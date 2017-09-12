package org.securecoding.swcontest.mypage.mpAdmin.aTeacher;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.TeacherVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("aTeacherdao")
public class aTeacherDaoImpl implements aTeacherDao {

	@Autowired
	SqlMapClient client;

	@Override
	public List<TeacherVo> teacherListAll() throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("aTeacher.teacherListAll");
	}

	@Override
	public TeacherVo teaDetail(String tea_id) throws SQLException {
		// TODO Auto-generated method stub
		return (TeacherVo) client.queryForObject("aTeacher.teaDetail",tea_id);
	}

	@Override
	public void teaDelete(String tea_id) throws SQLException {
		// TODO Auto-generated method stub
		client.delete("aTeacher.teaDelete",tea_id);
	}

	@Override
	public void teaInsert(TeacherVo vo) throws SQLException {
		client.insert("aTeacher.teaInsert",vo);
	}

	@Override
	public void teaUpdate(TeacherVo vo) throws SQLException {
		client.update("aTeacher.teaUpdate", vo);
	}

	
}
