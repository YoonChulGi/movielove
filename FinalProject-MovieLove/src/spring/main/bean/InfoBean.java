package spring.main.bean;

import java.util.ArrayList;
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
import spring.vo.bean.ReviewVO;
@Controller
public class InfoBean {
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	@Autowired
	private RConnection conn = null;
	
	@Autowired 
	private MovieVO vo = null;
	
	@RequestMapping("movie_info_page.do")
	public String movie_info_page(Model model,HttpServletRequest request) {
		System.out.println("MainBean-movie_info_page()");
		
		if(request.getParameter("sel") == null || request.getParameter("sel").equals("1") || request.getParameter("sel").equals("") || request.getParameter("sel").equals("null")) { // 상영중
			System.out.println("상영중");
			System.out.println(request.getParameter("sel"));
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
			List<MovieVO> list = sqlSession.selectList("movie.movieInfo_past");
			
			for(int i=0;i<list.size();i++) {
				System.out.println(list.get(i).getMOVIE_TITLE());
				System.out.println(list.get(i).getMOVIE_YEAR());
			}
			model.addAttribute("list",list);
		}
		
		return "movie_info_page";
	}
	
	@RequestMapping("movie_detail_page.do")
	public String movie_detail_page(String id, Model model) {
		System.out.println("MainBean-movie_detail_page()");
		System.out.println("id: "+id);
		
		vo = sqlSession.selectOne("movie.movieInfoById", id);
		if(vo.getMOVIE_ACTORS().length() > 80) {
			String actors = vo.getMOVIE_ACTORS().substring(0, 80);
			vo.setMOVIE_ACTORS(actors+"...");
		}
		String [] steelcuts = vo.getMOVIE_STEELCUT().split("#");
		
		model.addAttribute("vo",vo);
		model.addAttribute("steelcuts",steelcuts);
		
		//해당 영화 평점 가져오기
		List<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		reviewList = sqlSession.selectList("review.reviewInfoById", id);
		
		int sumRating = 0;
		for(int i=0;i<reviewList.size();i++) {
			sumRating += Integer.parseInt(reviewList.get(i).getREVIEW_RATING());
		}
		float avgRating = (float) sumRating / (float) reviewList.size();
		int avgRatingPer = (int)(avgRating * 10);  //소수점 버리고 10 곱하기 ->평점 별 퍼센트 조정하기 위해서
		model.addAttribute("avgRating", String.format("%.2f", avgRating));  //둘째자리까지 반올림
		model.addAttribute("avgRatingPer", avgRatingPer);
		System.out.println("avgRating: "+String.format("%.2f", avgRating));
		System.out.println("avgRatingPer: "+avgRatingPer);
		
		return "movie_detail_page";
	}
}
