package org.securecoding.swcontest.mindmap.service;


import java.util.List;

import org.securecoding.swcontest.vo.MindmapFileVo;
import org.securecoding.swcontest.vo.MindmapVo;

public interface MindmapService {
	public String mindmapInsert(MindmapVo vo);
	public MindmapVo mindmapList(String num);
	public String mindmapCirInsert(MindmapVo vo);
	public void mindmapUpdate(MindmapVo vo);
	public MindmapVo selectByNum(MindmapVo vo);
	public void mindmapFileInsert(MindmapFileVo vo);
	public MindmapFileVo mindmapFileSelect(String num);
	public void mindmapFileDelete(String code);
	public void mindmapImgUpdate(MindmapVo vo);
	public void mindmapDelete(MindmapVo vo);
	public List<MindmapVo> selectByParent(MindmapVo vo);
	public MindmapFileVo selectNumMindDownload(String code);
	public MindmapVo mindmapResult(String num);
}
