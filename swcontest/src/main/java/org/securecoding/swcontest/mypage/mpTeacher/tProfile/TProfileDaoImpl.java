package org.securecoding.swcontest.mypage.mpTeacher.tProfile;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import org.securecoding.swcontest.vo.TeacherVo;


@Repository("tprofiledao")
public class TProfileDaoImpl implements TProfileDao {

	@Autowired
	SqlMapClient client;
	
	@Override
	public TeacherVo teacherProfile(TeacherVo id) throws SQLException {
		
		return (TeacherVo) client.queryForObject("teacher.teacherProfile",id);
	}

	@Override
	public void teacherProfileUpdate(TeacherVo vo) throws SQLException {
		
		client.update("teacher.teacherProfileUpdate",vo);
		
	}

}
