<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/main.css">
<script>
	$('.carousel').carousel({
		interval: 3000
	})
</script>
</head>
<body>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper" id="conWBground">
	
	<br>
	

			<!-- Main content -->
			<section class="content">
			<div class="row">
				<section class="col-lg-1 connectedSortable"></section>
				<section class="col-lg-10"> 
			
			<section class="content">
			<div class="col">
				<!-- /.col -->
				<div class="col-md-6">
					<div class="box box-info">
						<div class="nav-tabs-custom">
							<ul class="nav nav-tabs pull-right">
								<li><a href="#tea_notice" data-toggle="tab">선생님 공지사항</a></li>
								<li class="active"><a href="#notice" data-toggle="tab">공지사항</a></li>
							</ul>
						</div>
						<!-- /.box-header -->
						<div class="tab-content no-padding">
							<!-- Morris chart - Sales -->
							<div class="chart tab-pane" id="tea_notice" style="position: relative;">
								<table class="table table-hover table-striped">
									<thead>
										<th class="mailbox-name">번호</th>
										<th class="mailbox-subject">제목</th>
										<th class="mailbox-subject">작성자</th>
										<th class="mailbox-subject">등록일</th>
										<th class="mailbox-subject">조회수</th>
									</thead>
									<tbody>
										<c:forEach items="${tNotice}" var="vo" end="2">
										<tr>
											<td class="mailbox-name">${vo.bor_num}</td>
											<td class="mailbox-subject"><a href="${pageContext.request.contextPath}/customerCenter/cuNoticeDetail/${vo.bor_num}">${vo.bor_title}</a></td>
											<td class="mailbox-subject">${vo.bor_wri_pers}</td>
											<td class="mailbox-subject">${vo.bor_date}</td>
											<td class="mailbox-subject">${vo.bor_chk_con}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
								<div class="box-footer clearfix no-border">
								<a href="${pageContext.request.contextPath}/returntNotice" class="btn btn-default pull-right">more</a>
							</div>
								<!-- /.table -->
							</div>
							

							<div class="chart tab-pane active" id="notice"
								style="position: relative;">
								<table class="table table-hover table-striped">
									<thead>
										<th class="mailbox-name">번호</th>
										<th class="mailbox-subject">제목</th>
										<th class="mailbox-subject">작성자</th>
										<th class="mailbox-subject">등록일</th>
										<th class="mailbox-subject">조회수</th>
									</thead>
									<tbody>
									<c:forEach items="${notice}" var="vo" end="2">
										<tr>
											<td class="mailbox-name">${vo.bor_num}</td>
											<td class="mailbox-subject"><a href="${pageContext.request.contextPath}/customerCenter/cuNoticeDetail/${vo.bor_num}">${vo.bor_title}</a></td>
											<td class="mailbox-subject">${vo.bor_wri_pers}</td>
											<td class="mailbox-subject">${vo.bor_date}</td>
											<td class="mailbox-subject">${vo.bor_chk_con}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
								
								<div class="box-footer clearfix no-border">
								<a href="${pageContext.request.contextPath}/returnNotice" class="btn btn-default pull-right">more</a>
							</div>
								<!-- /.table -->
							</div>
						</div>
						
					</div>
					<!-- /. box -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

			<div class="col">
				<!-- /.col -->
				<div class="col-md-6">
					<div class="box box-info">
						<div class="box-header with-border">
							<h3 class="box-title">최근에 시청한 강의</h3>
							<!-- /.box-tools -->
						</div>
						<!-- /.box-header -->
						<div class="box-body no-padding">
							<div class="table-responsive mailbox-messages">
								<table class="table table-hover table-striped">
									<thead>
										<th>번호</th>
										<th>동영상 제목</th>
										<th>선생님 이름</th>
									</thead>
									<tbody>
									<c:forEach items="${lecWatList}" var="vo" varStatus="status" end="2">
										<tr>
											<td class="mailbox-name">${status.count}</td>
											<td class="mailbox-subject"><a href="${pageContext.request.contextPath}/video/watchVideo?num=${vo.lec_num}">${vo.lec_title}</a></td>
											<td class="mailbox-attachment">${vo.tea_name}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
								<!-- /.table -->
							</div>
							<!-- /.mail-box-messages -->
						</div>
					</div>
					<!-- /. box -->
				</div>
				<!-- /.col -->
			</div>
			</section>
			<!-- /.content -->
		</section>
		</div>
		</section>
		
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
		
</body>
</html>
