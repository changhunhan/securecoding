package org.securecoding.swcontest.video.lecture.dao;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.video.lecture.vo.CurriculumVo;
import org.securecoding.swcontest.video.lecture.vo.LectureVo;
import org.securecoding.swcontest.vo.TeacherVo;

public interface TeacherListDao {
	public String selectByTestDivCode(String code) throws SQLException;
	public String selectByProceCfyCode(String code) throws SQLException;
	public List<TeacherVo> selectByTeacherCfyCode(String code) throws SQLException;
	public TeacherVo selectByTeacherId(String id) throws SQLException;
	public List<CurriculumVo> selectCurriculumByTeacherId(String id) throws SQLException;
	public List<LectureVo> selectLectureAll() throws SQLException;
}
