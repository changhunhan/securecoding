package org.securecoding.swcontest.member.controller;

import java.util.Map;

import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
	@ResponseBody
	@RequestMapping(value="/test/validateRecaptcha", method=RequestMethod.POST)
	public String validateRecaptcha(@RequestParam Map<String, String> paramMap) {
	     
	    String check = "Y";
	     
	    ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
	    reCaptcha.setPrivateKey("6Lc4zyMTAAAAAL4ZltnCcwe8ucTPHEEEHKN-yx41");
	 
	    String host = paramMap.get("host");
	    String challenge = paramMap.get("challenge");
	    String res = paramMap.get("response");
	     
	    ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(host, challenge, res);
	 
	    if (reCaptchaResponse.isValid()) {
	        System.out.println("true");
	        check = "Y";
	    } else {
	        System.out.println("false");
	        check = "N";
	    }
	     
	    return check;
	 
	}
}
