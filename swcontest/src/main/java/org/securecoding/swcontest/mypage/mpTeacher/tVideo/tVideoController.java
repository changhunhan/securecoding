package org.securecoding.swcontest.mypage.mpTeacher.tVideo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class tVideoController {

	@RequestMapping(value="/tVideo/tVideoMain", method=RequestMethod.GET)
	public String returnForm(){
		
		return "tVideoMain";
	}
}
