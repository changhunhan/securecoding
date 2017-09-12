package org.securecoding.swcontest.mypage.mpStudent.sInquire;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.AnswerBoardVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("sInquiredao")
public class sInquireDaoImpl implements sInquireDao {

	@Autowired
	SqlMapClient client;

	@SuppressWarnings("unchecked")
	@Override
	public List<AnswerBoardVo> sInquireList(AnswerBoardVo vo) throws SQLException {
		
		return client.queryForList("sinquire.sInquireList",vo);
	}

	@Override
	public AnswerBoardVo sInquireDetail(String code) throws SQLException {
		return (AnswerBoardVo) client.queryForObject("sinquire.sInquireDetail", code);
	}

	@Override
	public void sInquireDelete(String code) throws SQLException {
		client.delete("sinquire.sInquireDelete", code);
		
	}

	@Override
	public List<AnswerBoardVo> sInquireByid(String id) throws SQLException {
		
		return client.queryForList("sinquire.sInquireByid",id);
	}
}
