package spring.main.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.vo.bean.MemVO;
import spring.vo.bean.MovieDAO;
import spring.vo.bean.MovieVO;

import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;


@Controller
public class AnalysisBean {
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	@Autowired
	private MovieVO mvo1 = null;
	
	@Autowired 
	private MovieVO mvo2 = null;
	
	@Autowired
	private MovieDAO dao = null;
	
	@Autowired
	private RConnection conn = null;

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
			model.addAttribute("searchFlag",true);
			for(int i=0;i<movieList.size();i++) {
				if(movieList.get(i).getMOVIE_ID().equals(movieId)) {
					model.addAttribute("vo",movieList.get(i));
					break;
				}
			}
			int [] ageArr  = dao.analysis(movieId);
			
			model.addAttribute("M",ageArr[7]);
			model.addAttribute("F",ageArr[8]);
			for(int i=0;i<ageArr.length-2;i++) {
				System.out.println("ageArr["+i+"]= "+ ageArr[i]);
			}
			model.addAttribute("ageArr",ageArr);
			
			// 워드 클라우드 R 자동화 
			try {
				conn.eval("library(rJava)");
				conn.eval("library(DBI)");
				conn.eval("library(RJDBC)");
				conn.eval("library(KoNLP)");
				conn.eval("useSejongDic()");
				conn.eval("library(RColorBrewer)");
				conn.eval("palete <- brewer.pal(9,'Set3')");
				conn.eval("drv <- JDBC('oracle.jdbc.driver.OracleDriver','D:\\\\Chul\\\\RClass\\\\ojdbc6.jar')");
				conn.eval("conn <- dbConnect(drv,\"jdbc:oracle:thin:@nullmaster.iptime.org:1521:xe\",\"final04\",\"final04\")");
				conn.eval("moviedf <- dbGetQuery(conn,\"select MOVIE_TITLE, MOVIE_ID from movie\")");
				String [] ids = conn.eval("moviedf$MOVIE_ID").asStrings();
				/*conn.eval("");
				conn.eval("");
				conn.eval("");
				conn.eval("");
				conn.eval("");
				conn.eval("");
				conn.eval("");
				conn.eval("");
				conn.eval("");
				conn.eval("");
				conn.eval("");
				conn.eval("");*/
				for(int i=0;i<ids.length;i++) { 
					System.out.println(ids[i]);
				}
				
			} catch (RserveException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (REXPMismatchException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			
		}
		//검색 안 했을 경우 (기본)
		else {
			model.addAttribute("searchFlag",false);
		}
		
		return "movie_analysis_page";
	}

	@RequestMapping("movie_analysis_page2.do")
	public String movie_analysis_page2(String id1, String id2, Model model) {
		System.out.println("movie_analysis_page2");
		System.out.println(id1);
		System.out.println(id2);
		
		mvo1 = sqlSession.selectOne("movie.movieInfoById",id1);
		mvo2 = sqlSession.selectOne("movie.movieInfoByTitle",id2);
		
		model.addAttribute("mvo1",mvo1);
		model.addAttribute("mvo2",mvo2);
		
		int [] arr1 = dao.analysis(mvo1.getMOVIE_ID());
		int [] arr2 = dao.analysis(mvo2.getMOVIE_ID());
		
		
		model.addAttribute("M1",arr1[7]);
		model.addAttribute("F1",arr1[8]);
		model.addAttribute("M2",arr2[7]);
		model.addAttribute("F2",arr2[8]);
		
		
		/*for(int i=0;i<ageArr.length;i++) {
			System.out.println("ageArr["+i+"]= "+ ageArr[i]);
		}*/
		model.addAttribute("ageArr1",arr1);
		model.addAttribute("ageArr2",arr2);
		
		return "movie_analysis_page2";
	}

	@RequestMapping("movie_search_popup.do")
	public String movie_search_popup(String id, Model model) {
		System.out.println("movie_search_popup.do");
		model.addAttribute("id1",id);

		List<MovieVO> movieList = sqlSession.selectList("movie.movieInfoAll");  //전체 영화 정보 가져옴
		model.addAttribute("movieList", movieList);
		
		return "movie_search_popup";
	}
	
}
