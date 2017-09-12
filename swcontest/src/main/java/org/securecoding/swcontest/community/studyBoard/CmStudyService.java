package org.securecoding.swcontest.community.studyBoard;


import java.util.List;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;


public interface CmStudyService {
	public List<BoardVo> studyList();
	public BoardVo selectStudyList(String code);
	public int selectStudyUpdate(BoardVo vo);
	public String studyInsert(BoardVo vo);
	public void studyDelete(String code);
	
	public void studyUpload(FileVo vo);
	public List<FileVo> studyDownload(String code);
	public FileVo selectNumDownload(String name);
	public void studyCount(BoardVo vo);
	
	public String selectByName(String name);
	
	public void studyfileDelete(String code);
}
