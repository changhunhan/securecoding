package org.securecoding.swcontest.community.studyBoard;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;

import org.springframework.stereotype.Service;

@Service("studyService")
public class CmStudyServiceImpl implements CmStudyService {

	@Resource(name="studyDao")
	CmStudyDao dao;
	
	@Override
	public List<BoardVo> studyList() {
		List<BoardVo> list=null;
		try {
			list=dao.studyList();
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return list;
	}
	
	

	@Override
	public BoardVo selectStudyList(String code) {
		BoardVo vo=null;
		try {
			vo=dao.selectStudyList(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return vo;
	}

	@Override
	public int selectStudyUpdate(BoardVo vo) {
		int num=0;
		try {
			num=dao.selectStudyUpdate(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return num;
	}

	@Override
	public String studyInsert(BoardVo vo) {
		String id=null;
		try {
			id=dao.studyInsert(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return id;
	}

	@Override
	public void studyDelete(String code) {
		try {
			dao.studyDelete(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}		
	}

	@Override
	public void studyUpload(FileVo vo) {
		try {
			dao.studyUpload(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
	}

	@Override
	public List<FileVo> studyDownload(String code) {
		// TODO Auto-generated method stub
		List<FileVo> vo=null;
		try {
			vo=dao.studyDownload(code);
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
	public void studyCount(BoardVo vo) {
		try {
			dao.studyCount(vo);
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
	public void studyfileDelete(String code) {
		try {
			dao.studyfileDelete(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
	}

}
