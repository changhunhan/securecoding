package org.securecoding.swcontest.mypage.mpAdmin.aTNotice;

import java.util.List;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;

public interface aTNoticeService {
	// 선생님 공지사항
		public List<BoardVo> aTnoticeList();

		public BoardVo selectAtNoticeList(String code);

		public int selectAtNoticeUpdate(BoardVo vo);

		public String aTnoticeInsert(BoardVo vo);

		public void aTnoticeDelete(String code);

		public void aTnoticeUpload(FileVo vo);

		public List<FileVo> aTnoticeDownload(String code);

		public void aTnoticeCount(BoardVo vo);

		public void aTnoticefileDelete(String code);
		
		public FileVo selectNumDownload(String name);
		
		public String selectByName(String name);

}
