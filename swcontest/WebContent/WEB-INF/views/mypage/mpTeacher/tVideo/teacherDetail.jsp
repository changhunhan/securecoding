<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/teacherDetail.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	$(function() {
		var num;
		var title;
		var key;
		$(document).on("click", "#modalClick", function() {
			num = $(this).parent().find("#lec_num").val();
			title = $(this).parent().find("#title").val();
			var code = "";
			$.ajax({
				url:"${pageContext.request.contextPath}/video/curriculum/searchPath",
				type:"POST",
				data: {'num' : num},
				success: function(res) {
					key = res.key;
				    $("#image").empty();
				    code += "<div class='modal-header' class='close'>"
				    code += "<h1 style='color:white'>" + title + "</h1>";
				    code += "</div>";
				    code += "<div class='modal-body'>";
				    code += "<img src='" + res.path + "' style='width:100%; height:100%;'>";
				    code += "</div>";
				    code += "<div class='modal-footer'>";
				    code += "<button type='button' id='insertCurReq' class='btn btn-block btn-danger btn-lg'>";
				    if(res.key == null) {
				    	code += "수강신청하기";
				    } else {
				    	code += "동영상 강의 시청";
				    }
				    code += "</button>";
				    code += "</div>";
				    $("#image").html(code);
				    if(res.state == "student") {
				    	$("#modalStart").click();
				    } else if(res.state == "teacher") {
				    	location.href="${pageContext.request.contextPath}/video/watchVideo?num=" + num;
				    } else if(res.state == "admin") {
				    	location.href="${pageContext.request.contextPath}/video/watchVideo?num=" + num;
				    }
				},
				dataType:'json'
			})
		})
		$(document).on("click", "#insertCurReq", function() {
			if(key == null) {
				var check = confirm("신청하시겠습니까?");
				if(check == true) {
					$.ajax({
						url:"${pageContext.request.contextPath}/video/curriculum/insertCurReq",
						type:"POST",
						data: {'num':num},
						success: function(res) {
							location.href="${pageContext.request.contextPath}/video/watchVideo?num=" + num;
						},
						dataType: 'text'
					})
				}				
			} else {
				location.href="${pageContext.request.contextPath}/video/watchVideo?num=" + num;
			}
		})
	})
</script>
<style>
.modal-header{ 
    background-color: #3C397F; 
 } 
 .modal-body{ 
    background-color: #3C397F; 
 } 
 .modal-footer { 
    background-color: #3C397F; 
 } 
</style>
<body>
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
			<br>
			<section class="content-header">
				<h1 id="title">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${teacherVo.tea_name}선생님
				</h1>
				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i> 강의시청</li>
					<li>${teacherVo.tea_name}선생님&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				</ol>
			</section>
			<hr id="hr"></hr>
			<br><br>
		
			<section class="content">
			<div class="row">
				<section class="col-lg-1 connectedSortable"></section>
				<section class="col-lg-10"> 
				<div class="box box-warning">
				<div class="box-header">
					<h3 class="box-title" id="title2">선생님 상세보기</h3>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-10">
							<table class="table table-inverse" style="margin-top:20px">
								<tbody>
									<tr>
										<td rowspan="3" style="width: 200px">
										<img src="${pageContext.request.contextPath}/filesave/${teacherVo.tea_intro_img}"
											style="width: 200px; height: 200px" alt=""></td>
										<th style="width: 20%">선생님 이름 :</th>
										<td id="teacher_name">${teacherVo.tea_name}</td>
									</tr>
									<tr>
										<th>과목 :</th>
										<td id="proce_name">${teacherVo.proce_name}</td>
									</tr>
									<tr>
										<th>경력:</th>
										<td id="teacher_prof">${teacherVo.tea_prof}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<section class="content">
			<div class="row">
					<div class="box box-warning box-solid">
						<div class="box-header with-border">
							<h3 class="box-title">커리큘럼 리스트</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<div class="col-md-12">
								<c:choose>
									<c:when test="${empty curriculumList}">
										<div class="col-md-1"></div>
										<div class="col-md-10"
											style="text-align: center; opacity: 0.5;">커리큘럼이 없습니다.
											</div>

									</c:when>
									<c:otherwise>
										<c:forEach items="${curriculumList}" var="curVo">
											<!-- MAP & BOX PANE -->
											<div class="box box collapsed-box">
												<div class="box-header with-border">
													<h3 class="box-title">${curVo.cur_title}</h3>

													<div class="box-tools pull-right">
														<button type="button" class="btn btn-box-tool"
															data-widget="collapse">
															<i class="fa fa-plus"></i>
														</button>
													</div>
												</div>
												<!-- /.box-header -->
												<div class="box-body no-padding">
													<div class="row">
														<div class="table-responsive"
															style="padding-right: 20px; padding-left: 20px; border: none;">
															<table class="table table-hover">
																<thead>
																	<th style="width: 30%">강의 번호</th>
																	<th>강의 제목</th>
																</thead>
																<tbody>
																	<%
																		int i = 1;
																	%>
																	<c:forEach items="${lectureList}" var="lecVo">
																		<c:if test="${lecVo.cur_num eq curVo.cur_num}">
																				<tr>
																					<td style="width: 30%"><%=i++%></td>
																					<td><a href="#" id="modalClick" >${lecVo.lec_title}</a>
																					<input type="hidden" name="lec_num" id="lec_num" value="${lecVo.lec_num}"> 
																					<input type="hidden" id="title" value="${curVo.cur_title}">
																					</td>
																				</tr>
																		</c:if>
																	</c:forEach>
																</tbody>
															</table>
														</div>
														<!-- /.col -->
													</div>
													<!-- /.row -->
												</div>
												<!-- /.box-body -->
											</div>
											<!-- end -->
										</c:forEach>
									</c:otherwise>
								</c:choose>
								<a href="#" id="modalStart" data-toggle="modal" data-target="#curReqModal"></a>
								<!-- 로그인 모달 시작 -->
								<div class="modal fade" id="curReqModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog" style="width:60%;">
										<div class="modal-content modal-popup" id="image">
											
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				<!-- /.row -->
			</div>
			</section>
		</section>
		</div>
		</section>
	</div>
</div>

</body>
</html>