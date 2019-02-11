package spring.main.bean;

import java.util.Date;
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
import spring.vo.bean.ReviewVO;

@Controller
public class AnalysisBean {
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	@Autowired
	private MemVO memvo = null;
	
	@Autowired
	private MovieVO mvo1 = null;
	
	@Autowired 
	private MovieVO mvo2 = null;
	
	@Autowired
	private MovieDAO dao = null;

	@SuppressWarnings("deprecation")
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
			
			// 남녀 성비 분석 (sex rate analysis) 
			/*List<ReviewVO> li = sqlSession.selectList("review.reviewInfoById",movieId);
			int M = 0; 
			int F = 0;
			Date today = new Date();
			Date d = new Date();
						     
			int [] ageArr = {0,0,0,0,0,0,0};// baby's,10's,20's,30's,40's,50's,over 60's			
			
			for(int i=0;i<li.size();i++) {
				memvo = sqlSession.selectOne("mem.selectMem",li.get(i).getREVIEW_WRITER());
				String sex = memvo.getMEM_GENDER();
				if(sex.equals("MALE")) {
					M++;
				} else {
					F++;
				}
				String age = memvo.getMEM_AGE();
				System.out.println("생년월일"+Integer.parseInt(""+age.charAt(0)+age.charAt(1)+age.charAt(2)+age.charAt(3)));
				d.setYear(Integer.parseInt(""+age.charAt(0)+age.charAt(1)+age.charAt(2)+age.charAt(3)));
				System.out.println(d.getYear());
				int x = today.getYear() - d.getYear()+1900;
				x++;
				System.out.println("x= "+ x);
				if(x>=0 && x<10) { // babies
					ageArr[0] ++;
				} else if(x>=10 && x<20) {
					ageArr[1] ++;
				} else if(x>=20 && x<30) {
					ageArr[2] ++;
				} else if(x>=30 && x<40) {
					ageArr[3] ++;
				} else if(x>=40 && x<50) {
					ageArr[4] ++;
				} else if(x>=50 && x<60) {
					ageArr[5] ++;
				} else if(x>=60) {
					ageArr[6] ++;
				}
			}*/ // for 
			model.addAttribute("M",ageArr[7]);
			model.addAttribute("F",ageArr[8]);
			for(int i=0;i<ageArr.length-2;i++) {
				System.out.println("ageArr["+i+"]= "+ ageArr[i]);
			}
			model.addAttribute("ageArr",ageArr);
			
			
			
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
