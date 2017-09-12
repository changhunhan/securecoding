package org.securecoding.swcontest.vo;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class AnswerBoardVo {
	private String ans_bor_title;
	private String ans_bor_wri_pers;
	private String ans_bor_date;
	private String ans_bor_cont;
	private String ans_bor_num;
	private int ans_bor_chk_con;
	private int ans_bor_ori_num;
	private int ans_bor_gup_num;
	private int ans_bor_next_num;
	private String bor_divi_code;
	private MultipartFile[] uploadFiles;
	private String[] tempFile;
	private String checkFile;
	
	public String getCheckFile() {
		return checkFile;
	}
	public void setCheckFile(String checkFile) {
		this.checkFile = checkFile;
	}
	public String getAns_bor_title() {
		return ans_bor_title;
	}
	public void setAns_bor_title(String ans_bor_title) {
		this.ans_bor_title = ans_bor_title;
	}
	public String getAns_bor_wri_pers() {
		return ans_bor_wri_pers;
	}
	public void setAns_bor_wri_pers(String ans_bor_wri_pers) {
		this.ans_bor_wri_pers = ans_bor_wri_pers;
	}
	public String getAns_bor_date() {
		return ans_bor_date;
	}
	public void setAns_bor_date(String ans_bor_date) {
		this.ans_bor_date = ans_bor_date;
	}
	public String getAns_bor_cont() {
		return ans_bor_cont;
	}
	public void setAns_bor_cont(String ans_bor_cont) {
		this.ans_bor_cont = ans_bor_cont;
	}
	public String getAns_bor_num() {
		return ans_bor_num;
	}
	public void setAns_bor_num(String ans_bor_num) {
		this.ans_bor_num = ans_bor_num;
	}
	public int getAns_bor_chk_con() {
		return ans_bor_chk_con;
	}
	public void setAns_bor_chk_con(int ans_bor_chk_con) {
		this.ans_bor_chk_con = ans_bor_chk_con;
	}
	public int getAns_bor_ori_num() {
		return ans_bor_ori_num;
	}
	public void setAns_bor_ori_num(int ans_bor_ori_num) {
		this.ans_bor_ori_num = ans_bor_ori_num;
	}
	public int getAns_bor_gup_num() {
		return ans_bor_gup_num;
	}
	public void setAns_bor_gup_num(int ans_bor_gup_num) {
		this.ans_bor_gup_num = ans_bor_gup_num;
	}
	public int getAns_bor_next_num() {
		return ans_bor_next_num;
	}
	public void setAns_bor_next_num(int ans_bor_next_num) {
		this.ans_bor_next_num = ans_bor_next_num;
	}
	public String getBor_divi_code() {
		return bor_divi_code;
	}
	public void setBor_divi_code(String bor_divi_code) {
		this.bor_divi_code = bor_divi_code;
	}
	public MultipartFile[] getUploadFiles() {
		return uploadFiles;
	}
	public void setUploadFiles(MultipartFile[] uploadFiles) {
		this.uploadFiles = uploadFiles;
	}
	public String[] getTempFile() {
		return tempFile;
	}
	public void setTempFile(String[] tempFile) {
		this.tempFile = tempFile;
	}
	@Override
	public String toString() {
		return "AnswerBoardVo [ans_bor_title=" + ans_bor_title
				+ ", ans_bor_wri_pers=" + ans_bor_wri_pers + ", ans_bor_date="
				+ ans_bor_date + ", ans_bor_cont=" + ans_bor_cont
				+ ", ans_bor_num=" + ans_bor_num + ", ans_bor_chk_con="
				+ ans_bor_chk_con + ", ans_bor_ori_num=" + ans_bor_ori_num
				+ ", ans_bor_gup_num=" + ans_bor_gup_num
				+ ", ans_bor_next_num=" + ans_bor_next_num + ", bor_divi_code="
				+ bor_divi_code + ", uploadFiles="
				+ Arrays.toString(uploadFiles) + ", tempFile="
				+ Arrays.toString(tempFile) + "]";
	}

	

}
