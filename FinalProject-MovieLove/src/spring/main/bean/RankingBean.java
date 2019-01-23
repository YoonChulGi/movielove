package spring.main.bean;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import org.json.simple.*;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import api.MovieRanking;
import api.MovieRanking2;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import spring.vo.bean.MovieVO;
import spring.vo.bean.RankingVO;
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
		
		List<RankingVO> dailyResult = rankingInfo.getDailyBoxoffice();
		request.setAttribute("dailyResult", dailyResult);
		List<RankingVO> weeklyResult = rankingInfo.getWeeklyBoxoffice("0");
		request.setAttribute("weeklyResult", weeklyResult);
		List<RankingVO> weekendResult = rankingInfo.getWeeklyBoxoffice("1");
		request.setAttribute("weekendResult", weekendResult);

		// String movieId = sqlSession.selectOne("movie.movieIdByTitle", "");
		// List<MovieVO> movieSearchList = sqlSession.selectList("movie.movieInfoById",
		// movieId); //검색한 해당 영화 모든정보 가져옴

		return "movie_ranking_page";
	}
}
