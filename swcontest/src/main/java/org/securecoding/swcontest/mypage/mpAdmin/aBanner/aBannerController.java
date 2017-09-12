package org.securecoding.swcontest.mypage.mpAdmin.aBanner;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import org.securecoding.swcontest.main.controller.DDayCount;
import org.securecoding.swcontest.main.service.MainService;
import org.securecoding.swcontest.main.vo.BannerVo;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.NoteVo;
import org.securecoding.swcontest.vo.ProcessClaVo;
import org.securecoding.swcontest.vo.TeacherVo;

@Controller
public class aBannerController {

	@Resource(name="mainService")
	private MainService mainService;
	
	@Autowired
	private DDayCount dday;
	
	@Resource(name="aBannerService")
	private aBannerService bannerService;
	
	@RequestMapping("/aBanner/aBannerMain")
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
		List<BannerVo> originBannerList = dday.getAllDay();
		for(BannerVo vo : originBannerList) {
			vo.setBann_date(vo.getBann_date().substring(0, 10));
		}
		model.addAttribute("banner", originBannerList);
		
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
		
		return "aBannerMain";
	}
	
	public String changePath(String path) {
	      int index = path.lastIndexOf("\\") + 1;
	      String rename = path.substring(index);
	      return rename;
	}

	
	@RequestMapping(value="/aBanner/aBannerInsert", method=RequestMethod.POST)
	public @ResponseBody String insert(BannerVo vo) {
		bannerService.insert(vo);
		return "OK";
	}
	
	@RequestMapping(value="/aBanner/aBannerUpdate", method=RequestMethod.POST)
	public @ResponseBody String update(BannerVo vo) {
		bannerService.update(vo);
		return "OK";
	}
	
	@RequestMapping(value="/aBanner/aBannerDelete", method=RequestMethod.POST) 
	public @ResponseBody String delete(String bann_num) {
		bannerService.delete(bann_num);
		return "OK";
	}
}
