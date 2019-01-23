package spring.main.bean;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
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

		//일간, 주간, 주말 선택에 따라서 영화정보 가져오기
		List<RankingVO> selResult = new ArrayList<RankingVO>();
		List<String> img_selResult = new ArrayList<String>();
		String img = "";
		String sel = request.getParameter("sel");
		System.out.println("Sel: "+sel);
		if(sel == null) {
			selResult = rankingInfo.getDailyBoxoffice();
			for(int i=0;i<selResult.size();i++) {
				img = sqlSession.selectOne("movie.movieImgByTitle", dailyResult.get(i).getTITLE());
				img_selResult.add(img);  //영화의 이미지 주소 리스트에 저장
			}
		} else if(sel.equals("2")) {
			selResult = rankingInfo.getWeeklyBoxoffice("0");
			for(int i=0;i<selResult.size();i++) {
				img = sqlSession.selectOne("movie.movieImgByTitle", weeklyResult.get(i).getTITLE());
				img_selResult.add(img);  //영화의 이미지 주소 리스트에 저장
			}
		} else if(sel.equals("3")) {
			selResult = rankingInfo.getWeeklyBoxoffice("1");
			for(int i=0;i<selResult.size();i++) {
				img = sqlSession.selectOne("movie.movieImgByTitle", weekendResult.get(i).getTITLE());
				img_selResult.add(img);  //영화의 이미지 주소 리스트에 저장
			}
		}
		request.setAttribute("selResult", selResult);
		request.setAttribute("img_selResult", img_selResult);

		return "movie_ranking_page";
	}
}
