package org.securecoding.swcontest.vo;

/**
 * @author J-zac
 *
 */
public class LecWatVo {
	private String lec_wat_num;
	private String lec_play_date;
	private String lec_play_time;
	private String lec_num;
	private String mem_id;
	private String lec_wat_memo;
	private String lec_wat_time;
	private String lec_achieve;
	private String cur_num;
	private String lec_title;
	private String tea_name;
	
	public String getLec_title() {
		return lec_title;
	}
	public void setLec_title(String lec_title) {
		this.lec_title = lec_title;
	}
	public String getTea_name() {
		return tea_name;
	}
	public void setTea_name(String tea_name) {
		this.tea_name = tea_name;
	}
	public String getLec_achieve() {
		return lec_achieve;
	}
	public void setLec_achieve(String lec_achieve) {
		this.lec_achieve = lec_achieve;
	}
	public String getCur_num() {
		return cur_num;
	}
	public void setCur_num(String cur_num) {
		this.cur_num = cur_num;
	}
	public String getLec_wat_time() {
		return lec_wat_time;
	}
	public void setLec_wat_time(String lec_wat_time) {
		this.lec_wat_time = lec_wat_time;
	}
	public String getLec_wat_num() {
		return lec_wat_num;
	}
	public void setLec_wat_num(String lec_wat_num) {
		this.lec_wat_num = lec_wat_num;
	}
	public String getLec_play_date() {
		return lec_play_date;
	}
	public void setLec_play_date(String lec_play_date) {
		this.lec_play_date = lec_play_date;
	}
	public String getLec_play_time() {
		return lec_play_time;
	}
	public void setLec_play_time(String lec_play_time) {
		this.lec_play_time = lec_play_time;
	}
	public String getLec_num() {
		return lec_num;
	}
	public void setLec_num(String lec_num) {
		this.lec_num = lec_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getLec_wat_memo() {
		return lec_wat_memo;
	}
	public void setLec_wat_memo(String lec_wat_memo) {
		this.lec_wat_memo = lec_wat_memo;
	}
	@Override
	public String toString() {
		return "LecWatVo [lec_wat_num=" + lec_wat_num + ", lec_play_date=" + lec_play_date + ", lec_play_time="
				+ lec_play_time + ", lec_num=" + lec_num + ", mem_id=" + mem_id + ", lec_wat_memo=" + lec_wat_memo
				+ ", lec_wat_time=" + lec_wat_time + ", cur_num=" + cur_num + "]";
	}
	
}
