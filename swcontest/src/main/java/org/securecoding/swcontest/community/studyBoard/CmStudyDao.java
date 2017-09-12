package org.securecoding.swcontest.community.studyBoard;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;



public interface CmStudyDao {
	public List<BoardVo> studyList()throws SQLException;
	public BoardVo selectStudyList(String code)throws SQLException;
	public int selectStudyUpdate(BoardVo vo)throws SQLException;
	public String studyInsert(BoardVo vo)throws SQLException;
	public void studyDelete(String code)throws SQLException;
	
	public void studyUpload(FileVo vo)throws SQLException;
	public List<FileVo> studyDownload(String code)throws SQLException;
	public FileVo selectNumDownload(String name)throws SQLException;
	public void studyCount(BoardVo vo)throws SQLException;
	
	public String selectByName(String name)throws SQLException;
	
	public void studyfileDelete(String code)throws SQLException;
}
