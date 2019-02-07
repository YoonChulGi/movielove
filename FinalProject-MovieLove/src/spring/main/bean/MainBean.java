package spring.main.bean;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.vo.bean.MovieVO;

@Controller
public class MainBean {
	@Autowired
	private SqlSessionTemplate sqlSession = null;
				
	@RequestMapping("main.do")
	public String Main(Model model) {
		System.out.println("MainBean-Main()");
		
		List<MovieVO> movieList = sqlSession.selectList("movie.movieInfoAll");  //전체 영화 정보 가져옴
		model.addAttribute("movieList", movieList);
		
		return "main";
	}
	
	@RequestMapping("menu.do")
	public String Menu(Model model) {
		System.out.println("MainBean-menu()");
		
		return "menu";
	}
		
}
