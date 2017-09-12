package org.securecoding.swcontest.video.lecture.vo;

public class VideoVo {
	private String vio_num;
	private String vio_name;
	private String vio_path;
	private String tol_vio_time;
	private String vio_size;
	private String tea_id;
	private String vio_poster_path;
	private String lec_num;
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
	public String getLec_num() {
		return lec_num;
	}
	public void setLec_num(String lec_num) {
		this.lec_num = lec_num;
	}
	public String getVio_num() {
		return vio_num;
	}
	public void setVio_num(String vio_num) {
		this.vio_num = vio_num;
	}
	public String getVio_name() {
		return vio_name;
	}
	public void setVio_name(String vio_name) {
		this.vio_name = vio_name;
	}
	public String getVio_path() {
		return vio_path;
	}
	public void setVio_path(String vio_path) {
		this.vio_path = vio_path;
	}
	public String getTol_vio_time() {
		return tol_vio_time;
	}
	public void setTol_vio_time(String tol_vio_time) {
		this.tol_vio_time = tol_vio_time;
	}
	public String getVio_size() {
		return vio_size;
	}
	public void setVio_size(String vio_size) {
		this.vio_size = vio_size;
	}
	public String getTea_id() {
		return tea_id;
	}
	public void setTea_id(String tea_id) {
		this.tea_id = tea_id;
	}
	public String getVio_poster_path() {
		return vio_poster_path;
	}
	public void setVio_poster_path(String vio_poster_path) {
		this.vio_poster_path = vio_poster_path;
	}
	@Override
	public String toString() {
		return "VideoVo [vio_num=" + vio_num + ", vio_name=" + vio_name
				+ ", vio_path=" + vio_path + ", tol_vio_time=" + tol_vio_time
				+ ", vio_size=" + vio_size + ", tea_id=" + tea_id
				+ ", vio_poster_path=" + vio_poster_path + "]";
	}
	
}
