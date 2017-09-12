package org.securecoding.swcontest.mypage.mpTeacher.tProfile;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.securecoding.swcontest.vo.TeacherVo;

@Service("tprofileservice")
public class TProfileServiceImpl implements TProfileService {
	
	@Resource(name="tprofiledao")
	private TProfileDao dao;

	@Override
	public TeacherVo teacherProfile(TeacherVo id) {
		TeacherVo vo=null;
		try {
			vo=dao.teacherProfile(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return vo;
	}

	@Override
	public void teacherProfileUpdate(TeacherVo vo) {
		try {
			dao.teacherProfileUpdate(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
	}

}
