package nsic.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Test {
	
	@RequestMapping(value = "/login.do")
	public String login() throws Exception {
		return "/common/main";
	}
	
	@RequestMapping(value = "/test.do")
	public String test() throws Exception {
		return "/common/test";
	}
	
	@RequestMapping(value = "/testDiv.do")
	public String test3() throws Exception {
		return "/common/testDiv";
	}
	
	@RequestMapping(value = "/test2.do")
	public String test2() throws Exception {
		return "/common/test2";
	}
}
