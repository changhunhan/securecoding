package org.securecoding.swcontest.community.answerBoard;


import java.util.List;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;


public interface AnswerService {
	public List<BoardVo> answerList();
	public BoardVo selectAnswerList(String code);
	public int selectAnswerUpdate(BoardVo vo);
	public String answerInsert(BoardVo vo);
	public void answerDelete(String code);
	
	public void answerUpload(FileVo vo);
	public List<FileVo> answerDownload(String code);
	public FileVo selectNumberDownload(String name);
	public void answerCount(BoardVo vo);
	
	public String selectName(String name);
	
	public void answerfileDelete(String code);
}
