package org.securecoding.swcontest.video.watchvideo.dao;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.video.lecture.vo.LectureVo;
import org.securecoding.swcontest.video.lecture.vo.VideoVo;
import org.securecoding.swcontest.vo.BookMarkVo;
import org.securecoding.swcontest.vo.CurriReqVo;
import org.securecoding.swcontest.vo.LecComVo;
import org.securecoding.swcontest.vo.LecWatVo;

public interface WatchVideoDao {
	public LectureVo selectLectureById(String id) throws SQLException;
	public VideoVo selectVideoById(String id) throws SQLException;
	public List<BookMarkVo> selectBookMarkListById(String id) throws SQLException;
	public String insertComment(LecComVo vo) throws SQLException;
	public List<LecComVo> selectCommentAll(String id) throws SQLException;
	public int deleteComment(String key) throws SQLException;
	public String insertLecWat(LecWatVo vo) throws SQLException;
	public LecWatVo selectLecWat(LecWatVo vo) throws SQLException;
	public int updateLecWat(LecWatVo vo) throws SQLException;
	public String searchNum(LecWatVo vo) throws SQLException;
	public String totalNum(String num) throws SQLException;
	public void updateCurAchieve(CurriReqVo vo) throws SQLException;
}
