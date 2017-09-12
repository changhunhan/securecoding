package org.securecoding.swcontest.mypage.mpAdmin.aBanner;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.securecoding.swcontest.main.vo.BannerVo;
import org.securecoding.swcontest.vo.ProcessClaVo;
@Service("aBannerService")
public class aBannerServiceImpl implements aBannerService{

	@Resource(name="aBannerDao")
	aBannerDao dao;
	
	@Override
	public List<ProcessClaVo> selectProcessAll() {
		List<ProcessClaVo> res = null;
		try {
			res = dao.selectProcessAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return res;
	}

	@Override
	public void insert(BannerVo vo) {
		try {
			dao.insert(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
	}

	@Override
	public void update(BannerVo vo) {
		try {
			dao.update(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
	}

	@Override
	public void delete(String num) {
		try {
			dao.delete(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
	}

}
