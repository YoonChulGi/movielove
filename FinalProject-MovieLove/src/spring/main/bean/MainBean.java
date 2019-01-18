package spring.main.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainBean {
				
	@RequestMapping("main.do")
	public String Main() {
		System.out.println("MainBean-Main()");
		return "main";
	}
		
}
