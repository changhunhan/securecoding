package org.securecoding.swcontest.mypage.mpStudent.sLecture;

import java.util.List;

import org.securecoding.swcontest.vo.CurriReqVo;

public interface sLectureService {
	public List<CurriReqVo> curriReqList(String id);
	
	public void curriDelete(String num);
	
	public void lecWatDelete(CurriReqVo num);
}
