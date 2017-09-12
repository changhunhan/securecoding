package org.securecoding.swcontest.mypage.mpStudent.sLecture;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.CurriReqVo;

public interface sLectureDao {
	public List<CurriReqVo> curriReqList(String id)throws SQLException;
	
	public void curriDelete(String num)throws SQLException;
	
	public void lecWatDelete(CurriReqVo num)throws SQLException;
}
