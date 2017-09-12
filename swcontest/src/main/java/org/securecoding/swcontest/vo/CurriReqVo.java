package org.securecoding.swcontest.vo;

public class CurriReqVo {
	private String cur_req_num;
	private String cur_req_date;
	private String cur_num;
	private String cur_achie_rate;
	private String cur_sft;
	private String mem_id;
	private String mem_name;
	private String cur_title;
	private String lec_wat_num;
	
		
	public String getLec_wat_num() {
		return lec_wat_num;
	}
	public void setLec_wat_num(String lec_wat_num) {
		this.lec_wat_num = lec_wat_num;
	}
	public String getCur_title() {
		return cur_title;
	}
	public void setCur_title(String cur_title) {
		this.cur_title = cur_title;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getCur_req_num() {
		return cur_req_num;
	}
	public void setCur_req_num(String cur_req_num) {
		this.cur_req_num = cur_req_num;
	}
	public String getCur_req_date() {
		return cur_req_date;
	}
	public void setCur_req_date(String cur_req_date) {
		this.cur_req_date = cur_req_date;
	}
	public String getCur_num() {
		return cur_num;
	}
	public void setCur_num(String cur_num) {
		this.cur_num = cur_num;
	}
	public String getCur_achie_rate() {
		return cur_achie_rate;
	}
	public void setCur_achie_rate(String cur_achie_rate) {
		this.cur_achie_rate = cur_achie_rate;
	}
	public String getCur_sft() {
		return cur_sft;
	}
	public void setCur_sft(String cur_sft) {
		this.cur_sft = cur_sft;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	@Override
	public String toString() {
		return "CurriReqVo [cur_req_num=" + cur_req_num + ", cur_req_date="
				+ cur_req_date + ", cur_num=" + cur_num + ", cur_achie_rate="
				+ cur_achie_rate + ", cur_sft=" + cur_sft + ", mem_id="
				+ mem_id + ", mem_name=" + mem_name + ", cur_title="
				+ cur_title + ", lec_wat_num=" + lec_wat_num + "]";
	}
	
	
	
}
