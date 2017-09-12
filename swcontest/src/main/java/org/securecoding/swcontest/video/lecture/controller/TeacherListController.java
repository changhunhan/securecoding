package org.securecoding.swcontest.video.lecture.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.securecoding.swcontest.main.controller.DDayCount;
import org.securecoding.swcontest.main.service.MainService;
import org.securecoding.swcontest.main.vo.BannerVo;
import org.securecoding.swcontest.video.lecture.service.TeacherListService;
import org.securecoding.swcontest.video.lecture.vo.CurriculumVo;
import org.securecoding.swcontest.video.lecture.vo.LectureVo;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.NoteVo;
import org.securecoding.swcontest.vo.TeacherVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TeacherListController {
	
	@Resource(name="teacherListService")
	TeacherListService service;
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@Autowired
	private DDayCount dday;
	
	private  String tea_id;
	
	@RequestMapping("/video/teacherList")
	public String listPage(int testCode,int proceCode, Model model,HttpSession session) {
		String testDivCode = "tdi" + String.format("%02d", testCode);
		String proceCfyCode = "pcla" + String.format("%02d", proceCode);
		String testName = service.selectByTestDivCode(testDivCode);
		String proceName = service.selectByProceCfyCode(proceCfyCode);
		List<TeacherVo> teacherList = service.selectByTeacherCfyCode(proceCfyCode);
		
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
		
		List<TeacherVo> allList=new ArrayList<TeacherVo>();
		for(TeacherVo imga : teacherList){
			String rename = changePath(imga.getTea_intro_img());
			imga.setTea_intro_img(rename);
			allList.add(imga);
		}
	
		model.addAttribute("teacherList", teacherList);
		model.addAttribute("testName", testName);
		model.addAttribute("proceName", proceName);
		model.addAttribute("testCode", testDivCode);
		return "teacherList";
	}
	
	
	
	
	
	@RequestMapping(value="/video/teacherFakeDetail", method=RequestMethod.POST)
	public String detailFakePage(String teacher_id, Model model) {
		tea_id = teacher_id;
		return "redirect:/video/teacherDetail";
	}
	
	@RequestMapping("/video/teacherDetail")
	public String detailPage(HttpSession session,Model model) {
		
		String id=(String)session.getAttribute("mem_id");
		List<NoteVo> list3 = mainService.noteList(id);
		List<NoteVo> list4 = mainService.noteSendList(id);
		NoteVo count=mainService.noteCheckCount(id);
		model.addAttribute("note", list3);
		model.addAttribute("noteSend", list4);
		model.addAttribute("notec", count);
		List<BannerVo> bannerVoList = dday.getDDay();
		model.addAttribute("bannerVoList", bannerVoList);
		
		
		TeacherVo teacherVo = service.selectByTeacherId(tea_id);
		List<CurriculumVo> curriculumList = service.selectCurriculumByTeacherId(tea_id);
		List<LectureVo> lectureList = service.selectLectureAll();
		
		teacherVo.setTea_intro_img(changePath(teacherVo.getTea_intro_img()));
		
		model.addAttribute("teacherVo", teacherVo);
		model.addAttribute("curriculumList", curriculumList);
		model.addAttribute("lectureList", lectureList);
		
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
		
		return "teacherDetail";
	}
	public String changePath(String path) {
		  
	      int index = path.lastIndexOf("\\") + 1;
	      String rename = path.substring(index);
	      return rename;
	}
	
}
