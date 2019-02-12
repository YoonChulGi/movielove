package spring.main.bean;

import java.util.ArrayList;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.vo.bean.MovieVO;
import spring.vo.bean.ReviewVO;

@Controller
public class MainBean {
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	//@Autowired
	//private RConnection conn = null;
				
	@RequestMapping("main.do")
	public String Main(Model model) {
		System.out.println("MainBean-Main()");
		
		List<MovieVO> movieList = sqlSession.selectList("movie.movieInfoAll");  //전체 영화 정보 가져옴
		model.addAttribute("movieList", movieList);
		
		return "main";
	}
	
	MainBean() throws RserveException{
		//RConnection conn = new RConnection();
		System.out.println("mainBean 생성자");
		//try {
			//conn.eval("a <- 1");
			/*conn.eval("library(rJava)");
			conn.eval("library(DBI)");
			conn.eval("library(RJDBC)");*/
			/*conn.eval("drv <- JDBC(\"oracle.jdbc.driver.OracleDriver\",\"D:\\\\Chul\\\\RClass\\\\ojdbc6.jar\")");
			conn.eval("conn <- dbConnect(drv,\"jdbc:oracle:thin:@nullmaster.iptime.org:1521:xe\",\"final04\",\"final04\")");
			conn.eval("moviedf <- dbGetQuery(conn,\"select * from movie where MOVIE_SHOWING='1'\")");
			conn.eval("library(rvest)");
			conn.eval("url <- 'https://movie.naver.com/movie/running/current.nhn?view=list&tab=normal&order=reserve'");
			conn.eval("html <- read_html(url)");
			conn.eval("ids <-c()");
			conn.eval("titles <- c()");
			conn.eval("nexturl <-c()");
			conn.eval("posters <-c()");
			conn.eval("rates<- c()");
			conn.eval("years<- c()");
			conn.eval("etitles <-c()");
			conn.eval("ctitles <- c()");
			conn.eval("contents <- c()");
			conn.eval("genres <- c()");
			conn.eval("countries <- c()");
			conn.eval("ages<- c()");
			conn.eval("runtimes<-c()");
			conn.eval("audiences<-c()");
			conn.eval("directors<-c()");
			conn.eval("actors<-c()");
			conn.eval("steelcuts<-c()");*/
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
			conn.eval("");
			conn.eval("");
			conn.eval("");
			conn.eval("");*/
			
		//} catch (RserveException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		//} finally {
		//	conn.close();
		//}
		
		
	}
	
	
	@RequestMapping("main_content.do")
	public String MainContent(Model model) {
		System.out.println("MainBean-main_content()");

		List<MovieVO> movieList = sqlSession.selectList("movie.movieInfoAll");  //전체 영화 정보 가져옴
		model.addAttribute("movieList", movieList);
		
		List<MovieVO> movieShowingList = sqlSession.selectList("movie.movieInfo_showing");  //상영중 영화정보 예매순 정렬후 모든정보 가져옴
		List<MovieVO> movieShowingList_Top5 = new ArrayList<MovieVO>();
		List<List<ReviewVO>> reviewList = new ArrayList<List<ReviewVO>>();
		int size = 5;
		
		if(movieShowingList.size() < 5) {
			size = movieShowingList.size();
		}
			
		for(int i=0; i<size; i++) {
			movieShowingList_Top5.add(movieShowingList.get(i));
			List<ReviewVO> vo = new ArrayList<ReviewVO>();
			vo = sqlSession.selectList("review.reviewInfoById_OrderBySYMPATHY", movieShowingList_Top5.get(i).getMOVIE_ID());  //영화 id로 해당 영화 찾아서 review 정보 가져옴
			for(int j=0;j<vo.size();j++) {
				String date = vo.get(j).getREVIEW_DATE();
				date = date.substring(0, 16);  //작성 시간에서 뒤에 초 삭제
				vo.get(j).setREVIEW_DATE(date);
			}
			reviewList.add(vo);
		}
			
		model.addAttribute("movieShowingList", movieShowingList_Top5);
		model.addAttribute("reviewList", reviewList);
		
		return "main_content";
	}
	
	@RequestMapping("menu.do")
	public String Menu() {
		System.out.println("MainBean-menu()");
		return "menu";
	}

	@RequestMapping("footer.do")
	public String Footer() {
		System.out.println("MainBean-footer()");
		return "footer";
	}
}
