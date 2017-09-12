package org.securecoding.swcontest.customerCenter.cuAdmin.ainquire;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.securecoding.swcontest.comment.CommentService;
import org.securecoding.swcontest.main.controller.DDayCount;
import org.securecoding.swcontest.main.service.MainService;
import org.securecoding.swcontest.main.vo.BannerVo;
import org.securecoding.swcontest.vo.AnswerBoardFileVo;
import org.securecoding.swcontest.vo.AnswerBoardVo;
import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.BorcommVo;
import org.securecoding.swcontest.vo.FileVo;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.NoteVo;
import org.securecoding.swcontest.vo.TeacherVo;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
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
public class CuaInquireBoardController implements ApplicationContextAware{
@Resource(name="cuaInquireService")
private CuaInquireService service;


@ModelAttribute("ansVo")
public AnswerBoardVo formValue() {
	return new AnswerBoardVo();
}
@Value("#{testProp.savePath}")
File saveFolder;

@Resource(name="mainService")
private MainService mainService;

@Autowired
private DDayCount dday;

AnswerBoardFileVo vo = new AnswerBoardFileVo();
WebApplicationContext context;

@Override
public void setApplicationContext(ApplicationContext context)
		throws BeansException {
	this.context = (WebApplicationContext) context;
	
}
@RequestMapping(value="/adminInquire", method=RequestMethod.GET)
public String returnInquirePage(Model model,HttpSession session){
	List<AnswerBoardVo> list=service.ainquireList();
	
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
	
	model.addAttribute("main",list);
	return "cuAdminInquireBoard";
}

public String changePath(String path) {
    int index = path.lastIndexOf("\\") + 1;
    String rename = path.substring(index);
    return rename;
}


	@RequestMapping(value="/customerCenter/cuAdminInquireForm", method=RequestMethod.GET)
	public String returnForm(HttpSession session,Model model){
		
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
		
		return "cuAdminInquireForm";
	}
	
		

	@RequestMapping(value="/customerCenter/cuAdminInquireDetail/{num}")
	public String returnDetail(@PathVariable("num") String ans_bor_num, Model model,HttpSession session){
		
		String id=(String)session.getAttribute("mem_id");
		List<NoteVo> list3 = mainService.noteList(id);
		List<NoteVo> list4 = mainService.noteSendList(id);
		NoteVo count1=mainService.noteCheckCount(id);
		model.addAttribute("note", list3);
		model.addAttribute("noteSend", list4);
		model.addAttribute("notec", count1);
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
		
		AnswerBoardVo vo2=service.ainquireDetail(ans_bor_num);
		int count=vo2.getAns_bor_chk_con()+1;
		vo2.setAns_bor_chk_con(count);
		vo2.setAns_bor_num(ans_bor_num);
		service.ainquireCount(vo2);
		AnswerBoardVo vo=service.ainquireDetail(ans_bor_num);
		
		List<AnswerBoardFileVo> ansfileVo=service.ainquireDownload(ans_bor_num);
		
		
		
		model.addAttribute("ainquireVo", vo);
		model.addAttribute("ansfileVo", ansfileVo);
		model.addAttribute("ans_bor_num", ans_bor_num);
		
		
		return "cuAdminInquireDetail";
	}
	
	

	@RequestMapping(value="/customerCenter/cuAdminInquireReplyDetail/{num}")
	public String ReplyDetail(@PathVariable("num") String ans_bor_num, Model model,HttpSession session){
		
		String id=(String)session.getAttribute("mem_id");
		List<NoteVo> list3 = mainService.noteList(id);
		List<NoteVo> list4 = mainService.noteSendList(id);
		NoteVo count1=mainService.noteCheckCount(id);
		model.addAttribute("note", list3);
		model.addAttribute("noteSend", list4);
		model.addAttribute("notec", count1);
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
		
		AnswerBoardVo vo2=service.ainquireDetail(ans_bor_num);
		int count=vo2.getAns_bor_chk_con()+1;
		vo2.setAns_bor_chk_con(count);
		vo2.setAns_bor_num(ans_bor_num);
		service.ainquireCount(vo2);
		AnswerBoardVo vo=service.ainquireDetail(ans_bor_num);
		
		List<AnswerBoardFileVo> ansfileVo=service.ainquireDownload(ans_bor_num);
		
		
		
		model.addAttribute("ainquireVo", vo);
		model.addAttribute("ansfileVo", ansfileVo);
		model.addAttribute("ans_bor_num", ans_bor_num);
		
		
		return "cuAdminInquireReplyDetail";
	}
	

	
	@RequestMapping(value="/customerCenter/cuAdminInquireReplyEdit/{num}")
	public String returnEditForm(@PathVariable("num") String ans_bor_num, Model model,HttpSession session){
		
		AnswerBoardVo vo=service.ainquireDetail(ans_bor_num);
		List<AnswerBoardFileVo> ansfilevo=service.ainquireDownload(ans_bor_num);
		model.addAttribute("cuaInquireVo", vo);
		model.addAttribute("ansfilevo", ansfilevo);
		
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
		
		
		return "cuAdminInquireReplyEdit";
	}
	

	@RequestMapping(value="/customerCenter/cuAdminInquireReplyEdit" ,method=RequestMethod.POST)
	public String update(AnswerBoardVo vo) throws IOException{
		
		service.ainquireUpdate(vo);
		String num=vo.getAns_bor_num();
		MultipartFile[] uploadFiles=vo.getUploadFiles();
		
		String[] tempFile=vo.getTempFile();
		for(String ans_bor_file_num:tempFile){
			service.ainquirefileDelete(ans_bor_file_num);
		}
		if(uploadFiles!=null){
			
			for(MultipartFile mFile : uploadFiles){
				uploadProcess(mFile, num);
			}
			
		}
		
		return "redirect:/adminInquire";	
	}
	
	
	

	@RequestMapping(value="/customerCenter/cuAdminInquireForm" ,method=RequestMethod.POST)
	public String insert(AnswerBoardVo vo) throws IOException{
		
		String num=service.ainquireInsert(vo);
		
		MultipartFile[] uploadFiles=vo.getUploadFiles();
	
		if(uploadFiles!=null){
			
			for(MultipartFile mFile : uploadFiles){
				uploadProcess(mFile, num);
			}
			
		}
		
		
		return "redirect:/adminInquire";	
	}
	
		

	@RequestMapping(value="/customerCenter/cuAdminInquireDelete/{num}")
	public String delete(@PathVariable("num") String ans_bor_num){
		
		service.ainquireDelete(ans_bor_num);
		return "redirect:/adminInquire";	
	}
	


	@RequestMapping(value="/customerCenter/cuInquireNumDelete/{num}")
	public String numDelete(@PathVariable("num") String ans_bor_num){
				
				service.ainquireNumDelete(ans_bor_num);
				return "redirect:/adminInquire";	
			}
	
	
	@RequestMapping(value = "/customerCenter/cuAdminInquireReply/{gnum}/{onum}/{nested}", method = RequestMethod.GET)
		public String replyForm(
					@PathVariable("gnum") String ans_bor_gup_num,
					@PathVariable("onum") String ans_bor_ori_num,
					@PathVariable("nested") String ans_bor_next_num,
					Model model,HttpSession session) {
				
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
				model.addAttribute("ans_bor_gup_num", ans_bor_gup_num);
				model.addAttribute("ans_bor_ori_num", ans_bor_ori_num);
				model.addAttribute("ans_bor_next_num", ans_bor_next_num);
				return "cuAdminInquireReplyForm";
			}
		
	
	@RequestMapping(value = "/customerCenter/cuAdminInquireReply")
		public String reply(AnswerBoardVo vo) throws IOException {

		
			int ans_bor_gup_num = vo.getAns_bor_gup_num();
			int ans_bor_ori_num = vo.getAns_bor_ori_num() + 1;
			int ans_bor_next_num = vo.getAns_bor_next_num() + 1;

	
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("ans_bor_gup_num", ans_bor_gup_num);
			map.put("ans_bor_ori_num", ans_bor_ori_num);
			service.updateAnsOnum(map);

	
			vo.setAns_bor_ori_num(ans_bor_ori_num);
			vo.setAns_bor_next_num(ans_bor_next_num);
			
			service.ainquireAnsInsert(vo);
			String num=vo.getAns_bor_num();
			MultipartFile[] uploadFiles = vo.getUploadFiles();
			
			if (uploadFiles != null) {
				for (MultipartFile mFile : uploadFiles) {
					uploadProcess(mFile, num);
				}
			}
			
			return "redirect:/adminInquire";
		}

	
	
	private String uploadProcess(MultipartFile mFile,String num) throws IOException {
		String oFileName = mFile.getOriginalFilename();
		String fileName = mFile.getName();
		long filesize=mFile.getSize();
		String refileName = null;
		String filePath =null;
		String ext = null;
		if(oFileName != null && oFileName.trim().length() > 0) {
			File uFile = new File(saveFolder, oFileName);
			if(createNewFile(uFile)) {
				refileName=oFileName;
				mFile.transferTo(uFile);	// 실제로 저장하는 것
				filePath = uFile.getAbsolutePath();
			
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
				filePath = uFile.getAbsolutePath();
				
			
			}	
		}
		
		vo.setAns_bor_file_name(oFileName);
		vo.setAns_bor_file_size(filesize);
		vo.setAns_bor_file_path(filePath);
		vo.setAns_bor_num(num);
		service.ainquireUpload(vo);
		return fileName;
	}
	
	private boolean createNewFile(File f) {
		try{
			return f.createNewFile();
		} catch(IOException ex) {
			return false;
		}
	}
	

	@RequestMapping("/ainquirefile.do") 
	public String download(@RequestParam("filename") String fname , Model model){
		
	
		File file = this.getFile(fname);
		
		AnswerBoardFileVo vo1=service.selectNumDownload(fname);
		vo1.getAns_bor_file_name();
		model.addAttribute("downfile", file);
		model.addAttribute("name",vo1);
		return "download"; 
		
	}
	
	
	public File getFile(String fname){
		
		File file = null;
		AnswerBoardFileVo vo=service.selectNumDownload(fname);	
		
		file = new File(vo.getAns_bor_file_path());		
		return file;
	}
		
}
