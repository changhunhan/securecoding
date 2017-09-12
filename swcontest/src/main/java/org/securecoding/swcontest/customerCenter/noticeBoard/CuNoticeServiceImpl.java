package org.securecoding.swcontest.customerCenter.noticeBoard;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;

import org.springframework.stereotype.Service;

@Service("cuNoticeService")
public class CuNoticeServiceImpl implements CuNoticeService {

	@Resource(name = "cuNoticeDao")
	CuNoticeDao dao;

	@Override
	public List<BoardVo> noticeList() {
		List<BoardVo> list = null;
		try {
			list = dao.noticeList();
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return list;
	}

	@Override
	public BoardVo selectNoticeList(String code) {
		BoardVo vo = null;
		try {
			vo = dao.selectNoticeList(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return vo;
	}

	@Override
	public int selectNoticeUpdate(BoardVo vo) {
		int num = 0;
		try {
			num = dao.selectNoticeUpdate(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return num;
	}

	@Override
	public String noticeInsert(BoardVo vo) {
		String id = null;
		try {
			id = dao.noticeInsert(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return id;
	}

	@Override
	public void noticeDelete(String code) {
		try {
			dao.noticeDelete(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
	}

	@Override
	public void noticeUpload(FileVo vo) {
		try {
			dao.noticeUpload(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}

	}

	@Override
	public List<FileVo> noticeDownload(String code) {
		// TODO Auto-generated method stub
		List<FileVo> vo = null;
		try {
			vo = dao.noticeDownload(code);
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
	public void noticeCount(BoardVo vo) {
		try {
			dao.noticeCount(vo);
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
	public void noticefileDelete(String code) {
		try {
			dao.noticefileDelete(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}

	}

	@Override
	public int noticeFileCheck(String num) {
		int res = 0;
		try {
			res = dao.noticeFileCheck(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}
}


