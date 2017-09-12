package org.securecoding.swcontest.video.lecture.dao;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.video.lecture.vo.CurriculumVo;
import org.securecoding.swcontest.video.lecture.vo.LectureVo;
import org.securecoding.swcontest.vo.CurriReqVo;
import org.securecoding.swcontest.vo.MindmapVo;

public interface CurriculumDao {
	public List<CurriculumVo> curriculumList(String id) throws SQLException;
	public String insertCurriculum(CurriculumVo vo) throws SQLException;
	public int updateCurriculum(CurriculumVo vo) throws SQLException;
	public void deleteCurriculum(String id) throws SQLException;
	public List<LectureVo> selectLectureAll() throws SQLException;
	public CurriculumVo selectCode(String id) throws SQLException;
	public CurriculumVo selectCurNum(String id) throws SQLException;
	public String selectPath(String id) throws SQLException;
	public String searchReq(CurriReqVo vo) throws SQLException;
	public void insertReq(CurriReqVo vo) throws SQLException;
	public CurriculumVo selectByNumCur(String num)throws SQLException;
	public void updateCurri(CurriculumVo vo)throws SQLException;
	public void deleteCurri(String num)throws SQLException;
}
