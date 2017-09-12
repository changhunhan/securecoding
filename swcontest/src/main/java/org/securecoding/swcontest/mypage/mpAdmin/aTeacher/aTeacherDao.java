package org.securecoding.swcontest.mypage.mpAdmin.aTeacher;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.TeacherVo;

public interface aTeacherDao {
	public List<TeacherVo> teacherListAll() throws SQLException;

	public TeacherVo teaDetail(String tea_id) throws SQLException;

	public void teaDelete(String tea_id) throws SQLException;
	
	public void teaInsert(TeacherVo vo)throws SQLException;
	
	public void teaUpdate(TeacherVo vo) throws SQLException;
}
