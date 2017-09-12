package org.securecoding.swcontest.mypage.mpTeacher.tAdvice;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.securecoding.swcontest.main.controller.DDayCount;
import org.securecoding.swcontest.main.service.MainService;
import org.securecoding.swcontest.main.vo.BannerVo;
import org.securecoding.swcontest.vo.AdviceVo;
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
import org.springframework.web.servlet.ModelAndView;

@Controller
public class tAdviceController {

	@Resource(name = "tAdviceService")
	private tAdviceService service;
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@Autowired
	private DDayCount dday;
	
	@RequestMapping("/tAdvice/teacherPage")
	public String serverPage(String num, Model model,HttpSession session) {
		model.addAttribute("num", num);
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
		return "teacherPage";
	}
	
	@RequestMapping(value="/tAdvice/keyUpdate", method=RequestMethod.POST)
	public @ResponseBody String pageUnload(String num) {
		service.pageUnload(num);
		return "OK";
	}
	
	@RequestMapping(value="/tAdvice/teacherKey", method=RequestMethod.POST)
	public @ResponseBody String getKey(String num, String key) {
		AdviceVo vo = new AdviceVo();
		vo.setId(num);
		vo.setAdv_key(key);
		service.updateKey(vo);
		
		return "OK";
	}
	
	@RequestMapping(value = "/tAdvice/tAdviceMain", method = RequestMethod.GET)
	public String returnForm(HttpSession session, Model model)throws SQLException {
		
		String id=(String)session.getAttribute("mem_id");
		List<NoteVo> list3 = mainService.noteList(id);
		List<NoteVo> list4 = mainService.noteSendList(id);
		NoteVo count=mainService.noteCheckCount(id);
		model.addAttribute("note", list3);
		model.addAttribute("noteSend", list4);
		model.addAttribute("notec", count);
		List<BannerVo> bannerVoList = dday.getDDay();
		model.addAttribute("bannerVoList", bannerVoList);
		
		String adv_tea_id = (String) session.getAttribute("mem_id");
		List<AdviceVo> vo = service.selectAdvice(adv_tea_id);
		
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
		
		
		model.addAttribute("advList", vo);
		return "tAdviceMain";
	}
	
	public String changePath(String path) {
	      int index = path.lastIndexOf("\\") + 1;
	      String rename = path.substring(index);
	      return rename;
	}
	


	@RequestMapping(value = "/tAdvice/tAdviceMain/tCalList", method = RequestMethod.POST)
	@ResponseBody
	public List<AdviceVo> tCalList(HttpSession session, Model model) {
		String adv_tea_id = (String) session.getAttribute("mem_id");
		
		List<AdviceVo> vo = service.selectAdviceByAdv_tea_id(adv_tea_id);
		
		model.addAttribute("vo", vo);
		return vo;
	}

	@RequestMapping(value = "/tAdvice/tAdviceMain/tCalInsert", method = RequestMethod.POST)
	public void tCalInsert(HttpSession session, @RequestParam String start,
			@RequestParam String end) {
		
		String adv_tea_id = (String) session.getAttribute("mem_id");
		AdviceVo advVo = new AdviceVo();
		advVo.setAdv_tea_id(adv_tea_id);
		advVo.setTitle("상담가능");
		advVo.setStart(start);
		advVo.setEnd(end);
		advVo.setAdv_state("n");
		service.insertAdviceByT(advVo);
		
	}
	
	@RequestMapping(value="/tAdvice/tAdviceMain/tCalDel", method=RequestMethod.POST)
	public void tCalDel(String id){
		service.deleteAdviceByAdvNum(id);
	}
	
}