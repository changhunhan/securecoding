package org.securecoding.swcontest.mypage.mpStudent.sAdvice;

import java.util.List;

import org.securecoding.swcontest.vo.AdviceVo;
import org.securecoding.swcontest.vo.TeacherVo;

public interface sAdviceService {

	public List<AdviceVo> selectAdviceBySid(String adv_mem_id);

	public void deleteAdviceByAdvNum(String id);

	public List<TeacherVo> selectAllTeacher();

	public void updateAdviceByAdv_num(AdviceVo vo);

	public List<AdviceVo> selectAdviceByAdv_tea_id(String adv_tea_id);
	
	public String selectKey(String num);
	
	public void updateState(String id);
}
