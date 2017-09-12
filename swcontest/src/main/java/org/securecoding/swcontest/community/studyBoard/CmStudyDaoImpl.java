package org.securecoding.swcontest.community.studyBoard;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("studyDao")
public class CmStudyDaoImpl implements CmStudyDao {
	
	@Autowired
	SqlMapClient client;
	
	@Override
	public List<BoardVo> studyList() throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("main.studyList");
	}
	
	

	@Override
	public BoardVo selectStudyList(String code) throws SQLException {
		// TODO Auto-generated method stub
		
		return (BoardVo) client.queryForObject("study.selectStudyList",code);
	}

	@Override
	public int selectStudyUpdate(BoardVo vo) throws SQLException {
		
		return client.update("study.selectStudyUpdate",vo);
	}

	@Override
	public String studyInsert(BoardVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return (String) client.insert("study.studyInsert",vo);
	}

	@Override
	public void studyDelete(String code) throws SQLException {
		// TODO Auto-generated method stub
		client.delete("study.studyDelete",code);
	}

	@Override
	public void studyUpload(FileVo vo) throws SQLException {
		client.insert("study.studyUpload",vo);
		
	}

	@Override
	public List<FileVo> studyDownload(String code) throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("study.studyDownload",code);
	}

	@Override
	public FileVo selectNumDownload(String name) throws SQLException {
		// TODO Auto-generated method stub
		return (FileVo) client.queryForObject("study.selectNumDownload", name);
	}

	@Override
	public void studyCount(BoardVo vo) throws SQLException {
		client.update("study.studyCount",vo);
		
	}

	@Override
	public String selectByName(String name) throws SQLException {
		
		return (String) client.queryForObject("study.selectByName",name);
		
	}

	@Override
	public void studyfileDelete(String code) throws SQLException {
		client.delete("study.studyfileDelete",code);
		
	}

}
