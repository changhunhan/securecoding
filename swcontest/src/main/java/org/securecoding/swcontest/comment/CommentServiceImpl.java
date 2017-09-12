package org.securecoding.swcontest.comment;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.securecoding.swcontest.vo.BorcommVo;

import org.springframework.stereotype.Service;

@Service(value="commentService")
public class CommentServiceImpl implements CommentService {

	@Resource(name="commentDao")
	CommentDao dao;

	@Override
	public List<BorcommVo> commentList(String bor_num) {
		List<BorcommVo> commentList = null;
		try {
			commentList = dao.commentList(bor_num);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return commentList;
	}

	@Override
	public int commentDelete(String comm_num) {
		int a = 0;
		try {
			dao.commentDelete(comm_num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return a;
	}

	@Override
	public void commentInsert(BorcommVo vo) {
		try {
			dao.commentInsert(vo);
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
	}

	@Override
	public String getCommentCurrentNum() {
		String currentCommNum = null;
		try {
			currentCommNum = dao.getCommentCurrentNum();
		} catch (SQLException e) {
			System.out.println("ERROR");
		}
		return currentCommNum;
	}

	@Override
	public void ansCommentInsert(BorcommVo vo) {
		try {
			dao.ansCommentInsert(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
	}

	@Override
	public List<BorcommVo> ansCommentList(String bor_num) {
		List<BorcommVo> list=null;
		try {
			list=dao.ansCommentList(bor_num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return list;
	}

	@Override
	public int ansCommentDelete(String comm_num) {
		int num=0;
		try {
			num=dao.ansCommentDelete(comm_num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return num;
	}

}
