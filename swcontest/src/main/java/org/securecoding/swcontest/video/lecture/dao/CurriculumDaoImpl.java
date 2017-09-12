package org.securecoding.swcontest.video.lecture.dao;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.video.lecture.vo.CurriculumVo;
import org.securecoding.swcontest.video.lecture.vo.LectureVo;
import org.securecoding.swcontest.vo.CurriReqVo;
import org.securecoding.swcontest.vo.MindmapVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
@Repository("curriculumDao")
public class CurriculumDaoImpl implements CurriculumDao {

	@Autowired
	SqlMapClient client;
	
	@Override
	public List<CurriculumVo> curriculumList(String id) throws SQLException {
		return client.queryForList("curriculum.curriculumList",id);
	}

	@Override
	public String insertCurriculum(CurriculumVo vo) throws SQLException {
		return (String) client.insert("curriculum.insertCurriculum", vo);
	}

	@Override
	public int updateCurriculum(CurriculumVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteCurriculum(String id) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public List<LectureVo> selectLectureAll() throws SQLException {
		return client.queryForList("curriculum.selectLectureAll");
	}

	@Override
	public CurriculumVo selectCode(String id) throws SQLException {
		// TODO Auto-generated method stub
		return (CurriculumVo) client.queryForObject("curriculum.selectCode", id);
	}

	@Override
	public CurriculumVo selectCurNum(String id) throws SQLException {
		return (CurriculumVo) client.queryForObject("curriculum.selectCurNum", id);
	}

	@Override
	public String selectPath(String id) throws SQLException {
		return (String) client.queryForObject("curriculum.selectPath", id);
	}

	@Override
	public String searchReq(CurriReqVo vo) throws SQLException {
		return (String) client.queryForObject("curriculum.searchReq", vo);
	}

	@Override
	public void insertReq(CurriReqVo vo) throws SQLException {
		client.insert("curriculum.insertReq", vo);
	}

	@Override
	public CurriculumVo selectByNumCur(String num) throws SQLException {
		// TODO Auto-generated method stub
		return (CurriculumVo) client.queryForObject("curriculum.selectByNumCur",num);
	}

	@Override
	public void updateCurri(CurriculumVo vo) throws SQLException {
		client.update("curriculum.updateCurri",vo);
		
	}

	@Override
	public void deleteCurri(String num) throws SQLException {
		client.delete("curriculum.deleteCurri",num);
		
	}

}
