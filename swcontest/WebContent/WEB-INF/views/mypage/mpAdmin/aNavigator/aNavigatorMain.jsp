<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/aNavigatorMain.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<!-- 헤더타이틀시작 -->
	<div class="wrapper">
			<div class="content-wrapper" id="conWBground">
				<br>
				<section class="content-header">
					<h1 id="title">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;네비게이터 관리<small></small>
					</h1>
					<ol class="breadcrumb">
						<li><i class="fa fa-dashboard"></i> 마이페이지</li>
						<li class="active">네비게이터 관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
					</ol>
				</section>
				<hr id="hr"></hr>
				<br> 
				<br>
				<!-- 헤더타이틀끝 -->
				
				<section class="content">
					<div class="row">
					<section class="col-lg-1 connectedSortable"></section>
					<!-- section class="col-lg-10 이거없으면content-wrapper적용안됨 --> 
						<section class="col-lg-6 col-lg-offset-2">			
							<div class="box box-info">
								<div class="nav-tabs-custom">
									<ul class="nav nav-tabs pull-right">
										<li><a href="#aNavigator2" data-toggle="tab">중분류</a></li>
										<li class="active"><a href="#aNavigator1" data-toggle="tab">대분류</a></li>
									</ul>
								</div>
								<!-- /.box-header -->
								
								<!-- tab-content no-padding div시작 -->
								<div class="tab-content no-padding">
								<!-- tab-pane active div시작 -->
									<div class="chart tab-pane active" id="aNavigator1">
										<table class="table table-hover table-striped" >
											<tr>
												<th>분류코드</th>
												<th>종목이름</th>
												<th>구분코드</th>
											</tr>
		
											<tr>
												<td>1</td>
												<td>정보처리기사</td>
												<td>1</td>
											</tr>
										</table>
										<!-- /.대분류끝 -->
										
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
									
										<!-- 검색,text입력시작 -->
										<div class="row" id="option">
											<div class="box-body" id="optionBox">
												<div class="input-group margin" id="searchBtn">
													<input type="text" class="form-control" placeholder="검색"> 
													<span class="input-group-btn">
														<button type="button" class="btn btn-info btn-flat" id="">검색</button>
														<button type="button" class="btn btn-info btn-flat" id="">새로고침</button>
													</span>
												</div>
											</div>
										</div>	
									</div>
									<!-- tab-pane active div시작 -->
			
									<!-- 중분류시작 -->
									<div class="chart tab-pane" id="aNavigator2">
										<table class="table table-hover table-striped" >
											<tr>
												<th class="mailbox-name">구분코드</th>
												<th class="mailbox-subject">분류</th>
											</tr>
											<tr>
												<td class="mailbox-name">1</td>
												<td class="mailbox-subject">기사</td>
											</tr>
										</table>
										<!-- /.table끝 -->
										
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
											<!-- 검색,새로고침시작 -->
											<div class="row" id="option">
											<div class="box-body" id="optionBox">
												<div class="input-group margin" id="searchBtn">
													<input type="text" class="form-control" placeholder="검색"> 
													<span class="input-group-btn">
														<button type="button" class="btn btn-info btn-flat" id="">검색</button>
														<button type="button" class="btn btn-info btn-flat" id="">새로고침</button>
													</span>
												</div>
											</div>
										</div>
										<!-- 검색,새로고침끝 -->
									</div>
									<!-- 중분류끝 -->
								</div>
								<!-- tab-content no-padding div 끝 -->
							</div>
							<!-- /. box 끝-->
					</section>
					<!-- col-lg-10 색션끝 -->
				</div>	
				<!-- row div끝 -->  
			</section>
			<!-- col-lg-1 색션끝-->
		</div>
		 <!-- content-wrapper div 끝 -->
	</div>
	<!-- wrapper 끝-->
</body>
</html>