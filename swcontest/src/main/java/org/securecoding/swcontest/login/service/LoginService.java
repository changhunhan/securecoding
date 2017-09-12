package org.securecoding.swcontest.login.service;
import org.securecoding.swcontest.vo.FindIdPwVo;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.SessionVo;

public interface LoginService {

	public MemberVo selectIdPwById(String id);
	public FindIdPwVo selectByNameEmail(FindIdPwVo vo);
	public FindIdPwVo selectByIdEmail(FindIdPwVo vo);
	public String checkCodeByIdPw(SessionVo vo);
	public void updateByPw(FindIdPwVo vo);
	public void tupdateByPw(FindIdPwVo vo);

}
