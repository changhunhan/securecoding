
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/aTNoticeMain.css">
<head>

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
		<br>
		<section class="content-header">
			<h1 id="title">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;선생님공지사항 관리<small></small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-dashboard"></i> 고객센터</li>
				<li class="active">선생님공지사항 관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
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
					<!-- /.box-header -->
					
					<div class="tab-content no-padding">
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
												href="${pageContext.request.contextPath}/aTNotice/aTNoticeDetail/${vo.bor_num}">${vo.bor_title}</a></td>
											<td class="mailbox-subject">${vo.bor_wri_pers}</td>
											<td class="mailbox-subject">${vo.bor_date}</td>
											<td class="mailbox-subject">${vo.bor_chk_con}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
					
						</div>
					</div>
					<!-- 작성하기위치 -->
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
