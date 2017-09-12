package org.securecoding.swcontest.video.watchvideo.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.securecoding.swcontest.video.lecture.vo.LectureVo;
import org.securecoding.swcontest.video.lecture.vo.VideoVo;
import org.securecoding.swcontest.video.watchvideo.dao.WatchVideoDao;
import org.securecoding.swcontest.vo.BookMarkVo;
import org.securecoding.swcontest.vo.CurriReqVo;
import org.securecoding.swcontest.vo.LecComVo;
import org.securecoding.swcontest.vo.LecWatVo;


@Service("watchVideoService")
public class WatchVideoServiceImpl implements WatchVideoService {
	@Resource(name = "watchVideoDao")
	private WatchVideoDao dao;

	@Override
	public LectureVo selectLectureById(String id) {
		LectureVo res = null;
		try {
			res = dao.selectLectureById(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public VideoVo selectVideoById(String id) {
		VideoVo res = null;
		try {
			res = dao.selectVideoById(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public List<BookMarkVo> selectBookMarkListById(String id) {
		List<BookMarkVo> res = null;
		try {
			res = dao.selectBookMarkListById(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public String insertComment(LecComVo vo) {
		String res = null;
		try {
			res = dao.insertComment(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public List<LecComVo> selectCommentAll(String id) {
		List<LecComVo> res = null;
		try {
			res = dao.selectCommentAll(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public int deleteComment(String key) {
		int res = 0;
		try {
			res = dao.deleteComment(key);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public String insertLecWat(LecWatVo vo) {
		String res = null;
		try {
			res = dao.insertLecWat(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public LecWatVo selectLecWat(LecWatVo vo) {
		LecWatVo res = null;
		try {
			res = dao.selectLecWat(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public int updateLecWat(LecWatVo vo) {
		int res = 0;
		try {
			res = dao.updateLecWat(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public String searchNum(LecWatVo vo) {
		String res = null;
		try {
			res = dao.searchNum(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public String totalNum(String num) {
		String res = null;
		try {
			res = dao.totalNum(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public void updateCurAchieve(CurriReqVo vo) {
		try {
			dao.updateCurAchieve(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
	}

}
