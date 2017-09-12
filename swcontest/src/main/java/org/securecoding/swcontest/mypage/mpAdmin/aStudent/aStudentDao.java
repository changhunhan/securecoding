package org.securecoding.swcontest.mypage.mpAdmin.aStudent;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.MemberVo;

public interface aStudentDao {

	public List<MemberVo> memberListAll() throws SQLException;

	public MemberVo memDetail(String mem_id) throws SQLException;

	public void memDelete(String mem_id) throws SQLException;

}
