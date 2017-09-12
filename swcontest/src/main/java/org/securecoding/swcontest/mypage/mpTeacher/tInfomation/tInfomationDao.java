package org.securecoding.swcontest.mypage.mpTeacher.tInfomation;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.ProcessClaVo;
import org.securecoding.swcontest.vo.TeacherVo;
import org.securecoding.swcontest.vo.ZipVo;

public interface tInfomationDao {
	public TeacherVo selectById(TeacherVo vo)throws SQLException;
	public int teacherUpdate(TeacherVo vo)throws SQLException;
	public int teacherPasswordUpdate(TeacherVo vo)throws SQLException;
	public List<ZipVo> selectZipAll(String dong) throws SQLException;
	public List<ProcessClaVo> proceAll() throws SQLException;
}
