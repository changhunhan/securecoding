package org.securecoding.swcontest.login.service;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.securecoding.swcontest.login.dao.LoginDao;
import org.securecoding.swcontest.vo.FindIdPwVo;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.SessionVo;

import org.springframework.stereotype.Service;

@Service("loginservice")
public class LoginServiceImpl implements LoginService {

	@Resource(name = "logindao")
	private LoginDao dao;

	@Override
	public MemberVo selectIdPwById(String id) {
		MemberVo a = null;
		try {
			a = dao.selectIdPwById(id);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return a;
	}

	@Override
	public FindIdPwVo selectByNameEmail(FindIdPwVo vo) {
		FindIdPwVo resVo = null;
		try {
			resVo = dao.selectByNameEmail(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return resVo;
	}

	@Override
	public FindIdPwVo selectByIdEmail(FindIdPwVo vo) {
		FindIdPwVo resVo = null;
		try {
			resVo = dao.selectByIdEmail(vo);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return resVo;
	}

	@Override
	public String checkCodeByIdPw(SessionVo vo) {
		String res = null;
		try {
			res = dao.checkCodeByIdPw(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}
	
	@Override
	public void updateByPw(FindIdPwVo vo) {
		try {
			dao.updateByPw(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
	}

	@Override
	public void tupdateByPw(FindIdPwVo vo) {
		try {
			dao.tupdateByPw(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
	}

}
