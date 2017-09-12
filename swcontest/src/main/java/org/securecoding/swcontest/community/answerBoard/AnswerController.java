package org.securecoding.swcontest.community.answerBoard;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.securecoding.swcontest.comment.CommentService;
import org.securecoding.swcontest.customerCenter.noticeBoard.CuNoticeService;
import org.securecoding.swcontest.main.controller.DDayCount;
import org.securecoding.swcontest.main.service.MainService;
import org.securecoding.swcontest.main.vo.BannerVo;
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
public class AnswerController implements ApplicationContextAware{
	
	@Resource(name="answerService")
	private AnswerService service;
	
	@Resource(name = "commentService")
	CommentService CommentService;
	
	@Resource(name="cuNoticeService")
	private CuNoticeService cuService;
	
	@Resource(name="mainService")
	private MainService mainService;
	@Autowired
	private DDayCount dday;
	
	@ModelAttribute("boardVo")
	public BoardVo formValue(){
		return new BoardVo();
	}
	
	@Value("#{testProp.savePath}")
	File saveFolder;
	
	
	FileVo vo=new FileVo();
	
	WebApplicationContext context ;
	@Override
	public void setApplicationContext(ApplicationContext context) throws BeansException {
		this.context = (WebApplicationContext) context;
		
	}
	
	
	@RequestMapping(value="/community/answerBoard", method=RequestMethod.GET)
	public String returnLoginPage(Model model,HttpSession session){
		
		String id=(String)session.getAttribute("mem_id");
		List<NoteVo> list3 = mainService.noteList(id);
		List<NoteVo> list4 = mainService.noteSendList(id);
		NoteVo count=mainService.noteCheckCount(id);
		model.addAttribute("note", list3);
		model.addAttribute("noteSend", list4);
		model.addAttribute("notec", count);
		List<BannerVo> bannerVoList = dday.getDDay();
		model.addAttribute("bannerVoList", bannerVoList);
		
		List<BoardVo> list=service.answerList();
		for(BoardVo sss : list) {
			if(cuService.noticeFileCheck(sss.getBor_num()) != 0) {
				sss.setCheckFile("y");
			} else {
				sss.setCheckFile("n");
			}
			
		}
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
		
		model.addAttribute("main1",list);
		return "answerBoard";
	}

	public String changePath(String path) {
	      int index = path.lastIndexOf("\\") + 1;
	      String rename = path.substring(index);
	      return rename;
	}
	
	
	@RequestMapping(value="/community/answerForm", method=RequestMethod.GET)
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
		
		
		return "answerForm";
	}
	
	

	@RequestMapping(value="/community/answerDetail/{num}")
	public String returnDetail(@PathVariable("num") String bor_num, Model model,HttpSession session){
		
		String id=(String)session.getAttribute("mem_id");
		List<NoteVo> list3 = mainService.noteList(id);
		List<NoteVo> list4 = mainService.noteSendList(id);
		NoteVo count=mainService.noteCheckCount(id);
		model.addAttribute("note", list3);
		model.addAttribute("noteSend", list4);
		model.addAttribute("notec", count);
		List<BannerVo> bannerVoList = dday.getDDay();
		model.addAttribute("bannerVoList", bannerVoList);
		
		BoardVo vo2=service.selectAnswerList(bor_num);
		
		int count1=vo2.getBor_chk_con()+1;
		vo2.setBor_chk_con(count1);
		vo2.setBor_num(bor_num);
		service.answerCount(vo2);
		BoardVo vo = service.selectAnswerList(bor_num);
		
		List<FileVo> filevo=service.answerDownload(bor_num);
		
		model.addAttribute("answerVo", vo);
		model.addAttribute("fileVo", filevo);
		model.addAttribute("bor_num", bor_num);
		
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
		
		// 댓글
		List<BorcommVo> commendList = CommentService.commentList(bor_num);
		for(BorcommVo comm:commendList){
			comm.setComm_img((changePath(comm.getComm_img())));
		}
		model.addAttribute("commendList", commendList);
		
		return "answerDetail";
	}
	
	
	
	@RequestMapping(value="/community/answerEdit/{num}")
	public String returnEditForm(@PathVariable("num") String bor_num, Model model,HttpSession session){
		
		BoardVo vo=service.selectAnswerList(bor_num);
		List<FileVo> filevo=service.answerDownload(bor_num);
		model.addAttribute("answerVo", vo);
		model.addAttribute("fileVo", filevo);
		
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
		
		
		return "answerEdit";
	}
	
	
	@RequestMapping(value="/community/answerEdit" ,method=RequestMethod.POST)
	public String update(BoardVo vo) throws IOException{
		
		service.selectAnswerUpdate(vo);
		String num=vo.getBor_num();
		MultipartFile[] uploadFiles=vo.getUploadFiles();
		
		String[] tempFile=vo.getTempFile();
		for(String bor_file_num:tempFile){
			service.answerfileDelete(bor_file_num);
		}
		if(uploadFiles!=null){
			
			for(MultipartFile mFile : uploadFiles){
				uploadProcess(mFile, num);
			}
			
		}
		
		return "redirect:/community/answerBoard";	
	}
	
	
	
	@RequestMapping(value="/community/answerForm" ,method=RequestMethod.POST)
	public String insert(BoardVo vo) throws IOException{
		
		String num=service.answerInsert(vo);
		
		MultipartFile[] uploadFiles=vo.getUploadFiles();
	
		if(uploadFiles!=null){
			
			for(MultipartFile mFile : uploadFiles){
				uploadProcess(mFile, num);
			}
			
		}
		
		
		return "redirect:/community/answerBoard";	
	}
	
	
	
	@RequestMapping(value="/community/answerDelete/{num}")
	public String delete(@PathVariable("num") String bor_num){
		
		service.answerDelete(bor_num);
		return "redirect:/community/answerBoard";	
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
		
		vo.setBor_file_name(oFileName);
		vo.setBor_file_size(filesize);
		vo.setBor_file_path(filePath);
		vo.setBor_num(num);
		service.answerUpload(vo);
		return fileName;
	}
	
	private boolean createNewFile(File f) {
		try{
			return f.createNewFile();
		} catch(IOException ex) {
			return false;
		}
	}
		
	
	@RequestMapping("/answerfile.do") //downlist.jsp의 화일 목록에서 링크에 위한 요청
	public String download(@RequestParam("filename") String fname , Model model){
		
		
		//실제서버영역에 접근 
		File file = this.getFile(fname);
		
		FileVo vo1=service.selectNumberDownload(fname);
		vo1.getBor_file_name();
		model.addAttribute("downfile", file);
		model.addAttribute("name",vo1);
		return "download"; 
	}
	
	
	//실제서버에 접근하기 위한 메소드 
	public File getFile(String fname){
		
		File file = null;
		FileVo vo=service.selectNumberDownload(fname);	
		
		file = new File(vo.getBor_file_path());		
		return file;
	}
	
		
	@RequestMapping(value="/answerFileDelete/{num}",method=RequestMethod.POST)
	public void fileDelete(
			HttpServletResponse response,
			@PathVariable("num") String bor_num){
		
		ObjectMapper mapper = new ObjectMapper();
		response.setContentType("application/json;charset=UTF-8");
			
		service.answerfileDelete(bor_num);
	
	}
			
}
