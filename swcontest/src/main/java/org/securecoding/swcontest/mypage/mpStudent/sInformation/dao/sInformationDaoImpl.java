package org.securecoding.swcontest.mypage.mpStudent.sInformation.dao;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.ZipVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("sInformationDao")
public class sInformationDaoImpl implements sInformationDao {

	@Autowired
	SqlMapClient client;

	@Override
	public int updateById(MemberVo vo) throws SQLException {
		return client.update("member.updateById", vo);
	}

	@Override
	public MemberVo selectAllById(String id) throws SQLException {
		return (MemberVo) client.queryForObject("member.selectAllById", id);
	}

	@Override
	public int updatePasswordById(MemberVo vo) throws SQLException {
		return client.update("member.updatePasswordById", vo);
	}

	@Override
	public List<ZipVo> selectZipAll(String dong) throws SQLException {
		return client.queryForList("member.selectZipAll", dong);
	}
}
