package spring.main.bean;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.vo.bean.MovieVO;
import spring.vo.bean.ReviewVO;

@Controller
public class ReviewBean {
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	@Autowired
	private ReviewVO Reviewvo = null;
	@Autowired
	private MovieVO Movievo = null;
	
	@RequestMapping("movie_review_page.do")
	public String movie_review_page(Model model, HttpServletRequest request) {
		System.out.println("MainBean-movie_review_page()");
		
		String movieTitle = request.getParameter("movieTitle");
		System.out.println("검색한 영화 제목: "+movieTitle);
		
		if(movieTitle != null) {
			String movieId = sqlSession.selectOne("movie.movieIdByTitle", movieTitle);
			List<MovieVO> movieSearchList = sqlSession.selectList("movie.movieInfoById", movieId);  //검색한 해당 영화 모든정보 가져옴
			model.addAttribute("movieShowingList", movieSearchList);
			for(int i=0;i<movieSearchList.size();i++) {
				System.out.println("["+(i+1)+"] ReviewBean.java &검색한&영화제목: "+movieSearchList.get(i).getMOVIE_TITLE());
			}
		} else {
		List<MovieVO> movieShowingList = sqlSession.selectList("movie.movieInfo_showing");  //상영중 영화정보 예매순 정렬후 모든정보 가져옴
			model.addAttribute("movieShowingList", movieShowingList);
			for(int i=0;i<movieShowingList.size();i++) {
				System.out.println("["+(i+1)+"] ReviewBean.java #상영#영화제목: "+movieShowingList.get(i).getMOVIE_TITLE());
			}
		}
		
		
		List<MovieVO> movieList = sqlSession.selectList("movie.movieInfoAll");  //전체 영화 정보 가져옴
		model.addAttribute("movieList", movieList);

		List<String> rateList = sqlSession.selectList("movie.movieRateRanking_showing");  //상영중 영화 평점순 정렬후  MOVIE_ID 가져옴
		
		List<List<ReviewVO>> list = new ArrayList<List<ReviewVO>>();
		for(int i=0;i<rateList.size();i++) {
			List<ReviewVO> vo = new ArrayList<ReviewVO>();
			vo = sqlSession.selectList("review.reviewInfoById", rateList.get(i));  //영화 id로 해당 영화 찾아서 review 정보 가져옴
			list.add(vo);
		}
		
		for(int i=0;i<list.size();i++) {
			for(int j=0;j<list.get(i).size();j++) {
				System.out.println("i: "+i+", j: "+j);
				System.out.println("list size: "+list.size()+", list.get(i) size: "+list.get(i).size());
				System.out.println("제목: "+list.get(i).get(j).getREVIEW_TITLE());
				System.out.println("작성자: "+list.get(i).get(j).getREVIEW_WRITER());
				System.out.println("내용: "+list.get(i).get(j).getREVIEW_CONTENTS());
				System.out.println();
			}
		}
		model.addAttribute("reviewList",list);
		
		return "movie_review_page";
	}
	
	@RequestMapping("movie_review_detail_page.do")
	public String movie_review_detail_page(Model model, HttpServletRequest request) {
		System.out.println("MainBean-movie_review_detail_page()");
		
		Movievo = sqlSession.selectOne("movie.movieInfoById", request.getParameter("movieId"));
		model.addAttribute("movieInfo", Movievo);
		
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		list = sqlSession.selectList("review.reviewInfoById", Movievo.getMOVIE_ID());
		model.addAttribute("reviewList", list);
		
		int sumRating = 0;
		for(int i=0;i<list.size();i++) {
			sumRating += Integer.parseInt(list.get(i).getREVIEW_RATING());
		}
		float avgRating = (float) sumRating / (float) list.size();
		int avgRatingPer = (int)(avgRating * 10);  //소수점 버리고 10 곱하기 ->평점 별 퍼센트 조정하기 위해서
		model.addAttribute("avgRating", String.format("%.2f", avgRating));  //둘째자리까지 반올림
		model.addAttribute("avgRatingPer", avgRatingPer);
		System.out.println("avgRating: "+String.format("%.2f", avgRating));
		System.out.println("avgRatingPer: "+avgRatingPer);
		
		return "movie_review_detail_page";
	}

	@RequestMapping("review_write_popup.do")
	public String review_write_popup(Model model) {
		System.out.println("review_write_popup.do");
		
		List<MovieVO> list = sqlSession.selectList("movie.movieInfoAll");
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i).getMOVIE_TITLE());
			System.out.println(list.get(i).getMOVIE_YEAR());
		}
		model.addAttribute("movieList",list);
		
		return "review_write_popup";
	}

	@RequestMapping("review_writePro.do")
	public String review_writePro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MainBean-review_writePro()");
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Reviewvo.setREVIEW_TITLE(request.getParameter("review_title"));
		Reviewvo.setREVIEW_CONTENTS(request.getParameter("review_contents"));
		Reviewvo.setREVIEW_RATING(request.getParameter("review_rating"));
		Reviewvo.setREVIEW_WRITER(request.getParameter("review_writer"));
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm");
		Reviewvo.setREVIEW_DATE(sdf.format(date));
		String movieid = sqlSession.selectOne("movie.movieIdByTitle", Reviewvo.getREVIEW_TITLE());
		Reviewvo.setREVIEW_MOVIEID(movieid);
		Reviewvo.setREVIEW_SYMPATHY(0);
		Reviewvo.setREVIEW_NOTSYMPATHY(0);
		
		
		System.out.println("영화 제목: "+Reviewvo.getREVIEW_TITLE());
		System.out.println("리뷰 내용: "+Reviewvo.getREVIEW_CONTENTS());
		System.out.println("평점: "+Reviewvo.getREVIEW_RATING());
		System.out.println("작성자: "+Reviewvo.getREVIEW_WRITER());
		System.out.println("작성날짜: "+Reviewvo.getREVIEW_DATE());
		System.out.println("영화 ID: "+Reviewvo.getREVIEW_MOVIEID());

		sqlSession.insert("review.insertReview", Reviewvo);
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('작성이 완료되었습니다.');history.go(-1);window.close();location.href='movie_review_page.do';</script>");
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//ReviewDAO.insertArticle(Reviewvo);
		
		return "movie_review_page";
	}
	
}
