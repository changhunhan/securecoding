package org.securecoding.swcontest.mypage.mpTeacher.tAdvice;

import java.util.List;

import org.securecoding.swcontest.vo.AdviceVo;

public interface tAdviceService {

	public List<AdviceVo> selectAdviceByAdv_tea_id(String adv_tea_id);

	public void insertAdviceByT(AdviceVo advVo);

	public void deleteAdviceByAdvNum(String id);

	public List<AdviceVo> selectAdvice(String adv_tea_id);
	
	public void updateKey(AdviceVo vo);
	
	public void pageUnload(String id);
}
