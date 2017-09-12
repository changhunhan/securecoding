package org.securecoding.swcontest.mypage.mpAdmin.aTeacher;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.securecoding.swcontest.vo.TeacherVo;

import org.springframework.stereotype.Service;

@Service("aTeacherService")
public class aTeacherServiceImpl implements aTeacherService {

	@Resource(name="aTeacherdao")
	private aTeacherDao dao;

	@Override
	public List<TeacherVo> teacherListAll() {
		List<TeacherVo> list=null;
		try {
			list=dao.teacherListAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
		return list;
	}

	@Override
	public TeacherVo teaDetail(String tea_id) {
		TeacherVo vo=null;
		try {
			vo=dao.teaDetail(tea_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return vo;
	}

	@Override
	public void teaDelete(String tea_id) {
		try {
			dao.teaDelete(tea_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
	}

	@Override
	public void teaInsert(TeacherVo vo) {
		try {
			dao.teaInsert(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
	}

	@Override
	public void teaUpdate(TeacherVo vo) {
		try {
			dao.teaUpdate(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
	}
}
