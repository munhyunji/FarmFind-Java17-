package farmfind.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	
	//로그인
	@RequestMapping(value="/admin/login", method = RequestMethod.GET)
	public String adminLogin() {
		
		return "admin/login";
	}
	
	//관리자메인
	@RequestMapping(value="/admin/main", method = RequestMethod.GET)
	public String adminMain() {
		
		return "admin/main";
	}
	
	//목록
	@RequestMapping(value="/admin/itemList", method = RequestMethod.GET)
	public String itemList() {
		
		return "admin/itemList";
	}
}
