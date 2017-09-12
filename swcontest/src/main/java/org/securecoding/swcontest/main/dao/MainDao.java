package org.securecoding.swcontest.main.dao;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.main.vo.BannerVo;
import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.LecWatVo;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.NoteVo;
import org.securecoding.swcontest.vo.TeacherVo;

public interface MainDao {
	public List<BannerVo> selectBannerAll() throws SQLException;
	public List<BoardVo> tNoticeList(String id)throws SQLException;
	public List<BoardVo> tNoticeListTeacher(String id)throws SQLException;
	public List<BoardVo> tNoticeListAdmin()throws SQLException;
	public List<BoardVo> noticeList()throws SQLException;
	public List<NoteVo> noteList(String note_rece_pers)throws SQLException;
	public List<NoteVo> noteSendList(String note_send_pers)throws SQLException;
	public void noteInsert(NoteVo vo)throws SQLException;
	public NoteVo noteCheckCount(String id)throws SQLException;
	public void noteCheckUpdate(String id)throws SQLException;
	public String selectId(NoteVo vo)throws SQLException;
	public MemberVo memberImg(String id)throws SQLException;
	public TeacherVo teacherImg(String id)throws SQLException;
	public List<LecWatVo> lecWatList(String id) throws SQLException;
}
