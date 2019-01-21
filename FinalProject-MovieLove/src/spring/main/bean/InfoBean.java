package spring.main.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.vo.bean.MovieVO;
@Controller
public class InfoBean {
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	@Autowired
	private RConnection conn = null;
	
	@RequestMapping("movie_info_page.do")
	public String movie_info_page(Model model,HttpServletRequest request) {
		System.out.println("MainBean-movie_info_page()");
		
		if(request.getParameter("sel") == null || request.getParameter("sel").equals("1")) { // 상영중
			System.out.println("상영중");
			List<MovieVO> list = sqlSession.selectList("movie.movieInfo_showing");
			for(int i=0;i<list.size();i++) {
				System.out.println(list.get(i).getMOVIE_TITLE());
				System.out.println(list.get(i).getMOVIE_YEAR());
			}
			model.addAttribute("list",list);
			model.addAttribute("sel","1");
		} else if(request.getParameter("sel").equals("2")) { // 개봉 예정 
			System.out.println("개봉 예정");
			try {
				System.out.println("초기 변수 세팅 시작");
				conn.eval("library(Rserve)");
				conn.eval("library(rvest)");
				conn.eval("url <- 'https://movie.naver.com/movie/running/premovie.nhn?viewType=image&festival=N&order=open'");
				conn.eval("html <- read_html(url)");
				conn.eval("titles<-c()");
				conn.eval("nexturl<-c()");
				conn.eval("posters<-c()");
				conn.eval("years<-c()");
				conn.eval("ids<-c()");
				
				System.out.println("초기 변수 세팅 완료");
				System.out.println("반복 시작");
				conn.eval("for(i in 1:12) { "
						+ "css<-paste('#content > div.article > div:nth-child(1) > div.lst_wrap > ul > li:nth-child(',i,') > a > strong',sep = ''); "
						+ "title<-html_node(html,css)%>%html_text(); "
						+ "titles<-c(titles,title); "
						+ "css<-paste('#content > div.article > div:nth-child(1) > div.lst_wrap > ul > li:nth-child(',i,') > a'); "
						+ "url <-html_node(html,css)%>%html_attr('href'); "
						+ "nexturl <- c(nexturl,url); "
						+ "css <- paste('#content > div.article > div:nth-child(1) > div.lst_wrap > ul > li:nth-child(',i,') > a > span > em',sep = ''); "
						+ "year <- html_node(html,css)%>%html_text(); "
						+ "years <- c(years,year); "
						+ "html2 <- read_html(paste('https://movie.naver.com',url,sep='')); "
						+ "css <- '#content > div.article > div.mv_info_area > div.poster > a > img'; "
						+ "poster <- html_node(html2,css)%>%html_attr('src'); "
						+ "posters<-c(posters,poster); "
						+ "} ");
				System.out.println("반복 끝");
				conn.eval("ids<-gsub('[a-zA-Z]','',nexturl)");
				conn.eval("ids<-gsub('[/.?=]','',ids)");
				
				String [] titles = conn.eval("titles").asStrings();
				String [] posters = conn.eval("posters").asStrings();
				String [] years = conn.eval("years").asStrings();
				String [] ids = conn.eval("ids").asStrings();
				
				/*for(int i=0;i<posters.length;i++) {
					System.out.println("posters["+i+"]= "+posters[i]);
				}*/
				model.addAttribute("titles",titles);
				model.addAttribute("posters",posters);
				model.addAttribute("years",years);
				model.addAttribute("ids",ids);
				model.addAttribute("sel","2");
				
			} catch (RserveException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (REXPMismatchException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} else if(request.getParameter("sel").equals("3")) { // 지난 영화
			System.out.println("지난 영화");
			model.addAttribute("sel","3");
		}
		
		return "movie_info_page";
	}
	
	@RequestMapping("movie_detail_page.do")
	public String movie_detail_page() {
		System.out.println("MainBean-movie_detail_page()");
		return "movie_detail_page";
	}
}
