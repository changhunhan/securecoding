package org.securecoding.swcontest.comment;

import java.util.List;

import org.securecoding.swcontest.vo.BorcommVo;

public interface CommentService {

	public List<BorcommVo> commentList(String bor_num);
	
	public List<BorcommVo> ansCommentList(String bor_num);

	public int commentDelete(String comm_num);

	public void commentInsert(BorcommVo vo);
	
	public String getCommentCurrentNum();
	
	public void ansCommentInsert(BorcommVo vo);
	
	public int ansCommentDelete(String comm_num);
}
