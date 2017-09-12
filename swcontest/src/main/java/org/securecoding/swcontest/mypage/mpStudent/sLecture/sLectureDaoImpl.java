package org.securecoding.swcontest.mypage.mpStudent.sLecture;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.CurriReqVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("sLecturedao")
public class sLectureDaoImpl implements sLectureDao {

	@Autowired
	SqlMapClient client;

	@Override
	public List<CurriReqVo> curriReqList(String id) throws SQLException {
		
		return client.queryForList("curriReq.curriReqList",id);
	}

	@Override
	public void curriDelete(String num) throws SQLException {
		client.delete("curriReq.curriDelete",num);
		
	}

	@Override
	public void lecWatDelete(CurriReqVo num) throws SQLException {
		client.delete("curriReq.lecWatDelete",num);
		
	}
}
