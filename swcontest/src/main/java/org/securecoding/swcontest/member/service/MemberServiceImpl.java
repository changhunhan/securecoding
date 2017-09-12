package org.securecoding.swcontest.member.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.securecoding.swcontest.member.dao.MemberDao;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.ZipVo;

import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Resource(name="memberdao")
	private MemberDao dao;
	
	@Override
	public String insertMember(MemberVo vo) {
			String a = null;
			try {
				a= dao.insertMember(vo);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("ERROR");
			}
			return a;
		}

	@Override
	public String selectById(String id) {
		String a = null;
		try {
			a= dao.selectById(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return a;
	}

	@Override
	public List<ZipVo> searchByDong(String dong) {
		List<ZipVo>list = null;
		try {
			list = dao.searchByDong(dong);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return list;
	}


}
