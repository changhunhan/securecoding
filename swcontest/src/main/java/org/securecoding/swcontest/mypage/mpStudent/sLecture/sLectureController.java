package org.securecoding.swcontest.mypage.mpStudent.sLecture;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.securecoding.swcontest.main.controller.DDayCount;
import org.securecoding.swcontest.main.service.MainService;
import org.securecoding.swcontest.main.vo.BannerVo;
import org.securecoding.swcontest.vo.CurriReqVo;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.NoteVo;
import org.securecoding.swcontest.vo.TeacherVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class sLectureController {

	@Resource(name ="sLectureService")
	sLectureService service; 
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@Autowired
	private DDayCount dday;
	
	@RequestMapping(value="/sLecture/sLectureList/{mid}", method=RequestMethod.GET)
	public String returnForm(Model model,@PathVariable("mid") String mid,HttpSession session){
		
		String id=(String)session.getAttribute("mem_id");
		List<NoteVo> list3 = mainService.noteList(id);
		List<NoteVo> list4 = mainService.noteSendList(id);
		NoteVo count=mainService.noteCheckCount(id);
		model.addAttribute("note", list3);
		model.addAttribute("noteSend", list4);
		model.addAttribute("notec", count);
		List<BannerVo> bannerVoList = dday.getDDay();
		model.addAttribute("bannerVoList", bannerVoList);
		
			
		List<CurriReqVo> list=service.curriReqList(mid);
		
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
			
		model.addAttribute("curr",list);
		
		return "sLectureList";
	}
	
	public String changePath(String path) {
		int index = path.lastIndexOf("\\") + 1;
		String rename = path.substring(index);
		return rename;
	}
	
	@RequestMapping(value="/sLecture/curriDelte", method=RequestMethod.POST)
	public @ResponseBody String curriDel(Model model,CurriReqVo vo,HttpSession session){
		String mid=vo.getCur_req_num();
		service.curriDelete(mid);
		vo.setMem_id((String)session.getAttribute("mem_id"));
		
		service.lecWatDelete(vo);
		return "ik";
	}
		
	
}
