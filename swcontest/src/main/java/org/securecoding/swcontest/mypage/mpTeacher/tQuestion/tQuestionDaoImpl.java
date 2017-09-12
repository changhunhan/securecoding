package org.securecoding.swcontest.mypage.mpTeacher.tQuestion;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("tQuestiondao")
public class tQuestionDaoImpl implements tQuestionDao {

	@Autowired
	SqlMapClient client;
}
