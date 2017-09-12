package org.securecoding.swcontest.mypage.mpStudent.sAdvice;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.securecoding.swcontest.vo.AdviceVo;
import org.securecoding.swcontest.vo.TeacherVo;

@Service(value="sAdviceService")
class sAdviceServiceImpl implements sAdviceService {

	@Resource(name="sAdviceDao")
	sAdviceDao dao;
	
	@Override
	public List<AdviceVo> selectAdviceBySid(String adv_mem_id) {
		List<AdviceVo> list = null;
		try {
			list = dao.selectAdviceBySid(adv_mem_id);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return list;
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
	public List<TeacherVo> selectAllTeacher() {
		List<TeacherVo> tVo = null;
		try {
			tVo = dao.selectAllTeacher();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return tVo;
	}

	@Override
	public void updateAdviceByAdv_num(AdviceVo vo) {
		try {
			dao.updateAdviceByAdv_num(vo);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
	}

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
	public String selectKey(String num) {
		String res = null;
		try {
			res = dao.selectKey(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public void updateState(String id) {
		try {
			dao.updateState(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
	}

}
