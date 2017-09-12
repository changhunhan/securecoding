package org.securecoding.swcontest.mypage.mpTeacher.tVideo;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("tVideoService")
class tVideoServiceImpl implements tVideoService {

	@Resource(name="tVideodao")
	private tVideoDao dao;
	
}
