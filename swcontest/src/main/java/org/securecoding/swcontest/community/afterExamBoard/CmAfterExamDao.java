package org.securecoding.swcontest.community.afterExamBoard;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;



public interface CmAfterExamDao {
	public List<BoardVo> examList()throws SQLException;
	public BoardVo selectExamList(String code)throws SQLException;
	public int selectExamUpdate(BoardVo vo)throws SQLException;
	public String examInsert(BoardVo vo)throws SQLException;
	public void examDelete(String code)throws SQLException;
	
	public void examUpload(FileVo vo)throws SQLException;
	public List<FileVo> examDownload(String code)throws SQLException;
	public FileVo selectNumDownload(String name)throws SQLException;
	public void examCount(BoardVo vo)throws SQLException;
	
	public String selectByName(String name)throws SQLException;
	
	public void examfileDelete(String code)throws SQLException;
}
