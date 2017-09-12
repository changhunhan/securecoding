package org.securecoding.swcontest.community.afterExamBoard;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;

import org.springframework.stereotype.Service;

@Service("examService")
public class CmAfterExamServiceImpl implements CmAfterExamService {

	@Resource(name="examDao")
	CmAfterExamDao dao;
	
	@Override
	public List<BoardVo> examList() {
		List<BoardVo> list=null;
		try {
			list=dao.examList();
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return list;
	}
	
	

	@Override
	public BoardVo selectExamList(String code) {
		BoardVo vo=null;
		try {
			vo=dao.selectExamList(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return vo;
	}

	@Override
	public int selectExamUpdate(BoardVo vo) {
		int num=0;
		try {
			num=dao.selectExamUpdate(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return num;
	}

	@Override
	public String examInsert(BoardVo vo) {
		String id=null;
		try {
			id=dao.examInsert(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return id;
	}

	@Override
	public void examDelete(String code) {
		try {
			dao.examDelete(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}		
	}

	@Override
	public void examUpload(FileVo vo) {
		try {
			dao.examUpload(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
	}

	@Override
	public List<FileVo> examDownload(String code) {
		// TODO Auto-generated method stub
		List<FileVo> vo=null;
		try {
			vo=dao.examDownload(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
		return vo;
	}

	@Override
	public FileVo selectNumDownload(String name) {
		// TODO Auto-generated method stub
		FileVo no=null;
		try {
			no=dao.selectNumDownload(name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return no;
	}

	@Override
	public void examCount(BoardVo vo) {
		try {
			dao.examCount(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
	}

	@Override
	public String selectByName(String name) {
		// TODO Auto-generated method stub
		String rename=null;
		try {
			rename=dao.selectByName(name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return rename;
	}

	@Override
	public void examfileDelete(String code) {
		try {
			dao.examfileDelete(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
	}

}
