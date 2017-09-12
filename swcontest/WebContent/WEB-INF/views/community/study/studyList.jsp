<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/studyList.css">

<head>

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
		<br>
		<!-- 헤더시작 -->
		<section class="content-header">
			<h1 id="title">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;학습게시판<small></small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-dashboard"></i> 커뮤니티</li>
				<li class="active">학습게시판&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			</ol>
		</section>
		<hr id="hr"></hr>
		<!-- /.헤더 -->
		<br>
		<br>
		<!-- 메인content -->
		<section class="content">
			<div class="row">
			<div class="box-body">
				<section class="col-lg-1 connectedSortable"></section>
				<section class="col-lg-10"> 
					<div class="box-body">
						<div class="nav-tabs-custom">
						</div>
							<div class="chart tab-pane active" id="notice"
								style="position: relative;">
								<table id="example1"
									class="table table-bordered table-striped">
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
											<tr>
												<td class="mailbox-name">${status.count}</td>
												<td class="mailbox-subject"><a
													href="${pageContext.request.contextPath}/community/studyDetail/${vo.bor_num}">${vo.bor_title}
													<c:if test="${vo.checkFile eq 'y'}">
													&nbsp&nbsp
													<i class="fa fa-fw fa-download"></i>
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
									<a
										href="${pageContext.request.contextPath}/community/studyForm"
										class="btn btn-info pull-right">작성하기</a>
								</div>
							</div>
						</div>
						<!-- /.box-body -->
				</section>
				</div>
				<!-- /.box -->
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
