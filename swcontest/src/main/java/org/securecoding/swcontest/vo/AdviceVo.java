package org.securecoding.swcontest.vo;

public class AdviceVo {

	private String adv_tea_id;
	private String title;
	private String start;
	private String end;
	private String id;
	private String adv_enroll;
	private String adv_divi;
	private String adv_mem_id;
	private String adv_state;
	private String adv_key;
	private String tea_name;
	private String mem_name;
	
	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getTea_name() {
		return tea_name;
	}

	public void setTea_name(String tea_name) {
		this.tea_name = tea_name;
	}

	public String getAdv_key() {
		return adv_key;
	}

	public void setAdv_key(String adv_key) {
		this.adv_key = adv_key;
	}

	public String getAdv_tea_id() {
		return adv_tea_id;
	}

	public void setAdv_tea_id(String adv_tea_id) {
		this.adv_tea_id = adv_tea_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAdv_enroll() {
		return adv_enroll;
	}

	public void setAdv_enroll(String adv_enroll) {
		this.adv_enroll = adv_enroll;
	}

	public String getAdv_divi() {
		return adv_divi;
	}

	public void setAdv_divi(String adv_divi) {
		this.adv_divi = adv_divi;
	}

	public String getAdv_mem_id() {
		return adv_mem_id;
	}

	public void setAdv_mem_id(String adv_mem_id) {
		this.adv_mem_id = adv_mem_id;
	}

	public String getAdv_state() {
		return adv_state;
	}

	public void setAdv_state(String adv_state) {
		this.adv_state = adv_state;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}
	
	@Override
	public String toString() {
		return "AdviceVo [adv_tea_id=" + adv_tea_id + ", title=" + title
				+ ", start=" + start + ", end=" + end + ", id=" + id
				+ ", adv_enroll=" + adv_enroll + ", adv_divi=" + adv_divi
				+ ", adv_mem_id=" + adv_mem_id + ", adv_state=" + adv_state
				+ "]";
	}

	

}
