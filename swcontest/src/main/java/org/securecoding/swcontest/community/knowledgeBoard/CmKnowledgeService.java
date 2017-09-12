package org.securecoding.swcontest.community.knowledgeBoard;

import java.util.List;
import java.util.Map;

import org.securecoding.swcontest.vo.AnswerBoardFileVo;
import org.securecoding.swcontest.vo.AnswerBoardVo;

public interface CmKnowledgeService {
	public List<AnswerBoardVo> knowledgeList();
	public AnswerBoardVo knowledgeDetail(String code);
	public int knowledgeUpdate(AnswerBoardVo vo);
	public String knowledgeInsert(AnswerBoardVo vo);
	public void knowledgeDelete(String code);
	public void knowledgeNumDelete(String code);
	public void knowledgeUpload(AnswerBoardFileVo vo);
	public List<AnswerBoardFileVo> knowledgeDownload(String code);
	public AnswerBoardFileVo selectNumDownload(String name);
	public void knowledgeCount(AnswerBoardVo vo);
	public String selectAnsFileByName(String name);
	public void knowledgefileDelete(String code);
	public int updateAnsOnum(Map<String, Integer> map);
	public void knowledgeAnsInsert(AnswerBoardVo vo);
	public void knowledgeAllFileDelete(String code);
	public int checkFile(String num);
}
