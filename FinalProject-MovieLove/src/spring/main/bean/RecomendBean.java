package spring.main.bean;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.vo.bean.MovieVO;



@Controller
public class RecomendBean {

	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	@Autowired
	private RConnection conn = null;
	
	@Autowired 
	private MovieVO vo = null;

	@RequestMapping("movie_recommend_page.do")
	public String movie_recommend_page(HttpServletRequest request, HttpSession session , Model model) {
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

		if(request.getParameter("sel") == null || "".equals(request.getParameter("sel"))||"1".equals(request.getParameter("sel"))) { 
			System.out.println("전체");
			System.out.println(request.getParameter("sel"));
			List<MovieVO> list = sqlSession.selectList("movie.all");
			for(int i=0;i<list.size();i++) {
				System.out.println(list.get(i).getMOVIE_TITLE());
				System.out.println(list.get(i).getMOVIE_YEAR());
				System.out.println(list.get(i).getMOVIE_IMG());
				System.out.println(list.get(i).getMOVIE_RATE());
				System.out.println(list.get(i).getNUM());
			}
			model.addAttribute("list",list);
			model.addAttribute("sel","1");
		} else if(request.getParameter("sel").equals("2")) { 
			System.out.println("국내");
			model.addAttribute("sel","2");
			List<MovieVO> list = sqlSession.selectList("movie.all2");
			
			for(int i=0;i<list.size();i++) {
				System.out.println(list.get(i).getMOVIE_TITLE());
				System.out.println(list.get(i).getMOVIE_YEAR());
				System.out.println(list.get(i).getMOVIE_IMG());
				System.out.println(list.get(i).getMOVIE_RATE());
			}
			model.addAttribute("list",list);
			
		}else if(request.getParameter("sel").equals("3")) { 
			System.out.println("해외");
			model.addAttribute("sel","3");
			List<MovieVO> list = sqlSession.selectList("movie.all3");
			
			for(int i=0;i<list.size();i++) {
				System.out.println(list.get(i).getMOVIE_TITLE());
				System.out.println(list.get(i).getMOVIE_YEAR());
				System.out.println(list.get(i).getMOVIE_IMG());
				System.out.println(list.get(i).getMOVIE_RATE());
			}
			model.addAttribute("list",list);
			
		}else if(request.getParameter("sel").equals("4")) { 
			System.out.println("액션/SF");
			model.addAttribute("sel","4");
			List<MovieVO> list = sqlSession.selectList("movie.all4");
			
			for(int i=0;i<list.size();i++) {
				System.out.println(list.get(i).getMOVIE_TITLE());
				System.out.println(list.get(i).getMOVIE_YEAR());
				System.out.println(list.get(i).getMOVIE_IMG());
				System.out.println(list.get(i).getMOVIE_RATE());
			}
			model.addAttribute("list",list);
			
		}else if(request.getParameter("sel").equals("5")) { 
			System.out.println("멜로/드라마");
			model.addAttribute("sel","5");
			List<MovieVO> list = sqlSession.selectList("movie.all5");
		
			for(int i=0;i<list.size();i++) {
				System.out.println(list.get(i).getMOVIE_TITLE());
				System.out.println(list.get(i).getMOVIE_YEAR());
				System.out.println(list.get(i).getMOVIE_IMG());
				System.out.println(list.get(i).getMOVIE_RATE());
			}
			model.addAttribute("list",list);
			
		}else if(request.getParameter("sel").equals("6")) { 
			System.out.println("코미디");
			model.addAttribute("sel","6");
			List<MovieVO> list = sqlSession.selectList("movie.all6");
		
			for(int i=0;i<list.size();i++) {
				System.out.println(list.get(i).getMOVIE_TITLE());
				System.out.println(list.get(i).getMOVIE_YEAR());
				System.out.println(list.get(i).getMOVIE_IMG());
				System.out.println(list.get(i).getMOVIE_RATE());
			}
			model.addAttribute("list",list);
			
		}else if(request.getParameter("sel").equals("7")) { 
			System.out.println("공포/스릴러");
			model.addAttribute("sel","7");
			List<MovieVO> list = sqlSession.selectList("movie.all7");
		
			for(int i=0;i<list.size();i++) {
				System.out.println(list.get(i).getMOVIE_TITLE());
				System.out.println(list.get(i).getMOVIE_YEAR());
				System.out.println(list.get(i).getMOVIE_IMG());
				System.out.println(list.get(i).getMOVIE_RATE());
			}
			model.addAttribute("list",list);
			
		}else if(request.getParameter("sel").equals("8")) { 
			System.out.println("전체관람가");
			model.addAttribute("sel","8");
			List<MovieVO> list = sqlSession.selectList("movie.all8");
		
			for(int i=0;i<list.size();i++) {
				System.out.println(list.get(i).getMOVIE_TITLE());
				System.out.println(list.get(i).getMOVIE_YEAR());
				System.out.println(list.get(i).getMOVIE_IMG());
				System.out.println(list.get(i).getMOVIE_RATE());
			}
			model.addAttribute("list",list);
			
		}else if(request.getParameter("sel").equals("9")) { 
			System.out.println("12세관람가");
			model.addAttribute("sel","9");
			List<MovieVO> list = sqlSession.selectList("movie.all9");
		
			for(int i=0;i<list.size();i++) {
				System.out.println(list.get(i).getMOVIE_TITLE());
				System.out.println(list.get(i).getMOVIE_YEAR());
				System.out.println(list.get(i).getMOVIE_IMG());
				System.out.println(list.get(i).getMOVIE_RATE());
			}
			model.addAttribute("list",list);
			
		}else if(request.getParameter("sel").equals("10")) { 
			System.out.println("15세관람가");
			model.addAttribute("sel","10");
			List<MovieVO> list = sqlSession.selectList("movie.all10");
		
			for(int i=0;i<list.size();i++) {
				System.out.println(list.get(i).getMOVIE_TITLE());
				System.out.println(list.get(i).getMOVIE_YEAR());
				System.out.println(list.get(i).getMOVIE_IMG());
				System.out.println(list.get(i).getMOVIE_RATE());
			}
			model.addAttribute("list",list);
			
		}else if(request.getParameter("sel").equals("11")) { 
			System.out.println("19세관람가");
			model.addAttribute("sel","11");
			List<MovieVO> list = sqlSession.selectList("movie.all11");
		
			for(int i=0;i<list.size();i++) {
				System.out.println(list.get(i).getMOVIE_TITLE());
				System.out.println(list.get(i).getMOVIE_YEAR());
				System.out.println(list.get(i).getMOVIE_IMG());
				System.out.println(list.get(i).getMOVIE_RATE());
			}
			model.addAttribute("list",list);
			
		}else if(request.getParameter("sel").equals("12")) { 
			System.out.println("1970년대");
			model.addAttribute("sel","12");
			List<MovieVO> list = sqlSession.selectList("movie.all12");
		
			for(int i=0;i<list.size();i++) {
				System.out.println(list.get(i).getMOVIE_TITLE());
				System.out.println(list.get(i).getMOVIE_YEAR());
				System.out.println(list.get(i).getMOVIE_IMG());
				System.out.println(list.get(i).getMOVIE_RATE());
			}
			model.addAttribute("list",list);
			
		}else if(request.getParameter("sel").equals("13")) { 
			System.out.println("1980년대");
			model.addAttribute("sel","13");
			List<MovieVO> list = sqlSession.selectList("movie.all13");
		
			for(int i=0;i<list.size();i++) {
				System.out.println(list.get(i).getMOVIE_TITLE());
				System.out.println(list.get(i).getMOVIE_YEAR());
				System.out.println(list.get(i).getMOVIE_IMG());
				System.out.println(list.get(i).getMOVIE_RATE());
			}
			model.addAttribute("list",list);
			
		}else if(request.getParameter("sel").equals("14")) { 
			System.out.println("1990년대");
			model.addAttribute("sel","14");
			List<MovieVO> list = sqlSession.selectList("movie.all14");
		
			for(int i=0;i<list.size();i++) {
				System.out.println(list.get(i).getMOVIE_TITLE());
				System.out.println(list.get(i).getMOVIE_YEAR());
				System.out.println(list.get(i).getMOVIE_IMG());
				System.out.println(list.get(i).getMOVIE_RATE());
			}
			model.addAttribute("list",list);
			
		}else if(request.getParameter("sel").equals("15")) { 
			System.out.println("2000년대");
			model.addAttribute("sel","15");
			List<MovieVO> list = sqlSession.selectList("movie.all15");
		
			for(int i=0;i<list.size();i++) {
				System.out.println(list.get(i).getMOVIE_TITLE());
				System.out.println(list.get(i).getMOVIE_YEAR());
				System.out.println(list.get(i).getMOVIE_IMG());
				System.out.println(list.get(i).getMOVIE_RATE());
			}
			model.addAttribute("list",list);
			
		}else if(request.getParameter("sel").equals("16")) { 
			System.out.println("2010년대");
			model.addAttribute("sel","16");
			List<MovieVO> list = sqlSession.selectList("movie.all16");
		
			for(int i=0;i<list.size();i++) {
				System.out.println(list.get(i).getMOVIE_TITLE());
				System.out.println(list.get(i).getMOVIE_YEAR());
				System.out.println(list.get(i).getMOVIE_IMG());
				System.out.println(list.get(i).getMOVIE_RATE());
			}
			model.addAttribute("list",list);
			
		}

			
		
		
		
		
		
		
		return "movie_recommend_page";
	}
}






