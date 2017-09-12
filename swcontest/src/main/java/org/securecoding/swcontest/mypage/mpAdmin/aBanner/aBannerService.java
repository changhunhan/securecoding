package org.securecoding.swcontest.mypage.mpAdmin.aBanner;

import java.util.List;

import org.securecoding.swcontest.main.vo.BannerVo;
import org.securecoding.swcontest.vo.ProcessClaVo;

public interface aBannerService {
	public List<ProcessClaVo> selectProcessAll();
	public void insert(BannerVo vo);
	public void update(BannerVo vo);
	public void delete(String num);
}
