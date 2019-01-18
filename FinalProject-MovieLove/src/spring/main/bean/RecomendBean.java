package spring.main.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RecomendBean {
	@RequestMapping("movie_recommend_page.do")
	public String movie_recommend_page() {
		System.out.println("MainBean-movie_recommend_page()");
		return "movie_recommend_page";
	}
}
