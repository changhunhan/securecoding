package org.securecoding.swcontest.mypage.mpAdmin.aTeacher;

import java.security.MessageDigest;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.securecoding.swcontest.main.controller.DDayCount;
import org.securecoding.swcontest.main.service.MainService;
import org.securecoding.swcontest.main.vo.BannerVo;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.NoteVo;
import org.securecoding.swcontest.vo.TeacherVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class aTeacherController {

	@Resource(name="aTeacherService")
	private aTeacherService service;
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@Autowired
	private DDayCount dday;
	
	@RequestMapping(value="/aTeacher/aTeacherMain", method=RequestMethod.GET)
	public String returnForm(HttpSession session,Model model){
		
		String id=(String)session.getAttribute("mem_id");
		List<NoteVo> list3 = mainService.noteList(id);
		List<NoteVo> list4 = mainService.noteSendList(id);
		NoteVo count=mainService.noteCheckCount(id);
		model.addAttribute("note", list3);
		model.addAttribute("noteSend", list4);
		model.addAttribute("notec", count);
		List<BannerVo> bannerVoList = dday.getDDay();
		model.addAttribute("bannerVoList", bannerVoList);
		
		List<TeacherVo> teacherVo = service.teacherListAll();
		
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
		
		model.addAttribute("teacherVo", teacherVo);
		
		return "aTeacherMain";
	}
	
	
	@RequestMapping(value="/aTeacher/teaDetail/{tea_id}", method=RequestMethod.POST)
	public @ResponseBody TeacherVo teaDetail(
			HttpServletRequest request,
			HttpServletResponse response,
			@PathVariable(value="tea_id") String tea_id,Model model,HttpSession session) {
		
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

		ObjectMapper mapper = new ObjectMapper();
		response.setContentType("application/json;charset=UTF-8");

		TeacherVo jsonres = new TeacherVo();
		
		jsonres = service.teaDetail(tea_id);
		String rename = changePath(jsonres.getTea_intro_img());
		jsonres.setTea_intro_img(rename);
		
		return jsonres;
	}
	
	public String changePath(String path) {
	      int index = path.lastIndexOf("\\") + 1;
	      String rename = path.substring(index);
	      return rename;
	}
	
	@RequestMapping(value="/aTeacher/teaJoin", method=RequestMethod.POST)
	public String teaJoin(TeacherVo mVo){
		service.teaInsert(mVo);
		return "redirect:/aTeacher/aTeacherMain";
	}
	
	@RequestMapping(value="/aTeacher/teaUpdate", method=RequestMethod.POST)
	public @ResponseBody String teaUpdate(TeacherVo mVo) {
		service.teaUpdate(mVo);
		return "OK";
	}
	
	@RequestMapping(value="/aTeacher/teaDel", method=RequestMethod.GET)
	public String memJoin(@RequestParam("tea_id") String tea_id){
		service.teaDelete(tea_id);
		
		return "aTeacherMain";
	}
	
}
