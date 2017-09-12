package org.securecoding.swcontest.member.controller;

import java.util.Random;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

public class Email {

	
	@RequestMapping(value="/findEmail")
	public String sendMail(@RequestParam("email")String Temail,Model model) {
		Random rnd =new Random();
		StringBuffer bufer =new StringBuffer();
		for(int i=0;i<8;i++){
		    if(rnd.nextBoolean()){
		     bufer.append((char)((int)(rnd.nextInt(26))+97));
		    }else{
		        bufer.append((rnd.nextInt(10))); 
		        
		    }
		}
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
			mail.addTo(Temail ,"utf-8");
			// 보내는 사람 설정
			mail.setFrom("swcontest2017@gmail.com", "관리자", "utf-8");
			// 제목설정
			mail.setSubject("인증코드 입니다");
			// 내용 설정
			  Temail=bufer.toString();
			mail.setMsg(Temail);
			// 메일 보내기
			mail.send();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return Temail;
	}
	
	public static void main(String args[]) throws Exception {   
		SimpleEmail email = new SimpleEmail();
	    email.setCharset("utf-8");   
	    email.setHostName("smtp.gmail.com");  
	    email.addTo("swcontest2017@gmail.com"); 
	    email.setFrom("swcontest2017@gmail.com", "관리자", "utf-8"); 
	    email.setSubject("텍스트 테스트 메일입니다."); 
	    email.setContent("테스트 메일의 내용입니다.", "text/plain; charset=utf-8");
	    email.send();

	}
	
	
}
