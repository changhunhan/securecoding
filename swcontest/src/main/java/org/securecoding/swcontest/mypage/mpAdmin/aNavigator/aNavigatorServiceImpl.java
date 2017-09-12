package org.securecoding.swcontest.mypage.mpAdmin.aNavigator;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("aNavigatorService")		
public class aNavigatorServiceImpl implements aNavigatorService {
	
	@Resource(name="aNavigatordao")
	private aNavigatorDao dao;
}
