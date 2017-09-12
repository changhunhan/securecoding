package org.securecoding.swcontest.mypage.mpTeacher.tInfomation;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.securecoding.swcontest.vo.ProcessClaVo;
import org.securecoding.swcontest.vo.TeacherVo;
import org.securecoding.swcontest.vo.ZipVo;

import org.springframework.stereotype.Service;

@Service("tInformationService")

class tInfomationServiceImpl implements tInfomationService {

	@Resource(name="tInfomationdao")
	private tInfomationDao dao;

	@Override
	public TeacherVo selectById(TeacherVo vo) {
		TeacherVo id=null;
		try {
			id=dao.selectById(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return id;
	}

	@Override
	public int teacherUpdate(TeacherVo vo) {
		int result=0;
		try {
			result=dao.teacherUpdate(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return result;
		
	}

	@Override
	public int teacherPasswordUpdate(TeacherVo vo) {
		int result=0;
		try {
			result=dao.teacherPasswordUpdate(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return result;
	}

	@Override
	public List<ZipVo> selectZipAll(String dong) {
		List<ZipVo> res = null;
		try {
			res = dao.selectZipAll(dong);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public List<ProcessClaVo> proceAll() {
		List<ProcessClaVo> res = null;
		try {
			res = dao.proceAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}
}
