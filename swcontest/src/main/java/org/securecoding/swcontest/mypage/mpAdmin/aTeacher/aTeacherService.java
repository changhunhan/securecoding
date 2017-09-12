package org.securecoding.swcontest.mypage.mpAdmin.aTeacher;

import java.util.List;

import org.securecoding.swcontest.vo.TeacherVo;

public interface aTeacherService {
	public List<TeacherVo> teacherListAll();

	public TeacherVo teaDetail(String tea_id);

	public void teaDelete(String tea_id);
	
	public void teaInsert(TeacherVo vo);
	
	public void teaUpdate(TeacherVo vo);
}
