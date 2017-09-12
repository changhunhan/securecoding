package org.securecoding.swcontest.mypage.mpAdmin.aNavigator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("aNavigatordao")
public class aNavigatorDaoImpl implements aNavigatorDao {

	@Autowired
	SqlMapClient client;
}
