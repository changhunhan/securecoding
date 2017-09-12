package org.securecoding.swcontest.main.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.securecoding.swcontest.main.service.MainService;
import org.securecoding.swcontest.vo.NoteVo;

public class MessagePrint {

	@Resource(name="mainService")
	private MainService service;
	
	public List<NoteVo> noteRecive(HttpSession session) {
		String id=(String)session.getAttribute("mem_id");
		List<NoteVo> list = null;
		list = service.noteList(id);
		return list;
	}
	
	public List<NoteVo> noteSend(HttpSession session) {
		String id=(String)session.getAttribute("mem_id");
		List<NoteVo> list = null;
		list = service.noteSendList(id);
		return list;
	}
	
	public String noteCount(HttpSession session) {
		String id=(String)session.getAttribute("mem_id");
		NoteVo vo = null;
		vo = service.noteCheckCount(id);
		String count=vo.getNote_check();
		return count;
	}
}
