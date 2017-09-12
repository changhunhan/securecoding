package org.securecoding.swcontest.mypage.mpTeacher.tProfile;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.securecoding.swcontest.main.controller.DDayCount;
import org.securecoding.swcontest.main.service.MainService;
import org.securecoding.swcontest.main.vo.BannerVo;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.NoteVo;
import org.securecoding.swcontest.vo.TeacherVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class TeacherEditController {
	
	@Resource(name="tprofileservice")
	private TProfileService service;
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@Autowired
	private DDayCount dday;
	
	@Value("#{testProp.savePath}")
	File saveFolder;
		
	private  String tea_img;
	
	@RequestMapping("/video/teacherEdit")
	public String teacherProfile(Model model,HttpSession session) {
		
		String id=(String)session.getAttribute("mem_id");
		List<NoteVo> list3 = mainService.noteList(id);
		List<NoteVo> list4 = mainService.noteSendList(id);
		NoteVo count=mainService.noteCheckCount(id);
		model.addAttribute("note", list3);
		model.addAttribute("noteSend", list4);
		model.addAttribute("notec", count);
		List<BannerVo> bannerVoList = dday.getDDay();
		model.addAttribute("bannerVoList", bannerVoList);
		
		
		
		TeacherVo vo=new TeacherVo();
		vo.setTea_id(id);
		TeacherVo profile=service.teacherProfile(vo);
		

		String rename = changePath(profile.getTea_intro_img());
		profile.setTea_intro_img(rename);
		tea_img=profile.getTea_intro_img();
		
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
		
		model.addAttribute("profile",profile);
		
		
		return "teacherEdit";
	}
	
	public String changePath(String path) {
	      int index = path.lastIndexOf("\\") + 1;
	      String rename = path.substring(index);
	      return rename;
	}
	
	
	@RequestMapping(value="/video/ProfileUpdate", method = RequestMethod.POST)
	public @ResponseBody void teacherProfileUpdate(TeacherVo teacherVo,Model model,HttpSession session) throws IOException {

		String id=(String)session.getAttribute("mem_id");
		teacherVo.setTea_id(id);
		if(teacherVo.getTeacherImage() != null) {
			String fileName = this.uploadProcess(teacherVo.getTeacherImage());
			teacherVo.setTea_intro_img(fileName);
		} else {
			teacherVo.setTea_intro_img(tea_img);
		}
		service.teacherProfileUpdate(teacherVo);
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
