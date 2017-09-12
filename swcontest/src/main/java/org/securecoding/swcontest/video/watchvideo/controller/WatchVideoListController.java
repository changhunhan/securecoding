package org.securecoding.swcontest.video.watchvideo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.securecoding.swcontest.mindmap.service.MindmapService;
import org.securecoding.swcontest.video.lecture.vo.LectureVo;
import org.securecoding.swcontest.video.lecture.vo.VideoVo;
import org.securecoding.swcontest.video.watchvideo.service.WatchVideoService;
import org.securecoding.swcontest.vo.BookMarkVo;
import org.securecoding.swcontest.vo.CurriReqVo;
import org.securecoding.swcontest.vo.LecComVo;
import org.securecoding.swcontest.vo.LecWatVo;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.MindmapVo;
import org.securecoding.swcontest.vo.NoteVo;
import org.securecoding.swcontest.vo.TeacherVo;

@Controller
public class WatchVideoListController {

	@Resource(name="watchVideoService")
	private WatchVideoService service;
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@Resource(name = "mindmapservice")
	MindmapService mindService;
	
	@Autowired
	private DDayCount dday;
	
	
	@RequestMapping("/video/watchVideo")
	public String watchPage(HttpSession session,String num, Model model){
		
		String id=(String)session.getAttribute("mem_id");
		List<NoteVo> list3 = mainService.noteList(id);
		List<NoteVo> list4 = mainService.noteSendList(id);
		NoteVo count=mainService.noteCheckCount(id);
		model.addAttribute("note", list3);
		model.addAttribute("noteSend", list4);
		model.addAttribute("notec", count);
		List<BannerVo> bannerVoList = dday.getDDay();
		model.addAttribute("bannerVoList", bannerVoList);
		
		LectureVo lectureVo = service.selectLectureById(num);
		VideoVo videoVo = service.selectVideoById(num);
		List<BookMarkVo> bookMarkList = service.selectBookMarkListById(lectureVo.getLec_num());
		videoVo.setVio_path(changePath(videoVo.getVio_path()));
		videoVo.setVio_poster_path(changePath(videoVo.getVio_poster_path()));
		model.addAttribute("videoVo", videoVo);
		model.addAttribute("bookMarkList", bookMarkList);
		if(bookMarkList.size() == 0) {
			model.addAttribute("size", bookMarkList.size());
		} else {
			model.addAttribute("size", bookMarkList.size()-1);
		}
		List<LecComVo> lecComList = service.selectCommentAll(lectureVo.getLec_num());
		LecWatVo lecWatVo = new LecWatVo();
		lecWatVo.setMem_id((String)session.getAttribute("mem_id"));
		lecWatVo.setLec_num(lectureVo.getLec_num());
		LecWatVo vo = service.selectLecWat(lecWatVo);
		if(vo == null) {
			vo = new LecWatVo();
			vo.setLec_play_time("0");
		}
		
		MindmapVo mmind=mindService.mindmapResult(lectureVo.getLec_num());
		model.addAttribute("mmind",mmind);
		model.addAttribute("lectureVo", lectureVo);
		model.addAttribute("lecWatVo", vo);
		for(LecComVo x : lecComList) {
			x.setComm_img(changePath(x.getComm_img()));
		}
		model.addAttribute("lecComList", lecComList);
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
		
		return "watchVideo";
	}
	
	public String changePath(String path) {
		int index = path.lastIndexOf("\\") + 1;
		String rename = path.substring(index);
		return rename;
	}
	
	@RequestMapping(value="/video/watch/addComment", method=RequestMethod.POST)
	public @ResponseBody Object addComment(LecComVo lecComVo, HttpSession session, Model model) {
		lecComVo.setLec_comm_wri_pers((String) session.getAttribute("mem_id"));
		service.insertComment(lecComVo);
		List<LecComVo> lecComList = service.selectCommentAll(lecComVo.getLec_num());
		Map<String, Object> map = new HashMap<>();
		map.put("lecComList", lecComList);
		return map;
	}
	
	@RequestMapping(value="/video/watch/deleteComment", method=RequestMethod.POST)
	public @ResponseBody String deleteComment(String key) {
		service.deleteComment(key);
		return "OK";
	}
	
	@RequestMapping(value="/video/watch/updateStartTime", method=RequestMethod.POST)
	public @ResponseBody String updateStartTime(LecWatVo lecWatVo, HttpSession session) {
		lecWatVo.setMem_id((String) session.getAttribute("mem_id"));
		LecWatVo vo = service.selectLecWat(lecWatVo);
		
		if(vo == null) {
			service.insertLecWat(lecWatVo);
		} else {
			lecWatVo.setLec_num(vo.getLec_num());
			service.updateLecWat(lecWatVo);
		}
		
		double searchNum = Double.parseDouble(service.searchNum(lecWatVo));
		double totalNum = Double.parseDouble(service.totalNum(lecWatVo.getCur_num()));
		CurriReqVo cvo = new CurriReqVo();
		cvo.setCur_num(lecWatVo.getCur_num());
		cvo.setMem_id((String) session.getAttribute("mem_id"));
		cvo.setCur_achie_rate(String.valueOf((searchNum/totalNum)*100));
		service.updateCurAchieve(cvo);
		
		return "OK";
	}
	
}
