package org.securecoding.swcontest.comment;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import org.securecoding.swcontest.comment.CommentService;
import org.securecoding.swcontest.vo.BorcommVo;

@Controller
public class CommentController {

	@Resource(name = "commentService")
	CommentService service;

	
	// 아작스 컨트롤러
	@RequestMapping(value = "/commentDelete",method=RequestMethod.POST)
	public @ResponseBody String commentDelete(String key) {
		int res = service.commentDelete(key);
		return "OK";
	}
	
	@RequestMapping(value = "/ansCommentDelete",method=RequestMethod.POST)
	public @ResponseBody String ansCommentDelete(String key) {
		int res = service.ansCommentDelete(key);
		return "OK";
	}

	@RequestMapping(value = "/commentInsertAjaxs" , method=RequestMethod.POST)
	public @ResponseBody Object commentInsert(HttpServletRequest request,
			HttpServletResponse response,BorcommVo borComm,Model model) {

		String borNum=borComm.getBor_num();
		
		ObjectMapper mapper = new ObjectMapper();
		response.setContentType("application/json;charset=UTF-8");

		String comm_wri_pers = (String) request.getSession().getAttribute("mem_id");

		BorcommVo borcommVo = new BorcommVo();

		borcommVo.setComm_img(borComm.getComm_img());
		borcommVo.setBor_num(borComm.getBor_num());
		borcommVo.setComm_title(borComm.getComm_title());
		borcommVo.setComm_wri_pers(comm_wri_pers);

		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss", Locale.KOREA);
		Date currentTime = new Date();
		String mTime = mSimpleDateFormat.format(currentTime);

		service.commentInsert(borcommVo);
		
		List<BorcommVo> borCommen=service.commentList(borNum);
		for(BorcommVo comm:borCommen){
			comm.setComm_img((changePath(comm.getComm_img())));
		}
		Map<String, Object> map = new HashMap<>();
		map.put("borCommen", borCommen);
		
		return map;

	
	}
	
	public String changePath(String path) {
	      int index = path.lastIndexOf("\\") + 1;
	      String rename = path.substring(index);
	      return rename;
	}
	
	@RequestMapping(value = "/ansCommentInsertAjaxs" , method=RequestMethod.POST)
	public @ResponseBody Object ansCommentInsert(HttpServletRequest request,
			HttpServletResponse response,BorcommVo borComm,Model model) {

		String borNum=borComm.getBor_num();
		
		ObjectMapper mapper = new ObjectMapper();
		response.setContentType("application/json;charset=UTF-8");

		String comm_wri_pers = (String) request.getSession().getAttribute("mem_id");

		BorcommVo borcommVo = new BorcommVo();

		borcommVo.setComm_img(borComm.getComm_img());
		borcommVo.setBor_num(borComm.getBor_num());
		borcommVo.setComm_title(borComm.getComm_title());
		borcommVo.setComm_wri_pers(comm_wri_pers);

		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss", Locale.KOREA);
		Date currentTime = new Date();
		String mTime = mSimpleDateFormat.format(currentTime);

		service.ansCommentInsert(borcommVo);
		
		List<BorcommVo> borCommen=service.ansCommentList(borNum);
		for(BorcommVo comm:borCommen){
			comm.setComm_img((changePath(comm.getComm_img())));
		}
		Map<String, Object> map = new HashMap<>();
		map.put("borCommen", borCommen);
		
		return map;

	
	}
			
	
}
