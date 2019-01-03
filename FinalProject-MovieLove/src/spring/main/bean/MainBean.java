package spring.main.bean;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.vo.bean.MemVO;



@Controller
public class MainBean {
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	@Autowired
	MemVO Memvo = null;
	
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
	@RequestMapping("register.do")
	public String register() {
		System.out.println("MainBean-register()");
		String pw = "1234";
		String encryptPassword = passwordEncoder.encode(pw);
		System.out.println("암호화 전 pw: " + pw + "암호화 후 pw: " + encryptPassword);
		
		if(passwordEncoder.matches("4242", encryptPassword)) {
			System.out.println("비밀번호 일치");
		} else {
			System.out.println("비밀번호 불일치");
		}
		if(passwordEncoder.matches(pw, encryptPassword)) {
			System.out.println("일치");
		} else {
			System.out.println("불일치");
		}
		Memvo = (MemVO)sqlSession.selectOne("mem.selectAll");
		
		System.out.println(Memvo.getMEM_ID());
		System.out.println(Memvo.getMEM_PW());
		System.out.println(Memvo.getMEM_GENDER());
		return "register";
	}
	@RequestMapping("movie_info_page.do")
	public String movie_info_page() {
		System.out.println("MainBean-movie_info_page()");
		return "movie_info_page";
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
	public String movie_review_page() {
		System.out.println("MainBean-movie_review_page()");
		return "movie_review_page";
	}
	@RequestMapping("review_write_popup.do")
	public String review_write_popup() {
		System.out.println("review_write_popup.do");
		return "review_write_popup";
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
}
