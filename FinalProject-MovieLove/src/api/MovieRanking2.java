package api;

import org.codehaus.jackson.map.ObjectMapper;
import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;

import java.util.HashMap;
import java.util.Locale;
import java.util.TimeZone;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class MovieRanking2 {
	private String key = "b1ba74ecebf8f7882eb010ca94d015b8";
	private String targetDt = "";
	private String itemPerPage = "10";
	private String weekGb = "";  //0:주간 1:주말 2:주중
	private String multiMovieYn = "";
	private String repNationCd = "";
	private String wideAreaCd = "";
	
	public HashMap<String, Object> getDailyBoxoffice() throws OpenAPIFault, Exception{
		//어제 날짜 구하기
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.add(Calendar.DATE, -1); // 오늘날짜로부터 -1
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		targetDt = sdf.format(cal.getTime());
		System.out.println("Date: "+targetDt);
	
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
		
		String dailyResponse = service.getDailyBoxOffice(true, targetDt, itemPerPage, multiMovieYn, repNationCd, wideAreaCd);
	
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> dailyResult = mapper.readValue(dailyResponse, HashMap.class);
	
		return dailyResult;
	}
	
	public HashMap<String, Object> getWeeklyBoxoffice(String weekGb) throws OpenAPIFault, Exception{
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
	
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
	
		String weeklyResponse = service.getWeeklyBoxOffice(true, targetDt, itemPerPage, weekGb, multiMovieYn, repNationCd, wideAreaCd);
	
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> weeklyResult = mapper.readValue(weeklyResponse, HashMap.class);
	
		return weeklyResult;
	}
}
