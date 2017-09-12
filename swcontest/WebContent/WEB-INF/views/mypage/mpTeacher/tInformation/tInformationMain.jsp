<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/tInformationMain.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/valid.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/select2/select2.min.css">
<title>Insert title here</title>
</head>
<style>
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
.modal-header{ 
    background-color: #222222; 
 } 
 .modal-body{ 
    background-color: #222222; 
 } 
 .modal-footer { 
    background-color: #222222; 
 }
#zip .table-hover tbody tr:hover td {
  color: black;
}
</style>
<script>
	$(document).ready(function() {
		var uploadImage = document.getElementById("file");
		var file;
		var updateCheck = false;
		$("#${teacherVo.proce_cfy_code}").attr("selected", "selected");
		if("${teacherVo.tea_img}" != "") {
			$("#userImage").attr("src", "${pageContext.request.contextPath}/filesave/${teacherVo.tea_img}");
		}
						//Date picker
						$('#datepicker').datepicker({
							autoclose : true
						});
						$("#updatePassword").click(function() {
							
											var currentPass = "${teacherVo.tea_pass}";
											var inputPass = $(
													"input[name=tea_pass]")
													.val();
											var updatePass = $(
													"input[name=pass_update]")
													.val();
											var checkUpdatePass = $(
													"input[name=pass_update_check]")
													.val();
											if (currentPass == "") {
												alert("현재 비밀번호를 입력해주세요.");
											} else if (inputPass != currentPass) {
												alert("현재 비밀번호가 일치하지 않습니다.");
											} else if (updatePass != checkUpdatePass) {
												alert("비밀번호와 비밀번호 확인이 같지 않습니다.");
											} else if (!validate_pass($(
													"input[name=pass_update]")
													.val())) {
												alert("비밀번호는 6~20 영문 대소문자이며, 최소 1개의 숫자 혹은 특수 문자를 포함해야 합니다.");
											} else {
												alert(updatePass);
												$.ajax({
															type : "POST",
															url : "${pageContext.request.contextPath}/tInformation/updatePassword",
															data : {
																"tea_pass" : updatePass
															},
															success : function(
																	res) {
																if (res == 1) {
																	alert("성공");
																} else {
																	alert("실패");
																}
															},
															dataType : 'json'
														})
											}
										});
						$(function() {
							$('#userImageUpload').click(function(e) {
								e.preventDefault();
								$('#file').click();
							});
						});
						
						uploadImage.onchange = function() {
							updateCheck = true;
							file = this.files[0];
							imgURL = window.URL.createObjectURL(this.files[0]);
							$("#userImage").attr('src', imgURL);
						};
						
						$("#register").click(function() {
							var formData = new FormData(document.getElementById('form'));
							if(file != undefined) {
								formData.append("teacherImage", file);
							}
							
							if($("#tea_name").val() == "") {
								alert("이름을 입력해주세요.");
							} else if(!validate_name($("#tea_name").val())) {
								alert("이름을 확인하여주세요");
							} else if($("#datepicker").val() == "") {
								alert("생일을 입력해주세요");
							} else if($("#tea_tel").val() == "") {
								alert("전화번호를 입력해주세요");
							} else if(!validate_tel($("#tea_tel").val())) {
								alert("전화번호는 '-'이 들어간 형식으로 입력해주세요'");
							} else if($("#tea_add2").val() == "") {
								alert("상세주소를 입력해주세요");
							} else if($("#tea_email").val() == "") {
								alert("이메일을 입력해주세요");
							} else if(!validate_email($("#tea_email").val())) {
								alert("이메일 형식에 맞게 입력해주세요");
							} else {
							$.ajax({
								url:"${pageContext.request.contextPath}/tInformation/updateInfo",
								type:"POST",
								data: formData,
								async:false,
								cache: false,
								contentType: false,
								processData: false,
								success: function(res) {
									if(updateCheck && res == 1) {
										alert("내 정보가 수정되었습니다.");
										window.location.reload();
									} else if(!updateCheck && res == 1) {
										alert("수정된 정보가 없습니다.");
									} else {
										alert("3");
									}
								}
							})
							}
						})
						$("input[type='text']").change(function() {
							updateCheck = true;
						})
						$("#selectCode").change(function() {
							updateCheck = true;
						})
						$("#tea_reg_num2").change(function() {
							updateCheck = true;
						})
						$(document).on("click", "#modalClick", function() {
							$("#dong").val("");
							$("#tbody").empty();
							$("#modalStart").click();
						})
						$(document).on("click", "#searchDong", function() {
							var dong = $("#dong").val();
							$("#tbody").empty();
							$.ajax({
								url:"${pageContext.request.contextPath}/tInformation/searchDong",
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
						   $("#tea_zip").val(zipcode);
						   $("#tea_add1").val(sido + " " + gugun + " " + dong + " " + bunji);
						   $("#tea_add2").val("");
						   $("#modalHide").click();
						});
						
					});
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
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;My page <small>update Information</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/main/main"><i
					class="fa fa-dashboard"></i> My page</a></li>
			<li class="active">내정보수정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
		</ol>
		</section>
		<hr id="hr"></hr>
		<!-- 헤더끝 -->
		<br>
		<br>
		<section class="content">
		<div class="row">
		<section class="col-lg-1 connectedSortable"></section>
			<div class="col-md-3">
				<!-- Profile Image -->
				<div class="box box-info">
					<div class="box-body box-profile">
						<img class="profile-user-img img-responsive img-circle" id="userImage"
							src="${pageContext.request.contextPath}/image/profile-image.png"
							style="height:100px" alt="User profile picture">
						<h3 class="profile-username text-center">${mem_id}</h3>
						<div>
							<input type="file" id="file" name="userImage" >
							<button type="button" id="userImageUpload" class="btn btn-info btn-block">
								<b>프로필 사진 수정</b>
							</button>
						</div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<div class="col-md-7">
				<div class="box box-info">
					<br>

					<form action="#" id="form" method="post">
						<div class="form-group has-feedback" style="margin: 10px">
							<label for="id">아이디</label> 
							<input type="text" name="tea_id"
								class="form-control input-sm" value="${teacherVo.tea_id}" 
								placeholder="ID" readonly> 
								<span class="glyphicon glyphicon-user form-control-feedback"></span>
						</div>
						<div class="form-group has-feedback"
							style="margin: 10px; margin-botton: 0px;">
							<label for="id">현재 비밀번호</label> 
							<input type="password" name="tea_pass" class="form-control input-sm"
								placeholder="Password"> 
								<span class="glyphicon glyphicon-lock form-control-feedback"></span>
						</div>
						<div class="row">
							<div class="col-xs-4" style="margin-left: 10px">
								<label for="id">비밀번호 변경</label> 
								<input type="password" name='pass_update' class="form-control input-sm"
									placeholder="Password Check">
							</div>
							<div class="col-xs-4">
								<label for="id">비밀번호 확인</label> <input type="password"
									name='pass_update_check' class="form-control input-sm"
									placeholder="Password Check">
							</div>
							<div class="form-group" style="margin-top: 22.5px">
								<input type="button" id="updatePassword" class="btn btn-info "
									value="비밀번호 변경">
							</div>
						</div>
						<div class="form-group has-feedback"
							style="margin: 10px; margin-top: 0px">
							<label for="id">이름</label> <input type="text" name="tea_name" id="tea_name"
								class="form-control input-sm" placeholder="Full name"
								value="${teacherVo.tea_name}"> 
								<span class="glyphicon glyphicon-pencil form-control-feedback"></span>
						</div>
						<div class="row">
							<div class="col-xs-4" style="margin-left: 10px">
								<label for="id">주민번호</label> 
								<input type="text" id="tea_reg_num1" name="tea_reg_num1" class="form-control input-sm"
									placeholder="Registration" value="${teacherVo.tea_reg_num1}" readonly>
							</div>
							<div class="col-xs-4" style="margin-top: 20px">
								<label for="id"></label> 
								<input type="password" id="tea_reg_num2" name='tea_reg_num2' class="form-control input-sm"
									placeholder="Number" value="${teacherVo.tea_reg_num2}" readonly>
							</div>
						</div>
						<div class="form-group has-feedback" style="margin: 10px">
						<label for="id">구분</label> 
						<select class="form-control select2" id="selectCode" name="proce_cfy_code" style="width: 100%;" tabindex="-1" aria-hidden="true">
						<c:forEach items="${proceCode}" var="vo">
							<option id="${vo.proce_cfy_code}" value="${vo.proce_cfy_code}">${vo.proce_name}</option>
						</c:forEach>
		                </select>
		                </div>
						<div class="form-group has-feedback" style="margin: 10px">
							<label>생년월일</label>

							<div class="input-group date">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								<input type="text" class="form-control pull-right"
									id="datepicker" name="tea_bir" value="${teacherVo.tea_bir}">
							</div>
							<!-- /.input group -->
						</div>

						<div class="form-group has-feedback" style="margin: 10px">
							<label for="id">전화번호</label> <input type="text" name="tea_tel" id="tea_tel"
								class="form-control input-sm" placeholder="Telephone number"
								value="${teacherVo.tea_tel}"> 
								<span class="glyphicon glyphicon-earphone form-control-feedback"></span>
						</div>
						<div class="form-group has-feedback" style="margin: 10px">
							<label for="id">우편번호</label><input type="text" name="tea_zip" id="tea_zip"
								class="form-control input-sm" placeholder="Address Number"
								readonly value="${teacherVo.tea_zip}">
								<span class="glyphicon glyphicon-map-marker form-control-feedback"></span>
						</div>
						<div class="row">
							<div class="col-xs-4" style="margin-left: 10px">
								<label for="id">주소</label> 
								<input type="text" name="tea_add1" class="form-control input-sm" id="tea_add1s" placeholder="Registration"
									readonly value="${teacherVo.tea_add1}">
							</div>
							<div class="col-xs-4">
								<label for="id">상세주소</label> 
								<input type="text" name='tea_add2' class="form-control input-sm" id="tea_add2" placeholder="Detail Address"
									value="${teacherVo.tea_add2}">
							</div>
							<div class="form-group" style="margin-top: 22.5px">
								<button type="button" id="modalClick" class="btn btn-info">주소찾기</button>
							</div>
						</div>

						<div class="form-group has-feedback"
							style="margin: 10px; margin-top: 0px;">
							<label for="id">이메일</label> <input type="text" name="tea_email" id="tea_email"
								class="form-control input-sm" placeholder="E-mail"
								value="${teacherVo.tea_email}"> 
								<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
						</div>
						<div class="row">
							<!-- /.col -->
							<div class="col-xs-4" id="registerStyle">
								<button type="button" id="register" class="btn btn-info btn-block">저장하기</button>
							</div>
							<!-- /.col -->
						</div>
						
					</form>
				</div>
			</div>
		</div>
		</section>
		
		<a href="#" id="modalStart" data-toggle="modal" data-target="#zipModal"></a>
		<!-- 로그인 모달 시작 -->
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
	</div>
	</div>
<script src="${pageContext.request.contextPath }/plugins/select2/select2.full.min.js"></script>
</body>
</html>