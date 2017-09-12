package org.securecoding.swcontest.customerCenter.inquireBoard;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.securecoding.swcontest.vo.AnswerBoardFileVo;
import org.securecoding.swcontest.vo.AnswerBoardVo;
import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;

import org.springframework.stereotype.Service;

@Service("cuInpuireService")
public class CuInquireServiceImpl implements CuInquireService{

	@Resource(name="cuInquireDao")
	private CuInquireDao dao;
	

	@Override
	public List<AnswerBoardVo> inquireList() {
		List<AnswerBoardVo> list = null;
		try {
			list = dao.inquireList();
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return list;
	}

	@Override
	public AnswerBoardVo inquireDetail(String code) {
		AnswerBoardVo vo = null;
		try {
			vo = dao.inquireDetail(code);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return vo;
	}

	@Override
	public int inquireUpdate(AnswerBoardVo vo) {
		int num = 0;
		try {
			num = dao.inquireUpdate(vo);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return num;
	}

	@Override
	public String inquireInsert(AnswerBoardVo vo) {
		String id = null;
		try {
			id = dao.inquireInsert(vo);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return id;
	}

	@Override
	public void inquireDelete(String code) {
		try {
			dao.inquireDelete(code);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
	}

	@Override
	public void inquireUpload(AnswerBoardFileVo vo) {
		try {
			dao.inquireUpload(vo);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
	}

	@Override
	public List<AnswerBoardFileVo> inquireDownload(String code) {
		List<AnswerBoardFileVo> vo = null;
		try {
			vo = dao.inquireDownload(code);
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
	public void inquireCount(AnswerBoardVo vo) {
		try {
			dao.inquireCount(vo);
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
	public void inquirefileDelete(String code) {
		try {
			dao.inquirefileDelete(code);
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
	public void inquireAnsInsert(AnswerBoardVo vo) {
		try {
			dao.inquireAnsInsert(vo);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
	}

	@Override
	public void inquireAllFileDelete(String code) {
		try {
			dao.inquireAllFileDelete(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
	}

}
