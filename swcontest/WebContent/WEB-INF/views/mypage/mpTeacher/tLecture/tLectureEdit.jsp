<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/tLectureEdit.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
			<br>
			<section class="content-header">
			<h1 id="title">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;강의관리<small>강의수정</small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-dashboard"></i> 마이페이지</li>
				<li class="active">강의관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			</ol>
			</section>
			<br> <br>
			<section class="content">
			<div class="row" id="border">
				<section class="col-lg-1 connectedSortable"></section>
				<section class="col-lg-10"> 
				<form name="totalSearch_form" method="POST" id="trectureOPform">
						<div class="row" id="option">
							<div class="box-body" id="optionBox">
							<!-- 커리큘럼선택옵션 -->
								<div class="input-group margin">
									<div class="input-group-btn">
										<button type="button" class="btn btn-info dropdown-toggle"
											data-toggle="dropdown">
											커리큘럼제목 <span class="fa fa-caret-down"></span>
										</button>
										<ul class="dropdown-menu">
											<li><a href="#">신나는데이터베이스</a></li>
											<li><a href="#">한방에끝내는전자계산</a></li>
										</ul>
									</div>
									<input type="text" class="form-control"> 
								</div>
								<!-- 커리큘럼선택옵션끝 -->
								
								<!-- 구분선택옵션시작 -->
								<div class="input-group margin">
									<div class="input-group-btn">
										<button type="button" class="btn btn-info dropdown-toggle"
											data-toggle="dropdown">
											구분 <span class="fa fa-caret-down"></span>
										</button>
										<ul class="dropdown-menu">
											<li><a href="#">기사</a></li>
											<li><a href="#">산업기사</a></li>
											<li><a href="#">기능사</a></li>
										</ul>
									</div>
									<input type="text" class="form-control"> 
								</div>
								<!-- 구분선택옵션끝 -->
								
								<!-- 종류선택옵션시작 -->
								<div class="input-group margin">
									<div class="input-group-btn">
										<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
											종류 <span class="fa fa-caret-down"></span>
										</button>
										<ul class="dropdown-menu">
											<li><a href="#">정보처리기사</a></li>
										</ul>
									</div>
									<input type="text" class="form-control"> 
								</div>
								<!-- 구분선택옵션끝 -->
								
								<!-- 마인드맵박스시작 -->
								  <div class="box">
							        <div class="box-header with-border">
							          <h3 class="box-title">마인드맵어쩔꼬얍</h3>
							          <div class="box-tools pull-right">
							            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
							              <i class="fa fa-minus"></i></button>
							            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
							              <i class="fa fa-times"></i></button>
							          </div>
							        </div>
							        <div class="box-body">
							          	그게 여기 박스에 넣어질까?
							          	<br>
							          	<br>
							          	<br>
							          	<br>
							          	<br>
							          	<br>
							          	<br>
							        </div>
							        <!-- /.box-body -->
							        <div class="box-footer">
							          Footer
							        </div>
							        <!-- /.box-footer-->
							      </div>
								  <!-- 마인드맵박스 끝 -->
								  <center>
								  <button type="button" class="btn btn-success btn-normal" id="editBtn">수정</button>
								  <button type="button" class="btn btn-success btn-normal" id="resetBtn">취소</button>
								  </center>
							</div>
						</div>
				</form>
				</section>
			</div>
			</section>
		</div>
	</div>

</body>
</html>