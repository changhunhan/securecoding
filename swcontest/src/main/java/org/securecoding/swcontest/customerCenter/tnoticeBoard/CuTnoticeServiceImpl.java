package org.securecoding.swcontest.customerCenter.tnoticeBoard;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;

import org.springframework.stereotype.Service;

@Service("cuTnoticeService")
public class CuTnoticeServiceImpl implements CuTnoticeService {

	@Resource(name = "cuTnoticeDao")
	CuTnoticeDao dao;


	// 선생님 공지사항

	@Override
	public List<BoardVo> tNoticeList(String id) {
		List<BoardVo> list = null;
		try {
			list = dao.tNoticeList(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return list;
	}
	
	@Override
	public List<BoardVo> tNoticeListTeacher(String id) {
		List<BoardVo> list = null;
		try {
			list = dao.tNoticeListTeacher(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return list;
	}

	@Override
	public BoardVo selectTnoticeList(String code) {

		BoardVo vo = null;
		try {
			vo = dao.selectTnoticeList(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return vo;
	}

	@Override
	public int selectTnoticeUpdate(BoardVo vo) {
		int num = 0;
		try {
			num = dao.selectTnoticeUpdate(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return num;
	}

	@Override
	public String tnoticeInsert(BoardVo vo) {
		String id = null;
		try {
			id = dao.tnoticeInsert(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return id;
	}

	@Override
	public void tnoticeDelete(String code) {
		try {
			dao.tnoticeDelete(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}

	}

	@Override
	public void tnoticeUpload(FileVo vo) {
		try {
			dao.tnoticeUpload(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}

	}

	@Override
	public List<FileVo> tnoticeDownload(String code) {
		// TODO Auto-generated method stub
		List<FileVo> vo = null;
		try {
			vo = dao.tnoticeDownload(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}

		return vo;
	}

	@Override
	public void tnoticeCount(BoardVo vo) {
		try {
			dao.tnoticeCount(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
	}

	@Override
	public void tnoticefileDelete(String code) {
		try {
			dao.tnoticefileDelete(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}

	}
	
	@Override
	public FileVo selectNumDownload(String name) {
		// TODO Auto-generated method stub
		FileVo no = null;
		try {
			no = dao.selectNumDownload(name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return no;
	}
	
	
	@Override
	public String selectByName(String name) {
		// TODO Auto-generated method stub
		String rename = null;
		try {
			rename = dao.selectByName(name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return rename;
	}

	@Override
	public List<BoardVo> tNoticeListAdmin() {
		List<BoardVo> vo=null;
		try {
			vo=dao.tNoticeListAdmin();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return vo;
	}

	

}
