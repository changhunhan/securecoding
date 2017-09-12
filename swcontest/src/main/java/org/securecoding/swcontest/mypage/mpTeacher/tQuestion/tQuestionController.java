package org.securecoding.swcontest.mypage.mpTeacher.tQuestion;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class tQuestionController {

	@RequestMapping(value="/tQuestion/tQuestionMain", method=RequestMethod.GET)
	public String returnForm(){
		
		return "tQuestionMain";
	}
}
