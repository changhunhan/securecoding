package org.securecoding.swcontest.customerCenter.inquireBoard;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.securecoding.swcontest.comment.CommentService;
import org.securecoding.swcontest.community.knowledgeBoard.CmKnowledgeService;
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

import org.codehaus.jackson.map.ObjectMapper;
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
public class CuInquireBoardController implements ApplicationContextAware{
@Resource(name="cuInpuireService")
private CuInquireService service;

@Resource(name = "cmKnowledgeService")
private CmKnowledgeService cmService;

@Resource(name="mainService")
private MainService mainService;

@Autowired
private DDayCount dday;

	
@ModelAttribute("ansVo")
public AnswerBoardVo formValue() {
	return new AnswerBoardVo();
}

@Value("#{testProp.savePath}")
File saveFolder;

AnswerBoardFileVo vo = new AnswerBoardFileVo();
WebApplicationContext context;

@Override
public void setApplicationContext(ApplicationContext context)
		throws BeansException {
	this.context = (WebApplicationContext) context;
	
}
	@RequestMapping(value="/returnInquire", method=RequestMethod.GET)
	public String returnInquirePage(Model model,HttpSession session){
		List<AnswerBoardVo> list=service.inquireList();
		for(AnswerBoardVo sss : list) {
			if(cmService.checkFile(sss.getAns_bor_num()) != 0) {
				sss.setCheckFile("y");
			} else {
				sss.setCheckFile("n");
			}
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
		
		model.addAttribute("main",list);
		return "cuInquireBoard";
	}
	public String changePath(String path) {
	      int index = path.lastIndexOf("\\") + 1;
	      String rename = path.substring(index);
	      return rename;
	}

	
		@RequestMapping(value="/customerCenter/cuInquireForm", method=RequestMethod.GET)
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
			
			return "cuInquireForm";
		}
		
			

		@RequestMapping(value="/customerCenter/cuInquireDetail/{num}")
		public String returnDetail(@PathVariable("num") String ans_bor_num, Model model,HttpSession session){
			
			AnswerBoardVo vo2=service.inquireDetail(ans_bor_num);
			int count=vo2.getAns_bor_chk_con()+1;
			vo2.setAns_bor_chk_con(count);
			vo2.setAns_bor_num(ans_bor_num);
			service.inquireCount(vo2);
			AnswerBoardVo vo=service.inquireDetail(ans_bor_num);
			
			List<AnswerBoardFileVo> ansfileVo=service.inquireDownload(ans_bor_num);
			
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
			
			
			
			model.addAttribute("inquireVo", vo);
			model.addAttribute("ansfileVo", ansfileVo);
			model.addAttribute("ans_bor_num", ans_bor_num);
		
			return "cuInquireDetail";
		}
		


	@RequestMapping(value="/customerCenter/cuInquireReplyDetail/{num}")
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
					
					AnswerBoardVo vo2=service.inquireDetail(ans_bor_num);
					int count=vo2.getAns_bor_chk_con()+1;
					vo2.setAns_bor_chk_con(count);
					vo2.setAns_bor_num(ans_bor_num);
					service.inquireCount(vo2);
					AnswerBoardVo vo=service.inquireDetail(ans_bor_num);
					
					List<AnswerBoardFileVo> ansfileVo=service.inquireDownload(ans_bor_num);
					
					
					
					model.addAttribute("inquireVo", vo);
					model.addAttribute("ansfileVo", ansfileVo);
					model.addAttribute("ans_bor_num", ans_bor_num);
				
					return "cuInquireReplyDetail";
				}
		

		@RequestMapping(value="/customerCenter/cuInquireEdit/{num}")
		public String returnEditForm(@PathVariable("num") String ans_bor_num, Model model,HttpSession session){
			
			AnswerBoardVo vo=service.inquireDetail(ans_bor_num);
			List<AnswerBoardFileVo> ansfilevo=service.inquireDownload(ans_bor_num);
			model.addAttribute("cuInquireVo", vo);
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
			
			
			return "cuInquireEdit";
		}
		

	@RequestMapping(value="/customerCenter/cuInquireEdit" ,method=RequestMethod.POST)
		public String update(AnswerBoardVo vo) throws IOException{
			
			service.inquireUpdate(vo);
			String num=vo.getAns_bor_num();
			MultipartFile[] uploadFiles=vo.getUploadFiles();
			
			String[] tempFile=vo.getTempFile();
			for(String ans_bor_file_num:tempFile){
				service.inquirefileDelete(ans_bor_file_num);
			}
			if(uploadFiles!=null){
				
				for(MultipartFile mFile : uploadFiles){
					uploadProcess(mFile, num);
				}
				
			}
			
			return "redirect:/returnInquire";	
		}
		
		
		
	@RequestMapping(value="/customerCenter/cuInquireForm" ,method=RequestMethod.POST)
		public String insert(AnswerBoardVo vo) throws IOException{
			
			String num=service.inquireInsert(vo);
			
			MultipartFile[] uploadFiles=vo.getUploadFiles();
		
			if(uploadFiles!=null){
				
				for(MultipartFile mFile : uploadFiles){
					uploadProcess(mFile, num);
				}
				
			}
			
			
			return "redirect:/returnInquire";	
		}
		
		
	@RequestMapping(value="/customerCenter/cuInquireDelete/{num}")
	public String delete(@PathVariable("num") String ans_bor_num){
					
					service.inquireDelete(ans_bor_num);
					return "redirect:/returnInquire";	
				}
		

	@RequestMapping(value = "/customerCenter/cuInquireReply/{gnum}/{onum}/{nested}", method = RequestMethod.GET)
				public String replyForm(
						@PathVariable("gnum") String ans_bor_gup_num,
						@PathVariable("onum") String ans_bor_ori_num,
						@PathVariable("nested") String ans_bor_next_num,
						Model model,HttpSession session) {
					model.addAttribute("ans_bor_gup_num", ans_bor_gup_num);
					model.addAttribute("ans_bor_ori_num", ans_bor_ori_num);
					model.addAttribute("ans_bor_next_num", ans_bor_next_num);
					
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
					
					return "cuInquireReplyForm";
				}
			
	
	@RequestMapping(value = "/customerCenter/cuInquireReply")
		public String reply(AnswerBoardVo vo) {

				
			
				int ans_bor_gup_num = vo.getAns_bor_gup_num();
				
				int ans_bor_ori_num = vo.getAns_bor_ori_num() + 1;
				int ans_bor_next_num = vo.getAns_bor_next_num() + 1;

		
				Map<String, Integer> map = new HashMap<String, Integer>();
				map.put("ans_bor_gup_num", ans_bor_gup_num);
				map.put("ans_bor_ori_num", ans_bor_ori_num);
				service.updateAnsOnum(map);
				

				vo.setAns_bor_ori_num(ans_bor_ori_num);
				vo.setAns_bor_next_num(ans_bor_next_num);
				
				service.inquireAnsInsert(vo);
				
				return "redirect:/returnInquire";
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
			service.inquireUpload(vo);
			return fileName;
		}
		
		private boolean createNewFile(File f) {
			try{
				return f.createNewFile();
			} catch(IOException ex) {
				return false;
			}
		}
		

		@RequestMapping("/inquirefile.do") //downlist.jsp의 화일 목록에서 링크에 위한 요청
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
