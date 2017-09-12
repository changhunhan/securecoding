package org.securecoding.swcontest.login.controller;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.securecoding.swcontest.login.service.LoginService;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.SessionVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes({ "mem_id", "state","img"})
public class LoginController {

	@Resource(name = "loginservice")
	private LoginService service;

	@RequestMapping(value = "/returnLogin", method = RequestMethod.GET)
	public String returnLoginPage() {

		return "login/loginForm";

	}

	@RequestMapping(value = "/returnMainPage", method = RequestMethod.POST)
	public @ResponseBody loginJson loginPro(HttpServletRequest request,
			HttpServletResponse response, Model model) {
     /*
      * 임시 로그인 계정 : tmpUser/tmpAdmin 
      *    암호         : tmpUp@sswd/tmp@dmin
      */    
      // String mem_id = request.getParameter("tmpUser");
	  //String mem_pass = request.getParameter("tmpUp@sswd");
	 
		
		String mem_id = request.getParameter("login_id");
		String mem_pass = request.getParameter("login_pass");
	

		loginJson jsonres = new loginJson();
		SessionVo sessionVo = new SessionVo();

		Cookie loginCookie = new Cookie("rememberme", mem_id);
		response.addCookie(loginCookie);
		
		MemberVo vo = service.selectIdPwById(mem_id);

		if (vo != null) {
			if (vo.getMem_pass().equals(mem_pass)) {
				jsonres.setLoginResult("YES");
				jsonres.setLoginId(mem_id);
				model.addAttribute("mem_id", mem_id);
				if (mem_id.equals("admin")) {
					jsonres.setLoginState("admin");
					model.addAttribute("state", "admin");
				} else {
					sessionVo.setId(mem_id);
					sessionVo.setPass(mem_pass);
					String code = service.checkCodeByIdPw(sessionVo);
					if (code != null) {
						jsonres.setLoginState("teacher");
						model.addAttribute("state", "teacher");
					} else {
						jsonres.setLoginState("student");
						model.addAttribute("state", "student");
					}
				}
			} else {
				
				jsonres.setLoginResult("NO");
			}
		} else {
		
			jsonres.setLoginResult("NO");
		}
		return jsonres;
	}

}
