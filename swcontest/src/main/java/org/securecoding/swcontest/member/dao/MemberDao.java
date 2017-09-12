package org.securecoding.swcontest.member.dao;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.ZipVo;

public interface MemberDao {
	
 public String insertMember(MemberVo vo) throws SQLException;
 
 public String selectById(String id)throws SQLException;
 	
 public List<ZipVo> searchByDong(String dong)throws SQLException;

}
