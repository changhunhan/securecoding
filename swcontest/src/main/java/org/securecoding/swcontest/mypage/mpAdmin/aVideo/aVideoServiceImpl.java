package org.securecoding.swcontest.mypage.mpAdmin.aVideo;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.securecoding.swcontest.video.lecture.vo.VideoVo;

@Service("aVideoService")
public class aVideoServiceImpl implements aVideoService {

	@Resource(name="aVideodao")
	private aVideoDao dao;

	@Override
	public List<VideoVo> selectLectureAll() {
		List<VideoVo> res = null;
		try {
			res = dao.selectLectureAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public void videoDelete(String num) {
		try {
			dao.videoDelete(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
	}
}
