package org.securecoding.swcontest.customerCenter.cuAdmin.ainquire;



import java.util.List;
import java.util.Map;

import org.securecoding.swcontest.vo.AnswerBoardFileVo;
import org.securecoding.swcontest.vo.AnswerBoardVo;


public interface CuaInquireService {
	public List<AnswerBoardVo> ainquireList();
	public AnswerBoardVo ainquireDetail(String code);
	public int ainquireUpdate(AnswerBoardVo vo);
	public String ainquireInsert(AnswerBoardVo vo);
	public void ainquireDelete(String code);
	public void ainquireNumDelete(String code);
	public void ainquireUpload(AnswerBoardFileVo vo);
	public List<AnswerBoardFileVo> ainquireDownload(String code);
	public AnswerBoardFileVo selectNumDownload(String name);
	public void ainquireCount(AnswerBoardVo vo);
	public String selectAnsFileByName(String name);
	public void ainquirefileDelete(String code);
	public int updateAnsOnum(Map<String, Integer> map);
	public void ainquireAnsInsert(AnswerBoardVo vo);
	public void ainquireAllFileDelete(String code);
	
}
