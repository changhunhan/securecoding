package org.securecoding.swcontest.video.lecture.dao;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.video.lecture.vo.CurriculumVo;
import org.securecoding.swcontest.video.lecture.vo.LectureVo;
import org.securecoding.swcontest.vo.TeacherVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
@Repository("teacherListDao")
public class TeacherListDaoImpl implements TeacherListDao {

	@Autowired
	SqlMapClient client;
	
	@Override
	public String selectByTestDivCode(String code) throws SQLException {
		return (String) client.queryForObject("teacherList.selectByTestDivCode", code);
	}

	@Override
	public String selectByProceCfyCode(String code) throws SQLException {
		return (String) client.queryForObject("teacherList.selectByProceCfyCode", code);
	}

	@Override
	public List<TeacherVo> selectByTeacherCfyCode(String code) throws SQLException {
		return client.queryForList("teacherList.selectByTeacherCfyCode", code);
	}

	@Override
	public TeacherVo selectByTeacherId(String id) throws SQLException {
		return (TeacherVo) client.queryForObject("teacherList.selectByTeacherId", id);
	}

	@Override
	public List<CurriculumVo> selectCurriculumByTeacherId(String id)
			throws SQLException {
		return client.queryForList("teacherList.selectCurriculumByTeacherId", id);
	}

	@Override
	public List<LectureVo> selectLectureAll() throws SQLException {
		return client.queryForList("teacherList.selectLectureAll");
	}

}
