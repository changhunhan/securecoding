package org.securecoding.swcontest.mypage.mpAdmin.aNotice;

import java.util.List;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;

public interface aNoticeService {

			public List<BoardVo> anoticeList();
			public BoardVo selectAnoticeList(String code);
			public int selectAnoticeUpdate(BoardVo vo);
			public String anoticeInsert(BoardVo vo);
			public void anoticeDelete(String code);	
			public void anoticeUpload(FileVo vo);
			public List<FileVo> anoticeDownload(String code);
			public FileVo selectNumDownload(String name);
			public void anoticeCount(BoardVo vo);	
			public String selectByName(String name);	
			public void anoticefileDelete(String code);
}
