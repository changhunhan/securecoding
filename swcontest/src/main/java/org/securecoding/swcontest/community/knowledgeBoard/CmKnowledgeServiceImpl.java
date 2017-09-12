package org.securecoding.swcontest.community.knowledgeBoard;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.securecoding.swcontest.vo.AnswerBoardFileVo;
import org.securecoding.swcontest.vo.AnswerBoardVo;

import org.springframework.stereotype.Service;

@Service("cmKnowledgeService")
public class CmKnowledgeServiceImpl implements CmKnowledgeService {

	@Resource(name = "cmKnowledgeDao")
	CmKnowledgeDao dao;

	@Override
	public List<AnswerBoardVo> knowledgeList() {
		List<AnswerBoardVo> list = null;
		try {
			list = dao.knowledgeList();
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return list;
	}

	@Override
	public AnswerBoardVo knowledgeDetail(String code) {
		AnswerBoardVo vo = null;
		try {
			vo = dao.knowledgeDetail(code);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return vo;
	}

	@Override
	public int knowledgeUpdate(AnswerBoardVo vo) {
		int num = 0;
		try {
			num = dao.knowledgeUpdate(vo);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return num;
	}

	@Override
	public String knowledgeInsert(AnswerBoardVo vo) {
		String id = null;
		try {
			id = dao.knowledgeInsert(vo);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return id;
	}

	@Override
	public void knowledgeDelete(String code) {
		try {
			dao.knowledgeDelete(code);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
	}

	@Override
	public void knowledgeUpload(AnswerBoardFileVo vo) {
		try {
			dao.knowledgeUpload(vo);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
	}

	@Override
	public List<AnswerBoardFileVo> knowledgeDownload(String code) {
		List<AnswerBoardFileVo> vo = null;
		try {
			vo = dao.knowledgeDownload(code);
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
	public void knowledgeCount(AnswerBoardVo vo) {
		try {
			dao.knowledgeCount(vo);
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
	public void knowledgefileDelete(String code) {
		try {
			dao.knowledgefileDelete(code);
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
	public void knowledgeAnsInsert(AnswerBoardVo vo) {
		try {
			dao.knowledgeAnsInsert(vo);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
	}

	@Override
	public void knowledgeAllFileDelete(String code) {
		try {
			dao.knowledgeAllFileDelete(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
	}

	@Override
	public void knowledgeNumDelete(String code) {
		try {
			dao.knowledgeNumDelete(code);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
	}

	@Override
	public int checkFile(String num) {
		int res = 0;
		try {
			res = dao.checkFile(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}
	}
