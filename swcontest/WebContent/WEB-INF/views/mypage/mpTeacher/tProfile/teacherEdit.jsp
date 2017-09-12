<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<link href="${pageContext.request.contextPath}/css/creative.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/teacherList.css">
	
<script>
	$(document).ready(function() {
		var uploadImage = document.getElementById("file");
		document.getElementById("teacher_prof").value="${profile.tea_prof}"
		/* if("${profile.tea_intro_img}" != "") {
			$("#userImage").attr("src", "${pageContext.request.contextPath}/filesave/${profile.tea_intro_img}");
		} */
		var code = "${testCode}";
		var name = "${teacherList.get(0).tea_name}";
		var prof = "${teacherList.get(0).tea_prof}";
		var id = "${teacherList.get(0).tea_id}";
		var file;
		code = code.substring(code.length - 2, code.length);
		document.getElementById('teacher_id').value = id;
		$("#teacher_name").text(name);
		$("#proce_name").text("${proceName}");
		$("#teacher_prof").text(prof);
		
		uploadImage.onchange = function() {
			updateCheck = true;
			file = this.files[0];
			imgURL = window.URL.createObjectURL(this.files[0]);
			$("#userImage").attr('src', imgURL);
		};
		$('#userImageUpload').click(function(e) {
			$('#file').click();
		});
		$('#register').click(function(e) {
			var formData = new FormData();
			var proce_cfy_code=document.getElementById('proce_name').value
			var tea_prof=document.getElementById('teacher_prof').value
			if(file != undefined) {
				formData.append("teacherImage", file);
				formData.append("proce_cfy_code",proce_cfy_code);
				formData.append("tea_prof",tea_prof);
			}
			else{
				formData.append("proce_cfy_code",proce_cfy_code);
				formData.append("tea_prof",tea_prof);
			}
			$.ajax({
				url:"${pageContext.request.contextPath}/video/ProfileUpdate",
				type:"POST",
				data: formData,
				async:false,
				cache: false,
				contentType: false,
				processData: false,
				success: function(res) {
					location.href="${pageContext.request.contextPath}/main/main";
				}
			})
			
		});
	})
	
</script>
<style>
#file {
	display: none;
}
</style>
<body>
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
			<br>
			<section class="content-header">
				<h1 id="title">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;프로필 관리
				</h1>
				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i> 마이페이지</li>
					<li>프로필 관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				</ol>
			</section>
			<hr id="hr"></hr>
			<br><br>
			
			<section class="content">
			<div class="row">
				<section class="col-lg-2 connectedSortable"></section>
				<section class="col-lg-8"> 
				<div class="box box-warning">
					<div class="box-header">
						<h3 class="box-title" id="titleH3">선생님 상세보기</h3>
					</div>
					<div class="box-body">
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-10">
								<table class="table table-inverse" style="margin-top:20px">
									<tbody>
										<tr>
											<td rowspan="3" style="width: 200px">
												<img id="userImage" src="${pageContext.request.contextPath}/filesave/${profile.tea_intro_img}"
												style="height:200px" alt="User profile picture">
												<div>
													<input type="file" id="file" name="userImage" accept="image/*">
													<button type="button" id="userImageUpload" class="btn btn-warning btn-block">
														<b>프로필 사진 수정</b>
													</button>
												</div>
											<th style="width: 12%">선생님 이름 :</th>
											<td><input type="text" id="tea_name" name="tea_name" value="${profile.tea_name}"></td>
										</tr>
										<tr>
											<th>과목 :</th>
											<td><input type="text" id="proce_name" name="proce_name" value="${profile.proce_cfy_code}" readonly="readonly"></td>
										</tr>
										<tr>
											<th>경력:</th>
											<td><textarea rows="4" cols="50" id="teacher_prof"></textarea></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-5" style="left: 77%; width:150px;margin: 10px">
								<button type="button" id="register" class="btn btn-warning btn-block btn-flat">수정완료</button>
									<input type="hidden" id="teacher_id" name="teacher_id">
							</div>
						</div>
					</div>
				</div>
				<!--/. box -->
			</section>
			</div>
		</section>
		</div>
		<!-- /.content-wrapper -->
	</div>
</body>

</html>