package org.securecoding.swcontest.mypage.mpAdmin.aVideo;

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
import org.securecoding.swcontest.video.lecture.vo.VideoVo;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.NoteVo;
import org.securecoding.swcontest.vo.TeacherVo;

@Controller
public class aVideoController {

	@Resource(name="mainService")
	private MainService mainService;
	
	@Autowired
	private DDayCount dday;
	
	@Resource(name="aVideoService")
	private aVideoService videoService;
	
	@RequestMapping(value="/aVideo/aVideoDelete", method=RequestMethod.POST)
	public @ResponseBody String deleteVideo(String num) {
		videoService.videoDelete(num);
		return "OK";
	}
	
	@RequestMapping(value="/aVideo/aVideoMain", method=RequestMethod.GET)
	public String returnForm(HttpSession session, Model model){
		
		String id=(String)session.getAttribute("mem_id");
		List<NoteVo> list3 = mainService.noteList(id);
		List<NoteVo> list4 = mainService.noteSendList(id);
		NoteVo count=mainService.noteCheckCount(id);
		model.addAttribute("note", list3);
		model.addAttribute("noteSend", list4);
		model.addAttribute("notec", count);
		List<BannerVo> bannerVoList = dday.getDDay();
		
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
		List<VideoVo> aVideoList = videoService.selectLectureAll();
		for(VideoVo vo : aVideoList) {
			vo.setVio_poster_path(changePath(vo.getVio_poster_path()));
		}
		model.addAttribute("aVideoList", aVideoList);
		model.addAttribute("img",allImg);
		model.addAttribute("bannerVoList", bannerVoList);
		
		return "aVideoMain";
	}
	
	public String changePath(String path) {
	      int index = path.lastIndexOf("\\") + 1;
	      String rename = path.substring(index);
	      return rename;
	}
}
