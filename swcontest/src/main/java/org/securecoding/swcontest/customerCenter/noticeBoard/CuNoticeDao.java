package org.securecoding.swcontest.customerCenter.noticeBoard;

import java.sql.SQLException;
import java.util.List;
import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;



public interface CuNoticeDao {
   //공지사항	
	public List<BoardVo> noticeList()throws SQLException;
	public BoardVo selectNoticeList(String code)throws SQLException;
	public int selectNoticeUpdate(BoardVo vo)throws SQLException;
	public String noticeInsert(BoardVo vo)throws SQLException;
	public void noticeDelete(String code)throws SQLException;	
	public void noticeUpload(FileVo vo)throws SQLException;
	public List<FileVo> noticeDownload(String code)throws SQLException;
	public FileVo selectNumDownload(String name)throws SQLException;
	public void noticeCount(BoardVo vo)throws SQLException;	
	public String selectByName(String name)throws SQLException;	
	public void noticefileDelete(String code)throws SQLException;
	public int noticeFileCheck(String num) throws SQLException;
}
