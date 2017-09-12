package org.securecoding.swcontest.mindmap.dao;

import java.sql.SQLException;
import java.util.List;

import org.securecoding.swcontest.vo.MindmapFileVo;
import org.securecoding.swcontest.vo.MindmapVo;

public interface MindmapDao {
	public String mindmapInsert(MindmapVo vo)throws SQLException;
	public MindmapVo mindmapList(String num)throws SQLException;
	public String mindmapCirInsert(MindmapVo vo)throws SQLException;
	public void mindmapUpdate(MindmapVo vo)throws SQLException;
	public MindmapVo selectByNum(MindmapVo vo)throws SQLException;
	public void mindmapFileInsert(MindmapFileVo vo)throws SQLException;
	public MindmapFileVo mindmapFileSelect(String num)throws SQLException;
	public void mindmapFileDelete(String code)throws SQLException;
	public void mindmapImgUpdate(MindmapVo vo)throws SQLException;
	public void mindmapDelete(MindmapVo vo) throws SQLException;
	public List<MindmapVo> selectByParent(MindmapVo vo)throws SQLException;
	public MindmapFileVo selectNumMindDownload(String code)throws SQLException;
	public MindmapVo mindmapResult(String num)throws SQLException;
}
