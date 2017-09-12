<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/cuNoticeList.css">
<head>
<!-- <script>
	var dt = new Date();
	var now = "${vo.bor_date}";
	var nowYear = dt.getYear() - 100;
	var nowMonth = dt.getMonth() + 1;
	var nowDate = dt.getDate();
	var day1 = new Date(nowYear, nowMonth, nowDate);
	var year = parseInt(now.substr(0, 2));
	var month = parseInt(now.substr(3, 2));
	var date = parseInt(now.substr(6, 2));
	var day2 = new Date(year, month, date);
	var diff = day1 - day2;
	var currDay = 24 * 60 * 60 * 1000;
	var num = parseInt(diff / currDay) - 1;
	document.getElementById("ffff").innerHTML = "new";
</script> -->
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
		<br>
		<section class="content-header">
			<h1 id="title">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공지사항<small></small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-dashboard"></i> 고객센터</li>
				<li class="active">공지사항&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
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
										<th class="mailbox-name">공지번호
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
											<td class="mailbox-subject">
												<a href="${pageContext.request.contextPath}/customerCenter/cuNoticeDetail/${vo.bor_num}">${vo.bor_title}
												<c:if test="${vo.checkFile eq 'y'}">
												&nbsp&nbsp
												<i class="fa fa-fw fa-download"></i>
												</c:if>
												&nbsp&nbsp
												<c:if test="${msg < 3}">
													<p id="ffff" class="badge bg-green" style="margin:0px; padding:0px;">new</p>
												</c:if></a></td>
											<td class="mailbox-subject">${vo.bor_wri_pers}</td>
											<td class="mailbox-subject">${vo.bor_date}</td>
											<td class="mailbox-subject">${vo.bor_chk_con}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="box-footer clearfix no-border">
							<c:set value="${mem_id}" var="id"/>
							<c:if test="${id eq 'admin'}">
								<a href="${pageContext.request.contextPath}/customerCenter/cuNoticeForm"class="btn btn-info pull-right">작성</a>
							</c:if>
							</div>
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
