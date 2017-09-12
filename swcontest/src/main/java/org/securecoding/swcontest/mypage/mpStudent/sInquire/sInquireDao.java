package org.securecoding.swcontest.mypage.mpStudent.sInquire;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.AnswerBoardVo;

public interface sInquireDao {
	public List<AnswerBoardVo> sInquireList(AnswerBoardVo vo) throws SQLException;
	public AnswerBoardVo sInquireDetail(String code) throws SQLException;
	public void sInquireDelete(String code) throws SQLException;
	public List<AnswerBoardVo> sInquireByid(String id)throws SQLException;
}
