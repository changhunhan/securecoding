package org.securecoding.swcontest.mypage.mpStudent.sInformation.controller;

import java.io.File;
import java.io.IOException;
import java.security.MessageDigest;
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
import org.securecoding.swcontest.mypage.mpStudent.sInformation.service.sInformationService;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.NoteVo;
import org.securecoding.swcontest.vo.TeacherVo;
import org.securecoding.swcontest.vo.ZipVo;

@Controller
public class sInformationController {
	@Resource(name = "sInformationService")
	private sInformationService service;
	
	@Resource(name="mainService")
	private MainService mainService;

	@Autowired
	DDayCount dday;
	
	@Value("#{testProp.savePath}")
	File saveFolder;
	
	private static String mem_img_rename;
	
	@RequestMapping("/sInformation/sInformationMain")
	public String studentMyPageForm(Model model, HttpSession session) throws IOException{
		
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
		MemberVo vo = service.selectAllById(mid);	
		if(vo.getMem_img_rename() != null) {
			mem_img_rename = vo.getMem_img_rename();
			String rename = changePath(vo.getMem_img_rename());
			vo.setMem_img_rename(rename);
		}
		model.addAttribute("memberVo", vo);
		
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
		
		return "sInformationMain";
	}
	
	
	
	@RequestMapping(value="/sInformation/searchDong")
	public @ResponseBody List<ZipVo> searchDong(String dong) {
		List<ZipVo> list = service.selectZipAll(dong);
		return list;
	}
	
	public String changePath(String path) {
		int index = path.lastIndexOf("\\") + 1;
		String rename = path.substring(index);
		return rename;
	}

	@RequestMapping(value = "/sInformation/updatePassword", method = RequestMethod.POST)
	public @ResponseBody int studentMyPageProcess(Model model,
			HttpSession session, @RequestParam String mem_pass)  throws Exception {
		MemberVo vo = new MemberVo();
		vo.setMem_id((String) session.getAttribute("mem_id"));
		vo.setMem_pass(mem_pass);
		int res = service.updatePasswordById(vo);
		getPasswordHash(mem_pass);
		return res;
	}
	
	@RequestMapping(value = "/sInformation/updateInfo", method = RequestMethod.POST)
	public @ResponseBody int updateInfo(MemberVo memberVo, Model model)  throws IOException {
		if(memberVo.getMemberImage() != null) {
			String fileName = this.uploadProcess(memberVo.getMemberImage());
			memberVo.setMem_img_rename(fileName);
		} else {
			memberVo.setMem_img_rename(mem_img_rename);
		}
		int res = service.updateById(memberVo);
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
	
	public String getPasswordHash(String password) throws Exception {
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.update(password.getBytes());
		byte byteData[] = md.digest();
		StringBuffer hexString = new StringBuffer();
		for (int i=0; i<byteData.length; i++) {
		String hex=Integer.toHexString(0xff & byteData[i]);
		if (hex.length() == 1) {
		hexString.append('0');
		}
		hexString.append(hex);
		}
		return hexString.toString();
		}
}
