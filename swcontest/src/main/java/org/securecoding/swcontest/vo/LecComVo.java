package org.securecoding.swcontest.vo;

public class LecComVo {
	public String lec_comm_num;
	public String lec_comm_wri_pers;
	public String lec_comm_date;
	public String lec_num;
	public String lec_comm_cont;
	public String comm_img;
	
	public String getComm_img() {
		return comm_img;
	}
	public void setComm_img(String comm_img) {
		this.comm_img = comm_img;
	}
	public String getLec_comm_num() {
		return lec_comm_num;
	}
	public void setLec_comm_num(String lec_comm_num) {
		this.lec_comm_num = lec_comm_num;
	}
	public String getLec_comm_wri_pers() {
		return lec_comm_wri_pers;
	}
	public void setLec_comm_wri_pers(String lec_comm_wri_pers) {
		this.lec_comm_wri_pers = lec_comm_wri_pers;
	}
	public String getLec_comm_date() {
		return lec_comm_date;
	}
	public void setLec_comm_date(String lec_comm_date) {
		this.lec_comm_date = lec_comm_date;
	}
	public String getLec_num() {
		return lec_num;
	}
	public void setLec_num(String lec_num) {
		this.lec_num = lec_num;
	}
	public String getLec_comm_cont() {
		return lec_comm_cont;
	}
	public void setLec_comm_cont(String lec_comm_cont) {
		this.lec_comm_cont = lec_comm_cont;
	}
	@Override
	public String toString() {
		return "LecComVo [lec_comm_num=" + lec_comm_num
				+ ", lec_comm_wri_pers=" + lec_comm_wri_pers
				+ ", lec_comm_date=" + lec_comm_date + ", lec_num=" + lec_num
				+ ", lec_comm_cont=" + lec_comm_cont + "]";
	}
}
