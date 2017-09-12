package org.securecoding.swcontest.mindmap.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.securecoding.swcontest.mindmap.dao.MindmapDao;
import org.securecoding.swcontest.vo.MindmapFileVo;
import org.securecoding.swcontest.vo.MindmapVo;

import org.springframework.stereotype.Service;

@Service("mindmapservice")
public class MindmapServiceImpl implements MindmapService {

	@Resource(name="mindmapdao")
	MindmapDao dao;


	@Override
	public String mindmapInsert(MindmapVo vo) {
		String num=null;
		try {
			num=dao.mindmapInsert(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return num;
	}


	@Override
	public MindmapVo mindmapList(String num) {
		MindmapVo vo=null;
		try {
			vo=dao.mindmapList(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
		return vo;
	}


	@Override
	public String mindmapCirInsert(MindmapVo vo) {
		String num=null;
		try {
			num=dao.mindmapCirInsert(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return num;
		
	}


	@Override
	public void mindmapUpdate(MindmapVo vo) {
		try {
			dao.mindmapUpdate(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
	}


	@Override
	public MindmapVo selectByNum(MindmapVo vo) {
		MindmapVo num=null;
		try {
			num=dao.selectByNum(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}

		return num;
	}


	@Override
	public void mindmapFileInsert(MindmapFileVo vo) {
		try {
			dao.mindmapFileInsert(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
	}


	@Override
	public MindmapFileVo mindmapFileSelect(String num) {
		MindmapFileVo list=null;
		try {
			list=dao.mindmapFileSelect(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return list;
	}


	@Override
	public void mindmapFileDelete(String code) {
		try {
			dao.mindmapFileDelete(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
	}


	@Override
	public void mindmapImgUpdate(MindmapVo vo) {
		try {
			dao.mindmapImgUpdate(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
	}


	@Override
	public void mindmapDelete(MindmapVo vo) {
		try {
			dao.mindmapDelete(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		
	}


	@Override
	public List<MindmapVo> selectByParent(MindmapVo vo) {
		List<MindmapVo> list=null;
		try {
			list=dao.selectByParent(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return list;
	}


	@Override
	public MindmapFileVo selectNumMindDownload(String code) {
		MindmapFileVo file=null;
		try {
			file=dao.selectNumMindDownload(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return file;
	}


	@Override
	public MindmapVo mindmapResult(String num) {
		MindmapVo vo=null;
		try {
			vo=dao.mindmapResult(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR");
		}
		return vo;
	}

}
