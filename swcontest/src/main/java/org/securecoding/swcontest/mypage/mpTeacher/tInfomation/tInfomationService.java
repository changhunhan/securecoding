package org.securecoding.swcontest.mypage.mpTeacher.tInfomation;

import java.util.List;

import org.securecoding.swcontest.vo.ProcessClaVo;
import org.securecoding.swcontest.vo.TeacherVo;
import org.securecoding.swcontest.vo.ZipVo;

public interface tInfomationService {
	public TeacherVo selectById(TeacherVo vo);
	public int teacherUpdate(TeacherVo vo);
	public int teacherPasswordUpdate(TeacherVo vo);
	public List<ZipVo> selectZipAll(String dong);
	public List<ProcessClaVo> proceAll();
}
