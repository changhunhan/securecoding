package org.securecoding.swcontest.member.service;

import java.util.List;

import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.ZipVo;

public interface MemberService {
	public String insertMember(MemberVo vo);
	public String selectById(String id);
 	public List<ZipVo> searchByDong(String dong);
}
