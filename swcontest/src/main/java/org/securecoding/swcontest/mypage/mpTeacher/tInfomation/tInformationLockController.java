package org.securecoding.swcontest.mypage.mpTeacher.tInfomation;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.securecoding.swcontest.main.controller.DDayCount;
import org.securecoding.swcontest.main.service.MainService;
import org.securecoding.swcontest.main.vo.BannerVo;
import org.securecoding.swcontest.mypage.mpStudent.sInformation.service.sInformationService;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.NoteVo;
import org.securecoding.swcontest.vo.TeacherVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class tInformationLockController {

	@Resource(name = "tInformationService")
	private tInfomationService service;
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@Autowired
	private DDayCount dday; 

	@RequestMapping("/tInformation/tInformationLock")
	public String lockForm(Model model,HttpSession session) {
		
		String id=(String)session.getAttribute("mem_id");
		List<NoteVo> list3 = mainService.noteList(id);
		List<NoteVo> list4 = mainService.noteSendList(id);
		NoteVo count=mainService.noteCheckCount(id);
		model.addAttribute("note", list3);
		model.addAttribute("noteSend", list4);
		model.addAttribute("notec", count);
		List<BannerVo> bannerVoList = dday.getDDay();
		model.addAttribute("bannerVoList", bannerVoList);
		
		MemberVo img=mainService.memberImg(id);
		TeacherVo tImg=mainService.teacherImg(id);
		
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
		
		return "tInformationLock";
	}
	
	public String changePath(String path) {
	      int index = path.lastIndexOf("\\") + 1;
	      String rename = path.substring(index);
	      return rename;
	}
	
	@RequestMapping(value="/tInformation/check", method=RequestMethod.POST)
	public @ResponseBody String lockProcess(TeacherVo vo) {
		TeacherVo pass = service.selectById(vo);
		
		return pass.getTea_pass();
	}
	
	@RequestMapping("/tInformation/teacherMyInfoUpdate")
	public String form(Model model) {
		List<BannerVo> list = dday.getDDay();
		model.addAttribute("bannerVoList", list);

		return "redirect:/tInformation/tInformationMain";
	}
	
	
}
