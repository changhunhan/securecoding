package org.securecoding.swcontest.comment;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.BorcommVo;

public interface CommentDao {

	public List<BorcommVo> commentList(String bor_num) throws SQLException;
	public List<BorcommVo> ansCommentList(String bor_num) throws SQLException;

	public int commentDelete(String comm_num) throws SQLException;
	
	public int ansCommentDelete(String comm_num) throws SQLException;
	
	public void commentInsert(BorcommVo vo)throws SQLException;
	public void ansCommentInsert(BorcommVo vo)throws SQLException;

	public String getCommentCurrentNum()throws SQLException;

}
