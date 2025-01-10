package farmfind.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HousingInfoController {
	
private static final Logger logger = LoggerFactory.getLogger(ItemInfoController.class);
	
	//아이템 목록
	@RequestMapping(value="/housing/list", method = RequestMethod.GET)
	public String housingList() {
		
		return "housing/list";
	}
	
	//아이템 상세
	@RequestMapping(value="/housing/detail", method = RequestMethod.GET)
	public String housingDetail() {
		
		return "housing/detail";
	}
}
