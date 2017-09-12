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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/cmKnowledgeDetail.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
		<br>
		<!-- 헤더시작 -->
		<section class="content-header">
			<h1 id="title">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;나의질문내역<small>상세보기</small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-dashboard"></i> 마이페이지</li>
				<li class="active">나의질문내역&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
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
							<a href="${pageContext.request.contextPath}/sInquire/sInquireDelete/${knowledgeVo.ans_bor_num}" class="btn btn-info pull-right">삭제</a>
							<a href="${pageContext.request.contextPath}/sInquire/sInquireMain" class="btn btn-info pull-right">목록으로</a>
						</div>
					</div>
					<div class="box-body no-padding">
						<div class="mailbox-read-info">
							<h3>${knowledgeVo.ans_bor_title}
								<span class="mailbox-read-time pull-right">${knowledgeVo.ans_bor_chk_con}</span>
							</h3>
							<h5>
								From: ${knowledgeVo.ans_bor_wri_pers} <span
									class="mailbox-read-time pull-right">${knowledgeVo.ans_bor_date}</span>
							</h5>
						</div>

						<!-- /.mailbox-read-info -->

						<!-- /.mailbox-controls -->
						<div class="mailbox-read-message">${knowledgeVo.ans_bor_cont}</div>
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
									<table class="table table-condensed" id="replyList">
										<tr>
											<th>Task</th>
										</tr>
										<c:forEach items="${commendList}" var="cList">
											<tr id="replyItem<c:out value="${cList.comm_num}" />">
												<td>
													<table border="1">
														<tr>
															<td rowspan="2">사진 들어가는 자리</td>
															<td>${cList.comm_wri_pers}</td>
															<td rowspan="2">이미지, 추천수 들어가는 자리</td>
														</tr>
														<tr>
															<td>${cList.comm_date}&nbsp;&nbsp;&nbsp;<%-- 					             			| <a href="${pageContext.request.contextPath}/commentDelete/${cList.comm_num}&${ans_bor_num}"> 삭제</a> --%>
																| <a href="#" onclick="commentDelete();"
																id="#deleteTag"> 삭제</a>
																<form>
																	<input type="hidden" id="ans_bor_num" value="${ans_bor_num}">
																	<input type="hidden" id="comm_num"
																		value="${cList.comm_num}">
																</form>
															</td>
														</tr>
														<tr>
															<td colspan="3">${cList.comm_title}</td>
														</tr>
													</table>
												</td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
						<div class="box-footer">
							<div class="input-group">
								<input class="form-control" id="comm_title" placeholder="댓글"
									name="comm_title">
								<div class="input-group-btn">
									<button type="button" id="btn" class="btn btn-success"
										onclick="commentInsert();">
										<i class="fa fa-plus"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<!-- /.댓글달기box-footer -->
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

		<!-- jQuery 2.2.0 -->

		<script type="text/javascript">
			function commentDelete() {
				var comm_num = $("#comm_num").val();

				$
						.ajax({
							url : "${pageContext.request.contextPath}/commentDeleteAjaxs/"
									+ comm_num + "&${ans_bor_num}",
							type : "post",
							data : {
								"ans_bor_num" : $("#ans_bor_num").val(),
								"comm_num" : $("#comm_num").val()
							},
							success : function(result) {
								if (result == "OK") {
									$("#replyItem" + comm_num).remove();
									alert("삭제되었습니다.");
								} else {
									alert("삭제 노노해");
								}
							}
						})
			}

			function commentInsert() {
				alert("댓글쓰기 버튼 클릭");
				//            					var ans_bor_num = $("#ans_bor_num").val();
				var comm_title = $("#comm_title").val();

				$
						.ajax({
							url : "${pageContext.request.contextPath}/commentInsertAjaxs/${ans_bor_num}&"
									+ comm_title,
							type : "POST",
							data : {
								"ans_bor_num" : $("#ans_bor_num").val(),
								"comm_title" : $("#comm_title").val()
							},
							success : function(result) {
								if (result == null) {
									alert("댓글추가 실패");
								} else {
									$("#replyList")
											.append(
													"<tr id='replyItem"+result+"'>"
															+ "<td>"
															+ "<table border='1'>"
															+ "<tr>"
															+ "<td rowspan='2'>"
															+ "사진들어가는 자리"
															+ "</td>"
															+ "<td>"
															+ result.res_mem_id
															+ "</td>"
															+ "<td rowspan='2'>이미지, 추천수 들어가는 자리</td>"
															+ "</tr>"
															+ "<tr>"
															+ "<td>"
															+ result.res_comm_date
															+ " &nbsp;&nbsp;&nbsp | "
															+ "<a href='#' onclick='commentDelete();' id='#deleteTag'> 삭제</a>"
															+ "</td></tr><tr><td colspan='3'>"
															+ result.res_comm_title
															+ "</td></tr></table></td>"
															+ "</tr>")
									$("#comm_title").attr("value", "");
									//         				            	var div = $("<tr>");
									//         				                div.attr("id", "replyItem" + result);
									//         				                div.appendTo($("#replyList"));
									//         				                div.text($("#rewriter1").val() + " 방금" );
									//         				                div.html("<td><table border='1'><tr><td rowspan='2'>사진들어가는 자리</td><td>작성자</td><td rowspan='2'>이미지, 추천수 들어가는 자리</td></tr><tr><td>작성날짜 &nbsp;&nbsp;&nbsp | <a href='#' onclick='commentDelete();' id='#deleteTag'> 삭제</a></td></tr><tr><td colspan='3'>" + 글내용 + "</td></tr></table></td>");
									alert("댓글추가완료");
								}
							}
						})
			}
		</script>
	</div>
</body>
</html>
