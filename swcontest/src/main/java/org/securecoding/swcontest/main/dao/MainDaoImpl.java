package org.securecoding.swcontest.main.dao;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.main.vo.BannerVo;
import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.LecWatVo;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.NoteVo;
import org.securecoding.swcontest.vo.TeacherVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("mainDao")
public class MainDaoImpl implements MainDao {

	@Autowired
	SqlMapClient client;

	@Override
	public List<BannerVo> selectBannerAll() throws SQLException {
		return client.queryForList("main.selectBannerAll");
	}

	@Override
	public List<BoardVo> tNoticeList(String id) throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("main.tNoticeList",id);
	}
	
	@Override
	public List<BoardVo> tNoticeListTeacher(String id) throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("main.tNoticeListTeacher",id);
	}
	
	

	@Override
	public List<BoardVo> noticeList() throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("main.noticeList");
	}

	@Override
	public List<NoteVo> noteList(String note_rece_pers) throws SQLException {
		
		return client.queryForList("main.noteList",note_rece_pers);
	}

	@Override
	public List<NoteVo> noteSendList(String note_send_pers) throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("main.noteSendList",note_send_pers);
	}

	@Override
	public void noteInsert(NoteVo vo) throws SQLException {
		client.insert("main.noteInsert",vo);
		
	}

	@Override
	public NoteVo noteCheckCount(String id) throws SQLException {
		
		return (NoteVo) client.queryForObject("main.noteCheckCount",id);
	}

	@Override
	public void noteCheckUpdate(String id) throws SQLException {
		client.update("main.noteCheckUpdate",id);
		
	}

	@Override
	public String selectId(NoteVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return (String) client.queryForObject("main.selectId",vo);
	}

	@Override
	public MemberVo memberImg(String id) throws SQLException {
		// TODO Auto-generated method stub
		return (MemberVo) client.queryForObject("main.memberImg",id);
	}

	@Override
	public TeacherVo teacherImg(String id) throws SQLException {
		// TODO Auto-generated method stub
		return (TeacherVo) client.queryForObject("main.teacherImg",id);
	}

	@Override
	public List<BoardVo> tNoticeListAdmin() throws SQLException {
		
		return client.queryForList("main.tNoticeListAdmin");
	}

	@Override
	public List<LecWatVo> lecWatList(String id) throws SQLException {
		return client.queryForList("main.lecWatList", id);
	}

}
