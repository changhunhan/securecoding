<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/sLectureMain.css">

</head>
<!-- 헤더시작 -->
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
		<br>
		<section class="content-header">
			<h1 id="title">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수강신청현황<small></small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-dashboard"></i> 마이페이지</li>
				<li class="active">수강신청현황&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
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
					
					<div class="tab-content no-padding">
						<div class="chart tab-pane active" id="notice"
							style="position: relative;">
							<table id="example1"
								class="table table-bordered table-striped">
								<thead>
									<tr>
										<th class="mailbox-name">번호
										</td>
										<th class="mailbox-subject">강사명
										</td>
										<th class="mailbox-subject">강의명
										</td>
										<th class="mailbox-subject">신청일자
										</td>
										<th class="mailbox-subject">진도율
										</td>
										<th class="mailbox-subject">수강현황
										</td>
									</tr>
								</thead>
								<tbody>
									
									<c:forEach items="${curr}" var="vo" varStatus="status">
									<c:set var="rate" value="${vo.cur_achie_rate}" />
										<tr>
											<td class="mailbox-name">${status.count}</td>
											<td class="mailbox-subject">${vo.mem_id}</td>
											<td class="mailbox-subject">${vo.cur_num}</td>
											<td class="mailbox-subject">${vo.cur_req_date}</td>
											<td class="mailbox-subject">${vo.cur_achie_rate}</td>
											<td class="mailbox-subject">
											
											<c:if test="${rate == 100}"> 
												<span class="badge bg-light-blue">수강완료</span>
												
											</c:if>
											<c:if test="${rate != 100}"> 
												<span class="badge bg-light-blue">수강중</span>
											</c:if>
											<button type="button" style="background:none; border:none;" onclick="filedel(this,${vo.cur_req_num},${vo.lec_wat_num});"><span class="badge bg-red">수강 취소</span></button>
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
		
		</div>
	</div>
	<script>
		$(function() {
			$('#example2').DataTable({
				"stateSave" : true
			});
			$('#example1').DataTable({
				"stateSave" : true
			});
		});
		
		function filedel(obj,num,num2){	
			
			var value={cur_req_num:num, lec_wat_num:num2};
			if(confirm("삭제하시겠습니까?") == true) {
				$.ajax({
			    	url : "${pageContext.request.contextPath}/sLecture/curriDelte",
			    	type :'POST',
			    	data : value,
			    	success : function(res) {
			    		$(obj).parent().parent().remove();
			    	}
				})
			}
			
			
		}
	</script>
	
</body>
</html>