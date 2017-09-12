<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript" src="http://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>


<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Cardio is a free one page template made exclusively for Codrops by Luka Cvetinovic" />
	<meta name="keywords" content="html template, css, free, one page, gym, fitness, web design" />
	<meta name="author" content="Luka Cvetinovic for Codrops" />
	<meta name="msapplication-TileColor" content="#00a8ff">
	<meta name="msapplication-config" content="image/favicons/browserconfig.xml">
	<meta name="theme-color" content="#ffffff">
	<title>SWCONTEST INDEXPAGE</title>
	<link rel="apple-touch-icon" sizes="57x57" href="image/favicons/apple-touch-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="image/favicons/apple-touch-icon-60x60.png">
	<link rel="icon" type="image/png" href="image/favicons/favicon-32x32.png" sizes="32x32">
	<link rel="icon" type="image/png" href="image/favicons/favicon-16x16.png" sizes="16x16">
	<link rel="manifest" href="image/favicons/manifest.json">
	<link rel="shortcut icon" href="image/favicons/favicon.ico">
	<link rel="stylesheet" type="text/css" href="css/normalize.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/owl.css">
	<link rel="stylesheet" type="text/css" href="css/animate.css">
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.1.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/eleganticons/et-icons.css">
	<link rel="stylesheet" type="text/css" href="css/cardio.css">
	<link rel="stylesheet" href="plugins/iCheck/square/blue.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
<!-- 	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"> -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	<link rel="stylesheet" href="dist/css/AdminLTE.min.css">

	<!-- 시험정보 -->
	<link rel="stylesheet" href="css/index.css">
	
	<style>
	.modal-body {
		max-height: calc(100vh - 210px);
		overflow-y: auto;
	}
	</style>
	<style type="text/css">
	:after, :before {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
:after, :before {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
button, input, optgroup, select, textarea {
    margin: 0;
    font: inherit;
    color: inherit;
}
button, input, select, textarea {
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
}
.form-control {
    display: block;
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
.has-feedback .form-control {
    padding-right: 42.5px;
}

/* 버튼 */
button, input, optgroup, select, textarea {
    margin: 0;
    font: inherit;
    color: inherit;
}
button, input, select, textarea {
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
}
.btn {
    display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
}
.btn-block {
    display: block;
    width: 100%;
}
button, html input[type=button], input[type=reset], input[type=submit] {
    -webkit-appearance: button;
    cursor: pointer;
}
.btn.focus, .btn:focus, .btn:hover {
    color: #333;
    text-decoration: none;
}
.btn-primary:hover {
    color: #fff;
    background-color: #286090;
    border-color: #204d74;
}
input[type=button].btn-block, input[type=reset].btn-block, input[type=submit].btn-block {
    width: 100%;
}
	</style>
	<!-- 로그인모달 스타일 -->
<style type="text/css">
 	#idSaveCheck, #agree1, #agree2 {
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
	<style>
	.zipData:hover {
		background: skyblue;
	}
	
	#backpage {
		width: 800px;
		top: 200px;
	}
	
	.zipbutton {
		
	}
	
	.align {
		width: 400px;
		margin: auto;
	}
	
	#mem_id {
		width: 300px;
	}
	
	#mem_zip {
		width: 300px;
	}
/* 	.datepicker{ */
/* 		z-index:+1 !important; */
/* 		z-index: auto; */
/* 	} */
	#joinBtn {
		border-bottom-left-radius : 3px;
		border-top-left-radius : 3px;
	}
	#resetBtn {
		border-bottom-right-radius : 3px;
		border-top-right-radius : 3px;
	}
	</style>

	<script>
	//모달 스크립트
	$(document).ready(function() {
		
		var check;
		
		$("#joinAClick").click(function() {
			$("#joinAStart").click();
		})
// 		$("#joinFClick").click(function() {
// 			$("#joinFStart").click();
// 		})
		$("#idpwFClick").click(function() {
			$("#idpwFStart").click();
		})

		
		$('#signUpModal').on('show.bs.modal', function(e) {
			check = false;
			$("body").css("padding-right", "0px");
			$("body").css("overflow-y", "hidden");
		})
		$('#idpwFModal').on('show.bs.modal', function(e) {
			check = true;
			$("body").css("padding-right", "0px");
			$("body").css("overflow-y", "hidden");
		})
		$('#joinAModal').on('show.bs.modal', function(e) {
			check = true;
			$("body").css("padding-right", "0px");
			$("body").css("overflow-y", "hidden");
		})
		$('#joinFModal').on('show.bs.modal', function(e) {
			check = false;
			$("body").css("padding-right", "0px");
			$("body").css("overflow-y", "hidden");
		})
		$('#zipModal').on('show.bs.modal', function(e) {
			check = false;
			$("body").css("padding-right", "0px");
			$("body").css("overflow-y", "hidden");
		})
	
		$('#signUpModal').on('hidden.bs.modal', function(e) {
			if (check) {
				$("body").css("overflow-y", "hidden");
			} else {
				$("body").css("overflow-y", "auto");
			}
		})
		$('#idpwFModal').on('hidden.bs.modal', function(e) {
			$("body").css("overflow-y", "auto");
		})
		$('#joinAModal').on('hidden.bs.modal', function(e) {
			if (!check) {
				$("body").css("overflow-y", "hidden");
			} else {
				$("body").css("overflow-y", "auto");
			}
			$("#agree1").attr("checked", false);
			$("#agree2").attr("checked", false);
		})
		$('#joinFModal').on('hidden.bs.modal', function(e) {
			$("body").css("overflow-y", "auto");
			checkAutoJoin = false;
			checkDuplicate = false;
			checkCertifyAccept = false;
			checkName = "";
			checkEmail = "";
			$("#mem_id").val("");
			$("#mem_pass").val("");
			$("#mem_name").val("");
			$("#mem_email").val("");
			$("#certify").val("");
			$("#mem_tel").val("");
			$("#datepicker").val("");
			$("#mem_reg_num1").val("");
			$("#mem_reg_num2").val("");
			$("#mem_zip").val("");
			$("#mem_add1").val("");
			$("#mem_add2").val("");
			$("#recaptcha_response_field").val("");
			$('#change').text("");
			document.getElementById("message").innerHTML = "";
			$("#emailcheck").text("");
			$("#check").text("");
			
		})
		$(document).on("keypress", "#login_pass", function(e) {
			if(e.keyCode == 13) {
				$("#loginBtn").click();
			}
				
		})
// 		Date picker
		$('#datepicker').datepicker({ 
			autoclose : true,
			changeMonth : true,
			changeYear : true,
			yearRange: "1920:2015"
			
		});
			var checkAutoJoin = false;
			$(function() {
				var dialog;
				
				// 이메일인증
				$('#emailBtn').click(function() {
					var mem_email = $('#mem_email').val();
					if (mem_email == "") {
						$("#emailcheck").text("email 입력해주세요");
					} else {
						$("#emailcheck").text("email 발송되었습니다");
						$.ajax({
							url : '${pageContext.request.contextPath}/findEmail',
							type : 'POST',
							data : { 'mem_email' : mem_email },
							success : function(res) {
								$("#checkCertify").attr("value", res);
							}
						})
					};
				})
				
			})
	
			//자동가입 방지 기능
			$(function() {
				var siteKey = "6Lc4zyMTAAAAAEL2mCdiuXHfDwuY0DJeEhOFHjeZ";//Site key
				var div = "recaptcha";
				Recaptcha.create(siteKey, div, { theme : "red" });
	
				$("#recaptchaCheck").click(function() {
					checkAutoJoin = false;
					var challenge = Recaptcha.get_challenge();
					var response = Recaptcha.get_response();
					var host = $(location).attr('host');
					$.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/test/validateRecaptcha",
						async : false,
						data : {
							host : host,
							challenge : challenge,
							response : response
						},
						success : function(data) {
							if (data == "Y") {
								document.getElementById("message").innerHTML = "성공하였습니다.";
								checkAutoJoin = true;
							} else {
								document.getElementById("message").innerHTML = "실패하였습니다. 다시 입력해주세요";
								checkAutoJoin = false;
								Recaptcha.reload();
							}
						}
					});
				});
			});
			
			var checkDuplicate = false;
			var checkCertifyAccept = false;
			var checkName;
			var checkEmail;
			$("#joinBtn").click(function(event) {
				
				// 	아이디 체크
				var id = $("#mem_id").val();
				var validFlag = validate_id(id);//유효성 검사 boolean 체크
				//	유효한 id 가 아니라면..
				if (id == "") {
					alert("아이디를 입력하세요");
					$("#mem_id").focus();
					return false;
				}
				if (!validFlag) {
					alert("아이디는 5글자이상, 영문또는 숫자로 입력하세요");
					event.preventDefault();
					$("#mem_id").focus();
					return false;
				}
				
				if(checkDuplicate == false){
					alert("중복검사를 해주세요");
					$("#mem_id").focus();
					return false;
				}
				
				if(checkName != $("#mem_id").val()) {
					alert("중복검사를 받지않은 아이디입니다.");
					$("#mem_id").focus();
					return false;
				}

				//  비밀번호 체크
				var pass = $("#mem_pass").val();
				var validFlag = validate_pass(pass);
				if (pass == "") {
					alert("비밀번호를 입력하세요");
					$("#mem_pass").focus();
					return false;
				} else if (!validFlag) {
					$("#mem_pass").next().html();
					alert("비밀번호는 6~20 영문 대소문자이며, 최소 1개의 숫자 혹은 특수 문자를 포함해야 함");
					event.preventDefault();
					$("#mem_pass").focus();
					return false;
				}
				//  이름 체크
				var name = $("#mem_name").val();
// 				var validFlag = validate_name(name);
				if (name == "") {
					alert("이름을 입력하세요");
					$("#mem_name").focus();
					return false;
				}

				// 	이메일체크
				var email = $("#mem_email").val();
				var validFlag = validate_email(email);
				if (email == "") {
					alert("이메일을 입력하세요");
					$("#mem_email").focus();
					return false;
				} else if (!validFlag) {
					$("#mem_email").next().html();
					alert("올바른 email 형식이 아닙니다.");
					event.preventDefault();
					$("#mem_email").focus();
					return false;
				} else if(!checkCertifyAccept) {
					alert("이메일 인증을 해주세요");
					return false;
				} else if(checkEmail != $("#mem_email").val()) {
					alert("인증받은 이메일이 아닙니다.");
					return false;
				}
				// 	전화번호체크
				var tel = $("#mem_tel").val();
				var validFlag = validate_tel(tel);
				if (tel == "") {
					alert("전화번호를 입력하세요");
					$("#mem_tel").focus();
					return false;
				} else if (!validFlag) {
					$("#mem_tel").next().html();
					alert("잘못된 휴대폰 번호입니다. 숫자, - 를 포함한 숫자만 입력하세요.");
					event.preventDefault();
					$("#mem_tel").focus();
					return false;
				}
				// 	생년월일체크
				var bir = $("#datepicker").val()
				if (bir == "") {
					alert("생년월일을 입력하세요");
					$("#datepicker").focus();
					return false;
				}
	
		
				
				if(checkName != $("#mem_id").val()) {
					alert("중복검사를 하지 않은 아이디입니다.");
					return false;
				}
				
				if (checkAutoJoin == false) {
					alert("자동가입 방지 문자를 입력해주세요");
					return false;
				}
				alert("회원가입이 성공하였습니다.");
				return true;
			});
			
			$('#userCheck').click(function() {
				var mem_id = $('#mem_id').val();
				var validFlag = validate_id(mem_id);//유효성 검사 boolean 체크
				if (mem_id == "") {
					$("#change").text("아이디를 입력하세요");
					$("#mem_id").focus();
					return false;
				} else if(!validFlag){
					$("#change").text("아이디는 5글자이상, 영문또는 숫자로 입력하세요");
					event.preventDefault();
					$("#mem_id").focus();
					return false;
				} else {
					$.ajax({
						url : '${pageContext.request.contextPath}/duplicateCheck',
						type : 'post',
						data : { 'mem_id' : mem_id },
						success : function(res) {
							if (res.status == "OK") {
								if (!validFlag) {
									event.preventDefault();
									$('#change').text(res.mem_id + "는 사용 불가능합니다.");
									return false;
								} else {
									checkDuplicate = true;
									$('#change').text(res.mem_id + "는 사용가능 합니다."); //text 위치에 html 가능
									checkName = mem_id;
								}
							} else {
								$('#change').text("중복검사에 실패하였습니다. 다시 시도해주세요");
							}
						},
						dataType : 'json' //가져오는것
					})
				}
			})
			
			$(document).on("click", "#codeBtn", function() {
							$("#dong").val("");
							$("#tbody").empty();
							$("#zipStart").click();
						})
			$(document).on("click", "#searchDong", function() {
				var dong = $("#dong").val();
				$("#tbody").empty();
				$.ajax({
					url:"${pageContext.request.contextPath}/sInformation/searchDong",
					type: "post",
					data: {"dong":dong},
					success: function(res) {
						$.each(res, function(i,v){
							var local = document.getElementById("tbody");
						    var tr = document.createElement("tr");
						    var td1 = document.createElement("td");
						    td1.appendChild(document.createTextNode(v.zipcode));
						    var td2 = document.createElement("td");
						    td2.appendChild(document.createTextNode(v.sido));
						    var td3 = document.createElement("td");
						    td3.appendChild(document.createTextNode(v.gugun));
						    var td4 = document.createElement("td");
						    td4.appendChild(document.createTextNode(v.dong));
						    var td5 = document.createElement("td");
						    if(v.bunji == null) {
						    	td5.appendChild(document.createTextNode(""));
						    } else {
						    	td5.appendChild(document.createTextNode(v.bunji));
						    }
						    tr.appendChild(td1);
						    tr.appendChild(td2);
						    tr.appendChild(td3);
						    tr.appendChild(td4);
						    tr.appendChild(td5);
						    local.appendChild(tr);
						})
					},
					dataType: "json"
				})
			})
			var zipcode;
			var sido;
			var gugun;
			var dong;
			var bunji;
			$(document).on("click", "#table tr", function() {
			   var zipcode = this.getElementsByTagName("td")[0].innerText;
			   var sido = this.getElementsByTagName("td")[1].innerText;
			   var gugun = this.getElementsByTagName("td")[2].innerText;
			   var dong = this.getElementsByTagName("td")[3].innerText;
			   var bunji = this.getElementsByTagName("td")[4].innerText;
			   $("#mem_zip").val(zipcode);
			   $("#mem_add1").val(sido + " " + gugun + " " + dong + " " + bunji);
			   $("#mem_add2").val("");
			   $("#modalHide").click();
			});
			$("#certifyBtn").click(function() {
				var certifyCode = $("#certify").val();
				var checkCertify = $("#checkCertify").val();
				if (certifyCode == "") {
					$("#check").text("인증코드를 입력해주세요");
				} else if (certifyCode == checkCertify) {
					$("#check").text("인증코드가 맞습니다");
					checkCertifyAccept = true;
					checkEmail = $("#mem_email").val();
				} else {
					$("#check").text("인증코드를 다시입력해주세요");
				}
			})
		});

		function validate_id(id) {
			var pattern = new RegExp(/^[a-z0-9]{5,14}$/);
			return pattern.test(id);
		}
		
		function validate_pass(pass) {
			var pattern = new RegExp(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/);
			return pattern.test(pass);
		}
		
// 		function validate_name(name) {
// 			var pattern = new RegExp(/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/);
// 			return pattern.test(name);
// 		}
		
		function validate_email(email) {
			var pattern = new RegExp(
					/^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/);
			return pattern.test(email);
		}
		
		function validate_tel(tel) {
			var pattern = new RegExp(
					/^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/);
			return pattern.test(tel);
		}
		
		function validate_res1(res1) {
			var pattern = new RegExp(/^\d{6}$/);
			return pattern.test(res1);
		}
		
		function validate_res2(res2) {
			var pattern = new RegExp(/^\d{7}$/);
			return pattern.test(res2);
		}
		
		function validate_zip(zip) {
			var pattern = new RegExp(/^\d\d\d-\d\d\d$/, /^\d{3}-\d{3}$/);
			return pattern.test(zip);
		}
		
</script>
<style>
#datepicker{
	position:relative;
	z-index:auto !important;
	}
#zip thead
{
	display:block;
	width:100%;
	overflow: auto;
}
#zip tbody
{
	display:block;
	width:100%;
	height:90%;
	overflow: auto;
}
#zip th
{
	color:white;
	width:200px;
}
#zip td
{
	color:white;
	width:200px;
}
#zipModal .modal-header{ 
    background-color: #222222; 
 } 
#zipModal .modal-body{ 
    background-color: #222222; 
 } 
#zipModal .modal-footer { 
    background-color: #222222; 
 }
#zip .table-hover tbody tr:hover td {
  color: black;
}
</style>
</head>

<body>
	<div class="preloader">
		<img src="img/loader.gif" alt="Preloader image">
	</div>
	<nav class="navbar">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">
					<img src="img/logo.png" data-active-url="img/logo-active.png" alt="로고">
				</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right main-nav">
					<li><a href="#intro">Intro</a></li>
					<li><a href="#testInfo">시험정보</a></li>
					<li><a href="#" id="mainModalClick" data-toggle="modal" data-target="#signUpModal" class="btn btn-blue">로그인/회원가입</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<header id="intro">
		<div class="container">
			<div class="table">
				<div class="header-text">
					<div class="row">
						<div class="col-md-12 text-center">
							<h3 class="light white">SWCONTEST......응원합니다</h3>
							<h1 class="white typed">You can do it!  - Securecoding!</h1>
							<span class="typed-cursor">|</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
		
	<section>
		<div class="container">
			<div class="row intro-tables" >
				<div class="col-md-4" style="bottom: 60px;">
					<div class="service" style="background-color: white;">
						<div class="icon-holder" style="border-radius: 100px;">
							<img src="image/icons/heart-blue.png" alt="" class="icon">
						</div>
						<h4 class="heading">무료 동영상 강의</h4>
						<p class="description">
							최고의 강의서비스<br>대한민국 자격시험교육 1위!
						</p>
					</div>
				</div>
				<div class="col-md-4" style="bottom: 60px;">
					<div class="service" style="background-color: white;">
						<div class="icon-holder" style="border-radius: 100px;">
							<img src="image/icons/guru-blue.png" alt="" class="icon">
						</div>
						<h4 class="heading">메모기능</h4>
						<p class="description">
							회원별 메모기능<br>동영상 시청시 자유로운 필기로 효율적인 학습을 돕습니다.
						</p>
					</div>
				</div>
				<div class="col-md-4" style="bottom: 60px;">
					<div class="service" style="background-color: white;">
						<div class="icon-holder" style="border-radius: 100px;">
							<img src="image/icons/weight-blue.png" alt="" class="icon">
						</div>
						<h4 class="heading">1:1 상담</h4>
						<p class="description">선생님과의 빠른상담<br>모르는 문제, 어려운 과목을 선생님과 상담하세요
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<div class="container">
		<!-- 중1 타이틀부분 시작 -->
		<div class="row text-center title">
			<h2 style="font-weight: bolder;">시험정보</h2>
			<br>
			<div class="subContainer">
				<div class="info_cont">
					<ul class="gyTab">
						<li class="on" style="border-left: 1px solid;">
							<a onclick="exam1();" style="font-size: 10pt; font-weight: bold; cursor:pointer;">정보처리기사</a></li>
						<li><a onclick="exam2();" style="font-size: 10pt; font-weight: bold; cursor:pointer;">정보처리산업기사</a></li>
						<li><a onclick="exam3();" style="font-size: 10pt; font-weight: bold; cursor:pointer;">사무자동화산업기사</a></li>
						<li><a onclick="exam4();" style="font-size: 10pt; font-weight: bold; cursor:pointer;">컴퓨터활용능력</a></li>
						<li><a onclick="exam5();" style="font-size: 10pt; font-weight: bold; cursor:pointer;">워드프로세서</a></li>
						<li><a onclick="exam6();" style="font-size: 10pt; font-weight: bold; cursor:pointer;">ITQ</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="frame"></div>
		
	</div>
	</section>
	
<!-- 중간 - 두번째 팀소개 부분 끝 -->

<!-- 모달 모음!!!!! 시작 -->
<a href="#" data-toggle="modal" data-target="#joinAModal" id="joinAStart"></a>
<a href="#" data-toggle="modal" data-target="#idpwFModal" id="idpwFStart"></a>
<a href="#" data-toggle="modal" data-target="#zipModal" id="zipStart"></a>
<a href="#" data-toggle="modal" data-target="#joinFModal" id="joinFStart"></a>
<a href="#" data-toggle="modal" data-target="#signUpModal" id="loginStart"></a>

<!-- 아이디비밀번호찾기 모달 시작 -->
<div class="modal fade" id="idpwFModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content modal-popup" style="text-align: left;">
			<div class="login-box">
			<div class="contents_detail find">
				<center>
					<h3 style="font-weight: bold; color:#3c8dbc" id="idstyle">아이디/패스워드 찾기</h3>
					<br>
					<p id="success_msg" style="font-size: 13px; color: #ef6500;">&nbsp;</p>
				</center>
				<br>
				<label><i class="fa fa-cog"> 아이디찾기</i></label>
				<div name="member_find_id_frm" id="member_find_id_frm" >
					<div class="form-group has-feedback">
						<input type="text" class="form-control" placeholder="NAME" name="mem_name" id="Fmem_name">
<!-- 						<div class="success_msg"></div> -->
					</div>
					<div class="form-group has-feedback">
						<input type="text" class="form-control" placeholder="EAMAIL" name="mem_email" id="Fmem_email">
<!-- 						<div class="success_msg" id="email_id_msg"></div> -->
					</div>
					<div class="form-group has-feedback">
						<input type="button" id="sendId" class="btn btn-primary btn-block btn-flat" placeholder="BUTTON" value="확인">
					</div>
				</div>
<script type="text/javascript">
	$(function(){
		$("#sendId").click(function(){
			var mem_name = $("#Fmem_name").val();
			var mem_email = $("#Fmem_email").val();
			if(mem_name == ""){
				$("#success_msg").text("이름을 입력하세요");
				$("#Fmem_name").focus();
				return false;
			}
			if(mem_email == ""){
				$("#success_msg").text("이메일을 입력하세요");
				$("#Fmem_email").focus();
				return false;
			}
		      
			$.ajax({
				url: '${pageContext.request.contextPath}/findId',
				type: 'POST',
				dataType: 'JSON',
				data: {
					"mem_name" : mem_name,
					"mem_email" : mem_email
				},
				success : function(res){
						
							if(res != null){
								$("#success_msg").text("아이디가 발송되었습니다");
							}
				},
				error:function(res){

					$("#success_msg").text("아이디 발송실패");
				}
					
			})//ajax
			
		})
	})
</script>
				<br>
				<label><i class="fa fa-cog">비밀번호 찾기</i></label>
				<div name="member_find_pass_frm" id="member_find_pass_frm">
					<div class="form-group has-feedback">
						<input type="text" class="form-control" placeholder="NAME" name="mem_name" id="Pmem_name">
					</div>
					<div class="form-group has-feedback">
						<input type="text" class="form-control" placeholder="ID" name="mem_id" id="Pmem_id">
					</div>
					<div class="form-group has-feedback">
						<input type="text" class="form-control" placeholder="EAMAIL" name="mem_email" id="Pmem_email">
					</div>
					<div class="form-group has-feedback">
						<input type="submit" id="sendPw" class="btn btn-primary btn-block btn-flat" placeholder="BUTTON" value="이메일로 비밀번호 새로받기">
					</div>
				</div>
<script type="text/javascript">
	$(function(){
		$("#sendPw").click(function(){
			var mem_name = $("#Pmem_name").val();
			var mem_id = $("#Pmem_id").val();
			var mem_email = $("#Pmem_email").val();
			if(mem_name == ""){
				$("#success_msg").text("이름을 입력하세요");
				$("#Pmem_name").focus();
				return false;
			}
			if(mem_id == ""){
				$("#success_msg").text("아이디를 입력하세요");
				$("#Pmem_id").focus();
				return false;
			}
			if(mem_email == ""){
				$("#success_msg").text("이메일을 입력하세요");
				$("#Pmem_email").focus();
				return false;
			}
			
				$.ajax({
				url: '${pageContext.request.contextPath}/findPw',
				type: 'POST',
				dataType: 'JSON',
				data: {
					"mem_name" : mem_name,
					"mem_id" : mem_id,
					"mem_email" : mem_email
				},
				success : function(res){
							if(res != null){
							$("#success_msg").text("임시비밀번호가 발송되었습니다");
							}
				},
				error:function(res){			
					$("#success_msg").text("임시비밀번호 발송실패");
				}
					
			})//ajax
		})
	})
</script>
			</div>
		</div>
		</div>
	</div>
</div>
<!-- 아이디비밀번호찾기 모달 끝 -->


<!-- 회원가입 약관동의 모달 시작 -->
<div class="modal fade" id="joinAModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="wrapper">
<!-- 					<section class="content-header"> -->
						<center>
							<h3 style="font-weight: bold; color:#3c8dbc">회원 가입 약관</h3>
						</center>
<!-- 					</section> -->
					<form name="fregister" id="fregister" onsubmit="return freg_submit(this);" method="POST" autocomplete="off">
						<section class="content">
							<div class="box box-primary">
								<div class="box-header with-border">
									<h4 class="box-title" style="font-weight: bold; color: #616161;">SWCONTEST 이용약관 동의</h4><span style="color: gray;">(필수)</span>
								</div>
								<div class="box-body" style="text-align: left; font-size:12px; height: 150px; overflow: auto; overflow-x:hidden;">
									<span style="font-weight: bold;">SWCONTEST</span><br>
									이하 생략. 
								</div>
								<div class="box-footer" style="text-align: right;">
									<fieldset class="fregister_agree">
										<label for="agree1" style="font-weight: bold; color:#3c8dbc">상기 내용에 동의합니다</label>
										<input type="checkbox" name="agree" value="1" id="agree1">
									</fieldset>
								</div>
							</div>
						</section>
						<section class="content">
							<div class="box box-primary">
								<div class="box-header with-border">
								<h4 class="box-title" style="font-weight: bold; color: #616161;">개인정보 수집 및 이용에 대한 안내</h4><span style="color: gray;">(필수)</span></div>
								<div class="box-body" style="text-align: left; font-size:12px; height: 150px; overflow: auto; overflow-x:hidden;">
									이하생략.
								</div>
								<div class="box-footer" style="text-align: right;">
									<fieldset class="fregister_agree">
										<label for="agree2" style="font-weight: bold; color:#3c8dbc">상기 내용에 동의합니다</label>
										<input type="checkbox" name="agree2" value="1" id="agree2">
									</fieldset>
								</div>
							</div>
						</section>
						<div class="form-group has-feedback">
							<input type="submit" class="btn btn-primary btn-block btn-flat" value="회원가입" id="joinFClick" >
						</div>
<!-- 						<div class="btn-primary"> -->
<!-- 							<input type="submit" class="btn btn-primary ripple trial-button" value="회원가입"> -->
<!-- 						</div> -->
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 회원가입 약관동의 모달 끝 -->
<script type="text/javascript">
function freg_submit(f) {
	if (!f.agree.checked) {
		alert("회원가입약관의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
		f.agree.focus();
		return false;
	} else if (!f.agree2.checked) {
		alert("개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
		f.agree2.focus();
		return false;
	} else if(f.agree.checked && f.agree2.checked){
		$('#joinAModal').modal('hide');
		$("#joinFStart").click();
		return false;
	}
}
</script>

<!-- 회원가입 양식 모달 시작 -->
<div class="modal fade" id="joinFModal" tabindex="-1"role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
<div class="modal-content modal-popup3">
<div class="modal-body">
<div class="wrapper">
<section class="content">
	<div class="row">
		<div class="box-body">
			<div class="input-group margin">
				<div class="register-box" style="width: 470px;">
					<div class="register-logo">
						<a href="${pageContext.request.contextPath}/index.jsp"><b>SWCONTEST</b></a>
					</div>
					<div>
					<p class="login-box-msg">SWCONTEST 회원가입</p>
					<form id="fregisterform" name="fregisterform" action="${pageContext.request.contextPath}/joinFunction" onsubmit="return allCheck(this);" method="post" class="align">
						<div class="row">
							<div class="box-body">
								<!-- 아이디 입력 폼 --> 
								<div class="input-group form-group has-feedback margin">
									<input type="text" required class="form-control" placeholder="ID : 5자리 이상의 영문또는 숫자를 입력하세요" id="mem_id" name="mem_id" style="width: 295px;">
									<span class="input-group-btn">
										<input type="button" id="userCheck" value="중복검사" class="btn btn-block btn-warning" style="width: 95px;">	
									</span>
								</div>
								<span id="change" style="color: #f39c12;"></span>
								<!-- 비밀번호 입력 폼 -->
								<div class="input-group form-group has-feedback margin">
									<input type="password" required class="form-control" placeholder="PASSWORD" id="mem_pass" name="mem_pass" style="width: 390px;">
								</div>
								
								<div class="input-group form-group has-feedback margin">
									<input type="text" class="form-control" placeholder="NAME" id="mem_name" name="mem_name" style="width: 390px;">
								</div>
								
								<div class="input-group form-group has-feedback margin">
									<input type="text" class="form-control" placeholder="EMAIL" id="mem_email" name="mem_email" style="width: 295px;">
									<span class="input-group-btn">
										<input type="button" id="emailBtn" value="이메일인증" class="btn btn-block btn-warning">
									</span>
								</div>
								<span id="emailcheck" style="color: #f39c12;"></span>

								<div class="input-group form-group has-feedback margin">
									<input type="text" class="form-control" placeholder="인증코드" id="certify" name="certify" style="width: 295px;">
									<span class="input-group-btn">
										<input type="button" id="certifyBtn" value="인증확인" class="btn btn-block btn-warning" style="width: 95px;">
									</span>
								</div>
								<input type="hidden"id="checkCertify">
								<span id="check" style="color: #f39c12;"></span>
								
								<div class="input-group form-group has-feedback margin">
									<input type="text" class="form-control" placeholder="PHONE : 010-1234-5678" id="mem_tel" name="mem_tel" style="width: 390px;">
								</div>
								
								<div class="input-group form-group has-feedback margin">
									<div class="input-group date input-append"></div>
									<input type="text" class="form-control" placeholder="이곳을 클릭하여 생년월일 입력하세요" id="datepicker" name="mem_bir" style="width: 390px; right: 1000px;">
									<span class="add-on"><i data-time-icon="icon-time" data-date-icon="icon-calendar"></i></span>
								</div>
								
																							
								<div class="input-group form-group has-feedback margin">
									<div id="message" style="color:#ff0000; "></div>
									<div id="recaptcha"></div>
									<div class="row">
									<div class="col-xs-6"><div style="width: 150px; margin-top: 2px; margin-left: 10px;"><span id="message" style="color: #f39c12;"> </span></div></div>
									<div class="col-xs-6">
									<input id="recaptchaCheck" type="button" value="자동가입방지 확인" class="btn btn-block btn-warning" style="margin-top: 3.5px; margin-bottom: 3.5px;">
<!-- 									<input id="recaptchaCheck" type="button" value="자동가입방지 확인" class="btn btn-block btn-warning" style="background-color: #7c0000; margin: -6px; border-top-right-radius: 0px; border-top-left-radius: 0px; width: 102%;"> -->
									</div>
									</div>
								</div>
								
								<br></br>
								<div class="input-group margin">
								<span class="input-group-btn">
									<button type="submit" class="btn btn-warning btn-flat" style="width: 50%;" id="joinBtn">가입</button>
									<button type="reset"  class="btn btn-warning btn-flat" style="width: 50%;" data-dismiss="modal" id="resetBtn">취소</button>
								</span>
								</div>
								
<!-- 								<div class="row"> -->
<!-- 									<div class="col-xs-2"></div> -->
<!-- 									<div class="col-xs-4"> -->
<!-- 										<input type="button" class="btn btn-warning" value="가입" id="searchZipClick" style="width: 160px; height: 50px; font-size: 20px;"> -->
<!-- 									</div> -->
<!-- 									<div class="col-xs-4"> -->
<!-- 										<input type="reset" class="btn btn-warning" value="취소" style="width: 160px; height: 50px; font-size: 20px;">  -->
<!-- 									</div> -->
<!-- 									<div class="col-xs-2"></div> -->
<!-- 								</div> -->
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
</div>
</div>
</div>
</div>
</div>
<!-- 회원가입 양식 모달 끝 -->
<div class="modal fade" id="zipModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<a href="#" id="modalHide" data-dismiss="modal"></a>
				<div class="modal-dialog">
					<div class="modal-content modal-popup">
					<div class="modal-header">
						<h1 style="color:white">주소 찾기</h1>
					</div>
					<div class="modal-body">
					<div class="box-tools" style="margin-left:70%">
		                <div class="input-group input-group-sm" style="width: 150px;">
							<input class="form-control pull-right" type="text" id="dong">
		                  <div class="input-group-btn">
		                    <button class="btn btn-default" type="button" id="searchDong">검색</button>
		                  </div>
		                </div>
		              </div>
						
						<div id="zip" style="height:500px;">
							<table class='table table-hover dataTable' id="table">
									<thead>
									<th>우편번호</th>
									<th>시/도</th>
									<th>구/군</th>
									<th>동이름</th>
									<th>번지</th>
									<th style="width:0px"></th>
									</thead>
									<tbody id="tbody" style="height:450px;">
									</tbody>
							</table>
						</div>
					</div>
					</div>
		    	</div>
			</div>
<!-- 로그인 모달 시작 -->
<div class="modal fade" id="signUpModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
			<div class="modal-content modal-popup">
				<div class="login-box">
					<div class="login-logo"><a href="index.jsp"><b>SWCONTEST</b></a></div>
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
										<a href="#" data-toggle="modal" data-target="#signUpModal" id="idpwFClick" class="text-center">아이디 | 비밀번호 찾기 | </a>
										<a href="#" data-toggle="modal" data-target="#signUpModal" id="joinAClick" class="text-center" style="font-weight: bold;">회원가입</a>
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
</div>
<!-- 로그인 모달 끝 -->

<!-- 아이디비밀번호찾기 모달 시작 -->

<!-- 아이디비밀번호찾기 모달 끝 -->

<!-- 인덱스 푸터 시작 -->
<footer>
	<div class="container">
		<div class="row  text-center-mobile">
			<div class="col-sm-8"><p>&copy; 2017 한국인터넷진흥원(KISA) <a>SW 경진대회</a></p></div>
		</div>
	</div>
</footer>
<!-- 인덱스 푸터 끝 -->

<!-- 인덱스 좁은화면용 시작 -->
<div class="mobile-nav"><ul></ul><a href="#" class="close-link"><i class="arrow_up"></i></a></div>
<!-- 인덱스 좁은화면용 끝 -->
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
				$("#checkMsg").text("아이디를 입력하세요");
				form.login_id.focus();
				return false;
			}
			else if (form.login_pass.value == "") {
				$("#checkMsg").text("비밀번호를 입력하세요");
				form.login_pass.focus();//포커스를 Password박스로 이동.
				return false;
			}
			else {
				$.ajax({
					url : "${pageContext.request.contextPath}/returnMainPage",
					type : "POST",
					data : {
						"login_id" : $("#login_id").val(),
						"login_pass" : $("#login_pass").val()
					},
					success : function(res) {
						if (res.loginResult == "NO") {
							$("#checkMsg").text("아이디와 비밀번호를 확인하세요");
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
<!-- Scripts -->
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<!-- 	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> -->
	<script type="text/javascript" src="http://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>
	<script src="plugins/datepicker/bootstrap-datepicker.js"></script>
	<script src="js/jquery.serializejson.min.js"></script>
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/typewriter.js"></script>
	<script src="js/jquery.onepagenav.js"></script>
	<script src="js/main.js"></script>
<!--  	<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script> -->
 	<script src="js/jquery-ui.min.js"></script>
 	
	<script type="text/javascript">
			$(function() { $("#frame").load("testInfo/exam1.jsp"); })
		function exam1() { $("#frame").load("testInfo/exam1.jsp"); }
		function exam2() { $("#frame").load("testInfo/exam2.jsp"); }
		function exam3() { $("#frame").load("testInfo/exam3.jsp"); }
		function exam4() { $("#frame").load("testInfo/exam4.jsp"); }
		function exam5() { $("#frame").load("testInfo/exam5.jsp"); }
		function exam6() { $("#frame").load("testInfo/exam6.jsp"); }
		
	</script>
	
	
</body>
</html>
