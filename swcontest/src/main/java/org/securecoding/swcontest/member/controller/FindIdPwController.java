package org.securecoding.swcontest.member.controller;

import javax.annotation.Resource;

import org.securecoding.swcontest.login.service.LoginService;
import org.securecoding.swcontest.vo.FindIdPwVo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("key")
public class FindIdPwController {

	@Resource(name = "loginservice")
	private LoginService service;

	@RequestMapping(value = "/returnFindIdPwPage", method = RequestMethod.GET)
	public String returnFindIdPwPage() {
		return "findIdPw/findIdPw";
	}

	@RequestMapping(value = "/findId", method = RequestMethod.POST)

	public @ResponseBody FindIdPwVo returnFindId(@RequestParam("mem_name")String mem_name, @RequestParam("mem_email")String mem_eamil, FindIdPwVo vo, Model model) {
		
		FindIdPwVo newVo = new FindIdPwVo();
		newVo = service.selectByNameEmail(vo);
		
	
		if (service.selectByNameEmail(vo) != null) {
			FindIdPwVo email =service.selectByNameEmail(vo);
			SendNewIdToEmail mail = new SendNewIdToEmail();
			mail.sendMail(newVo);
			model.addAttribute("mem_id", newVo.getMem_id());
			model.addAttribute("tea_id",newVo.getTea_id());
			
			return email;
		}   else {
			FindIdPwVo email2 = service.selectByNameEmail(vo);
			return email2;
		}
	}

	@RequestMapping(value = "/findPw", method = RequestMethod.POST)
	public @ResponseBody FindIdPwVo returnFindPw(@RequestParam("mem_name")String mem_name,@RequestParam("mem_id")String mem_id,@RequestParam("mem_email")String mem_email,FindIdPwVo vo, Model model, String bun) {
	
		service.selectByIdEmail(vo);

		FindIdPwVo newVo = new FindIdPwVo();
		newVo = service.selectByIdEmail(vo);

		model.addAttribute("vo", vo);
		if (service.selectByIdEmail(vo) != null) {
			FindIdPwVo passemail = service.selectByIdEmail(vo);
			
			SendNewPasswordToEmail mail = new SendNewPasswordToEmail();
			String bunho = mail.sendMail(newVo, bun);
			model.addAttribute("key", bunho);
			vo.setMem_pass(bunho);
			service.updateByPw(vo);
			service.tupdateByPw(vo);
			return passemail;
		} else {
			FindIdPwVo passemail2 = service.selectByIdEmail(vo);
			return passemail2;
		}
		
	}

	
}
