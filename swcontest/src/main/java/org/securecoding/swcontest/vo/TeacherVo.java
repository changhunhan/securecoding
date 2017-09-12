package org.securecoding.swcontest.vo;

import org.springframework.web.multipart.MultipartFile;

public class TeacherVo {

	private String tea_id;
	private String tea_name;
	private String tea_pass;
	private String tea_tel;
	private String tea_prof;
	private String tea_email;
	private String proce_cfy_code;
	private String proce_name;
	private String tea_bir;
	private String tea_add1;
	private String tea_add2;
	private String tea_reg_num1;
	private String tea_reg_num2;
	private String tea_cont;
	private String tea_img;
	private String tea_intro_img;
	private MultipartFile teacherImage;
	private String Mem_img_rename;
	private String tea_zip;

	
	public String getTea_zip() {
		return tea_zip;
	}

	public void setTea_zip(String tea_zip) {
		this.tea_zip = tea_zip;
	}

	public String getMem_img_rename() {
		return Mem_img_rename;
	}

	public void setMem_img_rename(String mem_img_rename) {
		Mem_img_rename = mem_img_rename;
	}

	public String getTea_intro_img() {
		return tea_intro_img;
	}

	public void setTea_intro_img(String tea_intro_img) {
		this.tea_intro_img = tea_intro_img;
	}

	public MultipartFile getTeacherImage() {
		return teacherImage;
	}

	public void setTeacherImage(MultipartFile teacherImage) {
		this.teacherImage = teacherImage;
	}

	public String getTea_cont() {
		return tea_cont;
	}

	public void setTea_cont(String tea_cont) {
		this.tea_cont = tea_cont;
	}

	public String getTea_img() {
		return tea_img;
	}

	public void setTea_img(String tea_img) {
		this.tea_img = tea_img;
	}

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

	public String getTea_pass() {
		return tea_pass;
	}

	public void setTea_pass(String tea_pass) {
		this.tea_pass = tea_pass;
	}

	public String getTea_tel() {
		return tea_tel;
	}

	public void setTea_tel(String tea_tel) {
		this.tea_tel = tea_tel;
	}

	public String getTea_prof() {
		return tea_prof;
	}

	public void setTea_prof(String tea_prof) {
		this.tea_prof = tea_prof;
	}

	public String getTea_email() {
		return tea_email;
	}

	public void setTea_email(String tea_email) {
		this.tea_email = tea_email;
	}

	public String getProce_cfy_code() {
		return proce_cfy_code;
	}

	public void setProce_cfy_code(String proce_cfy_code) {
		this.proce_cfy_code = proce_cfy_code;
	}

	public String getProce_name() {
		return proce_name;
	}

	public void setProce_name(String proce_name) {
		this.proce_name = proce_name;
	}

	public String getTea_bir() {
		return tea_bir;
	}

	public void setTea_bir(String tea_bir) {
		this.tea_bir = tea_bir;
	}

	public String getTea_add1() {
		return tea_add1;
	}

	public void setTea_add1(String tea_add1) {
		this.tea_add1 = tea_add1;
	}

	public String getTea_add2() {
		return tea_add2;
	}

	public void setTea_add2(String tea_add2) {
		this.tea_add2 = tea_add2;
	}

	public String getTea_reg_num1() {
		return tea_reg_num1;
	}

	public void setTea_reg_num1(String tea_reg_num1) {
		this.tea_reg_num1 = tea_reg_num1;
	}

	public String getTea_reg_num2() {
		return tea_reg_num2;
	}

	public void setTea_reg_num2(String tea_reg_num2) {
		this.tea_reg_num2 = tea_reg_num2;
	}

	@Override
	public String toString() {
		return "TeacherVo [tea_id=" + tea_id + ", tea_name=" + tea_name + ", tea_pass=" + tea_pass + ", tea_tel="
				+ tea_tel + ", tea_prof=" + tea_prof + ", tea_email=" + tea_email + ", proce_cfy_code=" + proce_cfy_code
				+ ", proce_name=" + proce_name + ", tea_bir=" + tea_bir + ", tea_add1=" + tea_add1 + ", tea_add2="
				+ tea_add2 + ", tea_reg_num1=" + tea_reg_num1 + ", tea_reg_num2=" + tea_reg_num2 + ", tea_cont="
				+ tea_cont + ", tea_img=" + tea_img + ", tea_intro_img=" + tea_intro_img + ", teacherImage="
				+ teacherImage + "]";
	}

}
