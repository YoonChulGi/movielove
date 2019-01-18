package spring.main.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AnalysisBean {

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
