<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/aStudentMain.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<!-- 헤더타이틀시작 -->
	<div class="wrapper">
		<!-- 배경흰색으로하려고 box씌움 -->
			<div class="content-wrapper" id="conWBground">
				<br>
				<section class="content-header">
					<h1 id="title">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고객 문의 게시판<small>고객 문의 게시판 관리</small>
					</h1>
					<ol class="breadcrumb">
						<li><i class="fa fa-dashboard"></i> 마이페이지</li>
						<li class="active">고객 문의 게시판&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
					</ol>
				</section>
				<hr id="hr"></hr>
				<br> 
				<br>
				<!-- 헤더타이틀끝 -->

				<!-- 문의리스트색션시작 -->
				<section class="content">
					<div class="row">
						<section class="col-lg-1 connectedSortable"></section>
						<!-- section class="col-lg-10 이거없으면content-wrapper적용안됨 --> 
						<section class="col-lg-10">
						<!-- 고객리스트 시작-->
						<div class="box-body no-padding">
							<form name="totalSearch_form" method="POST" id="form">
								<div class="box box-info" id="boxsize">
									<table class="table table-hover">
										<tr id="tr">
											<th>번호</th>
											<th>분류</th>
											<th>제목</th>
											<th>작성자</th>
											<th>등록일</th>
											<th>조회수</th>
										</tr>

										<tr>
											<td>1</td>
											<td>동영상문의</td>
											<td>동영상이안나와요</td>
											<td>오근자</td>
											<td>2016-07-16</td>
											<td>10</td>
										</tr>
									</table>
									<!-- 페이징 -->
									<div class="box-footer clearfix">
										<ul class="pagination pagination-sm no-margin pull-right">
											<li><a href="#">&laquo;</a></li>
											<li><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">&raquo;</a></li>
										</ul>
									</div>
									<!-- 페이징끝 -->
								</div>
							</form>
						</div>
						<!-- 문의리스트 끝--> 
						</section>
				</section>
			<!-- 문의리스트색션끝 -->
		</div>
	</div>
</body>
</html>