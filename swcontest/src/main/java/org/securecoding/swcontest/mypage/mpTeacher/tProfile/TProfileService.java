package org.securecoding.swcontest.mypage.mpTeacher.tProfile;

import org.securecoding.swcontest.vo.TeacherVo;

public interface TProfileService {
	public TeacherVo teacherProfile(TeacherVo id);
	public void teacherProfileUpdate(TeacherVo vo);
}
