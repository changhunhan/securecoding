package org.securecoding.swcontest.member.dao;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.ZipVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
@Repository("memberdao")
public class MemberDaoImpl implements MemberDao {
	@Autowired
	SqlMapClient client;
	
	@Override
	public String insertMember(MemberVo vo) throws SQLException {
		return (String) client.insert("member.insertMember", vo);
	}

	@Override
	public String selectById(String id) throws SQLException {
		return (String) client.queryForObject("member.selectById",id);
	}

	@Override
	public List<ZipVo> searchByDong(String dong) throws SQLException {
		// TODO Auto-generated method stub

		return client.queryForList("ziptb.searchByDong",dong);
	}

}
