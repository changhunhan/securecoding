<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//체크박스 스크립트
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
</script>
</head>
<body>
<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-body">
			<div class="wrapper">
				<section class="content-header"><h1>회원 가입 약관</h1></section>
				<form name="fregister" id="fregister" onsubmit="return fregister_submit(this);" method="POST" autocomplete="off">
					<section class="content">
						<div class="box">
							<div class="box-header with-border"><h3 class="box-title">사이트 이용약관 동의</h3></div>
							<div class="box-body">
								이하 생략.
							</div>
							<div class="box-footer">
								<fieldset class="fregister_agree">
									<label for="agree11">회원가입약관의 내용에 동의합니다</label>
									<input type="checkbox" name="agree" value="1" id="agree1">
								</fieldset>
							</div>
						</div>
					</section>
					<section class="content">
						<div class="box">
							<div class="box-header with-border"><h3 class="box-title">사이트 이용약관 동의</h3></div>
							<div class="box-body">
								이하 생략.
							</div>
							<div class="box-footer">
								<fieldset class="fregister_agree">
									<label for="agree11">회원가입약관의 내용에 동의합니다</label>
									<input type="checkbox" name="agree2" value="1" id="agree2">
								</fieldset>
							</div>
						</div>
					</section>
					<div class="btn-blue"><input type="submit" id="memberJoinClick" class="btn btn-blue ripple trial-button" value="회원가입"></div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>