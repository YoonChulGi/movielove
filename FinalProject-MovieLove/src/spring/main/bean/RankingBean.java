package spring.main.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RankingBean {

	@RequestMapping("movie_ranking_page.do")
	public String movie_ranking_page() {
		System.out.println("MainBean-movie_ranking_page()");
		return "movie_ranking_page";
	}
}
