package org.securecoding.swcontest.video.lecture.service;


import java.util.List;
import java.util.Map;

import org.securecoding.swcontest.video.lecture.vo.LectureVo;
import org.securecoding.swcontest.video.lecture.vo.VideoVo;
import org.securecoding.swcontest.vo.BookMarkVo;

public interface LectureService {
	public String insertVideo(VideoVo vo);
	public String insertLecture(LectureVo vo);
	public LectureVo selectLectureById(String id);
	public VideoVo selectVideoById(String id);
	public int updateLecture(LectureVo vo);
	public int updateVideo(VideoVo vo);
	public int insertBookMarkList(Map<String, Object> map);
	public List<BookMarkVo> selectBookMarkList(String num);
	public void deleteBookMark(String num);
	public void deleteLecture(String num);
}
