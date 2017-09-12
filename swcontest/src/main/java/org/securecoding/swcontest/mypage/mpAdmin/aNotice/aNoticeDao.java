package org.securecoding.swcontest.mypage.mpAdmin.aNotice;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;

public interface aNoticeDao {
	 
		public List<BoardVo> anoticeList()throws SQLException;
		public BoardVo selectAnoticeList(String code)throws SQLException;
		public int selectAnoticeUpdate(BoardVo vo)throws SQLException;
		public String anoticeInsert(BoardVo vo)throws SQLException;
		public void anoticeDelete(String code)throws SQLException;	
		public void anoticeUpload(FileVo vo)throws SQLException;
		public List<FileVo> anoticeDownload(String code)throws SQLException;
		public FileVo selectNumDownload(String name)throws SQLException;
		public void anoticeCount(BoardVo vo)throws SQLException;	
		public String selectByName(String name)throws SQLException;	
		public void anoticefileDelete(String code)throws SQLException;

}
