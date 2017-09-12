package org.securecoding.swcontest.comment;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.BorcommVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository(value="commentDao")
public class CommentDaoImpl implements CommentDao {
	@Autowired
	SqlMapClient client;

	@Override
	public List<BorcommVo> commentList(String bor_num) throws SQLException {
		return client.queryForList("borcomm.commentList", bor_num);
	}

	@Override
	public int commentDelete(String comm_num) throws SQLException {
		return client.delete("borcomm.commentDelete", comm_num);
	}

	@Override
	public void commentInsert(BorcommVo vo) throws SQLException {
		client.insert("borcomm.commentInsert", vo);
	}

	@Override
	public String getCommentCurrentNum() throws SQLException {
		return (String) client.queryForObject("borcomm.getCommentCurrentNum");
	}

	@Override
	public void ansCommentInsert(BorcommVo vo) throws SQLException {
		client.insert("borcomm.ansCommentInsert",vo);
		
	}

	@Override
	public List<BorcommVo> ansCommentList(String bor_num) throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("borcomm.ansCommentList",bor_num);
	}

	@Override
	public int ansCommentDelete(String comm_num) throws SQLException {
		// TODO Auto-generated method stub
		return client.delete("borcomm.ansCommentDelete",comm_num);
	}

}
