package org.securecoding.swcontest.video.lecture.vo;

public class CurriculumVo {
	private String lec_num;
	private String cur_num;
	private String cur_title;
	private String proce_cfy_code;
	private String proce_name;
	private String cur_poss;
	private String tea_id;
	
	public String getLec_num() {
		return lec_num;
	}
	public void setLec_num(String lec_num) {
		this.lec_num = lec_num;
	}
	public String getCur_num() {
		return cur_num;
	}
	public void setCur_num(String cur_num) {
		this.cur_num = cur_num;
	}
	public String getCur_title() {
		return cur_title;
	}
	public void setCur_title(String cur_title) {
		this.cur_title = cur_title;
	}
	public String getProce_name() {
		return proce_name;
	}
	public void setProce_name(String proce_name) {
		this.proce_name = proce_name;
	}
	public String getCur_poss() {
		return cur_poss;
	}
	public void setCur_poss(String cur_poss) {
		this.cur_poss = cur_poss;
	}
	public String getProce_cfy_code() {
		return proce_cfy_code;
	}
	public void setProce_cfy_code(String proce_cfy_code) {
		this.proce_cfy_code = proce_cfy_code;
	}
	public String getTea_id() {
		return tea_id;
	}
	public void setTea_id(String tea_id) {
		this.tea_id = tea_id;
	}
	@Override
	public String toString() {
		return "CurriculumVo [cur_num=" + cur_num + ", cur_title=" + cur_title
				+ ", proce_cfy_code=" + proce_cfy_code + ", proce_name="
				+ proce_name + ", cur_poss=" + cur_poss + ", tea_id=" + tea_id
				+ "]";
	}
	
	
}
