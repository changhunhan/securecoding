package org.securecoding.swcontest.mypage.mpTeacher.tLecture;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("tLecturedao")
public class tLectureDaoImpl implements tLectureDao {

	@Autowired
	SqlMapClient client;
}
