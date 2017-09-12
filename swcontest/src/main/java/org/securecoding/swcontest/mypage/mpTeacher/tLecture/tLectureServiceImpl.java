package org.securecoding.swcontest.mypage.mpTeacher.tLecture;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("tLectureService")
class tLectureServiceImpl implements tLectureService {

	@Resource(name="tLecturedao")
	private tLectureDao dao;
}
