package org.securecoding.swcontest.mindmap.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.securecoding.swcontest.main.controller.DDayCount;
import org.securecoding.swcontest.main.service.MainService;
import org.securecoding.swcontest.main.vo.BannerVo;
import org.securecoding.swcontest.mindmap.service.MindmapService;
import org.securecoding.swcontest.vo.LecWatVo;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.MindmapFileVo;
import org.securecoding.swcontest.vo.MindmapVo;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class Mindmapcontroller implements ApplicationContextAware {

	@Resource(name = "mindmapservice")
	MindmapService service;

	@Value("#{testProp.savePath}")
	File saveFolder;
	
	@Resource(name="mainService")
	private MainService mainService;
		
	@Autowired
	private DDayCount dday;

	MindmapFileVo vo = new MindmapFileVo();
	MindmapVo oriVo=new MindmapVo();
	WebApplicationContext context;

	@Override
	public void setApplicationContext(ApplicationContext context)
			throws BeansException {
		this.context = (WebApplicationContext) context;

	}

	
	@RequestMapping(value = "/mindmap/mindmapUpdate", method = RequestMethod.POST)
	public void mindmapUpdate(HttpServletResponse response, MindmapVo vo)
			throws IOException {

		ObjectMapper mapper = new ObjectMapper();
		response.setContentType("application/json;charset=UTF-8");
	
		service.mindmapUpdate(vo);
		
		response.getWriter().print(mapper.writeValueAsString("OK"));
	}

	
	@RequestMapping(value = "/resultmindmap/{num}", method = RequestMethod.GET)
	public  String mindmapPrint(@PathVariable("num") String num, Model model,HttpSession session) {
		MindmapVo vo = service.mindmapList(num);
		model.addAttribute("vo", vo);
		
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
		
		return "/video/curriculum/resultmindmap";
	}
	
	

		@RequestMapping(value = "/resultmindmap", method = RequestMethod.POST)
		public @ResponseBody MindmapVo resultMindmap(LecWatVo num, Model model,HttpSession session) {
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
			
			String mindNum=num.getLec_num();
			MindmapVo vo=service.mindmapResult(mindNum);
			
			return vo;
		}
		public String changePath(String path) {
		      int index = path.lastIndexOf("\\") + 1;
		      String rename = path.substring(index);
		      return rename;
		}
	
	

	@RequestMapping(value = "/mindmap/cirInsert", method = RequestMethod.POST)
	public void cirInsert(MindmapVo vo) throws IOException {
		String[] tempFile = vo.getTempFile();
		String num = null;
		String mind_num = null;
		MindmapVo value = service.selectByNum(vo);
		MultipartFile[] uploadFiles = vo.getUploadFiles();
		if (value == null) {
			num = service.mindmapCirInsert(vo);
		}
		if (vo.getMidm_num() != null) {
			mind_num = vo.getMidm_num();
		}
		if (value != null) {
			if (uploadFiles != null) {
				MindmapFileVo fVo = service.mindmapFileSelect(mind_num);
				if (fVo != null) {
					for (String tmpNum : tempFile) {
						
						service.mindmapFileDelete(tmpNum);
					}
				}
			}
			service.mindmapImgUpdate(vo);
			num = value.getMidm_num();
		}

		if (uploadFiles != null) {
			for (MultipartFile mFile : uploadFiles) {
				uploadProcess(mFile, num);
			}
		}
	}


	@RequestMapping(value = "/mindmap/selectBy", method = RequestMethod.POST)
	public void selectByNum(HttpServletResponse response, MindmapVo vo,
			Model model) throws IOException {
		
		ObjectMapper mapper = new ObjectMapper();
		response.setContentType("application/json;charset=UTF-8");

		MindmapVo value = service.selectByNum(vo);
		Object[] data = new Object[2];
		if (value != null) {
			String mindNum = value.getMidm_num();

			MindmapFileVo file = service.mindmapFileSelect(mindNum);

			data[0] = value;
			data[1] = file;
		}
		model.addAttribute("num",value);
		response.getWriter().print(mapper.writeValueAsString(data));
	}
	
	

	@RequestMapping(value = "/mindmap/mindmapDelete", method = RequestMethod.POST)
	public void mindmapDelete(MindmapVo vo) throws IOException {
		String[] tempOri = vo.getTempOri();
		String tempKey = vo.getTempKey();
		MindmapVo vo2 = new MindmapVo();
		vo.setMidm_key_num(tempKey);
		vo2.setMidm_key_num(tempKey);

		for (String oriNum : tempOri) {
			int result = Integer.parseInt(oriNum);
			String result2 = Integer
					.toString((result + 1) - ((result + 1) * 2));
			vo.setMidm_perent_num(result2);
			vo.setMidm_ori_num(oriNum);

			List<MindmapVo> ori_num = service.selectByParent(vo);

			if (ori_num != null) {
				for (MindmapVo per_ori_num : ori_num) {
					String ori = per_ori_num.getMidm_ori_num();
					int result3 = Integer.parseInt(ori);
					String result4 = Integer.toString((result3 + 1)
							- ((result3 + 1) * 2));
					vo2.setMidm_perent_num(result4);
					service.mindmapDelete(vo2);
				}
			}

			service.mindmapDelete(vo);
		}
	}

	private String uploadProcess(MultipartFile mFile, String num)
			throws IOException {
		String oFileName = mFile.getOriginalFilename();
		String fileName = mFile.getName();
		long filesize = mFile.getSize();
		String refileName = null;
		String filePath = null;
		String ext = null;
		if (oFileName != null && oFileName.trim().length() > 0) {
			File uFile = new File(saveFolder, oFileName);
			if (createNewFile(uFile)) {
				refileName = oFileName;
				mFile.transferTo(uFile); // 실제로 저장하는 것
				filePath = uFile.getAbsolutePath();

			} else {
				int dot = oFileName.lastIndexOf(".");
				if (dot != -1) {
					fileName = oFileName.substring(0, dot);
					ext = oFileName.substring(dot);
				}
				int count = 0;
				while (!createNewFile(uFile)) {
					count++;
					refileName = fileName + "(" + count + ")" + ext;
					uFile = new File(saveFolder, refileName);

				}
				mFile.transferTo(uFile);
				filePath = uFile.getAbsolutePath();

			}
		}

		vo.setMidm_file_name(oFileName);
		vo.setMidm_file_size(filesize);
		vo.setMidm_file_path(filePath);
		vo.setMidm_img_num(num);
		service.mindmapFileInsert(vo);
		return fileName;
	}
	

	private boolean createNewFile(File f) {
		try {
			return f.createNewFile();
		} catch (IOException ex) {
			return false;
		}
	}

	@RequestMapping(value = "mindfile.do", method = RequestMethod.GET)
	public String download(MindmapFileVo vo, Model model) {
		String fname = vo.getMidm_img_num();

		File file = this.getFile(fname);

		MindmapFileVo vo1 = service.selectNumMindDownload(fname);
		vo1.getMidm_file_name();
		
		model.addAttribute("mindfile", file);
		model.addAttribute("name", vo1);
		return "mindDownload"; 
	}

	
	public File getFile(String fname) {

		File file = null;
		MindmapFileVo vo = service.selectNumMindDownload(fname);

		file = new File(vo.getMidm_file_path());
		return file;
	}

}
