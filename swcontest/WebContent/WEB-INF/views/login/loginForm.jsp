<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="plugins/iCheck/square/blue.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
</head>

<body class="hold-transition login-page">
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
<div class="checkbox icheck" > 
<label>
ID기억
</label>
</div>
<div style="background: pink;">
<input type="checkbox" id="idSaveCheck" />
</div>
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
<a href="#" data-toggle="modal" data-target="#signUpModal" id="idpwFClick"  class="text-center">아이디 | 비밀번호 찾기</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="#" data-toggle="modal" data-target="#signUpModal" id="joinAClick" class="text-center">회원가입</a>
</div>
</div>
</div>

<script src="plugins/jQuery/jQuery-2.2.0.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="plugins/iCheck/icheck.min.js"></script>

<script type="text/javascript">
	$(function(){
// 		쿠키설정
		var userInputId = getCookie("userInputId");
		$("input[name='login_id']").val(userInputId);
		
		if($("input[name='login_id']").val() != ""){
			$("#idSaveCheck").attr("checked", true);
		}
		$("#idSaveCheck").change(function(){
			if($("#idSaveCheck").is(":checked")){
				var userInputId = $("input[name='login_id']").val();
				setCookie("userInputId", userInputId, 7);
			}else{
				deleteCookie("userInputId");
			}
		});
		
		// ID 저장하기를 체크한 상태에서 ID를 입혁하는 경우도 쿠키를 저장
		$("input[name='login_id']").keyup(function(){
			if($("#idSaveCheck").is(":checked")){
				var userInputId = $("input[name='login_id']").val();
				setCookie("userInputId", userInputId, 7);
			}
		});		
	});
	function setCookie(cookieName, value, exdays){
		var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	
	
	$(function(){
		$("#loginBtn").click(function(){
			var form = document.form1;
			if(form.login_id.value == ""){
				alert("아이디를 입력해랏!");
				$("#checkMsg").text("dfsfsfdsdf");
				form.login_id.focus();
				return false;
			}
			else if (form.login_pass.value == "") {
				alert("패스워드를 입력 해야 합니다!");
				$("#checkMsg").text("dfsfsfdsdf2222");
				form.login_pass.focus();//포커스를 Password박스로 이동.
				return false;
			}
			else {
				alert("로그인 컨트롤러로 이동");
				
				$.ajax({
					url : "${pageContext.request.contextPath}/returnMainPage",
					type : "POST",
					data : {
						"login_id" : $("#login_id").val(),
						"login_pass" : $("#login_pass").val()
					},
					success : function(res) {
						if (res.loginResult == "NO") {
							$("#checkMsg").text("로그인실패");
							return;
						} else {
							$("#checkMsg").text("로그인성공");
							window.location = "${pageContext.request.contextPath}/main/main";
						}
					}
				})
				return true;
			}
		})
	})
</script>
</body>
</html>