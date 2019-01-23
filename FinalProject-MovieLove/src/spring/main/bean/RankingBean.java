package spring.main.bean;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import api.MovieRanking;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import spring.vo.bean.MovieVO;
import spring.vo.bean.ReviewVO;

@Controller
public class RankingBean {
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	@Autowired
	private ReviewVO Reviewvo = null;
	@Autowired
	private MovieVO Movievo = null;

	@RequestMapping("movie_ranking_page.do")
	public String movie_ranking_page(HttpServletRequest request) throws OpenAPIFault, Exception {
		System.out.println("MainBean-movie_ranking_page()");

		MovieRanking rankingInfo = new MovieRanking();

		HashMap<String, Object> dailyResult = rankingInfo.getDailyBoxoffice();
		request.setAttribute("dailyResult", dailyResult);
		HashMap<String, Object> weeklyResult = rankingInfo.getWeeklyBoxoffice("0");
		request.setAttribute("weeklyResult", weeklyResult);
		HashMap<String, Object> weekendResult = rankingInfo.getWeeklyBoxoffice("1");
		request.setAttribute("weekendResult", weekendResult);
		for(String key : dailyResult.keySet() ) {
			System.out.println("방법1) key : " + key +" / value : " + dailyResult.get(key));
			System.out.println("class: "+dailyResult.get(key).getClass());
		}
		
		//String movieId = sqlSession.selectOne("movie.movieIdByTitle", "");
		//List<MovieVO> movieSearchList = sqlSession.selectList("movie.movieInfoById", movieId);  //검색한 해당 영화 모든정보 가져옴
		
		return "movie_ranking_page";
	}
}
