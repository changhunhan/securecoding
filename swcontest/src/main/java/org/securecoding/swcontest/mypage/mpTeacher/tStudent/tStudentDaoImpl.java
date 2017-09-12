package org.securecoding.swcontest.mypage.mpTeacher.tStudent;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.CurriReqVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("tStudentdao")
public class tStudentDaoImpl implements tStudentDao {

	@Autowired
	SqlMapClient client;

	@Override
	public List<CurriReqVo> curriReqMem(String id) throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("curriReq.curriReqMem",id);
	}

	
}
