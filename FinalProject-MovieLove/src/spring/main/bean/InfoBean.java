package spring.main.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.vo.bean.MovieVO;
@Controller
public class InfoBean {
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	@RequestMapping("movie_info_page.do")
	public String movie_info_page(Model model,HttpServletRequest request) {
		System.out.println("MainBean-movie_info_page()");
		List<MovieVO> list = sqlSession.selectList("movie.movieInfo");
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i).getMOVIE_TITLE());
			System.out.println(list.get(i).getMOVIE_YEAR());
		}
		
		if(request.getParameter("sel") != null) {
			if(request.getParameter("sel").equals("1")) { // 상영중
				
			} else if(request.getParameter("sel").equals("2")) { // 개봉 예정 
				
			}
		}
		
		
		model.addAttribute("list",list);
		return "movie_info_page";
	}
	
	@RequestMapping("movie_detail_page.do")
	public String movie_detail_page() {
		System.out.println("MainBean-movie_detail_page()");
		return "movie_detail_page";
	}
}
