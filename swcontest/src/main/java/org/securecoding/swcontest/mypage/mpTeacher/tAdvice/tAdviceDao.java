package org.securecoding.swcontest.mypage.mpTeacher.tAdvice;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.AdviceVo;

public interface tAdviceDao {
	public List<AdviceVo> selectAdviceByAdv_tea_id(String adv_tea_id) throws SQLException;

	public void insertAdviceByT(AdviceVo advVo) throws SQLException;

	public void deleteAdviceByAdvNum(String id) throws SQLException;

	public List<AdviceVo> selectAdvice(String adv_tea_id) throws SQLException;
	
	public void updateKey(AdviceVo vo) throws SQLException;
	
	public void pageUnload(String id) throws SQLException;
}
