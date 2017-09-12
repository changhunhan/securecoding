package org.securecoding.swcontest.video.lecture.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.securecoding.swcontest.video.lecture.dao.LectureDao;
import org.securecoding.swcontest.video.lecture.vo.LectureVo;
import org.securecoding.swcontest.video.lecture.vo.VideoVo;
import org.securecoding.swcontest.vo.BookMarkVo;
import org.springframework.stereotype.Service;

@Service("lectureServices")
public class LectureServiceImpl implements LectureService {

	@Resource(name="videoLectureDao")
	LectureDao dao;

	@Override
	public String insertVideo(VideoVo vo) {
		String id = null;
		try {
			id = dao.insertVideo(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return id;
	}

	@Override
	public String insertLecture(LectureVo vo) {
		String res = null;
		try {
			res = dao.insertLecture(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public LectureVo selectLectureById(String id) {
		LectureVo vo = null;
		try {
			vo = dao.selectLectureById(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return vo;
	}

	@Override
	public VideoVo selectVideoById(String id) {
		VideoVo vo = null;
		try {
			vo = dao.selectVideoById(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return vo;
	}

	@Override
	public int updateLecture(LectureVo vo) {
		int res = 0;
		try {
			res = dao.updateLecture(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public int updateVideo(VideoVo vo) {
		int res = 0;
		try {
			res = dao.updateVideo(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public int insertBookMarkList(Map<String, Object> map) {
		int res = 0;
		try {
			res = dao.insertBookMarkList(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public List<BookMarkVo> selectBookMarkList(String num) {
		List<BookMarkVo> res = null;
		try {
			res = dao.selectBookMarkList(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public void deleteBookMark(String num) {
		try {
			dao.deleteBookMark(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
	}

	@Override
	public void deleteLecture(String num) {
		try {
			dao.deleteLecture(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
	}

}
