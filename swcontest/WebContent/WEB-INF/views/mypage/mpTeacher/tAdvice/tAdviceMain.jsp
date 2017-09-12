<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/tAdviceMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/fullcalendar/fullcalendar.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/fullcalendar/fullcalendar.print.css" media="print">
<style type="text/css">
.fc-slats>table {
	height: 900px;
}

.fc-event, .fc-agenda .fc-event-time, .fc-event a {
	background-color: #40B8D1; /* background color */
	border-color: #40B8D1; /* border color */
	color: #2D2E2D; /* text color */
	font-weight: bold;
}
</style>
</head>
<script>
	$(
			function() {
				$(document)
						.on(
								"click",
								"#checkAdvice",
								function() {
									var start = $(this).parent().find(
											"#tAdvice_start").val();
									var end = $(this).parent().find(
											"#tAdvice_end").val();
									var id = $(this).parent().find(
											"#tAdvice_id").val();
									start = start.replace("T", " ");
									end = end.replace("T", " ");
									var startDate = new Date(start);
									var endDate = new Date(end);
									var curDate = new Date();
									if ((startDate.getYear() == curDate
											.getYear())
											&& ((startDate.getMonth + 1) == (curDate.getMonth + 1))) {
										if (startDate.getHours() - 1 <= curDate
												.getHours()
												&& curDate.getHours() < endDate
														.getHours()) {
											location.href = '${pageContext.request.contextPath}/tAdvice/teacherPage?num='
													+ id;
										} else {
											alert("상담입장가능 시간이 아닙니다.");
										}
									}
								})
			})
</script>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
			<br>
			<section class="content-header">
			<h1 id="title">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상담신청 관리<small></small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> My page</a></li>
				<li class="active">상담신청관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			</ol>
			</section>
			<hr id="hr"></hr>
			<br>
			<section class="content">
			<div class="row">
				<section class="col-lg-5 col-lg-offset-1"> <!-- 						<div class="box box-primary"> -->
				<!-- 							<div class="box-body no-padding" > -->
				<div id="calendar"></div>
				<!-- 							</div> --> <!-- 						</div> --> </section>
				<section class="col-lg-5">
				<div style="height: 705px;">
					<div class="box-header">
						<i class="fa fa-comments-o"></i>
						<h3 class="box-title">Chat</h3>
						<div class="box-tools pull-right" data-toggle="tooltip"
							title="Status">
							<div class="btn-group" data-toggle="btn-toggle">
								<button type="button" class="btn btn-default btn-sm active">
									<i class="fa fa-square text-green"></i>
								</button>
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-square text-red"></i>
								</button>
							</div>
						</div>
					</div>
					<div style="height: 700px; padding: 10px;">
						<!-- chat item -->
						<div id="divScroll">
							<table class="table table-striped">
								<tr>
									<th style="width: 10px">#</th>
									<th colspan="3">상담일자</th>
									<th>신청학생</th>
									<th>신청상태</th>
								</tr>
								<c:forEach items="${advList}" var="vo" varStatus="status">
									<tr>
										<td>${status.count}</td>
										<td>${vo.start}</td>
										<td>~</td>
										<td>${vo.end}</td>
										<td><span class="">${vo.mem_name}</span></td>
										<td>
											<button type="button" style="border: none; background: none;"
												id="checkAdvice">
												<span class="badge bg-yellow" id="doAdv">상담하기</span>
											</button> <input type="hidden" id="tAdvice_start" value="${vo.start}">
											<input type="hidden" id="tAdvice_end" value="${vo.end}">
											<input type="hidden" id="tAdvice_id" value="${vo.id}">
											<button type="button" style="border: none; background: none;">
												<span class="badge bg-red" id="${vo.id}"
													onclick="del(this);">상담취소</span>
											</button>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				</section>
			</div>
			</section>
		</div>
	</div>

	<script type="text/javascript">
		function del(a) {

			var id = $(a).attr("id");
			var del = confirm("상담신청 가능시간을 취소하시겠습니까?");
			if (del == true) {
				$.ajax({
							url : '${pageContext.request.contextPath}/tAdvice/tAdviceMain/tCalDel',
							type : 'POST',
							data : {
								"id" : id
							},
							success : function() {
								alert("삭제 되었습니다");

							}

						})
				document.location.reload();
				$('#calendar').fullCalendar('removeEvents', id);

			} else {
				alert("삭제 취소하였습니다");
			}
		}

		$(function() {
			$('#calendar')
					.fullCalendar(
							{
								header : {
									left : '',
									center : 'prev title next',
									right : 'today'
								},
								height : 700,
								allDaySlot : false,
								disableDragging : true,
								defaultView : 'agendaWeek',
								slotDuration : '01:00:00',
								timeFormat : 'h(:mm)t',
								events : function(start, end, timezone,
										callback) {
									jQuery.ajax({
												url : '${pageContext.request.contextPath}/tAdvice/tAdviceMain/tCalList',
												type : 'POST',
												dataType : 'json',
												success : function(doc) {
													console.dir(doc);
													var events = [];
													$.each(doc, function(i, r) {
														events.push({
															id : r.id,
															title : r.title,
															start : r.start,
															end : r.end
														});
													});
													console.log(events.length);
													callback(events);
												}
											});
								},
								// 등록되어있는 상담 삭제하기
								eventClick : function(calEvent, jsEvent, view) {

									var del = confirm("상담신청 가능시간을 취소하시겠습니까?");
									if (del == true) {
									     	$.ajax({
													url : '${pageContext.request.contextPath}/tAdvice/tAdviceMain/tCalDel',
													type : 'POST',
													data : {
														"id" : calEvent.id
													},
													success : function() {
														alert("삭제 되었습니다");

													}

												})
										document.location.reload();
										$('#calendar').fullCalendar(
												'removeEvents', calEvent._id);

									} else {
										alert("삭제 취소하였습니다");
									}
								},
								dragScroll : false,
								selectable : true,
								selectConstraint : {
									start : '00:01',
									end : '23:59',
								},
								eventConstraint : {
									start : '0:00',
									end : '24:00'
								},
								select : function(start, end, allDay) {
									var today = new Date();
									var timeLimit = ((end - start) / 1000 / 60);
									console.log(start - today - 33000000);
									if ((start - today - 33000000) > 0) {
										if (timeLimit > 60) {
											alert("신청가능시간을 초과하였습니다 한시간 단위로 등록해주세요");
										} else {
											var insert = confirm("상담가능시간으로 설정하겠습니까?");
											if (insert == true) {
												$
														.ajax({
															url : '${pageContext.request.contextPath}/tAdvice/tAdviceMain/tCalInsert',
															type : 'POST',
															data : {
																start : start
																		.format(),
																end : end
																		.format()
															},
															success : function() {
															}
														})
												$("#calendar").fullCalendar(
														'renderEvent',
														{
															title : '상담가능',
															start : start
																	.format(),
															end : end.format()
														}, true // make the event "stick"
												);
												$("#calendar").fullCalendar(
														'unselect');
											}
										}
									} else {
										alert("선택 불가능");
									}
								}
							})
		});
	</script>
	<script
		src="${pageContext.request.contextPath}/dist/js/pages/dashboard.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
</body>
</html>