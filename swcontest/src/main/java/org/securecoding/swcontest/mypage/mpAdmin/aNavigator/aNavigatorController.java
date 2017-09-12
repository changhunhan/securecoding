package org.securecoding.swcontest.mypage.mpAdmin.aNavigator;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class aNavigatorController {

	@RequestMapping(value="/aNavigator/aNavigatorMain", method=RequestMethod.GET)
	public String returnForm(){
		
		return "aNavigatorMain";
	}
	
	
	
}
