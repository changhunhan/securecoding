package org.securecoding.swcontest.customerCenter.noticeBoard;

import java.util.List;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;

public interface CuNoticeService {
	//공지사항
	public List<BoardVo> noticeList();

	public BoardVo selectNoticeList(String code);

	public int selectNoticeUpdate(BoardVo vo);

	public String noticeInsert(BoardVo vo);

	public void noticeDelete(String code);

	public void noticeUpload(FileVo vo);

	public List<FileVo> noticeDownload(String code);

	public FileVo selectNumDownload(String name);

	public void noticeCount(BoardVo vo);

	public String selectByName(String name);

	public void noticefileDelete(String code);

	public int noticeFileCheck(String num);
	

}
