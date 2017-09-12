package org.securecoding.swcontest.member.controller;

public class JsonResponse {
    private String status; 
	private String mem_id;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	@Override
	public String toString() {
		return "JsonResponse [status=" + status + ", mem_id=" + mem_id + "]";
	}
	
	
	
}
