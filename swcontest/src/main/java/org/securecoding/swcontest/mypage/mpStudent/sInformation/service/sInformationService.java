package org.securecoding.swcontest.mypage.mpStudent.sInformation.service;

import java.util.List;

import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.ZipVo;

public interface sInformationService {
	public MemberVo selectAllById(String id);
	public int updatePasswordById(MemberVo vo);
	public int updateById(MemberVo vo);
	public List<ZipVo> selectZipAll(String dong);
}
