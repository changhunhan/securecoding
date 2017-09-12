package org.securecoding.swcontest.mypage.mpAdmin.aStudent;



import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.securecoding.swcontest.main.controller.DDayCount;
import org.securecoding.swcontest.main.service.MainService;
import org.securecoding.swcontest.main.vo.BannerVo;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.NoteVo;
import org.securecoding.swcontest.vo.TeacherVo;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class aStudentController {

	@Resource(name="aStudentService")
	private aStudentService service;
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@Autowired
	private DDayCount dday;
	
	@RequestMapping(value="/aStudent/aStudentMain", method=RequestMethod.GET)
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
		
		List<MemberVo> memberVo = service.memberListAll();
		
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
		
		model.addAttribute("memberVo", memberVo);
		
		return "aStudentMain";
	}

	
	@RequestMapping(value="/aStudent/memDetail/{mem_id}", method=RequestMethod.POST)
	public @ResponseBody MemberVo memDetail(
			HttpServletRequest request,
			HttpServletResponse response,
			@PathVariable(value="mem_id") String mem_id,Model model,HttpSession session) {

		ObjectMapper mapper = new ObjectMapper();
		response.setContentType("application/json;charset=UTF-8");

		MemberVo jsonres = new MemberVo();
		jsonres = service.memDetail(mem_id);
		String rename = changePath(jsonres.getMem_img_rename());
		jsonres.setMem_img_rename(rename);;
		
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
			String mRename = changePath(img.getMem_img_rename());
			allImg.setMem_img_rename(mRename);
		}

		model.addAttribute("img",allImg);
		
		return jsonres;
	}
	
	public String changePath(String path) {
	      int index = path.lastIndexOf("\\") + 1;
	      String rename = path.substring(index);
	      return rename;
	}
	
	@RequestMapping(value="/aStudent/memJoin", method=RequestMethod.GET)
	public String memJoin(MemberVo mVo){
		
		return "aStudentMain";
	}
	
	@RequestMapping(value="/aStudent/memDel", method=RequestMethod.GET)
	public String memJoin(@RequestParam("mem_id") String mem_id){
		service.memDelete(mem_id);
		
		return "aStudentMain";
	}
}
