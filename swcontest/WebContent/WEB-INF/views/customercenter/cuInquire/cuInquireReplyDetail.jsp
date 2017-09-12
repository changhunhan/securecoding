<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SWCONTEST</title>
<!-- Tell the browser to be responsive to screen width -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/cuInquireReplyDetail.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
		<br>
		<!-- 헤더시작 -->
		<section class="content-header">
			<h1 id="title">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1:1문의<small>상세보기</small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-dashboard"></i> 고객센터</li>
				<li class="active">1:1문의&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
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
					<div class="box-header with-border">
						<div id="i">
								<i class="fa fa-fw fa-file-text-o"></i> detail content view
						</div>
						<div class="box-tools pull-right">
							
					
							<a href="${pageContext.request.contextPath}/returnInquire" class="btn btn-info pull-right">목록으로</a>
						</div>
					</div>
					<div class="box-body no-padding">
						<div class="mailbox-read-info">
							<h3>${inquireVo.ans_bor_title}
								<span class="mailbox-read-time pull-right">${inquireVo.ans_bor_chk_con}</span>
							</h3>
							<h5>
								From: ${inquireVo.ans_bor_wri_pers} <span
									class="mailbox-read-time pull-right">${inquireVo.ans_bor_date}</span>
							</h5>
						</div>

						<!-- /.mailbox-read-info -->

						<!-- /.mailbox-controls -->
						<div class="mailbox-read-message">${inquireVo.ans_bor_cont}</div>
						<!-- /.mailbox-read-message -->
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<ul class="mailbox-attachments clearfix">
							<c:forEach items="${ansfileVo}" var="vo">
								<c:set var="oriname" value="${vo.ans_bor_file_name}" />
								<c:set var="name" value="${fn:substringAfter(oriname,'.')}" />

								<c:choose>
									<c:when test="${name eq 'jpg' || name eq 'png'}">

										<li><span class="mailbox-attachment-icon"> <i
												class="fa fa-file-image-o"></i></span>
											<div class="mailbox-attachment-info">

												<c:url value="/ansFile.do" var="down">
													<c:param name="filename" value="${vo.ans_bor_file_num}"></c:param>
												</c:url>
												<a href="${down}" class="mailbox-attachment-name">  ${vo.ans_bor_file_num }
													${vo.ans_bor_file_name} <span class="mailbox-attachment-size">
														${vo.ans_bor_file_size} </span></a>

											</div></li>
									</c:when>
									<c:when test="${name eq 'pdf'}">
										<li id="file"><span class="mailbox-attachment-icon">
												<i class="fa fa-file-pdf-o"></i>
										</span>
											<div class="mailbox-attachment-info">

												<c:url value="/ansFile.do" var="down">
													<c:param name="filename" value="${vo.ans_bor_file_num}"></c:param>
												</c:url>
												<a href="${down}" class="mailbox-attachment-name"> 
												 ${vo.ans_bor_file_num }
													${vo.ans_bor_file_name} <span class="mailbox-attachment-size">
														${vo.ans_bor_file_size} </span></a>

											</div></li>
									</c:when>
									<c:when test="${name eq 'hwp'}">
										<li><span class="mailbox-attachment-icon"> <i
												class="fa fa-file-word-o"></i></span>
											<div class="mailbox-attachment-info">

												<c:url value="/ansFile.do" var="down">
													<c:param name="filename" value="${vo.ans_bor_file_num}"></c:param>
												</c:url>
												<a href="${down}" class="mailbox-attachment-name"> <i
													class="fa fa-paperclip"></i> ${vo.ans_bor_file_num }
													${vo.ans_bor_file_name} <span class="mailbox-attachment-size">
														${vo.ans_bor_file_size} </span></a>

											</div></li>
									</c:when>
									<c:when test="${name eq 'xlsx' || name eq 'xls'}">

										<li><span class="mailbox-attachment-icon"> <i
												class="fa fa-file-excel-o"></i></span>
											<div class="mailbox-attachment-info">
												<c:url value="/ansFile.do" var="down">
													<c:param name="filename" value="${vo.ans_bor_file_num}"></c:param>
												</c:url>
												<a href="${down}" class="mailbox-attachment-name">  ${vo.ans_bor_file_num }
													${vo.ans_bor_file_name} <span class="mailbox-attachment-size">
														${vo.ans_bor_file_size} </span></a>

											</div></li>
									</c:when>
									<c:otherwise>
										<li>
										<span class="mailbox-attachment-icon">
											<i class="fa fa-file"></i>
										</span>
											<div class="mailbox-attachment-info">
												<c:url value="/ansFile.do" var="down">
													<c:param name="filename" value="${vo.ans_bor_file_num}"></c:param>
												</c:url>
												<a href="${down}" class="mailbox-attachment-name"> ${vo.ans_bor_file_num }
													${vo.ans_bor_file_name} <span class="mailbox-attachment-size">
														${vo.ans_bor_file_size} </span></a>
											</div>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</div>
					
				</section>
				<!-- /.col-lg-10 -->
			</div>
			<!-- /.box-body -->
			<!-- /.content-wrapper -->
		</div>
		<!-- /.row -->
		<!-- Add the sidebar's background. This div must be placed
      immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
		</section>
		<!-- /.메인content -->
	</div>
	<!-- /.contents wrapper -->
	</div>
	<!-- /. wrapper -->

		
</body>
</html>
