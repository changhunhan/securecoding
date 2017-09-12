package org.securecoding.swcontest.vo;

public class AnswerBoardFileVo {
	private String ans_bor_file_num;
	private String ans_bor_file_name;
	private String ans_bor_file_path;
	private long ans_bor_file_size;
	private String ans_bor_num;

	public String getAns_bor_file_num() {
		return ans_bor_file_num;
	}

	public void setAns_bor_file_num(String ans_bor_file_num) {
		this.ans_bor_file_num = ans_bor_file_num;
	}

	public String getAns_bor_file_name() {
		return ans_bor_file_name;
	}

	public void setAns_bor_file_name(String ans_bor_file_name) {
		this.ans_bor_file_name = ans_bor_file_name;
	}

	public String getAns_bor_file_path() {
		return ans_bor_file_path;
	}

	public void setAns_bor_file_path(String ans_bor_file_path) {
		this.ans_bor_file_path = ans_bor_file_path;
	}

	public long getAns_bor_file_size() {
		return ans_bor_file_size;
	}

	public void setAns_bor_file_size(long ans_bor_file_size) {
		this.ans_bor_file_size = ans_bor_file_size;
	}

	public String getAns_bor_num() {
		return ans_bor_num;
	}

	public void setAns_bor_num(String ans_bor_num) {
		this.ans_bor_num = ans_bor_num;
	}

	@Override
	public String toString() {
		return "AnswerBoardFileVo [ans_bor_file_num=" + ans_bor_file_num
				+ ", ans_bor_file_name=" + ans_bor_file_name
				+ ", ans_bor_file_path=" + ans_bor_file_path
				+ ", ans_bor_file_size=" + ans_bor_file_size + ", ans_bor_num="
				+ ans_bor_num + "]";
	}

}
