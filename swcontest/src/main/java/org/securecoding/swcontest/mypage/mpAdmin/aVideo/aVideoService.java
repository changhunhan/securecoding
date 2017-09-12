package org.securecoding.swcontest.mypage.mpAdmin.aVideo;

import java.util.List;

import org.securecoding.swcontest.video.lecture.vo.VideoVo;

public interface aVideoService {
	public List<VideoVo> selectLectureAll();
	public void videoDelete(String num);
}
