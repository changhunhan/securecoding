<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/sLectureMain.css">

</head>
<!-- 헤더시작 -->
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
		<br>
		<section class="content-header">
			<h1 id="title">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수강회원현황<small></small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-dashboard"></i> 마이페이지</li>
				<li class="active">수강회원현황&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			</ol>
		</section>
		<!-- 헤더끝 -->
		<hr id="hr"></hr>
		<br>
		<br>
			<section class="content">
			<div class="row">
				<section class="col-lg-1 connectedSortable"></section>
				<section class="col-lg-10"> 
					
					<div class="tab-content no-padding">
						<div class="chart tab-pane active" id="notice"
							style="position: relative;">
							<table id="example1"
								class="table table-bordered table-striped">
								<thead>
									<tr>
										<th class="mailbox-name">번호
										</th>
										<th class="mailbox-subject">회원명
										</th>
										<th class="mailbox-subject">회원아이디
										</th>
										<th class="mailbox-subject">강의명
										</th>
										<th class="mailbox-subject">신청일자
										</th>
										<th class="mailbox-subject">진도율
										</th>
										<th class="mailbox-subject">수강현황
										</th>
									</tr>
								</thead>
								<tbody>
									
									<c:forEach items="${curriReq}" var="vo" varStatus="status">
										<c:set var="rate" value="${vo.cur_achie_rate}" />
										<tr>
											<td class="mailbox-name">${status.count}</td>
											<td class="mailbox-subject">${vo.mem_name}</td>
											<td class="mailbox-subject">${vo.mem_id}</td>
											<td class="mailbox-subject">${vo.cur_title}</td>
											<td class="mailbox-subject">${vo.cur_req_date}</td>
											<td class="mailbox-subject">${vo.cur_achie_rate}</td>
											<td class="mailbox-subject">
											 <c:if test="${rate == 100}"> 
												<span class="badge bg-light-blue">수강완료</span>
											</c:if>
											<c:if test="${rate != 100}"> 
												<span class="badge bg-light-blue">수강중</span>
											</c:if>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="box-footer clearfix no-border">
								<a href="#"class="btn btn-info pull-right">작성</a>
							</div>
						</div>
					</div>
					<!-- 작성하기위치 -->
			</section>
			</div>
			<!-- /.box -->
		</section>
		
		</div>
	</div>
	<script>
		$(function() {
			$('#example2').DataTable({
				"stateSave" : true
			});
			$('#example1').DataTable({
				"stateSave" : true
			});
		});
	</script>
	
</body>
</html>