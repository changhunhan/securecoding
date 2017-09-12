package org.securecoding.swcontest.customerCenter.noticeBoard;

import java.sql.SQLException;
import java.util.List;
import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("cuNoticeDao")
public class CuNoticeDaoImpl implements CuNoticeDao {

	@Autowired
	SqlMapClient client;

	@Override
	public List<BoardVo> noticeList() throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("main.noticeList");
	}

	@Override
	public BoardVo selectNoticeList(String code) throws SQLException {
		// TODO Auto-generated method stub

		return (BoardVo) client.queryForObject("cunotice.selectNoticeList",
				code);
	}

	@Override
	public int selectNoticeUpdate(BoardVo vo) throws SQLException {

		return client.update("cunotice.selectNoticeUpdate", vo);
	}

	@Override
	public String noticeInsert(BoardVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return (String) client.insert("cunotice.noticeInsert", vo);
	}

	@Override
	public void noticeDelete(String code) throws SQLException {
		// TODO Auto-generated method stub
		client.delete("cunotice.noticeDelete", code);
	}

	@Override
	public void noticeUpload(FileVo vo) throws SQLException {
		client.insert("cunotice.noticeUpload", vo);

	}

	@Override
	public List<FileVo> noticeDownload(String code) throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("cunotice.noticeDownload", code);
	}

	@Override
	public FileVo selectNumDownload(String name) throws SQLException {
		// TODO Auto-generated method stub
		return (FileVo) client.queryForObject("cunotice.selectNumDownload",
				name);
	}

	@Override
	public void noticeCount(BoardVo vo) throws SQLException {
		client.update("cunotice.noticeCount", vo);

	}

	@Override
	public String selectByName(String name) throws SQLException {

		return (String) client.queryForObject("cunotice.selectByName", name);

	}

	@Override
	public void noticefileDelete(String code) throws SQLException {
		client.delete("cunotice.noticefileDelete", code);

	}

	@Override
	public int noticeFileCheck(String num) throws SQLException {
		return (int) client.queryForObject("cunotice.noticeFileCheck", num);
	}

}
