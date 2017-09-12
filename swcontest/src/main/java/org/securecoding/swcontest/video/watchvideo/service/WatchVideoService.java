package org.securecoding.swcontest.video.watchvideo.service;

import java.util.List;

import org.securecoding.swcontest.video.lecture.vo.LectureVo;
import org.securecoding.swcontest.video.lecture.vo.VideoVo;
import org.securecoding.swcontest.vo.BookMarkVo;
import org.securecoding.swcontest.vo.CurriReqVo;
import org.securecoding.swcontest.vo.LecComVo;
import org.securecoding.swcontest.vo.LecWatVo;


public interface WatchVideoService {
	public LectureVo selectLectureById(String id);
	public VideoVo selectVideoById(String id);
	public List<BookMarkVo> selectBookMarkListById(String id);
	public String insertComment(LecComVo vo);
	public List<LecComVo> selectCommentAll(String id);
	public int deleteComment(String key);
	public String insertLecWat(LecWatVo vo);
	public LecWatVo selectLecWat(LecWatVo vo);
	public int updateLecWat(LecWatVo vo);
	public String searchNum(LecWatVo vo);
	public String totalNum(String num);
	public void updateCurAchieve(CurriReqVo vo);
}
