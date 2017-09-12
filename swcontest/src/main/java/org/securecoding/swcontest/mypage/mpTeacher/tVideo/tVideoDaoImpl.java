package org.securecoding.swcontest.mypage.mpTeacher.tVideo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;



@Repository("tVideodao")
public class tVideoDaoImpl implements tVideoDao {

	@Autowired
	SqlMapClient client;
}
