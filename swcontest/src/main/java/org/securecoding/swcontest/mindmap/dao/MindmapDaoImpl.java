package org.securecoding.swcontest.mindmap.dao;

import java.sql.SQLException;


import java.util.List;

import org.securecoding.swcontest.vo.MindmapFileVo;
import org.securecoding.swcontest.vo.MindmapVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("mindmapdao")
public class MindmapDaoImpl implements MindmapDao {

	@Autowired
	SqlMapClient client;
	


	@Override
	public String mindmapInsert(MindmapVo vo) throws SQLException {
		return (String) client.insert("mindmap.mindmapInsert",vo);
		
	}



	@Override
	public MindmapVo mindmapList(String num) throws SQLException {
		return (MindmapVo) client.queryForObject("mindmap.mindmapList",num);
	}



	@Override
	public String mindmapCirInsert(MindmapVo vo) throws SQLException {
		return (String) client.insert("mindmap.mindmapCirInsert",vo);
		
	}



	@Override
	public void mindmapUpdate(MindmapVo vo) throws SQLException {
		client.update("mindmap.mindmapUpdate",vo);
		
	}



	@Override
	public MindmapVo selectByNum(MindmapVo vo) throws SQLException {

		return (MindmapVo) client.queryForObject("mindmap.selectByNum",vo);
	}



	@Override
	public void mindmapFileInsert(MindmapFileVo vo) throws SQLException {
		client.insert("mindmap.mindmapFileInsert",vo);
		
	}



	@Override
	public MindmapFileVo mindmapFileSelect(String num)throws SQLException {
	
		return (MindmapFileVo) client.queryForObject("mindmap.mindmapFileSelect",num);
	}



	@Override
	public void mindmapFileDelete(String code) throws SQLException {
		client.delete("mindmap.mindmapFileDelete",code);
		
	}



	@Override
	public void mindmapImgUpdate(MindmapVo vo) throws SQLException {
		client.update("mindmap.mindmapImgUpdate",vo);
		
	}



	@Override
	public void mindmapDelete(MindmapVo vo) throws SQLException {
		client.delete("mindmap.mindmapDelete",vo);
		
	}



	@Override
	public List<MindmapVo> selectByParent(MindmapVo vo) throws SQLException {
		
		return client.queryForList("mindmap.selectByParent",vo);
	}



	@Override
	public MindmapFileVo selectNumMindDownload(String code) throws SQLException {
		// TODO Auto-generated method stub
		return (MindmapFileVo) client.queryForObject("mindmap.selectNumMindDownload",code);
	}



	@Override
	public MindmapVo mindmapResult(String num) throws SQLException {
		// TODO Auto-generated method stub
		return (MindmapVo) client.queryForObject("mindmap.mindmapResult",num);
	}

}
