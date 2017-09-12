package org.securecoding.swcontest.mypage.mpAdmin.aBanner;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import org.securecoding.swcontest.main.vo.BannerVo;
import org.securecoding.swcontest.vo.ProcessClaVo;
@Repository("aBannerDao")
public class aBannerDaoImpl implements aBannerDao{
	
	@Autowired
	SqlMapClient client;
	
	@Override
	public List<ProcessClaVo> selectProcessAll() throws SQLException {
		return client.queryForList("banner.selectProcessAll");
	}

	@Override
	public void insert(BannerVo vo) throws SQLException {
		client.insert("banner.insertBanner", vo);
	}

	@Override
	public void update(BannerVo vo) throws SQLException {
		client.update("banner.updateBanner", vo);
	}

	@Override
	public void delete(String num) throws SQLException {
		client.delete("banner.deleteBanner", num);
	}
	
}
