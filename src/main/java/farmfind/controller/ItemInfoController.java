package farmfind.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ItemInfoController {
	
	private static final Logger logger = LoggerFactory.getLogger(ItemInfoController.class);
	
	//아이템 목록
	@RequestMapping(value="/item/list", method = RequestMethod.GET)
	public String itemList() {
		
		return "item/list";
	}
	
	//아이템 상세
	@RequestMapping(value="/item/detail", method = RequestMethod.GET)
	public String itemDetail() {
		
		return "item/detail";
	}
	
}
