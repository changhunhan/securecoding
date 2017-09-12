<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	
	
</head>
<body>
<div class="modal" id="myModal" aria-hidden="true" style="display: none; z-index: 1050;">
	<div class="modal-dialog">
		<div class="modal-content modal-popup">
			<div class="login-box">
			<div class="login-logo">
			<a href="index.jsp">
			<b>DO</b>TV</a>
			</div>
			<p id="checkMsg"></p>
			<div class="login-box-body">
			<form method="post" name="form1">
			<div class="form-group has-feedback">
			<input type="text" class="form-control" placeholder="ID" name="login_id" id="login_id" >
			</div>
			<div class="form-group has-feedback">
			<input type="password" class="form-control" placeholder="PASSWORD" name="login_pass" id="login_pass">
			</div>
			<div class="row">
			<div class="col-xs-8">

			<label>
			  <input type="checkbox" class="minimal">
			  아이디 기억하기
			</label>
			
			</div>
			<div class="col-xs-4">
			<input type="button" class="btn btn-primary btn-block btn-flat" value="로그인" id="loginBtn">
			</div>
			</div>
			</form>
			
			<div class="social-auth-links text-center">
			<p>- OR -</p>
			</div>
			<div style="text-align: center;">
			<a href="#" data-toggle="modal" data-target="#signUpModal" id="searchModalClick"  class="text-center">아이디 | 비밀번호 찾기</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" data-toggle="modal" data-target="#signUpModal" id="joinModalClick" class="text-center">회원가입</a>
			</div>
			</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>