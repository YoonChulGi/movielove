package spring.main.bean;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class RecomendBean {

	@Autowired
	private SqlSessionTemplate sqlSession = null;

	@RequestMapping("movie_recommend_page.do")
	public String movie_recommend_page(HttpServletRequest request, HttpSession session) {
		System.out.println("MainBean-movie_recommend_page()");
		if (session.getAttribute("memId") != null) {
			String genre = sqlSession.selectOne("mem.recommend",session.getAttribute("memId"));
			System.out.println(genre);
		}
	
		
		return "movie_recommend_page";
	}
}
