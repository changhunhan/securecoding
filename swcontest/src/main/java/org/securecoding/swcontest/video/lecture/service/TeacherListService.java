package org.securecoding.swcontest.video.lecture.service;

import java.util.List;

import org.securecoding.swcontest.video.lecture.vo.CurriculumVo;
import org.securecoding.swcontest.video.lecture.vo.LectureVo;
import org.securecoding.swcontest.vo.TeacherVo;


public interface TeacherListService {
	public String selectByTestDivCode(String code);
	public String selectByProceCfyCode(String code);
	public List<TeacherVo> selectByTeacherCfyCode(String code);
	public TeacherVo selectByTeacherId(String id);
	public List<CurriculumVo> selectCurriculumByTeacherId(String id);
	public List<LectureVo> selectLectureAll();
}
