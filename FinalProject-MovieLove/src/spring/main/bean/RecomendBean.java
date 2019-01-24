package spring.main.bean;



import java.util.ArrayList;
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
			
			byte[] gen = genre.getBytes();  // 
			ArrayList choo = new ArrayList();
			for(int i = 0 ; i < gen.length ; i++) {
				if(gen[i] == 49) {
					choo.add(i+1);
				}
			}
			
			List choo2 = sqlSession.selectList("mem.choo",choo);
			List choo3 = new ArrayList();
			for(int i = 0 ; i < choo2.size(); i++) {
				String s = (String)choo2.get(i);
				String [] ss = s.split("/");
				for(String str : ss) {
					choo3.add(str);
				}
			}
			List result = sqlSession.selectList("mem.choo3",choo3);
			System.out.println(result.size());
			request.setAttribute("genre",result);
		}
	
		
		return "movie_recommend_page";
	}
}





