package org.securecoding.swcontest.mypage.mpAdmin.aCustomer;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service("aCustomerService")
public class aCustomerServiceImpl implements aCustomerService {

	@Resource(name="aCustomerdao")
	private aCustomerDao dao;
}
