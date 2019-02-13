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

	@RequestMapping("main.do")
	public String Main(Model model) {
		System.out.println("MainBean-Main()");
		
		List<MovieVO> movieList = sqlSession.selectList("movie.movieInfoAll");  //전체 영화 정보 가져옴
		model.addAttribute("movieList", movieList);
		
		return "main";
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
