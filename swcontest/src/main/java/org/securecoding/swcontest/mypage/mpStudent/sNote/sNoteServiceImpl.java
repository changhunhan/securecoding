package org.securecoding.swcontest.mypage.mpStudent.sNote;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service("sNoteService")
class sNoteServiceImpl implements sNoteService {

	@Resource(name="sNotedao")
	private sNoteDao dao;
}
