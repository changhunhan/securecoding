package org.securecoding.swcontest.login.dao;

import java.sql.SQLException;

import org.securecoding.swcontest.vo.FindIdPwVo;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.SessionVo;

public interface LoginDao {
	
	public MemberVo selectIdPwById(String id) throws SQLException;
	public FindIdPwVo selectByNameEmail(FindIdPwVo vo) throws SQLException;
	public FindIdPwVo selectByIdEmail(FindIdPwVo vo) throws SQLException;
	public String checkCodeByIdPw(SessionVo vo) throws SQLException;
	public void updateByPw(FindIdPwVo vo) throws SQLException;
	public void tupdateByPw(FindIdPwVo vo) throws SQLException;
}
