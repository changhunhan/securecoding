package org.securecoding.swcontest.mypage.mpAdmin.aCustomer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("aCustomerdao")
public class aCustomerDaoImpl implements aCustomerDao {

	@Autowired
	SqlMapClient client;
}
