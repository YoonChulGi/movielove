package spring.main.bean;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.vo.bean.MemVO;

@Controller
public class RegisterBean {
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private MemVO Memvo = null;
	
	@RequestMapping("register.do")
	public String register() {
		System.out.println("MainBean-register()");
		return "register";
	}

	@RequestMapping("idcheck.do")
	@ResponseBody
	public String idcheck(@RequestBody String username) {
		int count = 0;
		System.out.println("idcheck.do");
		System.out.println("username: " + username);
		count = (Integer) sqlSession.selectOne("mem.idcheck", username);
		System.out.println("count: " + count);
		return count + "";
	}

	@RequestMapping("registerPro.do")
	public String regsterPro(HttpServletRequest request) {
		System.out.println("MainBean-registerPro()");
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Enumeration names = request.getParameterNames();

		while (names.hasMoreElements()) {
			String name = (String) names.nextElement();
			System.out.print(name);
			System.out.println(": " + request.getParameter(name));
		}
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String enc_pw = passwordEncoder.encode(password);
		String gender = request.getParameter("gender");
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		int day = Integer.parseInt(request.getParameter("day"));
		String address_normal = request.getParameter("address_normal");
		String address_detail = request.getParameter("address_detail");
		
		String genre = "";
		for(int i=1;i<=6;i++) {
			if(request.getParameter("genre"+i) != null) {
				genre += "1";
			} else {
				genre += "0";
			}
		}
		System.out.println(genre);
		
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		
		Date d = new Date();
		d.setYear(year-1900);
		d.setMonth(month-1);
		d.setDate(day);
		
		String date = simpleDateFormat.format(d);
		System.out.println("date: " + date);
		
		Memvo.setMEM_ID(username);
		Memvo.setMEM_PW(enc_pw);
		Memvo.setMEM_AGE(date);
		Memvo.setMEM_GENDER(gender);
		Memvo.setMEM_ADDRESS1(address_normal);
		Memvo.setMEM_ADDRESS2(address_detail);
		Memvo.setMEM_GENRE(genre);
		
		sqlSession.insert("mem.registerMember", Memvo);
		
		return "registerConfirm";
	}
	
	@RequestMapping("register_confirm.do")
	public String register_confirm() {
		System.out.println("register_confirm");
		return "register_confirm";
	}
}
