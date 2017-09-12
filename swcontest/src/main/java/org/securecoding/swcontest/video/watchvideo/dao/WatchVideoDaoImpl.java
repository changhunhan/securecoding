package org.securecoding.swcontest.video.watchvideo.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import org.securecoding.swcontest.video.lecture.vo.LectureVo;
import org.securecoding.swcontest.video.lecture.vo.VideoVo;
import org.securecoding.swcontest.vo.BookMarkVo;
import org.securecoding.swcontest.vo.CurriReqVo;
import org.securecoding.swcontest.vo.LecComVo;
import org.securecoding.swcontest.vo.LecWatVo;


@Repository("watchVideoDao")
public class WatchVideoDaoImpl implements WatchVideoDao {

	@Autowired
	SqlMapClient client;

	@Override
	public LectureVo selectLectureById(String id) throws SQLException {
		return (LectureVo) client.queryForObject("watch.selectLectureById", id);
	}

	@Override
	public VideoVo selectVideoById(String id) throws SQLException {
		return (VideoVo) client.queryForObject("watch.selectVideoById", id);
	}

	@Override
	public List<BookMarkVo> selectBookMarkListById(String id)
			throws SQLException {
		return client.queryForList("watch.selectBookMarkListById", id);
	}

	@Override
	public String insertComment(LecComVo vo) throws SQLException {
		return (String) client.insert("watch.insertComment", vo);
	}

	@Override
	public List<LecComVo> selectCommentAll(String id) throws SQLException {
		return client.queryForList("watch.selectCommentAll", id);
	}

	@Override
	public int deleteComment(String key) throws SQLException {
		return client.delete("watch.deleteComment", key);
	}

	@Override
	public String insertLecWat(LecWatVo vo) throws SQLException {
		return (String) client.insert("watch.insertLecWat", vo);
	}

	@Override
	public LecWatVo selectLecWat(LecWatVo vo) throws SQLException {
		return (LecWatVo) client.queryForObject("watch.selectLecWat", vo);
	}

	@Override
	public int updateLecWat(LecWatVo vo) throws SQLException {
		return client.delete("watch.updateLecWat", vo);
	}

	@Override
	public String searchNum(LecWatVo vo) throws SQLException {
		return (String) client.queryForObject("watch.searchNum", vo);
	}

	@Override
	public String totalNum(String num) throws SQLException {
		return (String) client.queryForObject("watch.totalNum", num);
	}

	@Override
	public void updateCurAchieve(CurriReqVo vo) throws SQLException {
		client.update("watch.updateCurAchieve", vo);
	}

	
	
}
