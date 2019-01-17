package spring.main.bean;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.vo.bean.MemVO;
import spring.vo.bean.MovieVO;
import spring.vo.bean.ReviewDAOImpl;
import spring.vo.bean.ReviewVO;

@Controller
public class MainBean {
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	//@Autowired
	//private ReviewDAOImpl ReviewDAO = null;
	@Autowired
	private MemVO Memvo = null;
	@Autowired
	private MovieVO Movievo = null;
	@Autowired
	private ReviewVO Reviewvo = null;
	
	@RequestMapping("main.do")
	public String Main() {
		System.out.println("MainBean-Main()");
		return "main";
	}

	@RequestMapping("login.do")
	public String login() {
		System.out.println("MainBean-login()");
		return "login";
	}

	@RequestMapping("loginPro.do")
	public String loginPro(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("MainBean-loginPro()");
		
		String id = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println("username: "+id);
		System.out.println("password: "+password);
		
		MemVO vo = sqlSession.selectOne("mem.selectMem", id);
		//입력한 id가 DB에 있을 경우
		if(vo != null) {
			//비밀번호 일치
			if(passwordEncoder.matches(password, vo.getMEM_PW())){
				HttpSession session = request.getSession();
				session.setAttribute("memId", id);
				return "main";
			}
			//비밀번호 불일치
			else {
				try {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('비밀번호가 일치하지 않습니다.');history.go(-1);</script>");
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		//입력한 id가 DB에 없는 경우
		else {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('입력한 아이디가 존재하지 않습니다.');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) {
		System.out.println("MainBean-logout()");

		HttpSession session = request.getSession();
		session.invalidate();
		return "main";
	}
	
	@RequestMapping("register.do")
	public String register() {
		System.out.println("MainBean-register()");
		return "register";
	}

	@RequestMapping("idcheck.do")
	@ResponseBody
	public String idcheck(@RequestBody String username) {
		int count = 0;
		System.out.println("idcheck.do");
		System.out.println("username: " + username);
		count = (Integer) sqlSession.selectOne("mem.idcheck", username);
		System.out.println("count: " + count);
		return count + "";
	}

	@RequestMapping("registerPro.do")
	public String regsterPro(HttpServletRequest request) {
		System.out.println("MainBean-registerPro()");
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Enumeration names = request.getParameterNames();

		while (names.hasMoreElements()) {
			String name = (String) names.nextElement();
			System.out.print(name);
			System.out.println(": " + request.getParameter(name));
		}
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String enc_pw = passwordEncoder.encode(password);
		String gender = request.getParameter("gender");
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		int day = Integer.parseInt(request.getParameter("day"));
		String address_normal = request.getParameter("address_normal");
		String address_detail = request.getParameter("address_detail");
		
		String genre = "";
		for(int i=1;i<=6;i++) {
			if(request.getParameter("genre"+i) != null) {
				genre += "1";
			} else {
				genre += "0";
			}
		}
		System.out.println(genre);
		
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		
		Date d = new Date();
		d.setYear(year-1900);
		d.setMonth(month-1);
		d.setDate(day);
		
		String date = simpleDateFormat.format(d);
		System.out.println("date: " + date);
		
		Memvo.setMEM_ID(username);
		Memvo.setMEM_PW(enc_pw);
		Memvo.setMEM_AGE(date);
		Memvo.setMEM_GENDER(gender);
		Memvo.setMEM_ADDRESS1(address_normal);
		Memvo.setMEM_ADDRESS2(address_detail);
		Memvo.setMEM_GENRE(genre);
		
		sqlSession.insert("mem.registerMember", Memvo);
		
		return "registerConfirm";
	}

	@RequestMapping("movie_info_page.do")
	public String movie_info_page(Model model) {
		System.out.println("MainBean-movie_info_page()");
		List<MovieVO> list = sqlSession.selectList("movie.movieInfo");
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i).getMOVIE_TITLE());
			System.out.println(list.get(i).getMOVIE_YEAR());
			//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			//Date date = new Date(list.get(i).getMOVIE_YEAR()+" 00:00:00.0");
			//System.out.println(sdf.format(date));
		}
		model.addAttribute("list",list);
		return "movie_info_page";
	}
	
	@RequestMapping("movie_detail_page.do")
	public String movie_detail_page() {
		System.out.println("MainBean-movie_detail_page()");
		return "movie_detail_page";
	}

	@RequestMapping("movie_ranking_page.do")
	public String movie_ranking_page() {
		System.out.println("MainBean-movie_ranking_page()");
		return "movie_ranking_page";
	}

	@RequestMapping("movie_recommend_page.do")
	public String movie_recommend_page() {
		System.out.println("MainBean-movie_recommend_page()");
		return "movie_recommend_page";
	}
	
	@RequestMapping("movie_review_page.do")
	public String movie_review_page(Model model) {
		System.out.println("MainBean-movie_review_page()");
		
		List<String> rateList = sqlSession.selectList("movie.movieRateRanking");
		System.out.println("<예매율 순으로 정리>");
		for(int i=0;i<rateList.size();i++) {
			System.out.println("영화ID: "+rateList.get(i));
		}
		
		List<ReviewVO> list = new List<ReviewVO>();
		for(int i=0;i<rateList.size();i++) {
			ReviewVO vo = new ReviewVO();
			vo = sqlSession.selectOne("review.getReviewInfo", rateList.get(i));
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
	
	@RequestMapping("movie_analysis_page.do")
	public String movie_analysis_page() {
		System.out.println("movie_analysis_page");
		return "movie_analysis_page";
	}

	@RequestMapping("movie_analysis_page2.do")
	public String movie_analysis_page2() {
		System.out.println("movie_analysis_page2");
		return "movie_analysis_page2";
	}

	@RequestMapping("movie_search_popup.do")
	public String movie_search_popup() {
		System.out.println("movie_search_popup.do");
		return "movie_search_popup";
	}
	
	@RequestMapping("register_confirm.do")
	public String register_confirm() {
		System.out.println("register_confirm");
		return "register_confirm";
	}
	
}
