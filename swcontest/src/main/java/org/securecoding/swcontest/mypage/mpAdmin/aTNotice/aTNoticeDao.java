package org.securecoding.swcontest.mypage.mpAdmin.aTNotice;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;

public interface aTNoticeDao {

	public List<BoardVo> aTnoticeList()throws SQLException;
	public BoardVo selectAtNoticeList(String code)throws SQLException;
	public int selectAtNoticeUpdate(BoardVo vo)throws SQLException;
	public String aTnoticeInsert(BoardVo vo)throws SQLException;
	public void aTnoticeDelete(String code)throws SQLException;
	public void aTnoticeUpload(FileVo vo)throws SQLException;
	public List<FileVo> aTnoticeDownload(String code)throws SQLException;
	public void aTnoticeCount(BoardVo vo)throws SQLException;		
	public void aTnoticefileDelete(String code)throws SQLException;
	public FileVo selectNumDownload(String name)throws SQLException;
	public String selectByName(String name)throws SQLException;	
}
