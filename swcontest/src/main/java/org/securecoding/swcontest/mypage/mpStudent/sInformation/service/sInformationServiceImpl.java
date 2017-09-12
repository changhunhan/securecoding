package org.securecoding.swcontest.mypage.mpStudent.sInformation.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.securecoding.swcontest.member.dao.MemberDao;
import org.securecoding.swcontest.mypage.mpStudent.sInformation.dao.sInformationDao;
import org.securecoding.swcontest.vo.MemberVo;
import org.securecoding.swcontest.vo.ZipVo;

import org.springframework.stereotype.Service;

@Service("sInformationService")
class sInformationServiceImpl implements sInformationService {

	@Resource(name="sInformationDao")
	private sInformationDao dao;

	@Override
	public int updateById(MemberVo vo) {
		int res = 0;
		try {
			res = dao.updateById(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}
	@Override
	public MemberVo selectAllById(String id) {
		MemberVo res = null;
		try {
			res = dao.selectAllById(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;		
	}
	@Override
	public int updatePasswordById(MemberVo vo) {
		int res = 0;
		try {
			res = dao.updatePasswordById(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}
	@Override
	public List<ZipVo> selectZipAll(String dong) {
		List<ZipVo> res = null;
		try {
			res = dao.selectZipAll(dong);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

}
