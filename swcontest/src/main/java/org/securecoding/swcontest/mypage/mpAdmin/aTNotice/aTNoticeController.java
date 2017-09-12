package org.securecoding.swcontest.mypage.mpAdmin.aTNotice;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.securecoding.swcontest.comment.CommentService;
import org.securecoding.swcontest.main.controller.DDayCount;
import org.securecoding.swcontest.main.service.MainService;
import org.securecoding.swcontest.main.vo.BannerVo;
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
public class aTNoticeController implements ApplicationContextAware{
@Resource(name="aTNoticeService")
private aTNoticeService service;
@Resource(name = "commentService")
CommentService commentService;

@ModelAttribute("boardVo")
public BoardVo formValue(){
	return new BoardVo();
}

@Value("#{testProp.savePath}")
File saveFolder;

@Resource(name="mainService")
private MainService mainService;

@Autowired
private DDayCount dday;


FileVo vo=new FileVo();

WebApplicationContext context ;

@Override
public void setApplicationContext(ApplicationContext context)
		throws BeansException {
	this.context = (WebApplicationContext) context;
	
}
	@RequestMapping(value="/aTNotice/aTNoticeMain", method=RequestMethod.GET)
	public String returnForm(Model model,HttpSession session){
		List<BoardVo> list=service.aTnoticeList();		
	
	
		model.addAttribute("main",list);
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
		
		return "aTNoticeMain";
	}
	public String changePath(String path) {
	      int index = path.lastIndexOf("\\") + 1;
	      String rename = path.substring(index);
	      return rename;
	}

	
			@RequestMapping(value="/aTNotice/aTNoticeDetail/{num}")
			public String tworeturnDetail(@PathVariable("num") String bor_num, Model model,HttpSession session){
				
				BoardVo vo2=service.selectAtNoticeList(bor_num);
				int count=vo2.getBor_chk_con()+1;
				vo2.setBor_chk_con(count);
				vo2.setBor_num(bor_num);
				service.aTnoticeCount(vo2);
				BoardVo vo=service.selectAtNoticeList(bor_num);
				
				List<FileVo> filevo=service.aTnoticeDownload(bor_num);
				
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
				model.addAttribute("aTnoticeVo", vo);
				model.addAttribute("fileVo", filevo);
				model.addAttribute("bor_num", bor_num);
				
		
				List<BorcommVo> commendList = commentService.commentList(bor_num);
				model.addAttribute("commendList", commendList);
				
				
				return "aTNoticeDtail";
			}
	
			
			@RequestMapping(value="/aTNotice/aTNoticeEdit/{num}")
			public String tworeturnEditForm(@PathVariable("num") String bor_num, Model model,HttpSession session){
				
				BoardVo vo=service.selectAtNoticeList(bor_num);
				List<FileVo> filevo=service.aTnoticeDownload(bor_num);
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
				
				
				return "aTNoticeEdit";
			}
			
		
	@RequestMapping(value="/aTNotice/aTNoticeEdit" ,method=RequestMethod.POST)
		public String twoupdate(BoardVo vo) throws IOException{
				
				service.selectAtNoticeUpdate(vo);
				String num=vo.getBor_num();
				MultipartFile[] uploadFiles=vo.getUploadFiles();
				
				String[] tempFile=vo.getTempFile();
				for(String bor_file_num:tempFile){
					service.aTnoticefileDelete(bor_file_num);
				}
				if(uploadFiles!=null){
					
					for(MultipartFile mFile : uploadFiles){
						uploadProcess(mFile, num);
					}
					
				}
				
				return "redirect:/aTNotice/aTNoticeMain";	
			}
		
		
	@RequestMapping(value="/aTNotice/aTNoticeForm" ,method=RequestMethod.POST)
			public String twoinsert(BoardVo vo) throws IOException{
				
				String num=service.aTnoticeInsert(vo);
				
				MultipartFile[] uploadFiles=vo.getUploadFiles();
			
				if(uploadFiles!=null){
					
					for(MultipartFile mFile : uploadFiles){
						uploadProcess(mFile, num);
					}
					
				}
				
				
				return "redirect:/aTNotice/aTNoticeMain";	
			}
		
	
	@RequestMapping(value="/aTNotice/aTnoticeDelete/{num}")
		public String twodelete(@PathVariable("num") String bor_num){
				
				service.aTnoticeDelete(bor_num);
				return "redirect:/aTNotice/aTNoticeMain";	
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
				service.aTnoticeUpload(vo);
				return fileName;
			}
			
	private boolean createNewFile(File f) {
				try{
					return f.createNewFile();
				} catch(IOException ex) {
					return false;
				}
			}
			
	@RequestMapping("/aTnoticefile.do")
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
