package spring.main.bean;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.vo.bean.MovieVO;
import spring.vo.bean.ReviewVO;

@Controller
public class AnalysisBean {
	@Autowired
	private SqlSessionTemplate sqlSession = null;

	@RequestMapping("movie_analysis_page.do")
	public String movie_analysis_page(HttpServletRequest request, Model model) {
		System.out.println("movie_analysis_page");
		
		String movieTitle = request.getParameter("movieTitle");
		System.out.println("검색한 영화 제목: "+movieTitle);
		
		List<MovieVO> movieList = sqlSession.selectList("movie.movieInfoAll");  //전체 영화 정보 가져옴
		model.addAttribute("movieList", movieList);
		
		for(int i=0;i<movieList.size();i++) {
			System.out.println("영화제목: "+movieList.get(i).getMOVIE_TITLE());
		}
		
		//검색했을 경우
		if(movieTitle != null) {
			String movieId = sqlSession.selectOne("movie.movieIdByTitle", movieTitle);  //검색한 해당 영화의 id 가져옴
			System.out.println("검색한 영화 ID: "+movieId);
			
		}
		//검색 안 했을 경우 (기본)
		else {
		}
		
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
