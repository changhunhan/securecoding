package org.securecoding.swcontest.mypage.mpStudent.sInquire;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;







import org.securecoding.swcontest.vo.AnswerBoardVo;

import org.springframework.stereotype.Service;

@Service("sInquireService")
class sInquireServiceImpl implements sInquireService {

	@Resource(name="sInquiredao")
	private sInquireDao dao;

	@Override
	public List<AnswerBoardVo> sInquireList(AnswerBoardVo vo) {
		List<AnswerBoardVo> list = null;
		try {
			
			list = dao.sInquireList(vo);
			
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return list;
	}

	@Override
	public AnswerBoardVo sInquireDetail(String code) {
		AnswerBoardVo vo = null;
		try {
			vo = dao.sInquireDetail(code);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return vo;
	}

	@Override
	public void sInquireDelete(String code) {
		try {
			dao.sInquireDelete(code);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
	}

	@Override
	public List<AnswerBoardVo> sInquireByid(String id) {
		 List<AnswerBoardVo> list=null;
		 try {
			list=dao.sInquireByid(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return list;
	}
}
