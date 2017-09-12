package org.securecoding.swcontest.mypage.mpStudent.sNote;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class sNoteController {


	@RequestMapping(value="/sNote/sNoteMain", method=RequestMethod.GET)
	public String returnForm(){
		
		return "sNoteMain";
	}
}
