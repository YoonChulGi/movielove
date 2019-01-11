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

public class MovieRanking {
	private String key = "b1ba74ecebf8f7882eb010ca94d015b8";
	private String targetDt = "";
	private String itemPerPage = "10";
	private String multiMovieYn = "";
	private String repNationCd = "";
	private String wideAreaCd = "";
	
	public HashMap<String, Object> getDailyBoxoffice() throws OpenAPIFault, Exception{
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.add(Calendar.DATE, -1); // 오늘날짜로부터 -1
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); // 날짜 포맷 
		targetDt = sdf.format(cal.getTime()); //String으로 저장
		
		//DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		//targetDt = dateFormat.format(today);
		System.out.println("Date: "+targetDt);
		
		//Calendar calendar = Calendar.getInstance();
		//calendar.setTime(today);
		//int dayNum = calendar.get(Calendar.DAY_OF_WEEK) ; //1.월 2.화 3.수 4.목 5.금 6.토 7.일
	
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
	
		String dailyResponse = service.getDailyBoxOffice(true, targetDt, itemPerPage, multiMovieYn, repNationCd, wideAreaCd);
	
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> dailyResult = mapper.readValue(dailyResponse, HashMap.class);
		//request.setAttribute("dailyResult", dailyResult);
	
		return dailyResult;
	}
}
