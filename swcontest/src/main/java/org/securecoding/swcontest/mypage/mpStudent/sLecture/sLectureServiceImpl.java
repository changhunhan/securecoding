package org.securecoding.swcontest.mypage.mpStudent.sLecture;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.securecoding.swcontest.vo.CurriReqVo;

import org.springframework.stereotype.Service;

@Service("sLectureService")
class sLectureServiceImpl implements sLectureService {

	@Resource(name="sLecturedao")
	private sLectureDao dao;

	@Override
	public List<CurriReqVo> curriReqList(String id) {
		List<CurriReqVo> list=null;
		try {
			list=dao.curriReqList(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return list;
	}

	@Override
	public void curriDelete(String num) {
		try {
			dao.curriDelete(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
	}

	@Override
	public void lecWatDelete(CurriReqVo num) {
		try {
			dao.lecWatDelete(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
	}
}
