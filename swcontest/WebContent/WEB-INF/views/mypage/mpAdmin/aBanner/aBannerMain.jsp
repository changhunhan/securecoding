<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/aBannerMain.css">
 <!-- Select2 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/select2/select2.min.css">
<!-- Select2 -->
<script src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
<script type="text/javascript">

//Date picker
$(function () {
	$('#datepicker').datepicker({
	  autoclose: true
	});
	$(document).on("click", "#insert", function() {
		var today = new Date();
		var selectDay = new Date($("#datepicker").val());
		var insertDay = selectDay.getFullYear() + pad((selectDay.getMonth() + 1),2) + pad(selectDay.getDay(),2);
		if($("#cont").val() =="") {
			alert("내용을 입력해주세요");
		} else if((selectDay - today) < 0 ) {
			alert("오늘 날짜 이후의 날짜만 선택 가능합니다..");
		} else if($("#datepicker").val() =="") {
			alert("날짜를 입력해주세요")
		} else {
			$.ajax({
				url:"${pageContext.request.contextPath}/aBanner/aBannerInsert",
				type:"POST",
				data:{
					'bann_cont' : $("#cont").val(),
					'bann_date' : insertDay
					},
				success: function(res) {
					window.location.href = '${pageContext.request.contextPath}/aBanner/aBannerMain';
				},
				dataType:'text'
			})
		}
	})
	var maxValue = 12;
	$(document).on("keyup", "#cont", function(e) {
		$("#count").text(maxValue - $("#cont").val().length);
	})
	var rownum = "";
	$(document).on("click", "#table tr", function() {
		   $("#count").text(maxValue - this.getElementsByTagName("td")[1].innerText.length);
		   $("#cont").val(this.getElementsByTagName("td")[1].innerText);
		   var date = new Date(this.getElementsByTagName("td")[2].innerText);
		   date = pad((date.getMonth()+1),2) + "/" + pad(date.getDay(),2) + "/" + date.getFullYear();
		   $("#datepicker").val(date);
		   rownum = $(this).find("#num").val();
		});
	$(document).on("click", "#update", function() {
		var today = new Date();
		var selectDay = new Date($("#datepicker").val());
		var updateDay = selectDay.getFullYear() + pad((selectDay.getMonth() + 1),2) + pad(selectDay.getDay(),2);
		if(rownum == "") {
			alert("수정할 데이터를 클릭해주세요");
		} else if((selectDay - today) < 0 ) {
			alert("오늘 날짜 이후의 날짜만 선택 가능합니다..");
		} else if($("#datepicker").val() =="") {
			alert("날짜를 입력해주세요")
		} else {
			$.ajax({
				url:"${pageContext.request.contextPath}/aBanner/aBannerUpdate",
				type:"POST",
				data:{
					'bann_num'  : rownum,
					'bann_cont' : $("#cont").val(),
					'bann_date' : updateDay
					},
				success: function(res) {
					window.location.href = '${pageContext.request.contextPath}/aBanner/aBannerMain';
				},
				dataType:'text'
			})
		}
	})
	$(document).on("click", "#delete", function() {
		if(rownum =="") {
			alert("삭제할 데이터를 클릭해주세요");
		} else {
			$.ajax({
				url:"${pageContext.request.contextPath}/aBanner/aBannerDelete",
				type:"POST",
				data:{
					'bann_num'  : rownum,
					},
				success: function(res) {
					window.location.href = '${pageContext.request.contextPath}/aBanner/aBannerMain';
				},
				dataType:'text'
			})
		}
	})

});
function pad(n, width) {
	  n = n + '';
	  return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
	}
</script>

</head>

<body class="hold-transition skin-blue sidebar-mini">
	<!-- 헤더타이틀시작 -->
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
			<br>
			<section class="content-header">
			<h1 id="title">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;배너관리<small></small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-dashboard"></i> 마이페이지</li>
				<li class="active">배너관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			</ol>
			</section>
			<hr id="hr"></hr>
			<br> 
			<br>
			<!-- 헤더타이틀끝 -->
			
			<section class="content">
				<div class="row">
					<section class="col-lg-1 connectedSortable"></section>
					<section class="col-lg-6 col-lg-offset-2"> 
						<div class="box-body no-padding">
							<div class="box box-info" id="boxsize">
								<table class="table table-hover" id="table">
									<tr id="tr">
										<th>번호</th>
										<th>내용</th>
										<th>날짜</th>
									</tr>
								<c:forEach items="${banner}" var="bannerVo" varStatus="status">
									<tr>
										<td>${status.count}</td>
										<td>${bannerVo.bann_cont}</td>
										<td>${bannerVo.bann_date}</td>
										<input type="hidden" id="num" value="${bannerVo.bann_num}">
									</tr>
								</c:forEach>
								</table>
								<!-- 페이징끝 -->
							</div>
						</div>
						<br>
						<br>
						<!-- 내용,날짜,구분입력 -->
						<!-- col-lg-offset-* 으로 색션정렬가능-->
						<section class="col-lg-8 col-lg-offset-2">
						  <!-- 구분 -->
			           		<div class="form-group has-error" style="padding-bottom: 10px">
				                <div class="form-group" >
				                	<input type="text" class="form-control pull-right" id="cont" placeholder="내용" maxlength="12">
				                	<label><span id="count">12</span>/12</label>
					            </div>
				            </div>
				              <!-- /.구분 --> 
			            <!-- 날짜 -->
			                <div class="form-group has-error">
				                <div class="input-group date">
				                  <div class="input-group-addon">
				                    <i class="fa fa-calendar"></i>
				                  </div>
				                  <input type="text" class="form-control pull-right" id="datepicker" placeholder="날짜">
	                			</div>
                			</div>
                			<!-- /.날짜 -->
			            	<!-- 내용,날짜,구분입력끝 -->
				            <div id="btn">
				            	<button type="button" id="insert" class="btn btn-danger btn-flat">등록</button>
				            	<button type="button" id="update" class="btn btn-danger btn-flat">수정</button>
				            	<button type="button" id="delete" class="btn btn-danger btn-flat">삭제</button>
			            	</div>
			            	<!--  등록수정삭제버튼끝 -->
			            </section>
					</section>
					<!-- col-lg-10 끝-->
				</div>
				<!-- row끝 -->
			</section>
			<!-- content색션끝 -->
		</div>
		<!-- content-wrapper끝 -->
	</div>
	<!-- wrapper끝 -->
</body>
</html>