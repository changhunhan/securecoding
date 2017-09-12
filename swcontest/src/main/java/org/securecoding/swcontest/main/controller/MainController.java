package org.securecoding.swcontest.main.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.securecoding.swcontest.main.service.MainService;
import org.securecoding.swcontest.main.vo.BannerVo;
import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.LecWatVo;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.NoteVo;
import org.securecoding.swcontest.vo.TeacherVo;

@Controller
public class MainController {
	@Resource(name="mainService")
	private MainService service;
	
	@Autowired
	private DDayCount dday;
	
	@RequestMapping(value="/main/main", method=RequestMethod.GET)
	public String returnLoginPage(Model model,HttpSession session){
		String id=(String)session.getAttribute("mem_id");
		List<NoteVo> list3 = service.noteList(id);
		List<NoteVo> list4 = service.noteSendList(id);
		NoteVo count=service.noteCheckCount(id);
		model.addAttribute("note", list3);
		model.addAttribute("noteSend", list4);
		model.addAttribute("notec", count);
		List<BannerVo> bannerVoList = dday.getDDay();
		model.addAttribute("bannerVoList", bannerVoList);
		
		MemberVo img=service.memberImg(id);
		TeacherVo tImg=service.teacherImg(id);
		
		
		
		
		List<BoardVo> list=null;
		if(img==null){
			list=service.tNoticeListTeacher(id);
		}
		
		else{
			if(img.getMem_id().equals("admin")){
				list=service.tNoticeListAdmin();
			}
			else{
				list=service.tNoticeList(id);
			}
		}
		List<BoardVo> list2=service.noticeList();
		
		
		List<LecWatVo> lecWatList = service.lecWatList(id);
		model.addAttribute("lecWatList", lecWatList);
		
		TeacherVo allImg=new TeacherVo();
		
		if(tImg!=null){
			String trename = changePath(tImg.getTea_img());
			allImg.setMem_img_rename(trename);;
			
		}
		else if(img!=null){
			String rename = changePath(img.getMem_img_rename());
			allImg.setMem_img_rename(rename);
		}
		model.addAttribute("img",allImg);
		
		
		model.addAttribute("tNotice",list);
		model.addAttribute("notice",list2);
		
	
		return "start";
	}
	
	public String changePath(String path) {
	      int index = path.lastIndexOf("\\") + 1;
	      String rename = path.substring(index);
	      return rename;
	}
	
	@RequestMapping(value="/noteInsert", method=RequestMethod.POST)
	public void noteIn(NoteVo vo,HttpSession session,HttpServletResponse response) throws IOException{
		
		String id=(String)session.getAttribute("mem_id");
		vo.setNote_send_pers(id);
		String mtid=service.selectId(vo);
		
		ObjectMapper mapper = new ObjectMapper();
		response.setContentType("application/json;charset=UTF-8");
		
		if(mtid!=null){
			service.noteInsert(vo);
			response.getWriter().print(mapper.writeValueAsString("ok"));
		}
		else if(mtid==null){
			response.getWriter().print(mapper.writeValueAsString("no"));
		}
	}
	
	@RequestMapping("/noteUpdate")
	public void update(HttpSession session){
		String id=(String)session.getAttribute("mem_id");
		service.noteCheckUpdate(id);
		
	}
	
	@RequestMapping(value="/returnIndexPage", method=RequestMethod.GET)
	public String returnIndexPage(HttpSession session){
		
		session.setAttribute("mem_id", null);
		session.setAttribute("state", null);
		
		return "../../index";
	}
	
	
	
}
