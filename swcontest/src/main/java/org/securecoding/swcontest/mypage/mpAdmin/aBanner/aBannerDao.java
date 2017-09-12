package org.securecoding.swcontest.mypage.mpAdmin.aBanner;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.main.vo.BannerVo;
import org.securecoding.swcontest.vo.ProcessClaVo;

public interface aBannerDao {
	public List<ProcessClaVo> selectProcessAll() throws SQLException;
	public void insert(BannerVo vo) throws SQLException;	
	public void update(BannerVo vo) throws SQLException;
	public void delete(String num) throws SQLException;
}
