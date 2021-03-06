package org.securecoding.swcontest.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.securecoding.swcontest.vo.FileVo;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownLoadView extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest request,
			HttpServletResponse response)
			throws Exception {
		
	File file = (File) model.get("downfile");
	
	response.setContentType(super.getContentType());
	response.setContentLength((int) file.length());

	String userAgent = request.getHeader("User-Agent");
	
	
	boolean ie = userAgent.indexOf("Trident") > -1;
	String fileName = null;
	
	FileVo vo=(FileVo)model.get("name");
	
	//fileName = file.getName();
	if (ie) {
		fileName =URLEncoder.encode(vo.getBor_file_name(), "utf-8");
		//fileName = file.getName();
	} else {
		fileName = new String((vo.getBor_file_name()).getBytes("utf-8"),
				"iso-8859-1");
		//fileName =URLEncoder.encode(file.getName(), "utf-8");
	}
	
	//////////////////////////////////////////////////////////////////////
	response.setHeader("Content-Disposition", "attachment; filename=\""+(fileName) + "\";");
	response.setHeader("Content-Transfer-Encoding", "binary");
		
  
	OutputStream out = response.getOutputStream();
	FileInputStream fis = null;
	try {
		fis = new FileInputStream(file);
		FileCopyUtils.copy(fis, out);
	} finally {
		if (fis != null)
			try {
				fis.close();
			} catch (IOException ex) {
				System.out.println("ERROR");
			}
	}
	out.flush();
	
	
		}
		
	public static String K2E(String korean) {
		String str = null;
		if (korean == null ) return null;
		try { 
			str = new String(korean.getBytes("MS949"), "ISO-8859-1");
		} catch (Exception e) {
			str = new String(korean);
		}
		return str;
    }
}
