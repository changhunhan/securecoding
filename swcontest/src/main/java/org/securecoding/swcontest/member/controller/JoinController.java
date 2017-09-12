package org.securecoding.swcontest.member.controller;

import java.util.List;

import javax.annotation.Resource;

import org.securecoding.swcontest.member.service.MemberService;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.ZipVo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JoinController {
	
	@Resource(name="memberService")
	MemberService service;
	

	@RequestMapping(value = "/returnJoinPage1", method = RequestMethod.GET)
	public String returnJoinPage() {
		return "login/memberForm1";
	}
	
	@RequestMapping(value = "/returnJoinPage2", method = RequestMethod.POST)
	public String returnJoinPage2() {
		return "login/memberForm4";
	}

	
	@RequestMapping(value="/joinFunction", method=RequestMethod.POST)
	public String successTest(MemberVo memberVo, Model model ) throws Throwable{
		
	  String a = service.insertMember(memberVo);

	  ModelAndView mav= new ModelAndView();
	  mav.setViewName("redirect:login/memberForm4");
		return "../../index";
	 }
	
	
	
	@RequestMapping(value="/duplicateCheck",method=RequestMethod.POST)
	public @ResponseBody JsonResponse selectById(@RequestParam("mem_id") String mem_id){ 
		JsonResponse jsonres = new JsonResponse();
		String idres = service.selectById(mem_id);
		
		if(idres!=null){
		  jsonres.setStatus("NO");
		}else{
    	  jsonres.setStatus("OK");
		}
		jsonres.setMem_id(mem_id);
		return jsonres;
	}
	
	
	@RequestMapping(value = "/searchDong",method={RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody List<ZipVo> searchDong(@RequestParam("dong")String dong, Model model){
		
		List<ZipVo>list = service.searchByDong(dong);
		return list;
		
	}
	

	
}
