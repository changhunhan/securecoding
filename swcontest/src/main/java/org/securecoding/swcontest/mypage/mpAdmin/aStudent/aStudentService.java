package org.securecoding.swcontest.mypage.mpAdmin.aStudent;

import java.util.List;

import org.securecoding.swcontest.vo.MemberVo;

public interface aStudentService {

	public List<MemberVo> memberListAll();

	public MemberVo memDetail(String mem_id);

	public void memDelete(String mem_id);

}
