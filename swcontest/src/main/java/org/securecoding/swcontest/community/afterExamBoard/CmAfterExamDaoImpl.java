package org.securecoding.swcontest.community.afterExamBoard;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("examDao")
public class CmAfterExamDaoImpl implements CmAfterExamDao {
	
	@Autowired
	SqlMapClient client;
	
	@Override
	public List<BoardVo> examList() throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("main.examList");
	}
	
	

	@Override
	public BoardVo selectExamList(String code) throws SQLException {
		// TODO Auto-generated method stub
		
		return (BoardVo) client.queryForObject("afterexam.selectExamList",code);
	}

	@Override
	public int selectExamUpdate(BoardVo vo) throws SQLException {
		
		return client.update("afterexam.selectExamUpdate",vo);
	}

	@Override
	public String examInsert(BoardVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return (String) client.insert("afterexam.examInsert",vo);
	}

	@Override
	public void examDelete(String code) throws SQLException {
		// TODO Auto-generated method stub
		client.delete("afterexam.examDelete",code);
	}

	@Override
	public void examUpload(FileVo vo) throws SQLException {
		client.insert("afterexam.examUpload",vo);
		
	}

	@Override
	public List<FileVo> examDownload(String code) throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("afterexam.examDownload",code);
	}

	@Override
	public FileVo selectNumDownload(String name) throws SQLException {
		// TODO Auto-generated method stub
		return (FileVo) client.queryForObject("afterexam.selectNumDownload", name);
	}

	@Override
	public void examCount(BoardVo vo) throws SQLException {
		client.update("afterexam.examCount",vo);
		
	}

	@Override
	public String selectByName(String name) throws SQLException {
		
		return (String) client.queryForObject("afterexam.selectByName",name);
		
	}

	@Override
	public void examfileDelete(String code) throws SQLException {
		client.delete("afterexam.examfileDelete",code);
		
	}

}
