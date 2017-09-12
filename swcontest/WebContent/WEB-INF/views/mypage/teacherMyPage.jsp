<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
$(document).ready(function() {
	//Date picker
	$('#datepicker').datepicker({
		  autoclose: true
		});
});

</script>
<body>
	<div class="content-wrapper">
		<section class="content-header">
		<h1>
			My page <small>update Information</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/main/main"><i
					class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">My page</li>
		</ol>
		</section>
		<section class="content">
		<div class="row">
			<div class="col-md-3">
				<!-- Profile Image -->
				<div class="box box-primary">
					<div class="box-body box-profile">
						<img class="profile-user-img img-responsive img-circle"
							src="${pageContext.request.contextPath}/dist/img/user4-128x128.jpg"
							alt="User profile picture">

						<h3 class="profile-username text-center">${tea_id}</h3>

						<p class="text-muted text-center">${teacherVo.proce_cfy_code}</p>

						<a href="#" class="btn btn-primary btn-block"><b>프로필 사진 수정</b></a>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<div class="col-md-9">
				<div class="box box-primary">
					<br>

					<form action="#" method="post">
						<div class="form-group has-feedback" style="margin: 10px">
							<label for="id">아이디</label> <input type="text" name="mem_id"
								class="form-control input-sm" placeholder="ID" readonly>
							<span class="glyphicon glyphicon-user form-control-feedback"></span>
						</div>
						<div class="form-group has-feedback"
							style="margin: 10px; margin-botton: 0px;">
							<label for="id">현재 비밀번호</label> <input type="password"
								name="tea_pass" class="form-control input-sm"
								placeholder="Password"> <span
								class="glyphicon glyphicon-lock form-control-feedback"></span>
						</div>
						<div class="row">
							<div class="col-xs-4" style="margin-left: 10px">
								<label for="id">비밀번호 변경</label> <input type="password"
									name='pass_update' class="form-control input-sm"
									placeholder="Password Check">
							</div>
							<div class="col-xs-4">
								<label for="id">비밀번호 확인</label> <input type="password"
									name='pass_update_check' class="form-control input-sm"
									placeholder="Password Check">
							</div>
							<div class="form-group" style="margin-top: 22.5px">
								<input type="button" class="btn" value="비밀번호 변경">
							</div>
						</div>
						<div class="form-group has-feedback"
							style="margin: 10px; margin-top: 0px">
							<label for="id">이름</label> <input type="text" name="tea_name"
								class="form-control input-sm" placeholder="Full name"> <span
								class="glyphicon glyphicon-pencil form-control-feedback"></span>
						</div>
						<div class="row">
							<div class="col-xs-4" style="margin-left: 10px">
								<label for="id">주민번호</label> <input type="text"
									name="tea_reg_num1" class="form-control input-sm"
									placeholder="Registration">
							</div>
							<div class="col-xs-4" style="margin-top: 20px">
								<label for="id"></label> <input type="password"
									name='tea_reg_num2' class="form-control input-sm"
									placeholder="Number">
							</div>
						</div>
						<div class="form-group has-feedback" style="margin: 10px">
								<label>생년월일</label>

								<div class="input-group date">
									<div class="input-group-addon">
										<i class="fa fa-calendar"></i>
									</div>
									<input type="text" class="form-control pull-right"
										id="datepicker">
								</div>
								<!-- /.input group -->
						</div>

						<div class="form-group has-feedback" style="margin: 10px">
							<label for="id">전화번호</label> <input type="text" name="tea_tel"
								class="form-control input-sm" placeholder="Telephone number">
							<span class="glyphicon glyphicon-earphone form-control-feedback"></span>
						</div>
						<div class="form-group has-feedback" style="margin: 10px">
							<label for="id">우편번호</label> <input type="text" name="tea_zip"
								class="form-control input-sm" placeholder="Address Number"
								readonly> <span
								class="glyphicon glyphicon-map-marker form-control-feedback"></span>
						</div>
						<div class="row">
							<div class="col-xs-4" style="margin-left: 10px">
								<label for="id">주소</label> <input type="text" name="tea_add1"
									class="form-control input-sm" placeholder="Registration"
									readonly>
							</div>
							<div class="col-xs-4">
								<label for="id">상세주소</label> <input type="password"
									name='tea_add2' class="form-control input-sm"
									placeholder="Number">
							</div>
							<div class="form-group" style="margin-top: 22.5px">
								<button type="button" class="btn">주소찾기</button>
							</div>
						</div>

						<div class="form-group has-feedback"
							style="margin: 10px; margin-top: 0px;">
							<label for="id">이메일</label> <input type="text" name="tea_email"
								class="form-control input-sm" placeholder="E-mail"> <span
								class="glyphicon glyphicon-envelope form-control-feedback"></span>
						</div>

						<div class="row">
							<!-- /.col -->
							<div class="col-xs-4" style="left: 50%; margin: 10px">
								<button type="submit" class="btn btn-primary btn-block btn-flat">Register</button>
							</div>
							<!-- /.col -->
						</div>
					</form>
				</div>
			</div>
		</div>
		</section>
	</div>


</body>
</html>