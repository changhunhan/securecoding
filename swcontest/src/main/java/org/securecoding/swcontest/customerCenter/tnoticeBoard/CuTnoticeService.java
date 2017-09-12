package org.securecoding.swcontest.customerCenter.tnoticeBoard;

import java.util.List;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;

public interface CuTnoticeService {

	
	public List<BoardVo> tNoticeList(String id);
	public List<BoardVo> tNoticeListTeacher(String id);
	public List<BoardVo> tNoticeListAdmin();
	public BoardVo selectTnoticeList(String code);
	public int selectTnoticeUpdate(BoardVo vo);

	public String tnoticeInsert(BoardVo vo);

	public void tnoticeDelete(String code);

	public void tnoticeUpload(FileVo vo);

	public List<FileVo> tnoticeDownload(String code);

	public void tnoticeCount(BoardVo vo);

	public void tnoticefileDelete(String code);
	
	public FileVo selectNumDownload(String name);
	
	public String selectByName(String name);

}
