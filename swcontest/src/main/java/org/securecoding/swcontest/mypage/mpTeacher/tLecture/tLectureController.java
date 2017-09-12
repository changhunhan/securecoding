package org.securecoding.swcontest.mypage.mpTeacher.tLecture;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class tLectureController {


	@RequestMapping(value="/tLecture/tLectureMain", method=RequestMethod.GET)
	public String returnForm(){
		
		return "tLectureMain";
	}
	@RequestMapping(value="/tLecture/tLectureEdit", method=RequestMethod.GET)
	public String returnForm2(){
		
		return "tLectureEdit";
	}
	@RequestMapping(value="/tLecture/tLectureEdit2", method=RequestMethod.GET)
	public String returnForm3(){
		
		return "tLectureEdit2";
	}
}
