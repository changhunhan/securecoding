<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/curriculumList.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://gojs.net/latest/release/go.js"></script>
</head>
<script>
	$(function() {
				$(document).on("click", "#delete", function() {
							var deleteNum = $(this).find("#lec_num").val();
							if (confirm("삭제하시겠습니까?") == true) {
								$.ajax({
											url : "${pageContext.request.contextPath}/video/deleteLecture",
											type : "POST",
											data : {
												'lec_num' : deleteNum
											},
											success : function(res) {
												location.href = "${pageContext.request.contextPath}/video/curriculum/curriculumList";
											},
											dataType : "text"
										})
									}
								})
					$(document).on("click", "#curDelete", function() {
							var num = $(this).parent().find("#curNum").val();
							var cur_num = {
								cur_num : num
							};
							if (confirm("삭제하시겠습니까?") == true) {
								$
										.ajax({
											url : "${pageContext.request.contextPath}/curricullumDelte",
											type : 'POST',
											data : cur_num,
											success : function(res) {
											}
										})
								$(this).parent().find("#remove").click();
							}
						})
			})
</script>
<body>
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
			<br>
			<section class="content-header">
			<h1 id="title">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;강의관리 <small>커리큘럼 리스트</small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-dashboard"></i> 마이페이지</li>
				<li class="active">강의관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			</ol>
			</section>
			<hr id="hr"></hr>
			<br>
			<br>
			<!-- /.헤더 -->

			<!-- 메인content -->
			<section class="content">
			<div class="row">
				<section class="col-lg-1 connectedSortable"></section>
				<section class="col-lg-10">
				<div class="box-header" id="boxheader">
					<h3 class="box-title" id="title2">커리큘럼 리스트</h3>
					<button type="button"
						onclick="location.href='${pageContext.request.contextPath}/video/curriculum/curriculumInsert'"
						class="btn btn-primary pull-right"
						style="background-color: #fff; border: none; color: #f39c12; font-weight: bold;">추가</button>
				</div>
				<br>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="col-md-12">
					<c:choose>
						<c:when test="${empty curriculumList}">
						<div class="col-md-1"></div>
						<div class="col-md-10" style="text-align:center; opacity:0.5;">커리큘럼이 없습니다. 커리큘럼을 추가해주세요</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${curriculumList}" var="curVo">
								   <!-- MAP & BOX PANE -->
						          <div class="box box collapsed-box">
						            <div class="box-header with-border">
						              <h3 class="box-title">${curVo.cur_title}</h3>
						
						              <div class="box-tools pull-right">
						              <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
						              
						                <button type="button" onclick="location.href='${pageContext.request.contextPath}/curriUpdate/${curVo.cur_num}'" class="btn btn-box-tool" ><i class="fa fa-wrench"></i></button>
						                <button type="button" id="curDelete" class="btn btn-box-tool"><i class="fa fa-times"></i></button>
						                <input type="hidden" id="remove" data-widget="remove">
						                
						                <input type="hidden" id="curNum" value="${curVo.cur_num}">
						              </div>
						            </div>
						            <!-- /.box-header -->
						            <div class="box-body no-padding">
						              <div class="row">
						                <div class="table-responsive" style="padding-right:20px; padding-left:20px; border:none;">
						                	<table class="table table-hover">
						                	<thead>
						                		<th style="width:30%">강의 번호</th>
						                		<th>강의 제목</th>
						                		<th><button type="button" onclick="location.href='${pageContext.request.contextPath}/video/lectureUpload?cur_num=${curVo.cur_num}'" class="btn btn-primary pull-right" style="background-color:#76c415; border: none;">강의 추가</button></th>
						                	</thead>
						                	<tbody>
						                	<%
						                		int i = 1;
						                	%>							      
												<c:forEach items="${lectureList}" var="lecVo">
													<c:if test="${lecVo.cur_num eq curVo.cur_num}">
														<form action="${pageContext.request.contextPath}/video/editLecture">
														<tr>
															<td style="width:30%"><%= i++ %></td>
															<td><a href="${pageContext.request.contextPath}/video/watchVideo?num=${lecVo.lec_num}">${lecVo.lec_title}</a></td>
															<td><button type="button" id="delete" class="btn-xs btn-primary pull-right" style="background-color:#f56954; border: none; margin-left:20px;">강의 삭제<input type="hidden" id="lec_num" value="${lecVo.lec_num}"></button><button type="submit" onclick="location.href='${pageContext.request.contextPath}/video/editLecture?lec_num=${lecVo.lec_num}'" id="edit" class="btn-xs btn-primary pull-right" style="background-color:#f39c12; border: none;">강의 수정</button></td>
														</tr>
														</form>
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
				</div>
				</section>
			</div>
			</section>
			</section>
		<!-- /.row --> 
		</div>
	</div>
</body>

</html>