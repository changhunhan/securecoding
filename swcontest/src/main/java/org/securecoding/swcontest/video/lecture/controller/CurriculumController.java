package org.securecoding.swcontest.video.lecture.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import org.securecoding.swcontest.main.controller.DDayCount;
import org.securecoding.swcontest.main.service.MainService;
import org.securecoding.swcontest.main.vo.BannerVo;
import org.securecoding.swcontest.mindmap.service.MindmapService;
import org.securecoding.swcontest.video.lecture.service.CurriculumService;
import org.securecoding.swcontest.video.lecture.vo.CurriculumVo;
import org.securecoding.swcontest.video.lecture.vo.LectureVo;
import org.securecoding.swcontest.video.lecture.vo.TempVo;
import org.securecoding.swcontest.vo.CurriReqVo;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.MindmapVo;
import org.securecoding.swcontest.vo.NoteVo;
import org.securecoding.swcontest.vo.TeacherVo;

@Controller
public class CurriculumController {
	
	@Resource(name="curriculumService")
	CurriculumService service;
	@Resource(name = "mindmapservice")
	MindmapService mindService;
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@Autowired
	private DDayCount dday;
	
	@RequestMapping(value="/video/curriculum/searchPath", method=RequestMethod.POST)
	public @ResponseBody TempVo searchPath(String num, HttpSession session) {
		CurriculumVo vo = service.selectCurNum(num);
		String path = service.selectPath(vo.getCur_num());
		CurriReqVo curReqVo = new CurriReqVo();
		curReqVo.setCur_num(vo.getCur_num());
		curReqVo.setMem_id((String) session.getAttribute("mem_id"));
		String key = service.searchReq(curReqVo);
		TempVo tmp = new TempVo();
		tmp.setKey(key);
		tmp.setPath(path);
		tmp.setState((String) session.getAttribute("state"));
		return tmp;
	}
	
	@RequestMapping(value="/video/curriculum/insertCurReq", method=RequestMethod.POST)
	public @ResponseBody String insertCurReq(String num, HttpSession session) {
		CurriculumVo vo = service.selectCurNum(num);
		CurriReqVo cvo = new CurriReqVo();
		cvo.setCur_num(vo.getCur_num());
		cvo.setMem_id((String) session.getAttribute("mem_id"));
		service.insertReq(cvo);
		return "OK";
	}
	
	@RequestMapping("/video/curriculum/curriculumList")
	public String CurriculumListPage(HttpSession session, Model model) {
		
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
		
	
		List<CurriculumVo> list = service.curriculumList(id);
		List<LectureVo> lectureList = service.selectLectureAll();
		
		model.addAttribute("curriculumList", list);
		model.addAttribute("lectureList", lectureList);
		return "curriculumList";
	}
	
	public String changePath(String path) {
	      int index = path.lastIndexOf("\\") + 1;
	      String rename = path.substring(index);
	      return rename;
	}
	
	@RequestMapping("/video/curriculum/curriculumInsert")
	public String CurriculumInsertPage(HttpSession session, Model model) {
		String id = (String)session.getAttribute("mem_id");
		CurriculumVo vo = service.selectCode(id);
		model.addAttribute("vo", vo);
		
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
		return "curriculumInsert";
	}
	
	
	
	@RequestMapping(value="/video/curriculum/curriculumInsertProcess", method=RequestMethod.POST)
	public String CurriculumInsertProcess(HttpSession session, Model model, CurriculumVo curriculumVo) {
		String id = (String)session.getAttribute("mem_id");
		curriculumVo.setTea_id(id);
		String num=service.insertCurriculum(curriculumVo);
		MindmapVo mind=new MindmapVo();	
		mind.setCur_num(num);
		String key=mindService.mindmapInsert(mind);
		mind.setKey(key);
		mind.setMind_num(1);
		model.addAttribute("mind",mind);
		
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
		return "mindmapInsert";
	}
	
	@RequestMapping(value="/curriUpdate/{num}", method=RequestMethod.GET)
	public String CurriculumUpdatePage(@PathVariable("num") String num, Model model,HttpSession session) {
		CurriculumVo vo=service.selectByNumCur(num);
		model.addAttribute("vo",vo);
		
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
		return "curriculumUpdate";
	}
	
	@RequestMapping(value="/video/curriculum/curriculumUpdateProcess", method=RequestMethod.POST)
	public String CurriculumUpdateProcess(HttpSession session,CurriculumVo curriculumVo) {
		
		service.updateCurri(curriculumVo);
		return "redirect:/video/curriculum/curriculumList";
	}
	
	@RequestMapping(value="/curricullumDelte", method=RequestMethod.POST)
	public void MindmapDeletePage(CurriculumVo vo) {
		String num=vo.getCur_num();
		service.deleteCurri(num);
	}
	
	@RequestMapping(value="/mindmapUpdate/{num}", method=RequestMethod.GET)
	public String MindmapUpdatePage(@PathVariable("num") String num, Model model,HttpSession session) {
		MindmapVo vo=mindService.mindmapList(num);
		model.addAttribute("vo",vo);
		
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
		return "mindmapEdit";
	}
}
