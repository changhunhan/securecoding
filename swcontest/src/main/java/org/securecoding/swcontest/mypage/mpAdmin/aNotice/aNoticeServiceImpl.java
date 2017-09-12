package org.securecoding.swcontest.mypage.mpAdmin.aNotice;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;

import org.springframework.stereotype.Service;

@Service("aNoticeService")
public class aNoticeServiceImpl implements aNoticeService {

	@Resource(name="aNoticedao")
	private aNoticeDao dao;


	@Override
	public List<BoardVo> anoticeList() {
		List<BoardVo> list = null;
		try {
			list = dao.anoticeList();
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return list;
	}

	@Override
	public BoardVo selectAnoticeList(String code) {
		BoardVo vo = null;
		try {
			vo = dao.selectAnoticeList(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return vo;
	}

	@Override
	public int selectAnoticeUpdate(BoardVo vo) {
		int num = 0;
		try {
			num = dao.selectAnoticeUpdate(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return num;
	}

	@Override
	public String anoticeInsert(BoardVo vo) {
		String id = null;
		try {
			id = dao.anoticeInsert(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return id;
	}

	@Override
	public void anoticeDelete(String code) {
		try {
			dao.anoticeDelete(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
	}

	@Override
	public void anoticeUpload(FileVo vo) {
		try {
			dao.anoticeUpload(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}

	}

	@Override
	public List<FileVo> anoticeDownload(String code) {
		// TODO Auto-generated method stub
		List<FileVo> vo = null;
		try {
			vo = dao.anoticeDownload(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}

		return vo;
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
	public void anoticeCount(BoardVo vo) {
		try {
			dao.anoticeCount(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}

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
	public void anoticefileDelete(String code) {
		try {
			dao.anoticefileDelete(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}

	}
}

