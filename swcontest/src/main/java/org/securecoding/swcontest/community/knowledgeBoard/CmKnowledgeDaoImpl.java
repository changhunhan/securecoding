package org.securecoding.swcontest.community.knowledgeBoard;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.securecoding.swcontest.vo.AnswerBoardFileVo;
import org.securecoding.swcontest.vo.AnswerBoardVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("cmKnowledgeDao")
public class CmKnowledgeDaoImpl implements CmKnowledgeDao {
	
	@Autowired
	SqlMapClient client;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<AnswerBoardVo> knowledgeList() throws SQLException {
		return client.queryForList("cmknowledge.knowledgeList");
	}

	@Override
	public AnswerBoardVo knowledgeDetail(String code) throws SQLException {
		return (AnswerBoardVo) client.queryForObject("cmknowledge.knowledgeDetail", code);
	}

	@Override
	public int knowledgeUpdate(AnswerBoardVo vo) throws SQLException {
		return client.update("cmknowledge.knowledgeUpdate", vo);
	}

	@Override
	public String knowledgeInsert(AnswerBoardVo vo) throws SQLException {
		return (String) client.insert("cmknowledge.knowledgedgeInsert", vo);
	}

	@Override
	public void knowledgeDelete(String code) throws SQLException {
		client.delete("cmknowledge.knowledgeDelete", code);
	}

	@Override
	public void knowledgeUpload(AnswerBoardFileVo vo) throws SQLException {
		client.insert("cmknowledge.knowledgeUpload", vo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AnswerBoardFileVo> knowledgeDownload(String code) throws SQLException {
		return client.queryForList("cmknowledge.knowledgeDownload", code);
	}

	@Override
	public AnswerBoardFileVo selectNumDownload(String name) throws SQLException {
		return (AnswerBoardFileVo) client.queryForObject("cmknowledge.selectNumDownload", name);
	}

	@Override
	public void knowledgeCount(AnswerBoardVo vo) throws SQLException {
		client.update("cmknowledge.knowledgeCount", vo);
	}

	@Override
	public String selectAnsFileByName(String name) throws SQLException {
		return (String) client.queryForObject("cmknowledge.selectAnsFileByName", name);
	}

	@Override
	public void knowledgefileDelete(String code) throws SQLException {
		client.delete("cmknowledge.knowledgefileDelete", code);
	}

	@Override
	public int updateAnsOnum(Map<String, Integer> map) throws SQLException {
		return client.update("cmknowledge.updateAnsOnum", map);
	}

	@Override
	public void knowledgeAnsInsert(AnswerBoardVo vo) throws SQLException {
		client.insert("cmknowledge.knowledgeAnsInsert", vo);
	}

	@Override
	public void knowledgeAllFileDelete(String code) throws SQLException {
		client.delete("cmknowledge.knowledgeAllFileDelete",code);
		
	}

	@Override
	public void knowledgeNumDelete(String code) throws SQLException {
		client.delete("cmknowledge.knowledgeNumDelete", code);
		
	}

	@Override
	public int checkFile(String num) throws SQLException {
		return (int) client.queryForObject("cmknowledge.checkFile", num);
	}

	

}
