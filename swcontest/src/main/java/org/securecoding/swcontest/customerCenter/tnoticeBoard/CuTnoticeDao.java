package org.securecoding.swcontest.customerCenter.tnoticeBoard;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;



public interface CuTnoticeDao {

//선생님 공지사항
	public List<BoardVo> tNoticeList(String id)throws SQLException;
	public List<BoardVo> tNoticeListTeacher(String id)throws SQLException;
	public List<BoardVo> tNoticeListAdmin()throws SQLException;
	public BoardVo selectTnoticeList(String code)throws SQLException;
	public int selectTnoticeUpdate(BoardVo vo)throws SQLException;
	public String tnoticeInsert(BoardVo vo)throws SQLException;
	public void tnoticeDelete(String code)throws SQLException;
	public void tnoticeUpload(FileVo vo)throws SQLException;
	public List<FileVo> tnoticeDownload(String code)throws SQLException;
	public void tnoticeCount(BoardVo vo)throws SQLException;		
	public void tnoticefileDelete(String code)throws SQLException;
	public FileVo selectNumDownload(String name)throws SQLException;
	public String selectByName(String name)throws SQLException;	
}
