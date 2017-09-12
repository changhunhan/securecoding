package org.securecoding.swcontest.video.lecture.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.securecoding.swcontest.video.lecture.dao.TeacherListDao;
import org.securecoding.swcontest.video.lecture.vo.CurriculumVo;
import org.securecoding.swcontest.video.lecture.vo.LectureVo;
import org.securecoding.swcontest.vo.TeacherVo;

import org.springframework.stereotype.Service;

@Service("teacherListService")
public class TeacherListServiceImpl implements TeacherListService {

	@Resource(name="teacherListDao")
	TeacherListDao dao;
	
	@Override
	public String selectByTestDivCode(String code) {
		String res = null;
		try {
			res = dao.selectByTestDivCode(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public String selectByProceCfyCode(String code) {
		String res = null;
		try {
			res = dao.selectByProceCfyCode(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public List<TeacherVo> selectByTeacherCfyCode(String code) {
		List<TeacherVo> res = null;
		try {
			res = dao.selectByTeacherCfyCode(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public TeacherVo selectByTeacherId(String id) {
		TeacherVo res = null;
		try {
			res = dao.selectByTeacherId(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public List<CurriculumVo> selectCurriculumByTeacherId(String id) {
		List<CurriculumVo> res = null;
		try {
			res = dao.selectCurriculumByTeacherId(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public List<LectureVo> selectLectureAll() {
		List<LectureVo> res = null;
		try {
			res = dao.selectLectureAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

}
