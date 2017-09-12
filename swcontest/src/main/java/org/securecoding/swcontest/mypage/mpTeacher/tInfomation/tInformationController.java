package org.securecoding.swcontest.mypage.mpTeacher.tInfomation;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import org.securecoding.swcontest.main.controller.DDayCount;
import org.securecoding.swcontest.main.service.MainService;
import org.securecoding.swcontest.main.vo.BannerVo;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.NoteVo;
import org.securecoding.swcontest.vo.ProcessClaVo;
import org.securecoding.swcontest.vo.TeacherVo;
import org.securecoding.swcontest.vo.ZipVo;

@Controller
public class tInformationController {
	
	@Resource(name = "tInformationService")
	private tInfomationService service;

	@Resource(name="mainService")
	private MainService mainService;
	
	@Autowired
	private DDayCount dday;
	
	@Value("#{testProp.savePath}")
	File saveFolder;
	
	private String tea_img;
	
	@RequestMapping(value="/tInformation/tInformationMain", method=RequestMethod.GET)
	public String returnForm(HttpSession session, Model model) throws IOException{
		
		String id=(String)session.getAttribute("mem_id");
		List<NoteVo> list3 = mainService.noteList(id);
		List<NoteVo> list4 = mainService.noteSendList(id);
		NoteVo count=mainService.noteCheckCount(id);
		model.addAttribute("note", list3);
		model.addAttribute("noteSend", list4);
		model.addAttribute("notec", count);
		List<BannerVo> bannerVoList = dday.getDDay();
		model.addAttribute("bannerVoList", bannerVoList);
		
		String mid = (String) session.getAttribute("mem_id");
		TeacherVo idaa=new TeacherVo();
		idaa.setTea_id(mid);
		
		TeacherVo vo = service.selectById(idaa);	
		
		if(vo.getTea_img() != null) {
			tea_img = vo.getTea_img();
			String rename = changePath(vo.getTea_img());
			vo.setTea_img(rename);;
		}
		model.addAttribute("teacherVo", vo);
		List<ProcessClaVo> proceList = service.proceAll();
		model.addAttribute("proceCode", proceList);
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
		
		return "tInformationMain";
	}
	
	@RequestMapping(value="/tInformation/searchDong")
	public @ResponseBody List<ZipVo> searchDong(String dong) {
		List<ZipVo> list = service.selectZipAll(dong);
		return list;
	}
	
	public String changePath(String path) {
	      int index = path.lastIndexOf("\\") + 1;
	      String rename = path.substring(index);
	      return rename;
	   }
	

	@RequestMapping(value = "/tInformation/updatePassword", method = RequestMethod.POST)
	public @ResponseBody int studentMyPageProcess(Model model,
			HttpSession session, @RequestParam String tea_pass) {
		TeacherVo vo = new TeacherVo();
		vo.setTea_id((String) session.getAttribute("mem_id"));
		
		vo.setTea_pass(tea_pass);
		int res = service.teacherPasswordUpdate(vo);
		return res;
	}
	
	@RequestMapping(value = "/tInformation/updateInfo", method = RequestMethod.POST)
	public @ResponseBody int updateInfo(TeacherVo teacherVo, Model model)  throws IOException {
		if(teacherVo.getTeacherImage() != null) {
			String fileName = this.uploadProcess(teacherVo.getTeacherImage());
			teacherVo.setTea_img(fileName);
		} else {
			teacherVo.setTea_img(tea_img);
		}
				
		int res = service.teacherUpdate(teacherVo);
		return res; 
	}

	public String uploadProcess(MultipartFile mFile) throws IOException {
		
		String oFileName = mFile.getOriginalFilename();
		String fileName = mFile.getName();
		String refileName = null;
		String ext = null;
		if(oFileName != null && oFileName.trim().length() > 0) {
			File uFile = new File(saveFolder, oFileName);
			if(createNewFile(uFile)) {
				mFile.transferTo(uFile);	
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
