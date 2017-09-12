package org.securecoding.swcontest.mypage.mpStudent.sInquire;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.securecoding.swcontest.comment.CommentService;
import org.securecoding.swcontest.main.controller.DDayCount;
import org.securecoding.swcontest.main.service.MainService;
import org.securecoding.swcontest.main.vo.BannerVo;
import org.securecoding.swcontest.vo.AnswerBoardFileVo;
import org.securecoding.swcontest.vo.AnswerBoardVo;
import org.securecoding.swcontest.vo.BorcommVo;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.NoteVo;
import org.securecoding.swcontest.vo.TeacherVo;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class sInquireController {

	@Resource(name = "sInquireService")
	private sInquireService service;

	@ModelAttribute("ansVo")
	public AnswerBoardVo formValue() {
		return new AnswerBoardVo();
	}
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@Autowired
	private DDayCount dday;

	@Value("#{testProp.savePath}")
	File saveFolder;

	

	@RequestMapping(value = "/sInquire/sInquireMain", method = RequestMethod.GET)
	public String returnLoginPage(Model model,HttpSession session) {
		String mem_id=(String) session.getAttribute("mem_id");
		
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
		
		AnswerBoardVo ansVo=new AnswerBoardVo();
		
		List<AnswerBoardVo> list1=new ArrayList<AnswerBoardVo>();
		
		List<AnswerBoardVo> group_num=service.sInquireByid(mem_id);
		for(AnswerBoardVo temp:group_num){
			int gnum=temp.getAns_bor_gup_num();
			ansVo.setAns_bor_wri_pers(mem_id);
			ansVo.setAns_bor_gup_num(gnum);
		
			List<AnswerBoardVo> list = service.sInquireList(ansVo);
			list1.addAll(list);
		}
		
		
		
		model.addAttribute("anslist", list1);
		return "sInquireMain";
		
	}
	
	public String changePath(String path) {
	      int index = path.lastIndexOf("\\") + 1;
	      String rename = path.substring(index);
	      return rename;
	}
	
	
	@RequestMapping(value = "/sInquire/sInquireDetail/{num}")
		public String returnDetail(
				@PathVariable("num") String ans_bor_num,
				Model model) {
			
			AnswerBoardVo vo = service.sInquireDetail(ans_bor_num);
			vo.setAns_bor_num(ans_bor_num);
			AnswerBoardVo resVo = service.sInquireDetail(ans_bor_num);
			model.addAttribute("knowledgeVo", resVo);
			model.addAttribute("ans_bor_num", ans_bor_num);
			return "sInquireDetail";
		}
	


	@RequestMapping(value = "/sInquire/sInquireDelete/{num}")
	public String delete(@PathVariable("num") String ans_bor_num) {
		service.sInquireDelete(ans_bor_num);
		return "redirect:/sInquire/sInquireMain";
	}


}
