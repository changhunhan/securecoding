package org.securecoding.swcontest.mypage.mpTeacher.tAdvice;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.AdviceVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository(value="tAdviceDao")
public class tAdviceDaoImpl implements tAdviceDao {

	@Autowired
	SqlMapClient client;

	@Override
	public List<AdviceVo> selectAdviceByAdv_tea_id(String adv_tea_id) throws SQLException {
		return client.queryForList("tadvice.selectAdviceByAdv_tea_id", adv_tea_id);
	}

	@Override
	public void insertAdviceByT(AdviceVo advVo) throws SQLException {
		client.insert("tadvice.insertAdviceByT", advVo);
	}

	@Override
	public void deleteAdviceByAdvNum(String id) throws SQLException {
		client.delete("tadvice.deleteAdviceByAdvNum", id);
	}

	@Override
	public List<AdviceVo> selectAdvice(String adv_tea_id) throws SQLException {
		return client.queryForList("tadvice.selectAdvice", adv_tea_id);
	}

	@Override
	public void updateKey(AdviceVo vo) throws SQLException {
		client.update("tadvice.updateKey", vo);
	}

	@Override
	public void pageUnload(String id) throws SQLException {
		client.update("tadvice.pageUnload", id);
	}
}
