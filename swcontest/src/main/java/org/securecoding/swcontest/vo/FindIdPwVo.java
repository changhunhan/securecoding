package org.securecoding.swcontest.vo;

public class FindIdPwVo {
	private String mem_id;
	private String mem_name;
	private String mem_email;
	private String mem_pass;
	private String tea_id;
	private String tea_name;
	private String tea_email;
	private String tea_pass;


	public String getTea_id() {
		return tea_id;
	}

	public void setTea_id(String tea_id) {
		this.tea_id = tea_id;
	}

	public String getTea_name() {
		return tea_name;
	}

	public void setTea_name(String tea_name) {
		this.tea_name = tea_name;
	}

	public String getTea_email() {
		return tea_email;
	}

	public void setTea_email(String tea_email) {
		this.tea_email = tea_email;
	}

	public String getTea_pass() {
		return tea_pass;
	}

	public void setTea_pass(String tea_pass) {
		this.tea_pass = tea_pass;
	}

	public String getMem_pass() {
		return mem_pass;
	}

	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	@Override
	public String toString() {
		return "FindIdPwVo [mem_id=" + mem_id + ", mem_name=" + mem_name
				+ ", mem_email=" + mem_email + ", mem_pass=" + mem_pass
				+ ", tea_id=" + tea_id + ", tea_name=" + tea_name
				+ ", tea_email=" + tea_email + ", tea_pass=" + tea_pass + "]";
	}

	

}
