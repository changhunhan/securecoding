package org.securecoding.swcontest.video.lecture.vo;


import org.springframework.web.multipart.MultipartFile;

public class LectureVo {
	private String lec_num;
	private String lec_title;
	private String lec_chk_con;
	private String lec_start_bra;
	private String lec_exit_bra;
	private String lec_ret_vio; 	//최근 본 시간
	private String lec_cont;
	private String cur_num;
	private MultipartFile video;
	
	public String getLec_title() {
		return lec_title;
	}
	public void setLec_title(String lec_title) {
		this.lec_title = lec_title;
	}
	public String getLec_num() {
		return lec_num;
	}
	public void setLec_num(String lec_num) {
		this.lec_num = lec_num;
	}
	public String getLec_cont() {
		return lec_cont;
	}
	public String getLec_chk_con() {
		return lec_chk_con;
	}
	public void setLec_chk_con(String lec_chk_con) {
		this.lec_chk_con = lec_chk_con;
	}
	public String getLec_start_bra() {
		return lec_start_bra;
	}
	public void setLec_start_bra(String lec_start_bra) {
		this.lec_start_bra = lec_start_bra;
	}
	public String getLec_exit_bra() {
		return lec_exit_bra;
	}
	public void setLec_exit_bra(String lec_exit_bra) {
		this.lec_exit_bra = lec_exit_bra;
	}
	public String getLec_ret_vio() {
		return lec_ret_vio;
	}
	public void setLec_ret_vio(String lec_ret_vio) {
		this.lec_ret_vio = lec_ret_vio;
	}
	public void setLec_cont(String lec_cont) {
		this.lec_cont = lec_cont;
	}
	public String getCur_num() {
		return cur_num;
	}
	public void setCur_num(String cur_num) {
		this.cur_num = cur_num;
	}
	public MultipartFile getVideo() {
		return video;
	}
	public void setVideo(MultipartFile video) {
		this.video = video;
	}
}
