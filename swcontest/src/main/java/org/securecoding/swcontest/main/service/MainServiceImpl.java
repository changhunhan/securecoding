package org.securecoding.swcontest.main.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.securecoding.swcontest.main.dao.MainDao;
import org.securecoding.swcontest.main.vo.BannerVo;
import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.LecWatVo;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.NoteVo;
import org.securecoding.swcontest.vo.TeacherVo;

import org.springframework.stereotype.Service;

@Service("mainService")
public class MainServiceImpl implements MainService {

	@Resource(name="mainDao")
	MainDao dao;
	
	@Override
	public List<BannerVo> selectBannerAll() {
		List<BannerVo> list = null;
		try {
			list = dao.selectBannerAll();
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return list;
	}

	@Override
	public List<BoardVo> tNoticeList(String id) {
		List<BoardVo> list=null;
		try {
			list=dao.tNoticeList(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return list;
	}
	
	@Override
	public List<BoardVo> tNoticeListTeacher(String id) {
		List<BoardVo> list=null;
		try {
			list=dao.tNoticeListTeacher(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return list;
	}
	
	

	@Override
	public List<BoardVo> noticeList() {
		List<BoardVo> list=null;
		try {
			list=dao.noticeList();
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return list;
	}

	@Override
	public List<NoteVo> noteList(String note_rece_pers) {
		
		List<NoteVo> list=null;
		try {
			list=dao.noteList(note_rece_pers);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
		return list;
	}

	@Override
	public List<NoteVo> noteSendList(String note_send_pers) {
		List<NoteVo> list=null;
		try {
			list=dao.noteSendList(note_send_pers);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return list;
	}

	@Override
	public void noteInsert(NoteVo vo) {
		try {
			dao.noteInsert(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
	}

	@Override
	public NoteVo noteCheckCount(String id) {
		NoteVo vo=null;
		try {
			vo=dao.noteCheckCount(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return vo;
	}

	@Override
	public void noteCheckUpdate(String id) {
		try {
			dao.noteCheckUpdate(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
	}

	@Override
	public String selectId(NoteVo vo) {
		String id=null;
		try {
			id=dao.selectId(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return id;
	}

	@Override
	public MemberVo memberImg(String id) {
		MemberVo vo=null;
		try {
			vo=dao.memberImg(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return vo;
	}

	@Override
	public TeacherVo teacherImg(String id) {
		TeacherVo vo=null;
		try {
			vo=dao.teacherImg(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return vo;
	}

	@Override
	public List<BoardVo> tNoticeListAdmin() {
		List<BoardVo> list=null;
		try {
			list=dao.tNoticeListAdmin();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return list;
	}

	@Override
	public List<LecWatVo> lecWatList(String id) {
		List<LecWatVo> res = null;
		try {
			res = dao.lecWatList(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}
}
