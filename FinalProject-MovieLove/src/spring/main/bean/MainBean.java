package spring.main.bean;

import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping("idcheck.do")
		@ResponseBody
		public String idcheck(@RequestBody String username){
		int count = 0;
		System.out.println("idcheck.do");
		System.out.println("username: " + username);
		count = (Integer)sqlSession.selectOne("mem.idcheck",username);
		System.out.println("count: " + count);
		return count+"";
	}
	@RequestMapping("registerPro.do")
	public String regsterPro(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Enumeration names = request.getParameterNames();
		
		while(names.hasMoreElements()) {
			String name = (String) names.nextElement();
			System.out.print(name);
			System.out.println(": "+request.getParameter(name));
		}
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String address_normal = request.getParameter("address_normal");
		String address_detail = request.getParameter("address_detail");
		String genre1 = request.getParameter("genre1");
		String genre2 = request.getParameter("genre2");
		String genre3 = request.getParameter("genre3");
		String genre4 = request.getParameter("genre4");
		String genre5 = request.getParameter("genre5");
		String genre6 = request.getParameter("genre6");
		String genre = "";
		if(genre1.equals("on")) {
			genre += "1";
		} else {
			genre += "0";
		}
		
		if(genre2.equals("on")) {
			genre += "1";
		} else {
			genre += "0";
		}
		
		if(genre3.equals("on")) {
			genre += "1";
		} else {
			genre += "0";
		}
		
		if(genre4.equals("on")) {
			genre += "1";
		} else {
			genre += "0";
		}
		
		if(genre5.equals("on")) {
			genre += "1";
		} else {
			genre += "0";
		}
		
		if(genre6.equals("on")) {
			genre += "1";
		} else {
			genre += "0";
		}
		
		System.out.println(genre);
		return null;
	}
}
