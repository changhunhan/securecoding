package org.securecoding.swcontest.mypage.mpStudent.sNote;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("sNotedao")
public class sNoteDaoImpl implements sNoteDao {

	@Autowired
	SqlMapClient client;
}
