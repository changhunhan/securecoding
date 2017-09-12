package org.securecoding.swcontest.vo;

public class SessionVo {
	
	private String id;
	private String pass;
	private String code;
	private String state;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "SessionVo [id=" + id + ", pass=" + pass + ", code=" + code
				+ ", state=" + state + "]";
	}

}
