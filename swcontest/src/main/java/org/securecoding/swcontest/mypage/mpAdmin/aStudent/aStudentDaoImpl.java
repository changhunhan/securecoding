package org.securecoding.swcontest.mypage.mpAdmin.aStudent;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.MemberVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("aStudentdao")
public class aStudentDaoImpl implements aStudentDao {

	@Autowired
	SqlMapClient client;

	@Override
	public List<MemberVo> memberListAll() throws SQLException {
		return client.queryForList("aStudent.memberListAll");
	}

	@Override
	public MemberVo memDetail(String mem_id) throws SQLException {
		return (MemberVo) client.queryForObject("aStudent.memDetail", mem_id);
	}

	@Override
	public void memDelete(String mem_id) throws SQLException {
		client.delete("aStudent.memDelete", mem_id);
	}
}
