package org.securecoding.swcontest.mypage.mpStudent.sAdvice;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import org.securecoding.swcontest.vo.AdviceVo;
import org.securecoding.swcontest.vo.TeacherVo;

@Repository(value="sAdviceDao")
public class sAdviceDaoImpl implements sAdviceDao {

	@Autowired
	SqlMapClient client;
	
	@Override
	public List<AdviceVo> selectAdviceBySid(String adv_mem_id) throws SQLException {
		return client.queryForList("sadvice.selectAdviceBySid", adv_mem_id);
	}

	@Override
	public void deleteAdviceByAdvNum(String id) throws SQLException {
		client.update("sadvice.deleteAdviceByAdvNum", id);
	}

	@Override
	public List<TeacherVo> selectAllTeacher() throws SQLException {
		return client.queryForList("sadvice.selectAllTeacher");
	}

	@Override
	public void updateAdviceByAdv_num(AdviceVo vo) throws SQLException {
		client.update("sadvice.updateAdviceByAdv_num", vo);
	}

	@Override
	public List<AdviceVo> selectAdviceByAdv_tea_id(String adv_tea_id)	throws SQLException {
		return client.queryForList("sadvice.selectAdviceByAdv_tea_id", adv_tea_id);
	}

	@Override
	public String selectKey(String num) throws SQLException {
		return (String)client.queryForObject("sadvice.selectKey", num);
	}

	@Override
	public void updateState(String id) throws SQLException {
		client.update("sadvice.updateState", id);
	}

}
