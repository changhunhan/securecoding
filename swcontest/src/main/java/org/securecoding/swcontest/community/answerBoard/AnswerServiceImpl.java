package org.securecoding.swcontest.community.answerBoard;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;

import org.springframework.stereotype.Service;

@Service("answerService")
public class AnswerServiceImpl implements AnswerService {

	@Resource(name="answerDao")
	AnswerDao dao;
	
	@Override
	public List<BoardVo> answerList() {
		List<BoardVo> list=null;
		try {
			list=dao.answerList();
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return list;
	}
	

	@Override
	public BoardVo selectAnswerList(String code) {
		BoardVo vo=null;
		try {
			vo=dao.selectAnswerList(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return vo;
	}

	@Override
	public int selectAnswerUpdate(BoardVo vo) {
		int num=0;
		try {
			num=dao.selectAnswerUpdate(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return num;
	}

	@Override
	public String answerInsert(BoardVo vo) {
		String id=null;
		try {
			id=dao.answerInsert(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return id;
	}

	@Override
	public void answerDelete(String code) {
		try {
			dao.answerDelete(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}		
	}

	@Override
	public void answerUpload(FileVo vo) {
		try {
			dao.answerUpload(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
	}

	@Override
	public List<FileVo> answerDownload(String code) {
		// TODO Auto-generated method stub
		List<FileVo> vo=null;
		try {
			vo=dao.answerDownload(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
		return vo;
	}

	@Override
	public FileVo selectNumberDownload(String name) {
		// TODO Auto-generated method stub
		FileVo no=null;
		try {
			no=dao.selectNumberDownload(name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return no;
	}

	@Override
	public void answerCount(BoardVo vo) {
		try {
			dao.answerCount(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
	}

	@Override
	public String selectName(String name) {
		// TODO Auto-generated method stub
		String rename=null;
		try {
			rename=dao.selectName(name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return rename;
	}

	@Override
	public void answerfileDelete(String code) {
		try {
			dao.answerfileDelete(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
	}

}
