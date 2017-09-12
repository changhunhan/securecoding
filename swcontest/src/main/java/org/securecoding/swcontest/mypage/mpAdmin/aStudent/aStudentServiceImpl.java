package org.securecoding.swcontest.mypage.mpAdmin.aStudent;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.securecoding.swcontest.vo.MemberVo;

import org.springframework.stereotype.Service;

@Service("aStudentService")
public class aStudentServiceImpl implements aStudentService {

	@Resource(name="aStudentdao")
	private aStudentDao dao;

	@Override
	public List<MemberVo> memberListAll() {
		List<MemberVo> vo = null;
		try {
			vo = dao.memberListAll();
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return vo;
	}

	@Override
	public MemberVo memDetail(String mem_id) {
		MemberVo vo = null;
		try {
			vo = dao.memDetail(mem_id);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return vo;
	}

	@Override
	public void memDelete(String mem_id) {
		try {
			dao.memDelete(mem_id);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
	}
}
