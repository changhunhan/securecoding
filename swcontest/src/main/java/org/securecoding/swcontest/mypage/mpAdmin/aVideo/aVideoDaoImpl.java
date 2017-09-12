package org.securecoding.swcontest.mypage.mpAdmin.aVideo;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import org.securecoding.swcontest.video.lecture.vo.VideoVo;

@Repository("aVideodao")
public class aVideoDaoImpl implements aVideoDao {

	@Autowired
	SqlMapClient client;

	@Override
	public List<VideoVo> selectLectureAll() throws SQLException {
		return client.queryForList("aVideo.selectLectureAll");
	}

	@Override
	public void videoDelete(String num) throws SQLException {
		client.delete("aVideo.videoDelete",num);
	}
}
