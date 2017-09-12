<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/cuTnoticeList.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
		<br>
		<section class="content-header">
			<h1 id="title">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;선생님공지사항<small></small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-dashboard"></i> 고객센터</li>
				<li class="active">선생님공지사항&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			</ol>
		</section>
		<hr id="hr"></hr>
		<!-- 헤더끝 -->
		<br>
		<br>
			<section class="content">
			<div class="row">
				<section class="col-lg-1 connectedSortable"></section>
				<section class="col-lg-10"> 
							<div class="nav-tabs-custom">
							</div>

							<div class="chart tab-pane active" id="tnotice"
								style="position: relative;">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th class="mailbox-name">번호
											</td>
											<th class="mailbox-subject">제목
											</td>
											<th class="mailbox-subject">작성자
											</td>
											<th class="mailbox-subject">등록일
											</td>
											<th class="mailbox-subject">조회수
											</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${main}" var="vo" varStatus="status">
										<c:set value="${vo.date}" var="msg"/>
											<tr>
												<td class="mailbox-name">${status.count}</td>
												<td class="mailbox-subject"><a
													href="${pageContext.request.contextPath}/customerCenter/cuTnoticeDetail/${vo.bor_num}">${vo.bor_title}
													<c:if test="${vo.checkFile eq 'y'}">
													&nbsp&nbsp
													<i class="fa fa-fw fa-download"></i>
													</c:if>
													<c:if test="${msg < 3}">
													<p id="ffff" class="badge bg-green" style="margin:0px; padding:0px;">new</p>
													</c:if>
													</a></td>
												<td class="mailbox-subject">${vo.bor_wri_pers}</td>
												<td class="mailbox-subject">${vo.bor_date}</td>
												<td class="mailbox-subject">${vo.bor_chk_con}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="box-footer clearfix no-border">
									<c:set value="${state}" var="id"/>
							 		<c:if test="${id eq 'teacher'}">
										<a href="${pageContext.request.contextPath}/customerCenter/cuTnoticeForm"
											class="btn btn-info pull-right">작성하기</a>
									</c:if>
								</div>
							</div>
				</section>
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
	</div>
	<!-- /.wrapper -->
		<div class="control-sidebar-bg"></div>

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
