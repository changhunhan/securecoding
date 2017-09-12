package org.securecoding.swcontest.community.answerBoard;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;



public interface AnswerDao {
	public List<BoardVo> answerList()throws SQLException;
	public BoardVo selectAnswerList(String code)throws SQLException;
	public int selectAnswerUpdate(BoardVo vo)throws SQLException;
	public String answerInsert(BoardVo vo)throws SQLException;
	public void answerDelete(String code)throws SQLException;
	
	public void answerUpload(FileVo vo)throws SQLException;
	public List<FileVo> answerDownload(String code)throws SQLException;
	public FileVo selectNumberDownload(String name)throws SQLException;
	public void answerCount(BoardVo vo)throws SQLException;
	
	public String selectName(String name)throws SQLException;
	
	public void answerfileDelete(String code)throws SQLException;
}
