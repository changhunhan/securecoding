package org.securecoding.swcontest.mypage.mpTeacher.tStudent;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.CurriReqVo;


public interface tStudentDao {
	public List<CurriReqVo> curriReqMem(String id)throws SQLException;
}
