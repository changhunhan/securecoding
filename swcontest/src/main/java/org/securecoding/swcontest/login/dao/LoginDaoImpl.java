package org.securecoding.swcontest.login.dao;

import java.sql.SQLException;

import org.securecoding.swcontest.vo.FindIdPwVo;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.SessionVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
@Repository("logindao")
public class LoginDaoImpl implements LoginDao {

	@Autowired
	SqlMapClient client;
	
	@Override
	public MemberVo selectIdPwById(String id) throws SQLException {
		return (MemberVo) client.queryForObject("login.selectIdPwById",id);
	}

	@Override
	public FindIdPwVo selectByNameEmail(FindIdPwVo vo)
			throws SQLException {
		return (FindIdPwVo) client.queryForObject("login.selectByNameEmail", vo);
	}

	@Override
	public FindIdPwVo selectByIdEmail(FindIdPwVo vo) throws SQLException {
		return (FindIdPwVo) client.queryForObject("login.selectByIdEmail", vo);
	}


	@Override
	public String checkCodeByIdPw(SessionVo vo) throws SQLException {
		return (String) client.queryForObject("login.checkCodeByIdPw",vo);
	}
	
	@Override
	public void updateByPw(FindIdPwVo vo) throws SQLException {
		client.update("login.updateByPw",vo);
		
	}


	@Override
	public void tupdateByPw(FindIdPwVo vo) throws SQLException {
		client.update("login.tupdateByPw",vo);
		
	}

}
