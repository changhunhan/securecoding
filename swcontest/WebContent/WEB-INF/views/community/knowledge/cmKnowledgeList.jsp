<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/cmKnowledgeList.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
		<br>
		<!-- 헤더시작 -->
		<section class="content-header">
			<h1 id="title">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지식인<small></small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-dashboard"></i> 커뮤니티</li>
				<li class="active">지식인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
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
						<div class="nav-tabs-custom">
							
						</div>
						<div class="tab-content no-padding">
							<div class="chart tab-pane active" id="notice" style="position: relative;">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th class="mailbox-name">번호</th>
											<th class="mailbox-subject">질문</th>
											<th class="mailbox-subject">작성자</th>
											<th class="mailbox-subject">등록일</th>
											<th class="mailbox-subject">조회수</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${main}" var="vo" varStatus="status">
										<tr>
											<td class="mailbox-name">${status.count}</td>
											
											<c:set var="space" value=""></c:set>
										    <c:forEach begin="1" end="${vo.ans_bor_next_num}">
										       <c:set var="space" value="${space}&nbsp;&nbsp;&nbsp;"></c:set>
										    </c:forEach>
											<td class="mailbox-subject">
												${space}
												<c:if test="${vo.ans_bor_next_num ne '0'}">
												<img alt="" src="${pageContext.request.contextPath}/image/replyArrow.jpg">
													<a href="${pageContext.request.contextPath}/community/cmKnowledgeReplyDetail/${vo.ans_bor_num}">
													${vo.ans_bor_title}
													<c:if test="${vo.checkFile eq 'y'}">
													&nbsp&nbsp
													<i class="fa fa-fw fa-download"></i>
													</c:if>
												</a>
												</c:if>
											<c:if test="${vo.ans_bor_next_num eq '0'}">
														<a href="${pageContext.request.contextPath}/community/cmKnowledgeDetail/${vo.ans_bor_num}">
														${vo.ans_bor_title}
														<c:if test="${vo.checkFile eq 'y'}">
														&nbsp&nbsp
														<i class="fa fa-fw fa-download"></i>
														</c:if>
														 </a>
											   </c:if>
											
											</td>
											<td class="mailbox-subject">${vo.ans_bor_wri_pers}</td>
											<td class="mailbox-subject">${vo.ans_bor_date}</td>
											<td class="mailbox-subject">${vo.ans_bor_chk_con}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
								<div class="box-footer clearfix no-border">
								<c:set value="${state}" var="id"/>
							 		<c:if test="${id eq 'student' || id eq 'admin'}">
									<a 
										href="${pageContext.request.contextPath}/community/cmKnowledgeForm" 
									    class="btn btn-info pull-right">작성</a>
									    </c:if>
								</div>
							</div>
						</div>
						<!-- /.box-body -->
				</section>
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
