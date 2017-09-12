$(function() {
		var siteKey = "6Lc4zyMTAAAAAEL2mCdiuXHfDwuY0DJeEhOFHjeZ";//Site key
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
	
	// 체크박스 스크립트
	function fregister_submit(f) {
		if (!f.agree.checked) {
			alert("회원가입약관의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
			f.agree.focus();
			return false;
		} else if (!f.agree2.checked) {
			alert("개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
			f.agree2.focus();
			return false;
		} else {
			$("#memberJoinModalStart").click();
			$('#provisionModal').modal('hide');
			return false;
		}
	}
	
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
					var siteKey = "6Lc4zyMTAAAAAEL2mCdiuXHfDwuY0DJeEhOFHjeZ";
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