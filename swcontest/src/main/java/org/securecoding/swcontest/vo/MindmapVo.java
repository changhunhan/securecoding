package org.securecoding.swcontest.vo;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class MindmapVo {
	private String key;
	private String text;
	private String path;
	private int mind_num;
	private String cur_num;
	private String midm_num;
	private String midm_title;
	private String midm_cont;
	private String midm_key_num;
	private String midm_ori_num;
	private String midm_perent_num;
	private MultipartFile[] uploadFiles;
	private String[] tempFile;
	private String[] tempOri;
	private String tempKey;

	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	public String getTempKey() {
		return tempKey;
	}
	public void setTempKey(String tempKey) {
		this.tempKey = tempKey;
	}
	public int getMind_num() {
		return mind_num;
	}
	public void setMind_num(int mind_num) {
		this.mind_num = mind_num;
	}
	
	public String getMidm_perent_num() {
		return midm_perent_num;
	}
	public void setMidm_perent_num(String midm_perent_num) {
		this.midm_perent_num = midm_perent_num;
	}
	public String[] getTempOri() {
		return tempOri;
	}
	public void setTempOri(String[] tempOri) {
		this.tempOri = tempOri;
	}
	
	public String[] getTempFile() {
		return tempFile;
	}
	public void setTempFile(String[] tempFile) {
		this.tempFile = tempFile;
	}
	public MultipartFile[] getUploadFiles() {
		return uploadFiles;
	}
	public void setUploadFiles(MultipartFile[] uploadFiles) {
		this.uploadFiles = uploadFiles;
	}
	
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getCur_num() {
		return cur_num;
	}
	public void setCur_num(String cur_num) {
		this.cur_num = cur_num;
	}
	public String getMidm_title() {
		return midm_title;
	}
	public void setMidm_title(String midm_title) {
		this.midm_title = midm_title;
	}
	public String getMidm_cont() {
		return midm_cont;
	}
	public void setMidm_cont(String midm_cont) {
		this.midm_cont = midm_cont;
	}
	public String getMidm_key_num() {
		return midm_key_num;
	}
	public void setMidm_key_num(String midm_key_num) {
		this.midm_key_num = midm_key_num;
	}
	public String getMidm_ori_num() {
		return midm_ori_num;
	}
	public void setMidm_ori_num(String midm_ori_num) {
		this.midm_ori_num = midm_ori_num;
	}
	public String getMidm_num() {
		return midm_num;
	}
	public void setMidm_num(String midm_num) {
		this.midm_num = midm_num;
	}
	@Override
	public String toString() {
		return "MindmapVo [key=" + key + ", text=" + text + ", path=" + path
				+ ", mind_num=" + mind_num + ", cur_num=" + cur_num
				+ ", midm_num=" + midm_num + ", midm_title=" + midm_title
				+ ", midm_cont=" + midm_cont + ", midm_key_num=" + midm_key_num
				+ ", midm_ori_num=" + midm_ori_num + ", midm_perent_num="
				+ midm_perent_num + ", uploadFiles="
				+ Arrays.toString(uploadFiles) + ", tempFile="
				+ Arrays.toString(tempFile) + ", tempOri="
				+ Arrays.toString(tempOri) + ", tempKey=" + tempKey + "]";
	}
	

	
	
}
