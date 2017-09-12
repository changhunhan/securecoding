package org.securecoding.swcontest.customerCenter.inquireBoard;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.securecoding.swcontest.vo.AnswerBoardFileVo;
import org.securecoding.swcontest.vo.AnswerBoardVo;
import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;

public interface CuInquireDao {

	public List<AnswerBoardVo> inquireList() throws SQLException;
	public AnswerBoardVo inquireDetail(String code) throws SQLException;
	public int inquireUpdate(AnswerBoardVo vo) throws SQLException;
	public String inquireInsert(AnswerBoardVo vo) throws SQLException;
	public void inquireDelete(String code) throws SQLException;
	public void inquireUpload(AnswerBoardFileVo vo) throws SQLException;
	public List<AnswerBoardFileVo> inquireDownload(String code) throws SQLException;
	public AnswerBoardFileVo selectNumDownload(String name) throws SQLException;
	public void inquireCount(AnswerBoardVo vo) throws SQLException;
	public String selectAnsFileByName(String name) throws SQLException;
	public void inquirefileDelete(String code) throws SQLException;
	public int updateAnsOnum(Map<String, Integer> map) throws SQLException;
	public void inquireAnsInsert(AnswerBoardVo vo) throws SQLException;
	public void inquireAllFileDelete(String code) throws SQLException;
}
