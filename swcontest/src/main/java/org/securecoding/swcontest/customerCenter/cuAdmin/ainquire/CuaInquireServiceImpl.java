package org.securecoding.swcontest.customerCenter.cuAdmin.ainquire;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.securecoding.swcontest.vo.AnswerBoardFileVo;
import org.securecoding.swcontest.vo.AnswerBoardVo;
import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;
@Service("cuaInquireService")
public class CuaInquireServiceImpl implements CuaInquireService {

	@Resource(name="cuaInquireDao")
	private CuaInquireDao dao;
	
	@Override
	public List<AnswerBoardVo> ainquireList() {
		List<AnswerBoardVo> list = null;
		try {
			list = dao.ainquireList();
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return list;
	}

	@Override
	public AnswerBoardVo ainquireDetail(String code) {
		AnswerBoardVo vo = null;
		try {
			vo = dao.ainquireDetail(code);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return vo;
	}

	@Override
	public int ainquireUpdate(AnswerBoardVo vo) {
		int num = 0;
		try {
			num = dao.ainquireUpdate(vo);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return num;
	}

	@Override
	public String ainquireInsert(AnswerBoardVo vo) {
		String id = null;
		try {
			id = dao.ainquireInsert(vo);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return id;
	}

	@Override
	public void ainquireDelete(String code) {
		try {
			dao.ainquireDelete(code);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
	}
	

	@Override
	public void ainquireNumDelete(String code) {
		try {
			dao.ainquireNumDelete(code);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
	}
	

	@Override
	public void ainquireUpload(AnswerBoardFileVo vo) {
		try {
			dao.ainquireUpload(vo);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
	}

	@Override
	public List<AnswerBoardFileVo> ainquireDownload(String code) {
		List<AnswerBoardFileVo> vo = null;
		try {
			vo = dao.ainquireDownload(code);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return vo;
	}

	@Override
	public AnswerBoardFileVo selectNumDownload(String name) {
		AnswerBoardFileVo vo = null;
		try {
			vo = dao.selectNumDownload(name);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return vo;
	}

	@Override
	public void ainquireCount(AnswerBoardVo vo) {
		try {
			dao.ainquireCount(vo);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
	}

	@Override
	public String selectAnsFileByName(String name) {
		String rename = null;
		try {
			rename = dao.selectAnsFileByName(name);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return rename;
	}

	@Override
	public void ainquirefileDelete(String code) {
		try {
			dao.ainquirefileDelete(code);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
	}

	@Override
	public int updateAnsOnum(Map<String, Integer> map) {
		int cnt = 0;
		try {
			cnt = dao.updateAnsOnum(map);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return cnt;
	}

	@Override
	public void ainquireAnsInsert(AnswerBoardVo vo) {
		try {
			dao.ainquireAnsInsert(vo);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
	}

	@Override
	public void ainquireAllFileDelete(String code) {
		try {
			dao.ainquireAllFileDelete(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
	}

}
