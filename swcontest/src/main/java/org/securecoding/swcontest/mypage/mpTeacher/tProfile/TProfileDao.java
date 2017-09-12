package org.securecoding.swcontest.mypage.mpTeacher.tProfile;

import java.sql.SQLException;

import org.securecoding.swcontest.vo.TeacherVo;

public interface TProfileDao {
	public TeacherVo teacherProfile(TeacherVo id)throws SQLException;
	public void teacherProfileUpdate(TeacherVo vo)throws SQLException;
}
