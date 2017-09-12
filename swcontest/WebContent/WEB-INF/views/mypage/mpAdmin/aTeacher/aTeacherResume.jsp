<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/aTeacherMain.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<!-- 헤더타이틀시작 -->
	<div class="wrapper">
		<!-- 배경흰색으로하려고 box씌움 -->
		<div class="box" id="backBox">
			<div class="box-header"></div>
			<div class="content-wrapper" id="conWBground">
				<br>
				<section class="content-header">
					<h1 id="title">
						&nbsp;&nbsp;&nbsp;&nbsp;강사관리<small></small>
					</h1>
					<ol class="breadcrumb">
						<li><i class="fa fa-dashboard"></i> 마이페이지</li>
						<li class="active">강사관리</li>
					</ol>
				</section>
				<hr id="hr"></hr>
				<br> 
				<br>
				<!-- 헤더타이틀끝 -->

				<section class="col-lg-1 connectedSortable"></section>
				<!-- section class="col-lg-10 이거없으면content-wrapper적용안됨 --> 
				<section class="col-lg-10">
				<div class="nav-tabs-custom">
    				<ul class="nav nav-tabs">
					     <li><a href="#resume" data-toggle="tab">이력서보관함</a></li>
					</ul>
					
				<div class="tab-content">
					<div class="tab-pane" id="resume">
						<!-- 강사리스트 시작-->
						<div class="box-body no-padding">
							<form name="totalSearch_form" method="POST" id="form">
								<div class="box box-success" id="boxsize">
									<table class="table table-hover">
										<tr id="tr">
											<th>강사이름</th>
											<th>강사ID</th>
											<th>강사비밀번호</th>
											<th>전화번호</th>
											<th>주소</th>
											<th>이메일</th>
										</tr>

										<tr>
											<td>김종혁</td>
											<td>kjh</td>
											<td>1234</td>
											<td>010-222-1111</td>
											<td>대전</td>
											<td>kjh@naver.com</td>
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
						<!-- 강사리스트 끝--> 
						
							<form name="totalSearch_form" method="POST" id="form2">
							<!-- 검색,text입력시작 -->
								<div class="row" id="option">
									<div class="box-body" id="optionBox">
										<div class="input-group margin" id="searchBtn">
											<input type="text" class="form-control" placeholder="검색"> 
											<span class="input-group-btn">
												<button type="button" class="btn btn-success btn-flat" id="optionBtn">검색</button>
											</span>
										</div>
									</div>
								</div>	
									
							  <div class="box-body">
							  	<div class="row">
									<div class="col-xs-2">
										<input type="text" class="form-control" placeholder="회원이름">
									</div>
									<div class="col-xs-2">
										<input type="text" class="form-control" placeholder="ID">
									</div>
									<div class="col-xs-2">
										<input type="text" class="form-control" placeholder="고객비밀번호">
									</div>
									<div class="col-xs-2">
										<input type="text" class="form-control" placeholder="전화번호">
									</div>
									<div class="col-xs-4">
										<input type="text" class="form-control" placeholder="이메일">
									</div>
								</div>
							  </div> 
							  <!-- 검색,text입력끝 -->
	
								<!-- 주소text입력,등록,수정삭제버튼시작-->
								<div class="input-group margin">
									<input type="text" class="form-control" placeholder="주소"> 
									<span class="input-group-btn">
										<button type="button" class="btn btn-info btn-flat" id="success">등록</button>
										<button type="button" class="btn btn-info btn-flat" id="edit">수정</button>
										<button type="button" class="btn btn-info btn-flat" id="del">삭제</button>
									</span>
								</div>
								<!-- 주소text입력,등록,수정삭제버튼끝-->
							</form>
						</div>
						<!-- 강사리스트 및 검색,완료,수정,삭제 색션끝 -->
			    	</div>
			    	<!-- tab-content끝 -->
				</div>
				 <!-- 배경boxdiv끝 -->
			</section>	  
			<!-- col-lg-10 색션끝 -->
		</div>
		 <!-- content-wrapper div 끝 -->
	</div>
	<!-- 배경 box끝 -->
</div>
<!-- wrapper 끝-->
	
</body>
</html>