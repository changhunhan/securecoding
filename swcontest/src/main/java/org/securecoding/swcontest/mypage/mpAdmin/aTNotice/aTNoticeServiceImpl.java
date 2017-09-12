package org.securecoding.swcontest.mypage.mpAdmin.aTNotice;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;

import org.springframework.stereotype.Service;

@Service("aTNoticeService")
public class aTNoticeServiceImpl implements aTNoticeService{

	@Resource(name="aTNoticedao")
	private aTNoticeDao dao;
	
	
	// 선생님 공지사항

		@Override
		public List<BoardVo> aTnoticeList() {
			List<BoardVo> list = null;
			try {
				list = dao.aTnoticeList();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("ERROR");
			}
			return list;
		}

		@Override
		public BoardVo selectAtNoticeList(String code) {

			BoardVo vo = null;
			try {
				vo = dao.selectAtNoticeList(code);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("ERROR");
			}
			return vo;
		}

		@Override
		public int selectAtNoticeUpdate(BoardVo vo) {
			int num = 0;
			try {
				num = dao.selectAtNoticeUpdate(vo);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("ERROR");
			}
			return num;
		}

		@Override
		public String aTnoticeInsert(BoardVo vo) {
			String id = null;
			try {
				id = dao.aTnoticeInsert(vo);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("ERROR");
			}
			return id;
		}

		@Override
		public void aTnoticeDelete(String code) {
			try {
				dao.aTnoticeDelete(code);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("ERROR");
			}

		}

		@Override
		public void aTnoticeUpload(FileVo vo) {
			try {
				dao.aTnoticeUpload(vo);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("ERROR");
			}

		}

		@Override
		public List<FileVo> aTnoticeDownload(String code) {
			// TODO Auto-generated method stub
			List<FileVo> vo = null;
			try {
				vo = dao.aTnoticeDownload(code);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("ERROR");
			}

			return vo;
		}

		@Override
		public void aTnoticeCount(BoardVo vo) {
			try {
				dao.aTnoticeCount(vo);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("ERROR");
			}
		}

		@Override
		public void aTnoticefileDelete(String code) {
			try {
				dao.aTnoticefileDelete(code);
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

}
