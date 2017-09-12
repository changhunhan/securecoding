package org.securecoding.swcontest.community.knowledgeBoard;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.securecoding.swcontest.vo.AnswerBoardFileVo;
import org.securecoding.swcontest.vo.AnswerBoardVo;

public interface CmKnowledgeDao {
	
	public List<AnswerBoardVo> knowledgeList() throws SQLException;
	public AnswerBoardVo knowledgeDetail(String code) throws SQLException;
	public int knowledgeUpdate(AnswerBoardVo vo) throws SQLException;
	public String knowledgeInsert(AnswerBoardVo vo) throws SQLException;
	public void knowledgeDelete(String code) throws SQLException;
	public void knowledgeNumDelete(String code) throws SQLException;
	public void knowledgeUpload(AnswerBoardFileVo vo) throws SQLException;
	public List<AnswerBoardFileVo> knowledgeDownload(String code) throws SQLException;
	public AnswerBoardFileVo selectNumDownload(String name) throws SQLException;
	public void knowledgeCount(AnswerBoardVo vo) throws SQLException;
	public String selectAnsFileByName(String name) throws SQLException;
	public void knowledgefileDelete(String code) throws SQLException;
	public int updateAnsOnum(Map<String, Integer> map) throws SQLException;
	public void knowledgeAnsInsert(AnswerBoardVo vo) throws SQLException;
	public void knowledgeAllFileDelete(String code) throws SQLException;
	public int checkFile(String num) throws SQLException;

}
