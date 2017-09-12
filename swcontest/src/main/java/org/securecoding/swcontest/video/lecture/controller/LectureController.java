package org.securecoding.swcontest.video.lecture.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import org.securecoding.swcontest.main.controller.DDayCount;
import org.securecoding.swcontest.main.service.MainService;
import org.securecoding.swcontest.main.vo.BannerVo;
import org.securecoding.swcontest.mypage.mpAdmin.aTeacher.aTeacherService;
import org.securecoding.swcontest.video.lecture.service.LectureService;
import org.securecoding.swcontest.video.lecture.vo.LectureVo;
import org.securecoding.swcontest.video.lecture.vo.VideoVo;
import org.securecoding.swcontest.vo.BookMarkVo;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.MindmapVo;
import org.securecoding.swcontest.vo.NoteVo;
import org.securecoding.swcontest.vo.TeacherVo;

@Controller
public class LectureController {
	
	@Resource(name="lectureServices")
	private LectureService service;
	
	@Resource(name="aTeacherService")
	private aTeacherService service2;
	
	@Resource(name="mainService")
	private MainService mainService;

	@Value("#{testProp.savePath}")
	File saveFolder;
	
	@Autowired
	private DDayCount dday;
	
	@RequestMapping(value="/video/deleteLecture")
	public @ResponseBody String deleteProcess(String lec_num) {
		service.deleteLecture(lec_num);
		return "OK";
	}
	
	
	@RequestMapping("/video/lectureUpload")
	public String uploadPage(@RequestParam("cur_num") String cur_num, Model model,HttpSession session) {
		
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
		model.addAttribute("cur_num", cur_num);
		
		return "videoUpload";
	}
	
	
	@RequestMapping(value="/video/lectureDetail/{num}", method=RequestMethod.GET)
	public String returnDetail(@PathVariable("num") String num, Model model){
		
	
		MindmapVo vo=new MindmapVo();
		vo.setCur_num(num);;
		model.addAttribute("curVo",vo);
		return "lectureDetail";
	}
	
	@RequestMapping("/video/editLecture")
	public String editVideoPage(String lec_num, Model model,HttpSession session) throws Exception {
		LectureVo lectureVo = service.selectLectureById(lec_num);
		VideoVo videoVo = service.selectVideoById(lec_num);
		model.addAttribute("lecVo", lectureVo);
		model.addAttribute("videoVo", videoVo);
		List<BookMarkVo> bookMarkList = service.selectBookMarkList(lec_num);
		model.addAttribute("BMList", bookMarkList);
		if(bookMarkList.size() == 0) {
			model.addAttribute("size", bookMarkList.size());
		} else {
			model.addAttribute("size", bookMarkList.size()-1);
		}
		
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
		return "editLecture";
	}
	
	public String changePath(String path) {
	      int index = path.lastIndexOf("\\") + 1;
	      String rename = path.substring(index);
	      return rename;
	}
	
	@RequestMapping(value="/video/lectureVideoUpload", method=RequestMethod.POST)
	public @ResponseBody String uploadProcess(LectureVo lectureVo, VideoVo videoVo,String[] time, String[] text, String[] cont, @RequestParam MultipartFile poster, @RequestParam String tol_vio_time, Model model, HttpSession session) throws IOException {
		String fileName = this.uploadProcess(lectureVo.getVideo());
		videoVo.setTea_id((String)session.getAttribute("mem_id"));
		videoVo.setVio_path(fileName);
		String posterName = this.uploadProcess(poster);
		if(posterName.equals("poster")){
			TeacherVo teaVo=service2.teaDetail((String)session.getAttribute("mem_id"));
			videoVo.setVio_poster_path(teaVo.getTea_intro_img());
		}
		else{
			videoVo.setVio_poster_path(posterName);
		}
		String lec_id = service.insertLecture(lectureVo);
		videoVo.setLec_num(lec_id);
		String id = service.insertVideo(videoVo);
		
		List<BookMarkVo> bookMarkList = new ArrayList<>();
		BookMarkVo bookMarkVo = null;
		String res = null;
		if(time != null) {
			for(int i = 0; i < time.length; i++) {
				bookMarkVo = new BookMarkVo();
				if(!time[i].equals("undefined")) {
					bookMarkVo.setBkmark_time(time[i]);
					bookMarkVo.setBkmark_title(text[i]);
					bookMarkVo.setBkmark_cont(cont[i]);
					bookMarkVo.setLec_num(lec_id);
					bookMarkList.add(bookMarkVo);
				}
			}
			Map<String, Object> map = new HashMap<>();
			map.put("List", bookMarkList);
			int listRes = 0;
			if(bookMarkList.size() != 0) {
				 listRes = service.insertBookMarkList(map);
			  }
			res = Integer.toString(listRes);
		}
		return res;
	}
	
	@RequestMapping(value="/video/editUpload", method=RequestMethod.POST)
	public @ResponseBody String editProcess(LectureVo lectureVo, VideoVo videoVo, String[] time, String[] text, String[] cont, @RequestParam MultipartFile poster, @RequestParam String tol_vio_time, Model model, HttpSession session) throws IOException {
		if(videoVo.getVio_size().equals("0")) {
			service.updateLecture(lectureVo);
		} else {
			String fileName = this.uploadProcess(lectureVo.getVideo());
			String posterName = this.uploadProcess(poster);
			videoVo.setVio_path(fileName);
			if(posterName.equals("poster")){
				TeacherVo teaVo=service2.teaDetail((String)session.getAttribute("mem_id"));
				videoVo.setVio_poster_path(teaVo.getTea_intro_img());
			}
			else{
				videoVo.setVio_poster_path(posterName);
			}
			service.updateVideo(videoVo);
			service.updateLecture(lectureVo);
		}
		if(service.selectBookMarkList(lectureVo.getLec_num()).size() != 0) 
			service.deleteBookMark(lectureVo.getLec_num());
		
		List<BookMarkVo> bookMarkList = new ArrayList<>();
		BookMarkVo bookMarkVo = null;
		String res = null;
		if(time != null) {
			for(int i = 0; i < time.length; i++) {
				bookMarkVo = new BookMarkVo();
				if(!time[i].equals("undefined")) {
					bookMarkVo.setBkmark_time(time[i]);
					bookMarkVo.setBkmark_title(text[i]);
					bookMarkVo.setBkmark_cont(cont[i]);
					bookMarkVo.setLec_num(lectureVo.getLec_num());
					bookMarkList.add(bookMarkVo);
				}
			}
			Map<String, Object> map = new HashMap<>();
			map.put("List", bookMarkList);
			int listRes = 0;
			if(bookMarkList.size() != 0) {
				listRes = service.insertBookMarkList(map);
			
			}
			res = Integer.toString(listRes);
		}
		return res;
	}
	
	private String uploadProcess(MultipartFile mFile) throws IOException{
		String oFileName = mFile.getOriginalFilename();
		String fileName = mFile.getName();
		
		String refileName = null;
		String ext = null;
		if(oFileName != null && oFileName.trim().length() > 0) {
			File uFile = new File(saveFolder, oFileName);
			if(createNewFile(uFile)) {
				mFile.transferTo(uFile);	// 실제로 저장하는 것
				fileName = uFile.getAbsolutePath();
				return fileName;
			} else {
				int dot = oFileName.lastIndexOf(".");
				if(dot != -1) {
					fileName = oFileName.substring(0, dot);
					ext = oFileName.substring(dot);
				}
				int count = 0;
				while(!createNewFile(uFile)) {
					count++;
					refileName = fileName + "(" + count + ")" + ext;
					uFile = new File(saveFolder, refileName);
				}
					
					mFile.transferTo(uFile);
					refileName = uFile.getAbsolutePath();
				return refileName;
			}
		}
		return fileName;
	}
	
	private boolean createNewFile(File f) {
		try{
			return f.createNewFile();
		} catch(IOException ex) {
			return false;
		}
	}
}
