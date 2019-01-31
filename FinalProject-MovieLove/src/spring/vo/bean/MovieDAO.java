package spring.vo.bean;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class MovieDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	@Autowired
	private MemVO memvo = null;
	
	@SuppressWarnings("deprecation")
	public int [] analysis(String id) { // MOVIE_ID를 파라미터로 받는다. 
		
		List<ReviewVO> li = sqlSession.selectList("review.reviewInfoById",id);
		int M = 0; 
		int F = 0;
		Date today = new Date();
		Date d = new Date();
					     
		int [] ageArr = {0,0,0,0,0,0,0,0,0};// baby's,10's,20's,30's,40's,50's,over 60's			
					
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
			} else if(x>=10 && x<20) { //10
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
		} 
		ageArr[7] = M; // 리턴값의 7번 인덱스 : 남자 수 
		ageArr[8] = F; // 리턴값의 8번 인덱스 : 여자 수 
		
		return ageArr;
	}

}
