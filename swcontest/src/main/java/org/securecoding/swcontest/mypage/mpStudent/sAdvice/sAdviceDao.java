package org.securecoding.swcontest.mypage.mpStudent.sAdvice;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.AdviceVo;
import org.securecoding.swcontest.vo.TeacherVo;

public interface sAdviceDao {


	public List<AdviceVo> selectAdviceBySid(String adv_mem_id) throws SQLException;

	public void deleteAdviceByAdvNum(String id) throws SQLException;

	public List<TeacherVo> selectAllTeacher() throws SQLException;

	public void updateAdviceByAdv_num(AdviceVo vo) throws SQLException;

	public List<AdviceVo> selectAdviceByAdv_tea_id(String adv_tea_id) throws SQLException;
	
	public String selectKey(String num) throws SQLException;
	
	public void updateState(String id) throws SQLException;
}
