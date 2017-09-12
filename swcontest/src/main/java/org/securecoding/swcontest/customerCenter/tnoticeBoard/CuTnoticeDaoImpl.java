package org.securecoding.swcontest.customerCenter.tnoticeBoard;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("cuTnoticeDao")
public class CuTnoticeDaoImpl implements CuTnoticeDao {

	@Autowired
	SqlMapClient client;

	
	// 선생님 공지사항

	@Override
	public List<BoardVo> tNoticeList(String id) throws SQLException {

		return client.queryForList("main.tNoticeList",id);
	}

	@Override
	public BoardVo selectTnoticeList(String code) throws SQLException {

		return (BoardVo) client.queryForObject("cutnotice.selectTnoticeList",
				code);
	}

	@Override
	public int selectTnoticeUpdate(BoardVo vo) throws SQLException {

		return client.update("cutnotice.selectTnoticeUpdate", vo);
	}

	@Override
	public String tnoticeInsert(BoardVo vo) throws SQLException {

		return (String) client.insert("cutnotice.tnoticeInsert", vo);
	}

	@Override
	public void tnoticeDelete(String code) throws SQLException {

		client.delete("cutnotice.tnoticeDelete", code);

	}

	@Override
	public void tnoticeUpload(FileVo vo) throws SQLException {

		client.insert("cutnotice.tnoticeUpload", vo);

	}

	@Override
	public List<FileVo> tnoticeDownload(String code) throws SQLException {

		return client.queryForList("cutnotice.tnoticeDownload", code);
	}

	@Override
	public void tnoticeCount(BoardVo vo) throws SQLException {

		client.update("cutnotice.tnoticeCount", vo);

	}

	@Override
	public void tnoticefileDelete(String code) throws SQLException {

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

	@Override
	public List<BoardVo> tNoticeListTeacher(String id) throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("main.tNoticeListTeacher",id);
	}

	@Override
	public List<BoardVo> tNoticeListAdmin() throws SQLException {
		
		return client.queryForList("main.tNoticeListAdmin");
	}

}
