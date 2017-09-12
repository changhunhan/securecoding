<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="modal fade" id="searchIdPasswordModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content modal-popup">
<div id="contents">
	<!-- contents detail -->
	<div class="contents_detail find">
<!-- 		<h2><img src="/img/dangi/member/tit_find.gif" alt="아이디 및 비밀번호 찾기"></h2> -->
		<div class="info_txt">아이디를 아래의 방식중 하나를 선택하여 찾아주세요.</div>
		<div class="find_box">
			<div class="id_box chk">
				<div class="tit">아이디 찾기<span>회원정보를 확인하여 아이디를 찾아드립니다</span></div>
				<form name="member_find_id_frm" id="member_find_id_frm" method="post" novalidate="novalidate" action="${pageContext.request.contextPath }/findId">
				<table>
					<tr>
						<td>
							<input type="text" name="mem_name" value="" title="이름" placeholder="이름">
							<div class="success_msg">
							</div>
						</td>
					</tr>
					<tr>
						<td><input type="text" name="mem_email" value="" title="이메일" placeholder="이메일">
							<div class="success_msg" id="email_id_msg">
							</div>
						</td>
					</tr>
				</table>
				<div class="btn_box">
					<input type="submit" value="확인">
					</div>
				</form>
			</div>
			<div class="pw_box">
				<div class="tit">비밀번호 찾기<span>아이디와 이메일, 실명확인으로 비밀번호를 변경하세요</span></div>
				<form name="member_find_pass_frm" id="member_find_pass_frm" method="post" novalidate="novalidate" action="${pageContext.request.contextPath }/findPw">
				<input type="hidden" name="cert_type" value="" />
				<table>
					<tr>
						<td>
							<input type="text" name="mem_name" value="" title="이름" placeholder="이름">
							<div class="success_msg">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="mem_id"  title="아이디" placeholder="아이디">
							<div class="success_msg">
							</div>
						</td>
					</tr>
					<tr>
						<td><input type="text" name="mem_email" value="" title="이메일" placeholder="이메일">
							<div class="success_msg" id="email_pass_msg">
							</div>
						</td>
					</tr>
					
					
				</table>
				<input type="submit" value="이메일로 비밀번호 새로받기">
				</form>
			</div>
		</div>
	</div>
</div>
		</div>
	</div>
</div>
</body>
</html>