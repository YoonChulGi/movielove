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
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		System.out.println("ReviewBean-movie_review_page()");
		
		String movieTitle = request.getParameter("movieTitle");
		System.out.println("검색한 영화 제목: "+movieTitle);
		
		List<MovieVO> movieList = sqlSession.selectList("movie.movieInfoAll");  //전체 영화 정보 가져옴
		model.addAttribute("movieList", movieList);
		
		List<List<ReviewVO>> list = new ArrayList<List<ReviewVO>>();
		
		//검색했을 경우
		if(movieTitle != null) {
			String movieId = sqlSession.selectOne("movie.movieIdByTitle", movieTitle);
			List<MovieVO> movieSearchList = sqlSession.selectList("movie.movieInfoById", movieId);  //검색한 해당 영화 모든정보 가져옴
			model.addAttribute("movieShowingList", movieSearchList);
			for(int i=0;i<movieSearchList.size();i++) {
				List<ReviewVO> vo = new ArrayList<ReviewVO>();
				vo = sqlSession.selectList("review.reviewInfoById_OrderBySYMPATHY", movieSearchList.get(i).getMOVIE_ID());  //영화 id로 해당 영화 찾아서 review 정보 가져옴
				for(int j=0;j<vo.size();j++) {
					String date = vo.get(j).getREVIEW_DATE();
					date = date.substring(0, 16);  //작성 시간에서 뒤에 초 삭제
					vo.get(j).setREVIEW_DATE(date);
				}
				list.add(vo);
			}
		}
		//검색 안 했을 경우 (기본)
		else {
			List<MovieVO> movieShowingList = sqlSession.selectList("movie.movieInfo_showing");  //상영중 영화정보 예매순 정렬후 모든정보 가져옴

			List<MovieVO> movieShowingList_Top10 = new ArrayList<MovieVO>();
			int size = 10;
			if(movieShowingList.size() < 10) {
				size = movieShowingList.size();
			}
			
			for(int i=0;i<size;i++) {
				movieShowingList_Top10.add(movieShowingList.get(i));
				List<ReviewVO> vo = new ArrayList<ReviewVO>();
				vo = sqlSession.selectList("review.reviewInfoById_OrderBySYMPATHY", movieShowingList_Top10.get(i).getMOVIE_ID());  //영화 id로 해당 영화 찾아서 review 정보 가져옴
				for(int j=0;j<vo.size();j++) {
					String date = vo.get(j).getREVIEW_DATE();
					date = date.substring(0, 16);  //작성 시간에서 뒤에 초 삭제
					vo.get(j).setREVIEW_DATE(date);
				}
				list.add(vo);
			}
			
			model.addAttribute("movieShowingList", movieShowingList_Top10);
		}
		
		model.addAttribute("reviewList",list);
		
		return "movie_review_page";
	}
	
	@RequestMapping("movie_review_detail_page.do")
	public String movie_review_detail_page(Model model, HttpServletRequest request) {
		System.out.println("ReviewBean-movie_review_detail_page()");
		
		Movievo = sqlSession.selectOne("movie.movieInfoById", request.getParameter("movieId"));
		model.addAttribute("movieInfo", Movievo);
		
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		list = sqlSession.selectList("review.reviewInfoById", Movievo.getMOVIE_ID());
		model.addAttribute("reviewList", list);
		

		//리뷰 리스트 초기 높이값 지정
		float listHeight;
		if(list.size() >= 10) { listHeight = 1300; }
		else { listHeight = (float) (165.5 + 113.45 * list.size()); }
		System.out.println("listHeight: "+listHeight);
		model.addAttribute("listHeight", listHeight);
		
		//평균 평점 구하기
		int sumRating = 0;
		for(int i=0;i<list.size();i++) {
			sumRating += list.get(i).getREVIEW_RATING();
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
	public String review_write_popup(Model model, HttpServletRequest request) {
		System.out.println("ReviewBean-review_write_popup()");
		
		String movieTitle = request.getParameter("movieTitle");
		request.setAttribute("movieTitle",  movieTitle);
		
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
		System.out.println("ReviewBean-review_writePro()");
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Reviewvo.setREVIEW_TITLE(request.getParameter("review_title"));
		Reviewvo.setREVIEW_CONTENTS(request.getParameter("review_contents"));
		Reviewvo.setREVIEW_RATING(Integer.parseInt(request.getParameter("review_rating")));
		Reviewvo.setREVIEW_WRITER(request.getParameter("review_writer"));
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
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
			out.println("<script>alert('작성이 완료되었습니다.');opener.parent.location.reload();window.close();</script>");
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//ReviewDAO.insertArticle(Reviewvo);
		
		return "movie_review_page";
	}

	@RequestMapping("frame_review_list.do")
	public String frame_review_list(HttpServletRequest request, Model model) throws Exception {
		System.out.println("ReviewBean-frame_review_list()");
		

		String movieId = (String) request.getParameter("movieId");
		String menu = (String) request.getParameter("menu");
		if(menu == null) {
			menu = "1";  //기본 메뉴 1로 설정 (공감순)
		}
		String page = (String) request.getParameter("page");
		if(page == null) {
			page = "1";  //기본 페이지 1로 설정
		}
		System.out.println("movieId: "+movieId+", menu: "+menu+", page: "+page);

		model.addAttribute("movieId", movieId);
		model.addAttribute("page", page);
		model.addAttribute("menu", menu);

		Movievo = sqlSession.selectOne("movie.movieInfoById", movieId);
		model.addAttribute("movieInfo", Movievo);

		List<ReviewVO> list = new ArrayList<ReviewVO>();
		List<ReviewVO> pageList = new ArrayList<ReviewVO>();
		
		if(menu == null || menu.equals("1")) {  //공감순
			list = sqlSession.selectList("review.reviewInfoById_OrderBySYMPATHY", Movievo.getMOVIE_ID());
		} else if(menu.equals("2")) {           //최신순
			list = sqlSession.selectList("review.reviewInfoById_OrderByDATE", Movievo.getMOVIE_ID());
		} else if(menu.equals("3")) {           //평점 높은 순
			list = sqlSession.selectList("review.reviewInfoById_OrderByRATING", Movievo.getMOVIE_ID());
		}
		
		int maxPage;
		maxPage = list.size() / 10 + 1;
		if(list.size() % 10 == 0) {
			maxPage-=1;
		}
		System.out.println("review list size: "+list.size()+", maxPage: "+maxPage);
		model.addAttribute("maxPage", maxPage);

		int pageNum = Integer.parseInt(page);
		int endPage = (pageNum*10) > list.size() ? list.size() : (pageNum*10);
		for(int i=(pageNum*10)-10; i<endPage; i++) {
			if(list.get(i) != null) {
				pageList.add(list.get(i));
			}
		}
		
		float listHeight = (float) (165.5 + 113.45 * pageList.size());
		System.out.println("listHeight: "+listHeight);
		model.addAttribute("listHeight", listHeight);

		System.out.println("pagelist size: "+pageList.size());
		model.addAttribute("reviewList", pageList);
		
		return "frame_review_list";
	}
	
	@RequestMapping("sympathyUp.do")
	public void SympathyUp(@RequestParam(value="writer") String writer, @RequestParam(value="date") String date) throws Exception {
		System.out.println("ReviewBean-sympathyUp()");
		
		System.out.println("writer: "+writer);
		System.out.println("date: "+date);
		Reviewvo.setREVIEW_WRITER(writer);
		Reviewvo.setREVIEW_DATE(date);

		sqlSession.update("review.SympathyUp", Reviewvo);
	}
	
	@RequestMapping("notSympathyUp.do")
	public void NotSympathyUp(@RequestParam(value="writer") String writer, @RequestParam(value="date") String date) throws Exception {
		System.out.println("ReviewBean-notSympathyUp()");

		System.out.println("writer: "+writer);
		System.out.println("date: "+date);
		Reviewvo.setREVIEW_WRITER(writer);
		Reviewvo.setREVIEW_DATE(date);

		sqlSession.update("review.notSympathyUp", Reviewvo);
	}
	
}
