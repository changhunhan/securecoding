package org.securecoding.swcontest.member.controller;




import org.securecoding.swcontest.vo.FindIdPwVo;

import org.apache.commons.mail.SimpleEmail;
import org.springframework.web.bind.annotation.RequestMapping;

public class SendNewIdToEmail {
	// 일반 텍스트 메일을 보내는 메소드
@RequestMapping(value="/findId")
	public void sendMail(FindIdPwVo vo) {
		// 일반 텍스트 메일을 보낼 수 있는 객체 생성

		SimpleEmail mail = new SimpleEmail();
	
		// 메일 보내는 서버설정
		mail.setHostName("smtp.gmail.com");
		mail.setSmtpPort(587);
		mail.setAuthentication("swcontest2017@gmail.com", "^secure^"); /*관리자 이메일 보내기*/
		try {
			// 보안 메일 설정
			mail.setSSL(true);
			mail.setTLS(true);
			// 메일 본문의 인코딩 설정
			mail.setCharset("utf-8");
			// 받는 사람 설정
			mail.addTo(vo.getMem_email(), vo.getMem_name(), "utf-8");

			// 보내는 사람 설정
			mail.setFrom("swcontest2017@gmail.com", "관리자", "utf-8");
			// 제목설정
			mail.setSubject("SWCONTEST 아이디입니다");
			// 내용 설정
	
			mail.setMsg(vo.getMem_id());
		
			mail.send();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
