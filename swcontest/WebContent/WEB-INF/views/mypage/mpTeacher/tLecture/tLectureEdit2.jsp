<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/tLectureEdit2.css">
</head>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- 배경흰색으로하려고 box씌움 -->
		<div class="box" id="backBox">
			<div class="box-header"></div>
			<div class="content-wrapper" id="conWBground">
				<br>
				<!-- 타이틀헤더시작 -->
				<section class="content-header">
					<h1 id="title">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;강의관리<small>강의수정</small>
					</h1>
					<ol class="breadcrumb">
						<li><i class="fa fa-dashboard"></i> 마이페이지</li>
						<li class="active">강의관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
					</ol>
				</section>
				<br>
				<br>
				<!-- 타이틀헤더끝 -->
				
				<section class="content">
				<div class="row" id="border">
					<section class="col-lg-1 connectedSortable"></section>
					
					<section class="col-lg-10">
					<form name="totalSearch_form" method="POST" id="trectureOPform">
							<div class="row" id="option">
								<div class="box-body" id="optionBox">
								<!-- 동영상선택옵션 -->
									<div class="input-group margin">
										<div class="input-group-btn">
											<button type="button" class="btn btn-info dropdown-toggle"
												data-toggle="dropdown">
												동영상제목 <span class="fa fa-caret-down"></span>
											</button>
											<ul class="dropdown-menu">
												<li><a href="#">신나는데이터베이스</a></li>
												<li><a href="#">한방에끝내는전자계산</a></li>
											</ul>
										</div>
										<input type="text" class="form-control"> 
									</div>
									<!-- 동영상선택옵션끝 -->
									
									<!-- 파일선택옵션시작 -->
									<div class="input-group margin">
										<div class="input-group-btn">
											<button type="button" class="btn btn-info" >
												파일선택 <span class=""></span></button>
												<!-- 스판 있어야지 버튼이 옆에 나란히 정렬됨 -->
										</div>
										<input type="text" class="form-control" >
											<span class="input-group-btn">
												<button type="button" class="btn btn-info btn-flat" id="optionBtn">선택</button>
											</span> 
									</div>
									<!-- 파일선택옵션끝 -->
									
									<!-- 코멘트시작 -->
									<div class="input-group margin">
										<div class="input-group-btn">
											<button type="button" class="btn btn-info">
												코멘트 <span class=""></span>
											</button>
										</div>
										<input type="text" class="form-control"> 
									</div>
									<br>
									<br>
									<!-- 코멘트끝 -->
									
									<!-- 추천교재이미지 추가삭제버튼 시작 -->
									<div class="input-group margin">
										<label id="font"><i class="fa fa-fw fa-photo"></i> 추천교재사진</label>
										<div class="input-group-btn">
											<button type="button" class="btn btn-info">+</button>&nbsp;&nbsp;
											<button type="button" class="btn btn-info">-</button>
										</div>
									</div>
									<!-- 추천교재이미지 추가삭제버튼 끝 -->
									
									<!-- 교재이미지 시작 -->
									<div class="input-group margin">
										<div class="input-group-btn">
											<button type="button" class="btn btn-info">
												추천교재사진 <span class=""></span>
											</button>
										</div>
										<input type="text" class="form-control">
										<span class="input-group-btn">
												<button type="button" class="btn btn-info btn-flat">선택</button>
										</span>  
									</div>
									<div class="input-group margin">
										<div class="input-group-btn">
											<button type="button" class="btn btn-info">
												추천교재사진 <span class=""></span>
											</button>
										</div>
										<input type="text" class="form-control">
										<span class="input-group-btn">
												<button type="button" class="btn btn-info btn-flat">선택</button>
										</span> 
									</div>
									<div class="input-group margin">
										<div class="input-group-btn">
											<button type="button" class="btn btn-info">
												추천교재사진 <span class=""></span>
											</button>
										</div>
										<input type="text" class="form-control">
										<span class="input-group-btn">
												<button type="button" class="btn btn-info btn-flat">선택</button>
										</span> 
									</div>
									<!-- 교재이미지 끝 -->
									
									  <center>
									  <button type="button" class="btn btn-success btn-normal" id="editBtn">수정</button>
									  <button type="button" class="btn btn-success btn-normal" id="resetBtn">취소</button>
									  </center>
								</div>
							</div>
					</form>
					</section> 
					</section>
				</div>
				
			</div>
		</div>
	</div>

</body>
</html>