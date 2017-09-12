package org.securecoding.swcontest.mypage.mpTeacher.tAdvice;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.securecoding.swcontest.vo.AdviceVo;

import org.springframework.stereotype.Service;

@Service(value="tAdviceService")
class tAdviceServiceImpl implements tAdviceService {

	@Resource(name="tAdviceDao")
	tAdviceDao dao;

	@Override
	public List<AdviceVo> selectAdviceByAdv_tea_id(String adv_tea_id) {
		List<AdviceVo> list = null;
		try {
			list = dao.selectAdviceByAdv_tea_id(adv_tea_id);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return list;
	}

	@Override
	public void insertAdviceByT(AdviceVo advVo) {
		try {
			dao.insertAdviceByT(advVo);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
	}

	@Override
	public void deleteAdviceByAdvNum(String id) {
		try {
			dao.deleteAdviceByAdvNum(id);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
	}

	@Override
	public List<AdviceVo> selectAdvice(String adv_tea_id) {
		List<AdviceVo> list = null;
		try {
			list = dao.selectAdvice(adv_tea_id);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return list;
	}
	
	@Override
	public void updateKey(AdviceVo vo) {
		try {
			dao.updateKey(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
	}

	@Override
	public void pageUnload(String id) {
		try {
			dao.pageUnload(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
	}
}
