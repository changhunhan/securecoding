<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SWCONTEST</title>
<!-- Tell the browser to be responsive to screen width -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/afterExamDetail.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
		<br>
		<!-- 헤더시작 -->
		<section class="content-header">
			<h1 id="title">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시험후기<small>상세보기</small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-dashboard"></i> 커뮤니티</li>
				<li class="active">시험후기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			</ol>
		</section>
		<!-- /.헤더 -->
		<hr id="hr"></hr>
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
						<c:set value="${mem_id}" var="id"/>
						<c:set value="${examVo.bor_wri_pers}" var="writer"/>
							
					<c:if test="${id eq writer || id eq 'admin'}">	
							
							<a href="${pageContext.request.contextPath}/community/afterExamEdit/${examVo.bor_num}"
								class="btn btn-info pull-right">수정</a> 
							<a href="${pageContext.request.contextPath}/community/afterExamDelete/${examVo.bor_num}"
								class="btn btn-info pull-right">삭제</a> 
					</c:if>
				
					
							<a href="${pageContext.request.contextPath}/community/afterExamForm"
								class="btn btn-info pull-right">새글작성</a> 
							<a href="${pageContext.request.contextPath}/returnAfterexam"
								class="btn btn-info pull-right">목록으로</a>

						</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body no-padding">
						<div class="mailbox-read-info">
							<h3>${examVo.bor_title}
								<span class="mailbox-read-time pull-right">${examVo.bor_chk_con}</span>
							</h3>
							<h5>
								From: ${examVo.bor_wri_pers} <span
									class="mailbox-read-time pull-right">${examVo.bor_date}</span>
							</h5>
						</div>

						<!-- /.mailbox-read-info -->

						<!-- /.mailbox-controls -->
						<div class="mailbox-read-message">${examVo.bor_cont}</div>
						<!-- /.mailbox-read-message -->
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<ul class="mailbox-attachments clearfix">
							<c:forEach items="${fileVo}" var="vo">
								<c:set var="oriname" value="${vo.bor_file_name}" />
								<c:set var="name" value="${fn:substringAfter(oriname,'.')}" />

								<c:choose>
									<c:when test="${name eq 'jpg' || name eq 'png'}">

										<li><span class="mailbox-attachment-icon"> <i
												class="fa fa-file-image-o"></i></span>
											<div class="mailbox-attachment-info">

												<c:url value="/file.do" var="down">
													<c:param name="filename" value="${vo.bor_file_num}"></c:param>
												</c:url>
												<a href="${down}" class="mailbox-attachment-name">
													${vo.bor_file_num } ${vo.bor_file_name} <span
													class="mailbox-attachment-size">
														${vo.bor_file_size} </span>
												</a>

											</div></li>
									</c:when>
									<c:when test="${name eq 'pdf'}">
										<li id="file"><span class="mailbox-attachment-icon">
												<i class="fa fa-file-pdf-o"></i>
										</span>
											<div class="mailbox-attachment-info">

												<c:url value="/file.do" var="down">
													<c:param name="filename" value="${vo.bor_file_num}"></c:param>
												</c:url>
												<a href="${down}" class="mailbox-attachment-name">
													${vo.bor_file_num } ${vo.bor_file_name} <span
													class="mailbox-attachment-size">
														${vo.bor_file_size} </span>
												</a>

											</div></li>
									</c:when>
									<c:when test="${name eq 'hwp'}">
										<li><span class="mailbox-attachment-icon"> <i
												class="fa fa-file-word-o"></i></span>
											<div class="mailbox-attachment-info">

												<c:url value="/file.do" var="down">
													<c:param name="filename" value="${vo.bor_file_num}"></c:param>
												</c:url>
												<a href="${down}" class="mailbox-attachment-name"> <i
													class="fa fa-paperclip"></i> ${vo.bor_file_num }
													${vo.bor_file_name} <span class="mailbox-attachment-size">
														${vo.bor_file_size} </span></a>

											</div></li>
									</c:when>
									<c:when test="${name eq 'xlsx' || name eq 'xls'}">

										<li><span class="mailbox-attachment-icon"> <i
												class="fa fa-file-excel-o"></i></span>
											<div class="mailbox-attachment-info">
												<c:url value="/file.do" var="down">
													<c:param name="filename" value="${vo.bor_file_num}"></c:param>
												</c:url>
												<a href="${down}" class="mailbox-attachment-name">
													${vo.bor_file_num } ${vo.bor_file_name} <span
													class="mailbox-attachment-size">
														${vo.bor_file_size} </span>
												</a>

											</div></li>
									</c:when>
									<c:otherwise>
										<li><span class="mailbox-attachment-icon"> <i
												class="fa fa-file"></i></span>
											<div class="mailbox-attachment-info">
												<c:url value="/file.do" var="down">
													<c:param name="filename" value="${vo.bor_file_num}"></c:param>
												</c:url>
												<a href="${down}" class="mailbox-attachment-name">
													${vo.bor_file_num } ${vo.bor_file_name} <span
													class="mailbox-attachment-size">
														${vo.bor_file_size} </span>
												</a>

											</div></li>
									</c:otherwise>
								</c:choose>

							</c:forEach>
						</ul>
					</div>
					<!-- /.box-footer -->
					<div class="box-footer">
						<div class="box box-success">
							<div class="box-header">
								<i class="fa fa-comments-o"></i>
								<h3 class="box-title">댓글달기</h3>
								<div class="box-tools pull-right" data-toggle="tooltip"
									title="Status">
									<div class="btn-group" data-toggle="btn-toggle"></div>
								</div>
							</div>

							<div class="box-body chat" id="chat-box">
								<div class="box-body no-padding">
									<div class="row">
										<div class="col-md-8">
											<textarea id="lec_comm_cont" name="lec_comm_cont"
												style="width: 93%; height: 100px; margin-left: 20px; resize: none;"></textarea>
										</div>
										<div class="col-md-2">
											<button type="button" id="addComment"
												class="btn btn-block btn-success btn-lg"
												style="width: 93%; height: 100px; margin-left: 20px">작성하기</button>
										</div>
									</div>
									<hr>
									<div id="refresh">
										<c:choose>
											<c:when test="${empty commendList}">
												<div class="col-lg-3"></div>
												<div class="col-lg-5" style="padding-bottom: 50px">
													댓글이 없습니다.</div>
											</c:when>
											<c:otherwise>
												<c:forEach items="${commendList}" var="vo">
													<div class="col-md-10">
														<div class="post">
															<div class="user-block">
																<img class="img-circle img-bordered-sm"
																	src="${pageContext.request.contextPath}/filesave/${vo.comm_img}"
																	alt="user image"> <span class="username">
																	<a>${vo.comm_wri_pers}</a>
																	<c:set value="${mem_id}" var="id"/>
																	<c:set value="${vo.comm_wri_pers}" var="writer"/>
							 										<c:if test="${id eq writer}">
																		<button type="button" id="deleteComment" class="pull-right btn-box-tool" style="border: 0">
																		<i class="fa fa-times"></i>
																	</c:if>
																	</button> <input type="hidden" id="key" value="${vo.comm_num}">
																</span> <span class="description">${vo.comm_date}</span>
															</div>
															<p>${vo.comm_title}</p>
														</div>
													</div>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
						
					</div>
					<!-- /.댓글달기box-footer -->
				</section>
				<!-- /.col-lg-10 -->
				</div>
				<!-- /.box-body -->
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
	<!-- jQuery 2.2.0 -->

<script>
$(function() {
	$(document).on("click", "#addComment", function() {
		var cont = $("#lec_comm_cont").val();
		var date = new Date();
		var num = "${examVo.bor_num}";
		var img="${img.mem_img_rename}";
		date = date.getFullYear() + "-" + pad((date.getMonth()+1),2) + "-" + date.getDate() + " " + pad(date.getHours(),2) + ":" + date.getMinutes() + ":" + pad(date.getSeconds(),2);
		var formData = new FormData();
		
		formData.append("comm_date", date);
		formData.append("comm_title", cont);
		formData.append("bor_num", num);
		formData.append("comm_img", img);
		
		var values = [];
		$.ajax({
			url:"${pageContext.request.contextPath}/commentInsertAjaxs",
			type:"POST",
			data:formData,
			async : false,
			cache : false,
			contentType : false,
			processData : false,
			success: function(res) {
				$("#refresh").empty();
				values = res.borCommen;
				var code = "";
				var id="${mem_id}";
				$.each(values, function(index, value) {
					code += "<div class='col-md-10'>";
					code += "<div class='post'>";
	                code += "<div class='user-block'>";
	                code += "<img class='img-circle img-bordered-sm' src='${pageContext.request.contextPath}/filesave/"+value.comm_img+"' alt='user image'>";
	                code += "<span class='username'>";
	                code += "<a>"+ value.comm_wri_pers +"</a>";
	                if(id==value.comm_wri_pers){
	                	code += "<button type='button' id='deleteComment' class='pull-right btn-box-tool' style='border:0'><i class='fa fa-times'></i></button>";
	                }
	                code += "<input type='hidden' id='key' value='" + value.comm_num + "'>";
	                code += "</span>";
	                code += "<span class='description'>" + value.comm_date + "</span>";
	                code += "</div>";
	                code += "<p>" + value.comm_title + "</p>";
	                code += "</div></div>";
				})
				$('#refresh').html(code);
			} 
		})
		$("#lec_comm_cont").val("");
	})
	
	$(document).on("click", "#deleteComment", function() {
			var key = $(this).parent().find("#key").val();
			if(confirm("삭제하시겠습니까?") == true) {
				$.ajax({
					url:"${pageContext.request.contextPath}/commentDelete",
					type:"POST",
					data:{'key':key},
					success:function(res) {
						alert("삭제되었습니다.");
					}
				})
				$(this).parent().parent().parent().parent().remove();
			} else {
				return;
			} 
		})
	
	})
	
	
	function pad(n, width) {
	  n = n + '';
	  return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
	}		
</script>
	</div>
</body>
</html>
