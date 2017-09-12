package org.securecoding.swcontest.vo;

public class NoteVo {
	private String note_num;
	private String note_cont;
	private String note_send_date;
	private String note_send_pers;
	private String note_rece_pers;
	private String note_check;
	
	
	
	public String getNote_check() {
		return note_check;
	}
	public void setNote_check(String note_check) {
		this.note_check = note_check;
	}
	public String getNote_num() {
		return note_num;
	}
	public void setNote_num(String note_num) {
		this.note_num = note_num;
	}
	public String getNote_cont() {
		return note_cont;
	}
	public void setNote_cont(String note_cont) {
		this.note_cont = note_cont;
	}
	public String getNote_send_date() {
		return note_send_date;
	}
	public void setNote_send_date(String note_send_date) {
		this.note_send_date = note_send_date;
	}
	public String getNote_send_pers() {
		return note_send_pers;
	}
	public void setNote_send_pers(String note_send_pers) {
		this.note_send_pers = note_send_pers;
	}
	public String getNote_rece_pers() {
		return note_rece_pers;
	}
	public void setNote_rece_pers(String note_rece_pers) {
		this.note_rece_pers = note_rece_pers;
	}
	
	@Override
	public String toString() {
		return "NoteVo [note_num=" + note_num + ", note_cont=" + note_cont
				+ ", note_send_date=" + note_send_date + ", note_send_pers="
				+ note_send_pers + ", note_rece_pers=" + note_rece_pers + "]";
	}
	
	
}
