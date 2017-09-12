package org.securecoding.swcontest.mypage.mpTeacher.tInfomation;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.ProcessClaVo;
import org.securecoding.swcontest.vo.TeacherVo;
import org.securecoding.swcontest.vo.ZipVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("tInfomationdao")
public class tInfomationDaoImpl implements tInfomationDao {

	@Autowired
	SqlMapClient client;

	@Override
	public TeacherVo selectById(TeacherVo vo) throws SQLException {
		
		return (TeacherVo) client.queryForObject("teacher.selectById",vo);
	}

	@Override
	public int teacherUpdate(TeacherVo vo) throws SQLException {
		return client.update("teacher.teacherUpdate",vo);
		
	}

	@Override
	public int teacherPasswordUpdate(TeacherVo vo) throws SQLException {
		
		return client.update("teacher.teacherPasswordUpdate",vo);
	}

	@Override
	public List<ZipVo> selectZipAll(String dong) throws SQLException {
		return client.queryForList("teacher.selectZipAll", dong);
	}

	@Override
	public List<ProcessClaVo> proceAll() throws SQLException {
		return client.queryForList("teacher.proceAll");
	}
}
