package org.securecoding.swcontest.main.service;

import java.util.List;

import org.securecoding.swcontest.main.vo.BannerVo;
import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.LecWatVo;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.NoteVo;
import org.securecoding.swcontest.vo.TeacherVo;

public interface MainService {
	public List<BannerVo> selectBannerAll();
	public List<BoardVo> tNoticeList(String id);
	public List<BoardVo> tNoticeListTeacher(String id);
	public List<BoardVo> tNoticeListAdmin();
	public List<BoardVo> noticeList();
	public List<NoteVo> noteList(String note_rece_pers);
	public List<NoteVo> noteSendList(String note_send_pers);
	public void noteInsert(NoteVo vo);
	public NoteVo noteCheckCount(String id);
	public void noteCheckUpdate(String id);
	public String selectId(NoteVo vo);
	public MemberVo memberImg(String id);
	public TeacherVo teacherImg(String id);
	public List<LecWatVo> lecWatList(String id);
}
