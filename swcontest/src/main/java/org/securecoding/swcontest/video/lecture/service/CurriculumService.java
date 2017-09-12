package org.securecoding.swcontest.video.lecture.service;

import java.util.List;

import org.securecoding.swcontest.video.lecture.vo.CurriculumVo;
import org.securecoding.swcontest.video.lecture.vo.LectureVo;
import org.securecoding.swcontest.vo.CurriReqVo;
import org.securecoding.swcontest.vo.MindmapVo;

public interface CurriculumService {
	public List<CurriculumVo> curriculumList(String id);
	public String insertCurriculum(CurriculumVo vo);
	public int updateCurriculum(CurriculumVo vo);
	public void deleteCurriculum(String id);
	public List<LectureVo> selectLectureAll();
	public CurriculumVo selectCode(String id);
	public CurriculumVo selectCurNum(String id);
	public String selectPath(String id);
	public String searchReq(CurriReqVo vo);
	public void insertReq(CurriReqVo vo);
	public CurriculumVo selectByNumCur(String num);
	public void updateCurri(CurriculumVo vo);
	public void deleteCurri(String num);
}
