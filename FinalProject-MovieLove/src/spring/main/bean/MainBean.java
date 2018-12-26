package spring.main.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


//윤철기 좆까1485919841

//hello

@Controller
public class MainBean {
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
	@RequestMapping("movie_review.do")
	public String movie_review() {
		System.out.println("MainBean-movie_review()");
		return "movie_review";
	}
}
