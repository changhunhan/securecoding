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
		<c:if test="${!empty teacherList}">
		var code = "${testCode}";
		var name = "${teacherList.get(0).tea_name}";
 		var prof = $("#teaProf").val();
		var id = "${teacherList.get(0).tea_id}";
		var img = "${teacherList.get(0).tea_intro_img}";
		code = code.substring(code.length - 2, code.length);
		document.getElementById("watch").className = "treeview active";
		document.getElementById(code).className = "active";
		document.getElementById('teacher_id').value = id;
		$("#updateImg").attr("src", "${pageContext.request.contextPath}/filesave/" + img);
		$("#teacher_name").text(name);
		$("#proce_name").text("${proceName}");
		$("#teacher_prof").text(prof);
		</c:if>
	})
	$(document).on("click", "#imgClick", function() {
		var id = $(this).find("#teaId").val();
		var name = $(this).find("#teaName").text();
		var prof  = $(this).find("#teaProf").val();
		var img  = $(this).find("#userImage").attr("src"); 
		
		$("#teacher_name").text(name);
		$("#teacher_prof").text(prof);	
		document.getElementById('teacher_id').value = id;
		$("#updateImg").attr("src", img);
	})
</script>
<body>
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
			<br>
			<section class="content-header">
				<h1 id="title">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${testName}<small>${proceName}</small>
				</h1>
				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i> 강의시청</li>
					<li>${testName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				</ol>
			</section>
			<hr id="hr"></hr>
			<br><br>
			
			<section class="content">
			<div class="row">
				<section class="col-lg-1 connectedSortable"></section>
				<section class="col-lg-8 col-lg-offset-1"> 
				<div class="box box-warning box-solid">
					<div class="box-header">
						<h3 class="box-title">선생님 상세보기</h3>
					</div>
					<div class="box-body">
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-10">
								<table class="table table-inverse" style="margin-top:20px">
									<tbody>
										<tr>
											<td rowspan="3" style="width: 200px">
											<img id="updateImg" src="${pageContext.request.contextPath}/image/profile-image.png"
												style="width: 200px; height: 200px" alt=""></td>
											<th style="width: 20%">선생님 이름 :</th>
											<td id="teacher_name"></td>
										</tr>
										<tr>
											<th>과목 :</th>
											<td id="proce_name"></td>
										</tr>
										<tr>
											<th>경력:</th>
											<td id="teacher_prof"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row">
							<!-- /.col -->
							<form  action="${pageContext.request.contextPath}/video/teacherFakeDetail" method="post">
							<div class="col-xs-5" style="left: 77%; width:150px; margin: 10px">
								<button type="submit" id="register"
									class="btn btn-warning btn-block btn-flat">강의실로 이동</button>
									<input type="hidden" id="teacher_id" name="teacher_id">
							</div>
							</form>
							<!-- /.col -->
						</div>
					</div>
				</div>
				<div class="box box-warning box-solid">
					<div class="box-header">
						<h3 class="box-title">선생님 리스트</h3>
					</div>
					<div class="box-body">
						<div class="col-md-1"></div>
						<div class="col-md-10">
							<section class="no-padding" id="portfolio">
							<div class="container-fluid">
								<div class="row no-gutter popup-gallery">
								<c:choose>
									<c:when test="${empty teacherList}">
										등록된 선생님이 없습니다.
									</c:when>
									<c:otherwise>
									<c:forEach items="${teacherList}" var="teacherVo">
										<div class="col-lg-3 col-md-4 col-sm-6 col-lg-2">
											<a href="#" id="imgClick" class="portfolio-box"> 
											
											<img id="userImage" src="${pageContext.request.contextPath}/filesave/${teacherVo.tea_intro_img}"
												style="width: 100%; height: 180px" class="img-responsive" alt="">
												<div class="portfolio-box-caption">
													<div class="portfolio-box-caption-content">
														<div class="project-category text-faded">${proceName}</div>
														<div class="project-name" id="teaName">${teacherVo.tea_name}</div>
													</div>
												</div>
												<input type="hidden" id="teaId" value="${teacherVo.tea_id}">
												<input type="hidden" id="teaProf" value="${teacherVo.tea_prof}">
											</a>
										</div>
									</c:forEach>
									</c:otherwise>
									</c:choose>
								</div>
							</div>
							</section>
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