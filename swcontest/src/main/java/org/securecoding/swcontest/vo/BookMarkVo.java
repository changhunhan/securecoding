package org.securecoding.swcontest.vo;

public class BookMarkVo {
	private String bkmark_num;
	private String bkmark_title;
	private String bkmark_time;
	private String bkmark_cont;
	private String lec_num;
	
	
	public String getBkmark_num() {
		return bkmark_num;
	}
	public void setBkmark_num(String bkmark_num) {
		this.bkmark_num = bkmark_num;
	}
	public String getBkmark_title() {
		return bkmark_title;
	}
	public void setBkmark_title(String bkmark_title) {
		this.bkmark_title = bkmark_title;
	}
	public String getBkmark_time() {
		return bkmark_time;
	}
	public void setBkmark_time(String bkmark_time) {
		this.bkmark_time = bkmark_time;
	}
	public String getBkmark_cont() {
		return bkmark_cont;
	}
	public void setBkmark_cont(String bkmark_cont) {
		this.bkmark_cont = bkmark_cont;
	}
	public String getLec_num() {
		return lec_num;
	}
	public void setLec_num(String lec_num) {
		this.lec_num = lec_num;
	}
	@Override
	public String toString() {
		return "BookMarkVo [bkmark_num=" + bkmark_num + ", bkmark_title="
				+ bkmark_title + ", bkmark_time=" + bkmark_time
				+ ", bkmark_cont=" + bkmark_cont + ", lec_num=" + lec_num + "]";
	}
	
}
