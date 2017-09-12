package org.securecoding.swcontest.mypage.mpStudent.sAdvice;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

@Controller
public class sAdviceController {
	
	@Resource(name = "sAdviceService")
	private sAdviceService service;
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@Autowired
	private DDayCount dday;

	@RequestMapping(value="/sAdvice/studentPage")
	public String studentpage(String num, Model model,HttpSession session) {
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
		model.addAttribute("num", num);
		return "studentPage";
	}
	
	@RequestMapping(value="/sAdvice/studentKey", method=RequestMethod.POST)
	public @ResponseBody String getKey(String num) {
		String res = service.selectKey(num);
		return res;
	}
	
	@RequestMapping(value="/sAdvice/sAdviceMain", method=RequestMethod.GET)
	public String returnForm(HttpSession session, Model model){
		
		String id=(String)session.getAttribute("mem_id");
		List<NoteVo> list3 = mainService.noteList(id);
		List<NoteVo> list4 = mainService.noteSendList(id);
		NoteVo count=mainService.noteCheckCount(id);
		model.addAttribute("note", list3);
		model.addAttribute("noteSend", list4);
		model.addAttribute("notec", count);
		List<BannerVo> bannerVoList = dday.getDDay();
		model.addAttribute("bannerVoList", bannerVoList);
		
		List<TeacherVo> tVo = service.selectAllTeacher();
		model.addAttribute("tList", tVo);
		String adv_mem_id = (String) session.getAttribute("mem_id");
		List<AdviceVo> advList =  service.selectAdviceBySid(adv_mem_id);
		for(AdviceVo x : advList) {
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				Date endDate = transFormat.parse(x.getEnd().replace("T", " "));
				Date today = new Date();
				if((today.getTime() - endDate.getTime()) > 0) {
					service.updateState(x.getId());
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				System.out.println("ERROR");
			}
		}
		model.addAttribute("advList", advList);
		
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
		
		return "sAdviceMain";
	}
	
	public String changePath(String path) {
		int index = path.lastIndexOf("\\") + 1;
		String rename = path.substring(index);
		return rename;
	}
	
	@RequestMapping(value="/calList", method=RequestMethod.POST)
	@ResponseBody
	public List<AdviceVo> calList(HttpSession session, Model model){
		String adv_mem_id = (String) session.getAttribute("mem_id");
		List<AdviceVo> vo = service.selectAdviceBySid(adv_mem_id);
		model.addAttribute("vo", vo);
		return vo;
	}
	
	@RequestMapping(value="/teacherAdvCal", method=RequestMethod.POST)
	@ResponseBody
	public List<AdviceVo> teacherAdvCal(@RequestParam String tea_id){
		
		List<AdviceVo> vo = service.selectAdviceByAdv_tea_id(tea_id);
		return vo;
	}
	
	@RequestMapping(value="/calDel", method=RequestMethod.POST)
	public void calDel(String id){
		service.deleteAdviceByAdvNum(id);

	}
	
	@RequestMapping(value="/calInsert", method=RequestMethod.POST)
	public void calDel(HttpSession session,
			@RequestParam String start,
			@RequestParam String end
			){
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
	}
	
	@RequestMapping(value="/enrollAdvice", method=RequestMethod.POST)
	public void enrollAdvice(AdviceVo vo, HttpSession session){
		String adv_mem_id = (String) session.getAttribute("mem_id");
		
		Date d = new Date();
        String s = d.toString();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String adv_enroll = sdf.format(d);
				
		AdviceVo resVo = new AdviceVo();
		resVo.setId(vo.getId());
		resVo.setAdv_mem_id(adv_mem_id);
		resVo.setAdv_divi(vo.getAdv_divi());
		resVo.setAdv_enroll(adv_enroll);

		service.updateAdviceByAdv_num(resVo);
	}
		
	
}
