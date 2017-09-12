package org.securecoding.swcontest.login.controller;

public class loginJson {

	private String loginId;		
	private String loginState;	
	private String loginResult;

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getLoginState() {
		return loginState;
	}

	public void setLoginState(String loginState) {
		this.loginState = loginState;
	}

	public String getLoginResult() {
		return loginResult;
	}

	public void setLoginResult(String loginResult) {
		this.loginResult = loginResult;
	}

	@Override
	public String toString() {
		return "loginJson [loginId=" + loginId + ", loginState=" + loginState
				+ ", loginResult=" + loginResult + "]";
	}

}
