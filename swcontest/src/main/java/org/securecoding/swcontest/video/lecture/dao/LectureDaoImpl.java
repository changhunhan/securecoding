package org.securecoding.swcontest.video.lecture.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import org.securecoding.swcontest.video.lecture.vo.LectureVo;
import org.securecoding.swcontest.video.lecture.vo.VideoVo;
import org.securecoding.swcontest.vo.BookMarkVo;

@Repository("videoLectureDao")
public class LectureDaoImpl implements LectureDao {

	@Autowired
	SqlMapClient client;

	@Override
	public String insertVideo(VideoVo vo) throws SQLException {
		return (String) client.insert("lecture.insertVideo",vo);
	}

	@Override
	public String insertLecture(LectureVo vo) throws SQLException {
		return (String) client.insert("lecture.insertLecture", vo);
	}

	@Override
	public LectureVo selectLectureById(String id) throws SQLException {
		return (LectureVo) client.queryForObject("lecture.selectLectureById",id);
	}

	@Override
	public VideoVo selectVideoById(String id) throws SQLException {
		return (VideoVo)client.queryForObject("lecture.selectVideoById", id);
	}

	@Override
	public int updateLecture(LectureVo vo) throws SQLException {
		return client.update("lecture.updateLecture", vo);
	}

	@Override
	public int updateVideo(VideoVo vo) throws SQLException {
		return client.update("lecture.updateVideo", vo);
	}

	@Override
	public int insertBookMarkList(Map<String, Object> map) throws SQLException {
		return (int)client.insert("lecture.insertBookMarkList", map);
	}

	@Override
	public List<BookMarkVo> selectBookMarkList(String num) throws SQLException {
		return client.queryForList("lecture.selectBookMarkList", num);
	}

	@Override
	public void deleteBookMark(String num) throws SQLException {
		client.delete("lecture.deleteBookMark", num);
	}

	@Override
	public void deleteLecture(String num) throws SQLException {
		client.delete("lecture.deleteLecture", num);
	}
	
	
	

}
