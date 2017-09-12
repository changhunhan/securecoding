<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.datepicker{
	z-index:+1 !important;
	z-index: auto;
}
</style>

<script type="text/javascript">
//자동가입 방지 기능
$(function() {
	var siteKey = "6Lc4zyMTAAAAAEL2mCdiuXHfDwuY0DJeEhOFHjeZ";
	var div = "recaptcha";
	Recaptcha.create(siteKey, div, { theme : "red" });
	$("#recaptchaCheck").click(function() {
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
					document.getElementById("message").innerHTML = "Success!";
				} else {
					document.getElementById("message").innerHTML = "Incorrect Recaptcha! Please try again!";
					Recaptcha.reload();
				}
			}
		});
	});
});
</script>
<script type="text/javascript">
$(document).ready(
function() {
	var checkDuplicate = false;
	var checkAutoJoin = false;
	$(function() {
		var dialog;
		dialog = $("#dialog-form").dialog({
			autoOpen : false,
			height : 300,
			width : 350,
			modal : true,
			close : function() {
				$('.zipData').remove();
				$('#search_dong').val("");
			}
		});
		
		$("#codeBtn").button().on("click", function() {
			dialog.dialog("open");
			return false;
		});
		
		//우편번호 검색
		$('#ok_btn').click(function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/searchDong',
				type : 'post',
				data : { 'dong' : $('#search_dong').val() },
				success : function(res) {
					var code = "";
					$.each(res,function(i,v) {
						code += "<div class = 'zipData'>";
						code += "<span>" + v.zipcode + "</span>";
						code += "<span>" + v.sido + " " + v.gugun + " " + v.dong + "</span>";
						if (v.bunji != null)
							code += " " + v.bunji;
							code += "</div>";
						$('#disp').html(code);
					})
				},
				dataType : 'json'
			})
		})

		$('#disp').on('click', '.zipData', function() {
			$('#mem_zip').val($('span:eq(0)', this).text());
			$('#mem_add1').val($('span:eq(1)', this).text());
			dialog.dialog("close");
			return false;
		})
		
		$("#search_dong").keydown(function(e) {
			if (e.keyCode == 13) {$('#ok_btn').trigger("click");}
		})

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
		
		//중복검사
		$('#userCheck').click(function() {
			checkDuplicate = false;
			var mem_id = $('#mem_id').val();
			var validFlag = validate_id(mem_id);//유효성 검사 boolean 체크
			if (mem_id == "") {
				alert("아이디를 입력하세요");
				return false;
			}
			$.ajax({
				url : '${pageContext.request.contextPath}/duplicateCheck',
				type : 'post',
				data : { 'mem_id' : mem_id },
				success : function(res) {
					//res.status , res.id 를 받는다
					if (res.status == "OK") {
						checkDuplicate = true;
						if (!validFlag) {
							event.preventDefault();
							$('#change').text(res.mem_id + " 사용 불가능합니다.");
							return false;
						} else {
							$('#change').text(res.mem_id + " 사용가능 합니다."); //text 위치에 html 가능
						}
					} else {
						checkDuplicate = false;
						$('#change').text(res.mem_id + " 사용 불가능합니다.");
					}
				},
				dataType : 'json' //가져오는것
			})
		})
	})

	//자동가입 방지 기능
	$(function() {
		var siteKey = "6Lc4zyMTAAAAAEL2mCdiuXHfDwuY0DJeEhOFHjeZ";//Site key
		var div = "recaptcha";
		Recaptcha.create(siteKey, div, { theme : "red" });

		$("#recaptchaCheck").click(function() {
			chekcAutoJoin = false;
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


	$(".submit").click(function(event) {
		// 	아이디 체크
		var id = $("#mem_id").val();
		var validFlag = validate_id(id);//유효성 검사 boolean 체크
		//	유효한 id 가 아니라면..
		if (id == "") {
			alert("아이디를 입력하세요");
			id.fo
			return false;
		} else if (!validFlag) {
			$("#mem_id").next().html();
			alert("아이디는 5글자이상, 영문또는 숫자로 입력하세요");
			event.preventDefault();
			return false;
		}
		//  비밀번호 체크
		var pass = $("#mem_pass").val();
		var validFlag = validate_pass(pass);
		if (pass == "") {
			alert("비밀번호를 입력하세요");
			return false;
		} else if (!validFlag) {
			$("#mem_pass").next().html();
			alert("비밀번호는 6~20 영문 대소문자이며, 최소 1개의 숫자 혹은 특수 문자를 포함해야 함");
			event.preventDefault();
			return false;
		}
		//  이름 체크
		var name = $("#mem_name").val();
		var validFlag = validate_name(name);
		if (name == "") {
			alert("이름을 입력하세요");
			return false;
		} else if (!validFlag) {
			$("#mem_name").next().html();
			alert("올바른 형식이 아닙니다. 한글은 띄어쓰기 불가능, 영문은 띄어쓰기가 가능");
			event.preventDefault();
			return false;
		}
		// 	이메일체크
		var email = $("#mem_email").val();
		var validFlag = validate_email(email);
		if (email == "") {
			alert("이메일을 입력하세요");
			return false;
		} else if (!validFlag) {
			$("#mem_email").next().html();
			alert("올바른 email 형식이 아닙니다.");
			event.preventDefault();
			return false;
		}
		// 	전화번호체크
		var tel = $("#mem_tel").val();
		var validFlag = validate_tel(tel);
		if (tel == "") {
			alert("전화번호를 입력하세요");
			return false;
		} else if (!validFlag) {
			$("#mem_tel").next().html();
			alert("잘못된 휴대폰 번호입니다. 숫자, - 를 포함한 숫자만 입력하세요.");
			event.preventDefault();
			return false;
		}
		// 	생년월일체크
		var bir = $("#datepicker").val()
		if (bir == "") {
			alert("생년월일을 입력하세요");
			return false;
		}

		// 	주민번호체크
		var res1 = $("#mem_res_num1").val();
		var validFlag = validate_res1(res1);
		if (res1 == "") {
			alert("주민번호를 입력하세요");
			return false;
		} else if (!validFlag) {
			$("#mem_res_num1").next().html();
			alert("주민번호 앞자리를 6자리로 입력하세요");
			event.preventDefault();
			return false;
		}

		var res2 = $("#mem_res_num2").val();
		var validFlag2 = validate_res2(res2);
		if (res2 == "") {
			alert("주민번호를 입력하세요");
			return false;
		} else if (!validFlag2) {
			$("#mem_res_num2").next()
					.html();
			alert("주민번호 뒷자리를 7자리로 입력하세요");
			event.preventDefault();
			return false;
		}

		// 	주소체크
		var add1 = $("#mem_add1").val();
		var add2 = $("#mem_add2").val();
		var zip = $("#mem_zip").val();
		if (add1 == "" && add2 == "" && zip == "") {
			alert("주소를 입력하세요");
			return false;
		}
		if (checkDuplicate == false) {
			alert("중복검사를 해주세요");
			return false;
		} else if (checkAutoJoin == false) {
			alert("자동가입 방지 문자를 입력해주세요");
			return false;
		}
		alert("회원가입이 성공하였습니다.")
		return true;
	});
});

function validate_id(id) {
	var pattern = new RegExp(/^[a-z0-9]{5,14}$/);
	return pattern.test(id);
}

function validate_pass(pass) {
	var pattern = new RegExp(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/);
	return pattern.test(pass);
}

function validate_name(name) {
	var pattern = new RegExp(/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/);
	return pattern.test(name);
}

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

$(function() {
	$("#certifyBtn").click(function() {
		var certifyCode = $("#certify").val();
		var checkCertify = $("#checkCertify").val();
		if (certifyCode == "") {
			$("#check").text("인증코드를 입력해주세요");
		} else if (certifyCode == checkCertify) {
			$("#check").text("인증코드가 맞습니다");
		} else {
			$("#check").text("인증코드를 다시입력해주세요");
		}
	})
})
</script>
</head>
<body>
<div class="modal fade" id="memberJoinModal" tabindex="-1"role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
						<a href="${pageContext.request.contextPath}/index.jsp"><b>DO</b>TV</a>
					</div>
					<div>
					<p class="login-box-msg">SWCONTEST회원가입</p>
					<form id="fregisterform" name="fregisterform" action="${pageContext.request.contextPath}/joinFunction" onsubmit="return allCheck(this);" method="post" class="align">
						<div class="row">
							<div class="box-body">
								<!-- 아이디 입력 폼 --> 
								<div class="input-group form-group has-feedback margin">
									<input type="text" required class="form-control" placeholder="ID" id="mem_id" name="mem_id">
									<span class="input-group-btn">
										<input type="button" id="userCheck" value="중복검사" class="btn btn-block btn-warning" style="width: 95px;">	
									</span>
								</div>
								<span id="change" style="color: #f39c12;"></span>
								<!-- 비밀번호 입력 폼 -->
								<div class="input-group form-group has-feedback margin">
									<input type="password" required class="form-control" placeholder="PASSWORD" id="mem_pass" name="mem_pass">
								</div>
								
								<div class="input-group form-group has-feedback margin">
									<input type="text" class="form-control" placeholder="NAME" id="mem_name" name="mem_name">
								</div>
								
								<div class="input-group form-group has-feedback margin">
									<input type="text" class="form-control" placeholder="EMAIL" id="mem_email" name="mem_email">
									<span class="input-group-btn">
										<input type="button" id="emailBtn" value="이메일인증" class="btn btn-block btn-warning">
									</span>
								</div>
								<span id="emailcheck" style="color: #f39c12;"></span>

								<div class="input-group form-group has-feedback margin">
									<input type="text" class="form-control" placeholder="인증코드" id="certify" name="certify">
									<span class="input-group-btn">
										<input type="button" id="certifyBtn" value="인증확인" class="btn btn-block btn-warning" style="width: 95px;">
									</span>
								</div>
								<input type="hidden"id="checkCertify">
								<span id="check" style="color: #f39c12;"></span>
								
								<div class="input-group form-group has-feedback margin">
									<input type="text" class="form-control" placeholder="PHONE" id="mem_tel" name="mem_tel">
								</div>
								
								<div class="input-group form-group has-feedback margin">
									<div class="input-group date input-append"></div>
									<div class="datepicker"></div>
									<input type="text" class="form-control pull-right " id="datepicker" name="mem_bir" value="BIR : 이곳을 클릭하세요" data-format="dd/MM/yyyy hh:mm:ss">
									<span class="add-on"><i data-time-icon="icon-time" data-date-icon="icon-calendar"></i></span>
								</div>
								
								
								
								
								
								
								<div class="input-group form-group has-feedback margin">
									<input type="text" placeholder="&nbsp;&nbsp;&nbsp;REGNO1" id="mem_res_num1" name="mem_res_num1" style="width: 200px;">
									<span style="font-size: 20px;"> &nbsp;&nbsp;──&nbsp;&nbsp; </span>
									<input type="text" placeholder="&nbsp;&nbsp;&nbsp;REGNO2" id="mem_res_num2" name="mem_res_num2" style="width: 200px;">
								</div>
								
								
								<div class="input-group form-group has-feedback margin">
									<input type="text" class="form-control" placeholder="우편번호" id="mem_zip" name="mem_zip" readonly>
									<span class="input-group-btn">
										<input type="button" id="searchZipClick" class="btn btn-block btn-warning" value="번호검색" style="width: 95px;">
									</span>
								</div>
								
								<div class="input-group form-group has-feedback margin">
									<input type="text" class="form-control" placeholder="ADDRESS1" id="mem_add1" name="mem_add1" readonly>
								</div>
								
								<div class="input-group form-group has-feedback margin">
									<input type="text" class="form-control" placeholder="ADDRESS2" id="mem_add2" name="mem_add2">
								</div>
								
								<div class="input-group form-group has-feedback margin">
									<div id="capcha" style="display: flex;">
										<div id="recaptcha"></div>
										<input id="recaptchaCheck" type="button" value="자동가입방지 확인" class="btn btn-block btn-warning" style="margin-top: 3.5px; margin-bottom: 3.5px;">
									</div>
								</div>
								<span id="message" style="color: #f39c12;"></span>
								
								<br></br>
								
								<div class="row">
									<div class="col-xs-2"></div>
									<div class="col-xs-4">
										<input type="button" class="btn btn-warning" value="가입" id="searchZipClick" style="width: 160px; height: 50px; font-size: 20px;">
									</div>
									<div class="col-xs-4">
										<input type="reset" class="btn btn-warning" value="취소" style="width: 160px; height: 50px; font-size: 20px;"> 
									</div>
									<div class="col-xs-2"></div>
								</div>
							</div>
						</div>
					</form>
					<div id="dialog-form">
					동입력
					<input type="text" name="search_dong" id="search_dong" />
					<input type="button" value="확인" id="ok_btn" />
					<div id="disp"></div>
					</div>
					</div>
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
</body>
</html>