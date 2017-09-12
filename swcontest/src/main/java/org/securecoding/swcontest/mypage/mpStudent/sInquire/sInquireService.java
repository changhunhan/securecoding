package org.securecoding.swcontest.mypage.mpStudent.sInquire;


import java.util.List;

import org.securecoding.swcontest.vo.AnswerBoardVo;

public interface sInquireService {
	public List<AnswerBoardVo> sInquireList(AnswerBoardVo vo);
	public AnswerBoardVo sInquireDetail(String code);
	public void sInquireDelete(String code);
	public List<AnswerBoardVo> sInquireByid(String id);
}
