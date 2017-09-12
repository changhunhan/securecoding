package org.securecoding.swcontest.customerCenter.inquireBoard;


import java.util.List;
import java.util.Map;
import org.securecoding.swcontest.vo.AnswerBoardFileVo;
import org.securecoding.swcontest.vo.AnswerBoardVo;


public interface CuInquireService {
	public List<AnswerBoardVo> inquireList();
	public AnswerBoardVo inquireDetail(String code);
	public int inquireUpdate(AnswerBoardVo vo);
	public String inquireInsert(AnswerBoardVo vo);
	public void inquireDelete(String code);
	public void inquireUpload(AnswerBoardFileVo vo);
	public List<AnswerBoardFileVo> inquireDownload(String code);
	public AnswerBoardFileVo selectNumDownload(String name);
	public void inquireCount(AnswerBoardVo vo);
	public String selectAnsFileByName(String name);
	public void inquirefileDelete(String code);
	public int updateAnsOnum(Map<String, Integer> map);
	public void inquireAnsInsert(AnswerBoardVo vo);
	public void inquireAllFileDelete(String code);
}
