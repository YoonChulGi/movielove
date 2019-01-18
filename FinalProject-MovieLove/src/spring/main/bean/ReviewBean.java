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
	private ReviewVO Reviewvo = null;
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	@RequestMapping("movie_review_page.do")
	public String movie_review_page(Model model) {
		System.out.println("MainBean-movie_review_page()");
		
		List<String> rateList = sqlSession.selectList("movie.movieRateRanking");
		System.out.println("<예매율 순으로 정리>");
		for(int i=0;i<rateList.size();i++) {
			System.out.println("영화ID: "+rateList.get(i));
		}
		
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		for(int i=0;i<rateList.size();i++) {
			ReviewVO vo = new ReviewVO();
			vo = sqlSession.selectOne("review.getReviewInfo", rateList.get(i));
			list.add(vo);
		}
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i).getReview_title());
			System.out.println(list.get(i).getReview_writer());
			System.out.println(list.get(i).getReview_contents());
		}
		model.addAttribute("reviewList",list);
		
		return "movie_review_page";
	}

	@RequestMapping("review_write_popup.do")
	public String review_write_popup(Model model) {
		System.out.println("review_write_popup.do");
		
		List<MovieVO> list = sqlSession.selectList("movie.movieInfo");
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
		Reviewvo.setReview_title(request.getParameter("review_title"));
		Reviewvo.setReview_contents(request.getParameter("review_contents"));
		Reviewvo.setReview_rating(request.getParameter("review_rating"));
		Reviewvo.setReview_writer(request.getParameter("review_writer"));
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm");
		Reviewvo.setReview_date(sdf.format(date));
		String movieid = sqlSession.selectOne("review.getMovieId", Reviewvo.getReview_title());
		Reviewvo.setReview_movieid(movieid);
		
		System.out.println("영화 제목: "+Reviewvo.getReview_title());
		System.out.println("리뷰 내용: "+Reviewvo.getReview_contents());
		System.out.println("평점: "+Reviewvo.getReview_rating());
		System.out.println("작성자: "+Reviewvo.getReview_writer());
		System.out.println("작성날짜: "+Reviewvo.getReview_date());
		System.out.println("영화 ID: "+Reviewvo.getReview_movieid());

		sqlSession.insert("review.insertReview", Reviewvo);
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('작성이 완료되었습니다.');history.go(-1);window.close();</script>");
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//ReviewDAO.insertArticle(Reviewvo);
		
		return "movie_review_page";
	}
	
	@RequestMapping("movie_review_detail_page.do")
	public String movie_review_detail_page() {
		System.out.println("MainBean-movie_review_detail_page()");
		return "movie_review_detail_page";
	}
	
}
