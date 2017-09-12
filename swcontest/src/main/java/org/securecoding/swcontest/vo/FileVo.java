package org.securecoding.swcontest.vo;

public class FileVo {
	private String bor_file_num;
	private String bor_file_name;
	private String bor_file_path;
	private long bor_file_size;
	private String bor_num;
	
	public String getBor_file_num() {
		return bor_file_num;
	}
	public void setBor_file_num(String bor_file_num) {
		this.bor_file_num = bor_file_num;
	}
	public String getBor_file_name() {
		return bor_file_name;
	}
	public void setBor_file_name(String bor_file_name) {
		this.bor_file_name = bor_file_name;
	}
	public String getBor_file_path() {
		return bor_file_path;
	}
	public void setBor_file_path(String bor_file_path) {
		this.bor_file_path = bor_file_path;
	}
	
	public String getBor_num() {
		return bor_num;
	}
	public long getBor_file_size() {
		return bor_file_size;
	}
	public void setBor_file_size(long bor_file_size) {
		this.bor_file_size = bor_file_size;
	}
	public void setBor_num(String bor_num) {
		this.bor_num = bor_num;
	}
	
	
}
