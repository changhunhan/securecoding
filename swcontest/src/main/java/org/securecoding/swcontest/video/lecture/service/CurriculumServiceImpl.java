package org.securecoding.swcontest.video.lecture.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.securecoding.swcontest.video.lecture.dao.CurriculumDao;
import org.securecoding.swcontest.video.lecture.vo.CurriculumVo;
import org.securecoding.swcontest.video.lecture.vo.LectureVo;
import org.securecoding.swcontest.vo.CurriReqVo;
import org.securecoding.swcontest.vo.MindmapVo;
@Service("curriculumService")
public class CurriculumServiceImpl implements CurriculumService {

	@Resource(name="curriculumDao")
	CurriculumDao dao;
	
	@Override
	public List<CurriculumVo> curriculumList(String id) {
		List<CurriculumVo> list = null;
		try {
			list = dao.curriculumList(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return list;
	}

	@Override
	public String insertCurriculum(CurriculumVo vo) {
		String num=null;
		try {
			num=dao.insertCurriculum(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return num;
	}

	@Override
	public int updateCurriculum(CurriculumVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteCurriculum(String id) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<LectureVo> selectLectureAll() {
		List<LectureVo> list = null;
		try {
			list = dao.selectLectureAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return list;
	}

	@Override
	public CurriculumVo selectCode(String id) {
		CurriculumVo res = new CurriculumVo();
		try {
			res = dao.selectCode(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public CurriculumVo selectCurNum(String id) {
		CurriculumVo res = null;
		try {
			res = dao.selectCurNum(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public String selectPath(String id) {
		String res = null;
		try {
			res = dao.selectPath(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public String searchReq(CurriReqVo vo) {
		String res = null;
		try {
			res = dao.searchReq(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public void insertReq(CurriReqVo vo) {
		try {
			dao.insertReq(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
	}

	@Override
	public CurriculumVo selectByNumCur(String num) {
		CurriculumVo vo=null;
		try {
			vo=dao.selectByNumCur(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return vo;
	}

	@Override
	public void updateCurri(CurriculumVo vo) {
		try {
			dao.updateCurri(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
	}

	@Override
	public void deleteCurri(String num) {
		try {
			dao.deleteCurri(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
	}
}
