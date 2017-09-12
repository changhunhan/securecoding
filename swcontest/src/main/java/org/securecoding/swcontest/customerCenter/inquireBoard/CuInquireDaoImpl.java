package org.securecoding.swcontest.customerCenter.inquireBoard;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.securecoding.swcontest.vo.AnswerBoardFileVo;
import org.securecoding.swcontest.vo.AnswerBoardVo;
import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;



@Repository("cuInquireDao")
public class CuInquireDaoImpl implements CuInquireDao{

	@Autowired
	SqlMapClient client;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<AnswerBoardVo> inquireList() throws SQLException {
		return client.queryForList("inquire.inquireList");
	}

	@Override
	public AnswerBoardVo inquireDetail(String code) throws SQLException {
		return (AnswerBoardVo) client.queryForObject("inquire.inquireDetail", code);
	}

	@Override
	public int inquireUpdate(AnswerBoardVo vo) throws SQLException {
		return client.update("inquire.inquireUpdate", vo);
	}

	@Override
	public String inquireInsert(AnswerBoardVo vo) throws SQLException {
		return (String) client.insert("inquire.inquireInsert", vo);
	}

	@Override
	public void inquireDelete(String code) throws SQLException {
		client.delete("inquire.inquireDelete", code);
	}
	
	@Override
	public void inquireUpload(AnswerBoardFileVo vo) throws SQLException {
		client.insert("inquire.inquireUpload", vo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AnswerBoardFileVo> inquireDownload(String code) throws SQLException {
		return client.queryForList("inquire.inquireDownload", code);
	}

	@Override
	public AnswerBoardFileVo selectNumDownload(String name) throws SQLException {
		return (AnswerBoardFileVo) client.queryForObject("inquire.selectNumDownload", name);
	}

	@Override
	public void inquireCount(AnswerBoardVo vo) throws SQLException {
		client.update("inquire.inquireCount", vo);
	}

	@Override
	public String selectAnsFileByName(String name) throws SQLException {
		return (String) client.queryForObject("inquire.selectAnsFileByName", name);
	}

	@Override
	public void inquirefileDelete(String code) throws SQLException {
		client.delete("inquire.inquirefileDelete", code);
	}

	@Override
	public int updateAnsOnum(Map<String, Integer> map) throws SQLException {
		return client.update("inquire.updateAnsOnum", map);
	}

	@Override
	public void inquireAnsInsert(AnswerBoardVo vo) throws SQLException {
		client.insert("inquire.inquireAnsInsert", vo);
	}

	@Override
	public void inquireAllFileDelete(String code) throws SQLException {
		client.delete("inquire.inquireAllFileDelete",code);
		
	}

	

}
