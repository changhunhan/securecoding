package org.securecoding.swcontest.mypage.mpAdmin.aVideo;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.video.lecture.vo.VideoVo;

public interface aVideoDao {
	public List<VideoVo> selectLectureAll() throws SQLException;
	public void videoDelete(String num) throws SQLException;
}
