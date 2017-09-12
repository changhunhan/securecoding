package org.securecoding.swcontest.mypage.mpTeacher.tQuestion;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service("tQuestionService")
class tQuestionServiceImpl implements tQuestionService {

	@Resource(name="tQuestiondao")
	private tQuestionDao dao;
}
