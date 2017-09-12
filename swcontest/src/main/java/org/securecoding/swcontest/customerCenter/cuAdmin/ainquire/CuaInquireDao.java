package org.securecoding.swcontest.customerCenter.cuAdmin.ainquire;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.securecoding.swcontest.vo.AnswerBoardFileVo;
import org.securecoding.swcontest.vo.AnswerBoardVo;
import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;

public interface CuaInquireDao {
	public List<AnswerBoardVo> ainquireList() throws SQLException;
	public AnswerBoardVo ainquireDetail(String code) throws SQLException;
	public int ainquireUpdate(AnswerBoardVo vo) throws SQLException;
	public String ainquireInsert(AnswerBoardVo vo) throws SQLException;
	public void ainquireDelete(String code) throws SQLException;
	public void ainquireNumDelete(String code) throws SQLException;
	public void ainquireUpload(AnswerBoardFileVo vo) throws SQLException;
	public List<AnswerBoardFileVo> ainquireDownload(String code) throws SQLException;
	public AnswerBoardFileVo selectNumDownload(String name) throws SQLException;
	public void ainquireCount(AnswerBoardVo vo) throws SQLException;
	public String selectAnsFileByName(String name) throws SQLException;
	public void ainquirefileDelete(String code) throws SQLException;
	public int updateAnsOnum(Map<String, Integer> map) throws SQLException;
	public void ainquireAnsInsert(AnswerBoardVo vo) throws SQLException;
	public void ainquireAllFileDelete(String code) throws SQLException;
	
}
