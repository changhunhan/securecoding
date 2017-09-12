package org.securecoding.swcontest.vo;

public class BorcommVo {
	private String comm_num;
	private String comm_title;
	private String comm_wri_pers;
	private String comm_date;
	private String bor_num;
	private String comm_gnum;
	private String comm_onum;
	private String comm_nested;
	private String comm_img;
	
	
	public String getComm_img() {
		return comm_img;
	}

	public void setComm_img(String comm_img) {
		this.comm_img = comm_img;
	}

	public String getComm_num() {
		return comm_num;
	}

	public void setComm_num(String comm_num) {
		this.comm_num = comm_num;
	}

	public String getComm_title() {
		return comm_title;
	}

	public void setComm_title(String comm_title) {
		this.comm_title = comm_title;
	}

	public String getComm_wri_pers() {
		return comm_wri_pers;
	}

	public void setComm_wri_pers(String comm_wri_pers) {
		this.comm_wri_pers = comm_wri_pers;
	}

	public String getComm_date() {
		return comm_date;
	}

	public void setComm_date(String comm_date) {
		this.comm_date = comm_date;
	}

	public String getBor_num() {
		return bor_num;
	}

	public void setBor_num(String bor_num) {
		this.bor_num = bor_num;
	}

	public String getComm_gnum() {
		return comm_gnum;
	}

	public void setComm_gnum(String comm_gnum) {
		this.comm_gnum = comm_gnum;
	}

	public String getComm_onum() {
		return comm_onum;
	}

	public void setComm_onum(String comm_onum) {
		this.comm_onum = comm_onum;
	}

	public String getComm_nested() {
		return comm_nested;
	}

	public void setComm_nested(String comm_nested) {
		this.comm_nested = comm_nested;
	}

	@Override
	public String toString() {
		return "BorcommVo [comm_num=" + comm_num + ", comm_title=" + comm_title + ", comm_wri_pers=" + comm_wri_pers
				+ ", comm_date=" + comm_date + ", bor_num=" + bor_num + ", comm_gnum=" + comm_gnum + ", comm_onum="
				+ comm_onum + ", comm_nested=" + comm_nested + "]";
	}

}
