package org.securecoding.swcontest.video.lecture.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.securecoding.swcontest.video.lecture.vo.LectureVo;
import org.securecoding.swcontest.video.lecture.vo.VideoVo;
import org.securecoding.swcontest.vo.BookMarkVo;

public interface LectureDao {
	public String insertVideo(VideoVo vo) throws SQLException;
	public String insertLecture(LectureVo vo) throws SQLException;
	public LectureVo selectLectureById(String id) throws SQLException;
	public VideoVo selectVideoById(String id) throws SQLException;
	public int updateLecture(LectureVo vo) throws SQLException;
	public int updateVideo(VideoVo vo) throws SQLException;
	public int insertBookMarkList(Map<String, Object> map) throws SQLException;
	public List<BookMarkVo> selectBookMarkList(String num) throws SQLException;
	public void deleteBookMark(String num) throws SQLException;
	public void deleteLecture(String num) throws SQLException;
}
