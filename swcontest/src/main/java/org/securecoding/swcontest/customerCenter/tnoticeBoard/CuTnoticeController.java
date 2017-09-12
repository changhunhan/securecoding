package org.securecoding.swcontest.customerCenter.tnoticeBoard;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
public class CuTnoticeController implements ApplicationContextAware{
	@Resource(name="cuTnoticeService")
	private CuTnoticeService service;
	
	@Resource(name="cuNoticeService")
	private CuNoticeService cuService;
	
	@Resource(name = "commentService")
	CommentService commentService;
	
	@ModelAttribute("boardVo")
	public BoardVo formValue(){
		return new BoardVo();
	}
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@Autowired
	private DDayCount dday;
	
	@Value("#{testProp.savePath}")
	File saveFolder;
	
	
	FileVo vo=new FileVo();
	
	WebApplicationContext context ;
	@Override
	public void setApplicationContext(ApplicationContext context) throws BeansException {
		this.context = (WebApplicationContext) context;
		
	}

	@RequestMapping(value="/returntNotice", method=RequestMethod.GET)
	public String returnLoginPage(HttpSession session,Model model){
		
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
		
		List<BoardVo> list=null;
		if(img==null){
			list=service.tNoticeListTeacher(id);
		}
		else{
			if(img.getMem_id().equals("admin")){
				list=service.tNoticeListAdmin();
			}
			else{
				list=service.tNoticeList(id);
			}
		}
		
		
		Date today = new Date();
		Date dDay = null;
		SimpleDateFormat transFormat = new SimpleDateFormat("yy/MM/dd");
		
		
		List<BoardVo> dayList=new ArrayList<BoardVo>();
		
		for(BoardVo sss:list) {
			try {
				dDay = transFormat.parse(sss.getBor_date());
				if(cuService.noticeFileCheck(sss.getBor_num()) != 0) {
					sss.setCheckFile("y");
				} else {
					sss.setCheckFile("n");
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				System.out.println("ERROR");
			}
			Calendar todayCalendar = Calendar.getInstance ( );
			todayCalendar.setTime (today);
			Calendar ddayCalendar = Calendar.getInstance();
			ddayCalendar.setTime(dDay);
			int count1 = (int)((today.getTime()-dDay.getTime())/1000/60/60/24) + 1;
			sss.setDate(count1);
			dayList.add(sss);
		}
		
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
		
		model.addAttribute("main",dayList);
		return "cuTnoticeList";
	}
	
	public String changePath(String path) {
	      int index = path.lastIndexOf("\\") + 1;
	      String rename = path.substring(index);
	      return rename;
	}
	
	
	@RequestMapping(value="/customerCenter/cuTnoticeForm", method=RequestMethod.GET)
		public String tworeturnForm(HttpSession session,Model model){
			
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
			
			return "cuTnoticeForm";
		}
		
	
	
		@RequestMapping(value="/customerCenter/cuTnoticeDetail/{num}")
		public String tworeturnDetail(HttpSession session,@PathVariable("num") String bor_num, Model model){
			
			String id=(String)session.getAttribute("mem_id");
			List<NoteVo> list3 = mainService.noteList(id);
			List<NoteVo> list4 = mainService.noteSendList(id);
			NoteVo count1=mainService.noteCheckCount(id);
			model.addAttribute("note", list3);
			model.addAttribute("noteSend", list4);
			model.addAttribute("notec", count1);
			List<BannerVo> bannerVoList = dday.getDDay();
			model.addAttribute("bannerVoList", bannerVoList);
			
			BoardVo vo2=service.selectTnoticeList(bor_num);
			int count=vo2.getBor_chk_con()+1;
			vo2.setBor_chk_con(count);
			vo2.setBor_num(bor_num);
			service.tnoticeCount(vo2);
			BoardVo vo=service.selectTnoticeList(bor_num);
			
			List<FileVo> filevo=service.tnoticeDownload(bor_num);
			
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
			
			model.addAttribute("tnoticeVo", vo);
			model.addAttribute("fileVo", filevo);
			model.addAttribute("bor_num", bor_num);
			
		
			List<BorcommVo> commendList = commentService.commentList(bor_num);
			for(BorcommVo comm:commendList){
				comm.setComm_img((changePath(comm.getComm_img())));
			}
			model.addAttribute("commendList", commendList);
			
			return "cuTnoticeDetail";
		}
	
	

		@RequestMapping(value="/customerCenter/cuTnoticeEdit/{num}")
		public String tworeturnEditForm(@PathVariable("num") String bor_num, Model model,HttpSession session){
			
			BoardVo vo=service.selectTnoticeList(bor_num);
			List<FileVo> filevo=service.tnoticeDownload(bor_num);
			model.addAttribute("cuTnoticeVo", vo);
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
			
			
			return "cuTnoticeEdit";
		}
		

		@RequestMapping(value="/customerCenter/cuTnoticeEdit" ,method=RequestMethod.POST)
		public String twoupdate(BoardVo vo) throws IOException{
			
			service.selectTnoticeUpdate(vo);
			String num=vo.getBor_num();
			MultipartFile[] uploadFiles=vo.getUploadFiles();
			
			String[] tempFile=vo.getTempFile();
			for(String bor_file_num:tempFile){
				service.tnoticefileDelete(bor_file_num);
			}
			if(uploadFiles!=null){
				
				for(MultipartFile mFile : uploadFiles){
					uploadProcess(mFile, num);
				}
				
			}
			
			return "redirect:/returntNotice";	
		}
	
	
	@RequestMapping(value="/customerCenter/cuTnoticeForm" ,method=RequestMethod.POST)
		public String twoinsert(BoardVo vo) throws IOException{
			
			String num=service.tnoticeInsert(vo);
			
			MultipartFile[] uploadFiles=vo.getUploadFiles();
		
			if(uploadFiles!=null){
				
				for(MultipartFile mFile : uploadFiles){
					uploadProcess(mFile, num);
				}
				
			}
			
			
			return "redirect:/returntNotice";	
		}
	

		@RequestMapping(value="/customerCenter/cuTnoticeDelete/{num}")
		public String twodelete(@PathVariable("num") String bor_num){
			
			service.tnoticeDelete(bor_num);
			return "redirect:/returntNotice";	
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
		service.tnoticeUpload(vo);
		return fileName;
	}
	
	private boolean createNewFile(File f) {
		try{
			return f.createNewFile();
		} catch(IOException ex) {
			return false;
		}
	}
	
	
	@RequestMapping("/tnoticefile.do") 
	public String download(@RequestParam("filename") String fname , Model model){
		
		
		File file = this.getFile(fname);
		
		FileVo vo1=service.selectNumDownload(fname);
		vo1.getBor_file_name();
		model.addAttribute("downfile", file);
		model.addAttribute("name",vo1);
		return "download"; 
	}
	

	public File getFile(String fname){
		
		File file = null;
		FileVo vo=service.selectNumDownload(fname);	
		
		file = new File(vo.getBor_file_path());		
		return file;
	}
	
			
}
