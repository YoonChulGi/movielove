package spring.main.bean;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.vo.bean.MemVO;

@Controller
public class LoginBean {
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	private String prevURL = null;
	
	@Autowired 
	BCryptPasswordEncoder passwordEncoder;
			
	@RequestMapping("login.do")
	public String login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("MainBean-login()");
		
		prevURL = (String)request.getHeader("REFERER");  //이전 페이지 URL 가져오기
		String[] prevURLS = prevURL.split("/");
		for(String i: prevURLS) {
			prevURL = i;
		}
		request.setAttribute("prevURL", prevURL);
		System.out.println("이전 페이지 URL: "+prevURL);
		
		return "login";
	}

	@RequestMapping("loginPro.do")
	public String loginPro(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("MainBean-loginPro()");
		
		String id = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println("username: "+id);
		System.out.println("password: "+password);
		
		MemVO vo = sqlSession.selectOne("mem.selectMem", id);
		//입력한 id가 DB에 있을 경우
		if(vo != null) {
			//비밀번호 일치
			if(passwordEncoder.matches(password, vo.getMEM_PW())){
				HttpSession session = request.getSession();
				session.setAttribute("memId", id);
				
				response.sendRedirect(prevURL);  //이전 페이지로 이동
				return null;
			}
			//비밀번호 불일치
			else {
				try {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('비밀번호가 일치하지 않습니다.');history.go(-1);</script>");
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		//입력한 id가 DB에 없는 경우
		else {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('입력한 아이디가 존재하지 않습니다.');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("MainBean-logout()");

		//세션 삭제
		HttpSession session = request.getSession();
		session.invalidate();
		
		response.sendRedirect(request.getHeader("referer"));  //이전 페이지로 이동
		return null;
	}
	
	

}
