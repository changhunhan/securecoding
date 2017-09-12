package org.securecoding.swcontest.vo;



import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class BoardVo {
	private String bor_title;
	private String bor_wri_pers;
	private String bor_date;
	private String bor_cont;
	private String bor_num;
	private int bor_chk_con;
	private String bor_divi_code;
	private MultipartFile[] uploadFiles;
	private String[] tempFile;
	private int date;
	private String checkFile;
	
	public String getCheckFile() {
		return checkFile;
	}

	public void setCheckFile(String checkFile) {
		this.checkFile = checkFile;
	}

	public int getDate() {
		return date;
	}

	public void setDate(int date) {
		this.date = date;
	}

	public String[] getTempFile() {
		return tempFile;
	}

	public void setTempFile(String[] tempFile) {
		this.tempFile = tempFile;
	}

	public int getBor_chk_con() {
		return bor_chk_con;
	}

	public void setBor_chk_con(int bor_chk_con) {
		this.bor_chk_con = bor_chk_con;
	}

	public String getBor_title() {
		return bor_title;
	}
	
	public MultipartFile[] getUploadFiles() {
		return uploadFiles;
	}

	public void setUploadFiles(MultipartFile[] uploadFiles) {
		this.uploadFiles = uploadFiles;
	}

	public void setBor_title(String bor_title) {
		this.bor_title = bor_title;
	}
	public String getBor_wri_pers() {
		return bor_wri_pers;
	}
	public void setBor_wri_pers(String bor_wri_pers) {
		this.bor_wri_pers = bor_wri_pers;
	}
	public String getBor_date() {
		return bor_date;
	}
	public void setBor_date(String bor_date) {
		this.bor_date = bor_date;
	}
	public String getBor_cont() {
		return bor_cont;
	}
	public void setBor_cont(String bor_cont) {
		this.bor_cont = bor_cont;
	}
	public String getBor_num() {
		return bor_num;
	}
	public void setBor_num(String bor_num) {
		this.bor_num = bor_num;
	}
	
	public String getBor_divi_code() {
		return bor_divi_code;
	}
	public void setBor_divi_code(String bor_divi_code) {
		this.bor_divi_code = bor_divi_code;
	}

	@Override
	public String toString() {
		return "BoardVo [bor_title=" + bor_title + ", bor_wri_pers="
				+ bor_wri_pers + ", bor_date=" + bor_date + ", bor_cont="
				+ bor_cont + ", bor_num=" + bor_num + ", bor_chk_con="
				+ bor_chk_con + ", bor_divi_code=" + bor_divi_code
				+ ", uploadFiles=" + Arrays.toString(uploadFiles)
				+ ", tempFile=" + Arrays.toString(tempFile) + "]";
	}

	
}
