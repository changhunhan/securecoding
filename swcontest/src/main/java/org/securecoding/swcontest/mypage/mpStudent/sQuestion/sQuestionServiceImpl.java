package org.securecoding.swcontest.mypage.mpStudent.sQuestion;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("sQuestionService")
class sQuestionServiceImpl implements sQuestionService {

	@Resource(name="sQuestiondao")
	private sQuestionDao dao;
}
