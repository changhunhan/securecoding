package org.securecoding.swcontest.mypage.mpAdmin.aTNotice;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("aTNoticedao")
public class aTNoticeDaoImpl implements aTNoticeDao{

	@Autowired
	SqlMapClient client;
	
	@Override
	public List<BoardVo> aTnoticeList() throws SQLException {

		return client.queryForList("main.tNoticeList");
	}

	@Override
	public BoardVo selectAtNoticeList(String code) throws SQLException {

		return (BoardVo) client.queryForObject("cutnotice.selectTnoticeList",
				code);
	}

	@Override
	public int selectAtNoticeUpdate(BoardVo vo) throws SQLException {

		return client.update("cutnotice.selectTnoticeUpdate", vo);
	}

	@Override
	public String aTnoticeInsert(BoardVo vo) throws SQLException {

		return (String) client.insert("cutnotice.tnoticeInsert", vo);
	}

	@Override
	public void aTnoticeDelete(String code) throws SQLException {

		client.delete("cutnotice.tnoticeDelete", code);

	}

	@Override
	public void aTnoticeUpload(FileVo vo) throws SQLException {

		client.insert("cutnotice.tnoticeUpload", vo);

	}

	@Override
	public List<FileVo> aTnoticeDownload(String code) throws SQLException {

		return client.queryForList("cutnotice.tnoticeDownload", code);
	}

	@Override
	public void aTnoticeCount(BoardVo vo) throws SQLException {

		client.update("cutnotice.tnoticeCount", vo);

	}

	@Override
	public void aTnoticefileDelete(String code) throws SQLException {

		client.delete("cutnotice.tnoticefileDelete", code);

	}
	
	@Override
	public FileVo selectNumDownload(String name) throws SQLException {
		// TODO Auto-generated method stub
		return (FileVo) client.queryForObject("cutnotice.selectNumDownload",
				name);
	}
	
	@Override
	public String selectByName(String name) throws SQLException {

		return (String) client.queryForObject("cutnotice.selectByName", name);

	}
}
