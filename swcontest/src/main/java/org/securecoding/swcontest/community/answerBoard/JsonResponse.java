package org.securecoding.swcontest.community.answerBoard;

public class JsonResponse {
	
	private String res_mem_id;
	private String res_comm_title;
	private String res_comm_date;
	private String currentNum;
	
	public String getCurrentNum() {
		return currentNum;
	}
	public void setCurrentNum(String currentNum) {
		this.currentNum = currentNum;
	}
	public String getRes_mem_id() {
		return res_mem_id;
	}
	public void setRes_mem_id(String res_mem_id) {
		this.res_mem_id = res_mem_id;
	}
	public String getRes_comm_title() {
		return res_comm_title;
	}
	public void setRes_comm_title(String res_comm_title) {
		this.res_comm_title = res_comm_title;
	}
	public String getRes_comm_date() {
		return res_comm_date;
	}
	public void setRes_comm_date(String res_comm_date) {
		this.res_comm_date = res_comm_date;
	}

	
}
