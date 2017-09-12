<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<style type="text/css">
 	#idSaveCheck {
 	    display: inline-block; 
 	    vertical-align: middle; 
 	    margin: 0; 
 	    padding: 0;
 	    width: 18px; 
 	    height: 18px;
 	    background: url(plugins/iCheck/minimal/blue.png) no-repeat;
 	    border: none;
 	    cursor: pointer; 
 	}
</style>
</head>
<body>
<div class="modal-dialog">
	<div class="modal-content modal-popup">
		<div class="login-box">
			<div class="login-logo"><a href="index.jsp"><b>DO</b>TV</a></div>
			<p id="checkMsg" style="font-size: 13px; color: #ef6500;">&nbsp;</p>
			<div class="login-box-body">
				<form method="post" name="form1">
					<div class="form-group has-feedback">
						<input type="text" class="form-control" placeholder="ID" name="login_id" id="login_id" >
					</div>
					<div class="form-group has-feedback">
						<input type="password" class="form-control" placeholder="PASSWORD" name="login_pass" id="login_pass">
					</div>
					<div class="form-group has-feedback">
						<input type="button" class="btn btn-primary btn-block btn-flat" value="로그인" id="loginBtn">
					</div>
					<div class="row">
						<div class="col-xs-5" style="text-align: left; font-size: 12px;">
							<label style="font-weight: lighter;">
							<input type="checkbox" style="padding-bottom: 22px;" id="idSaveCheck">
							&nbsp;&nbsp;&nbsp;아이디 기억하기</label>
						</div>
						<div class="col-xs-7">
							<div style="text-align: center; font-size: 12px;">
								<a href="#" data-toggle="modal" data-target="#loginModal" id="idpwFClick" class="text-center">아이디 | 비밀번호 찾기 | </a>
								<a href="#" data-toggle="modal" id="joinAClick" class="text-center" style="font-weight: bold;">회원가입</a>
<!-- 								<a href="#" data-toggle="modal" data-target="#idpwFModal" id="searchModalClick"  class="text-center">아이디 | 비밀번호 찾기 | </a> -->
<!-- 								<a href="#" data-toggle="modal" data-target="#joinAModal" id="joinModalClick" class="text-center" style="font-weight: bold;">회원가입</a> -->
							</div>
						</div>
					</div>
				</form>
				<div class="social-auth-links text-center">
<!-- 				<p style="font-size: 13px;">- OR -</p> -->
				</div>
			</div>
		</div>
	</div>
</div>


</body>
</html>