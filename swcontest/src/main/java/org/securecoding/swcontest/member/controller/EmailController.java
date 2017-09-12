package org.securecoding.swcontest.member.controller;

import javax.annotation.Resource;

import org.securecoding.swcontest.login.service.LoginService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EmailController {
	@Resource(name = "loginservice")
	private LoginService service;

	@RequestMapping(value = "/findEmail", method = RequestMethod.POST)
	public @ResponseBody String findEmail(
			@RequestParam("mem_email") String Temail, Model model) {

		Email mail = new Email();
		String Tmail = mail.sendMail(Temail, model);
		System.out.println("메일발신성공");
		return Tmail;
	}
}
