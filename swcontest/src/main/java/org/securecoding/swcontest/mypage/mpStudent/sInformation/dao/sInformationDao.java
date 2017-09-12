package org.securecoding.swcontest.mypage.mpStudent.sInformation.dao;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.ZipVo;

public interface sInformationDao {
	public MemberVo selectAllById(String id) throws SQLException;
	public int updatePasswordById(MemberVo vo) throws SQLException;
	public int updateById(MemberVo vo) throws SQLException;
	public List<ZipVo> selectZipAll(String dong) throws SQLException;
}
