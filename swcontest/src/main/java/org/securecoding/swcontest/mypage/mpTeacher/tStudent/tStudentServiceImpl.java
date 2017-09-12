package org.securecoding.swcontest.mypage.mpTeacher.tStudent;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.securecoding.swcontest.vo.CurriReqVo;

import org.springframework.stereotype.Service;

@Service("tStudentService")
class tStudentServiceImpl implements tStudentService {

	@Resource(name="tStudentdao")
	private tStudentDao dao;

	@Override
	public List<CurriReqVo> curriReqMem(String id) {
		List<CurriReqVo> list=null;
		try {
			list=dao.curriReqMem(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return list;
	}
}
