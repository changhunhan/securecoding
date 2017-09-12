package org.securecoding.swcontest.community.afterExamBoard;

import java.util.List;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;


public interface CmAfterExamService {
	public List<BoardVo> examList();
	public BoardVo selectExamList(String code);
	public int selectExamUpdate(BoardVo vo);
	public String examInsert(BoardVo vo);
	public void examDelete(String code);
	
	public void examUpload(FileVo vo);
	public List<FileVo> examDownload(String code);
	public FileVo selectNumDownload(String name);
	public void examCount(BoardVo vo);
	
	public String selectByName(String name);
	
	public void examfileDelete(String code);
}
