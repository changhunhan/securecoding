package org.securecoding.swcontest.mypage.mpStudent.sQuestion;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("sQuestiondao")
public class sQuestionDaoImpl implements sQuestionDao {

	@Autowired
	SqlMapClient client;
}
