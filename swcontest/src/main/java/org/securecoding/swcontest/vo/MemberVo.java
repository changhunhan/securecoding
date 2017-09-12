package org.securecoding.swcontest.vo;

import org.springframework.web.multipart.MultipartFile;

public class MemberVo {
	private String mem_id;
	private String mem_name;
	private String mem_bir;
	private String mem_pass;
	private String mem_tel;
	private String mem_add1;
	private String mem_add2;
	private String mem_email;
	private String mem_reg_num1;
	private String mem_cla_code;
	private String mem_cla_cfy;
	private String mem_reg_num2;
	private String mem_zip;
	private String mem_img_rename;
	private MultipartFile memberImage;
	
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
	public String getMem_bir() {
		return mem_bir;
	}
	public void setMem_bir(String mem_bir) {
		this.mem_bir = mem_bir;
	}
	public String getMem_pass() {
		return mem_pass;
	}
	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
		
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_add1() {
		return mem_add1;
	}
	public void setMem_add1(String mem_add1) {
		this.mem_add1 = mem_add1;
	}
	public String getMem_add2() {
		return mem_add2;
	}
	public void setMem_add2(String mem_add2) {
		this.mem_add2 = mem_add2;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_reg_num1() {
		return mem_reg_num1;
	}
	public void setMem_reg_num1(String mem_reg_num1) {
		this.mem_reg_num1 = mem_reg_num1;
	}
	public String getMem_cla_code() {
		return mem_cla_code;
	}
	public void setMem_cla_code(String mem_cla_code) {
		this.mem_cla_code = mem_cla_code;
	}
	public String getMem_cla_cfy() {
		return mem_cla_cfy;
	}
	public void setMem_cla_cfy(String mem_cla_cfy) {
		this.mem_cla_cfy = mem_cla_cfy;
	}
	public String getMem_reg_num2() {
		return mem_reg_num2;
	}
	public void setMem_reg_num2(String mem_reg_num2) {
		this.mem_reg_num2 = mem_reg_num2;
	}
	public String getMem_zip() {
		return mem_zip;
	}
	public void setMem_zip(String mem_zip) {
		this.mem_zip = mem_zip;
	}
	public String getMem_img_rename() {
		return mem_img_rename;
	}
	public void setMem_img_rename(String mem_img_rename) {
		this.mem_img_rename = mem_img_rename;
	}
	public MultipartFile getMemberImage() {
		return memberImage;
	}
	public void setMemberImage(MultipartFile memberImage) {
		this.memberImage = memberImage;
	}
	@Override
	public String toString() {
		return "MemberVo [mem_id=" + mem_id + ", mem_name=" + mem_name
				+ ", mem_bir=" + mem_bir + ", mem_pass=" + mem_pass
				+ ", mem_tel=" + mem_tel + ", mem_add1=" + mem_add1
				+ ", mem_add2=" + mem_add2 + ", mem_email=" + mem_email
				+ ", mem_reg_num1=" + mem_reg_num1 + ", mem_cla_code="
				+ mem_cla_code + ", mem_cla_cfy=" + mem_cla_cfy
				+ ", mem_reg_num2=" + mem_reg_num2 + ", mem_zip=" + mem_zip
				+ ", mem_img_rename=" + mem_img_rename + ", memberImage="
				+ memberImage + "]";
	}
	
	

}
