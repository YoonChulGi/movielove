package api;

import org.codehaus.jackson.map.ObjectMapper;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import spring.vo.bean.RankingVO;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class MovieRanking {
	private String key = "b1ba74ecebf8f7882eb010ca94d015b8";
	private String targetDt = "";
	private String itemPerPage = "10";
	private String weekGb = "";  //0:주간 1:주말 2:주중
	
	public List<RankingVO> getDailyBoxoffice() throws IOException {
		//어제 날짜 구하기
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.add(Calendar.DATE, -1); // 오늘날짜로부터 -1
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		targetDt = sdf.format(cal.getTime());
		System.out.println("Date: "+targetDt);
		
		BufferedReader bufferedReader = null;
		String result = "";
		try {
			String requestUrl = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?"
					+ "key="+key+"&targetDt="+targetDt+"&itemPerPage="+itemPerPage;

			URL url = new URL(requestUrl);
			URLConnection conn = url.openConnection();
			bufferedReader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			result = bufferedReader.readLine();
			System.out.println("bufferedReader: "+result);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		bufferedReader.close();
		
		List<RankingVO> dailyList = new ArrayList<RankingVO>();  //리스트 생성

		JsonParser Parser = new JsonParser();
		JsonObject jsonObj = (JsonObject) Parser.parse(result);
		JsonObject boxOfficeResult = (JsonObject) jsonObj.get("boxOfficeResult");
		JsonArray dailyArray = (JsonArray) boxOfficeResult.get("dailyBoxOfficeList");
		for (int i = 0; i < dailyArray.size(); i++) {
			JsonObject object = (JsonObject) dailyArray.get(i);
			
			RankingVO vo = new RankingVO();
			vo.setRANK((object.get("rank").toString()).replaceAll("\"",""));
			vo.setTITLE((object.get("movieNm").toString()).replaceAll("\"",""));
			vo.setAUDICNT(comma((object.get("audiCnt").toString()).replaceAll("\"","")));
			vo.setAUDIACC(comma((object.get("audiAcc").toString()).replaceAll("\"","")));
			vo.setRATE((object.get("salesShare").toString()).replaceAll("\"",""));
			vo.setDATE(targetDt);
			
			dailyList.add(vo);
		}
	
		return dailyList;
	}
	
	public List<RankingVO> getWeeklyBoxoffice(String weekGb) throws IOException{
		//지난 주 일요일 날짜 구하기
		Date today = new Date();
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		calendar.setTime(today);
		int dayNum = calendar.get(Calendar.DAY_OF_WEEK) ; //1.일  2.월  3.화  4.수  5.목  6.금  7.토 
		switch(dayNum) {
			case 1:
				calendar.add(Calendar.DATE, -7); // 오늘날짜로부터 -7
				break;
			case 2:
				calendar.add(Calendar.DATE, -1); // 오늘날짜로부터 -1
				break;
			case 3:
				calendar.add(Calendar.DATE, -2); // 오늘날짜로부터 -2
				break;
			case 4:
				calendar.add(Calendar.DATE, -3); // 오늘날짜로부터 -3
				break;
			case 5:
				calendar.add(Calendar.DATE, -4); // 오늘날짜로부터 -4
				break;
			case 6:
				calendar.add(Calendar.DATE, -5); // 오늘날짜로부터 -5
				break;
			case 7:
				calendar.add(Calendar.DATE, -6); // 오늘날짜로부터 -6
				break;
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		targetDt = sdf.format(calendar.getTime());
		System.out.println("Date: "+targetDt);
		
		String date = "";   //랭킹 기준 날짜 기간
		String lastDate = "";  //기준 날짜의 시작 기간 
		// 주간일 경우
		if(weekGb.equals("0")) {
			calendar.add(calendar.DATE, -6); // 6일을 뺀다
			lastDate = sdf.format(calendar.getTime());
			date = lastDate + " ~ " + targetDt;
		}
		// 주말일 경우
		else if(weekGb.equals("1")) {
			calendar.add(calendar.DATE, -2); // 2일을 뺀다
			lastDate = sdf.format(calendar.getTime());
			date = lastDate + " ~ " + targetDt;
		}
		
		BufferedReader bufferedReader = null;
		String result = "";
		try {
			String requestUrl = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?"
					+ "key="+key+"&targetDt="+targetDt+"&itemPerPage="+itemPerPage+"&weekGb="+weekGb;

			URL url = new URL(requestUrl);
			URLConnection conn = url.openConnection();
			bufferedReader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			result = bufferedReader.readLine();
			System.out.println("bufferedReader: "+result);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		bufferedReader.close();
		
		List<RankingVO> weeklyList = new ArrayList<RankingVO>();  //리스트 생성

		JsonParser Parser = new JsonParser();
		JsonObject jsonObj = (JsonObject) Parser.parse(result);
		JsonObject boxOfficeResult = (JsonObject) jsonObj.get("boxOfficeResult");
		JsonArray dailyArray = (JsonArray) boxOfficeResult.get("weeklyBoxOfficeList");
		for (int i = 0; i < dailyArray.size(); i++) {
			JsonObject object = (JsonObject) dailyArray.get(i);
			
			RankingVO vo = new RankingVO();
			vo.setRANK((object.get("rank").toString()).replaceAll("\"",""));
			vo.setTITLE((object.get("movieNm").toString()).replaceAll("\"",""));
			vo.setAUDICNT(comma((object.get("audiCnt").toString()).replaceAll("\"","")));
			vo.setAUDIACC(comma((object.get("audiAcc").toString()).replaceAll("\"","")));
			vo.setRATE((object.get("salesShare").toString()).replaceAll("\"",""));
			vo.setDATE(date);
			
			weeklyList.add(vo);
		}
		
		return weeklyList;
	}
	
	// 1000단위 콤마 넣기
	public static String comma(String str) {
		  int inValues = Integer.parseInt(str);
		  DecimalFormat Commas = new DecimalFormat("#,###");
		  String result_int = (String)Commas.format(inValues);
		  return result_int;
	}
	
}
