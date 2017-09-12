package org.securecoding.swcontest.community.answerBoard;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.BoardVo;
import org.securecoding.swcontest.vo.FileVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("answerDao")
public class AnswerDaoImpl implements AnswerDao {
	
	@Autowired
	SqlMapClient client;
	
	@Override
	public List<BoardVo> answerList() throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("answer.answerList");
	}

	@Override
	public BoardVo selectAnswerList(String code) throws SQLException {
		// TODO Auto-generated method stub
		
		return (BoardVo) client.queryForObject("answer.selectAnswerList",code);
	}

	@Override
	public int selectAnswerUpdate(BoardVo vo) throws SQLException {
		
		return client.update("answer.selectAnswerUpdate",vo);
	}

	@Override
	public String answerInsert(BoardVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return (String) client.insert("answer.answerInsert",vo);
	}

	@Override
	public void answerDelete(String code) throws SQLException {
		// TODO Auto-generated method stub
		client.delete("answer.answerDelete",code);
	}

	@Override
	public void answerUpload(FileVo vo) throws SQLException {
		client.insert("answer.answerUpload",vo);
		
	}

	@Override
	public List<FileVo> answerDownload(String code) throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("answer.answerDownload",code);
	}

	@Override
	public FileVo selectNumberDownload(String name) throws SQLException {
		// TODO Auto-generated method stub
		return (FileVo) client.queryForObject("answer.selectNumberDownload", name);
	}

	@Override
	public void answerCount(BoardVo vo) throws SQLException {
		client.update("answer.answerCount",vo);
		
	}

	@Override
	public String selectName(String name) throws SQLException {
		return (String) client.queryForObject("answer.selectName",name);
	}

	@Override
	public void answerfileDelete(String code) throws SQLException {
		client.delete("answer.answerfileDelete",code);
	}

}
