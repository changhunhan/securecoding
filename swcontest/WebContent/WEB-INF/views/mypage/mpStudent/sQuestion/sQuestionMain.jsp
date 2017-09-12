<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/sQuestionMain.css">
</head>

<body class="" id="sQuestionMain">
	<div class="wrapper" id="wrapper">
		<!-- 천번째헤더 -->
		<div class="content-wrapper" id="conWBground">
			<br>
			<section class="content-header">
				<h1 id="title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문제풀기<small></small></h1>
				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i> 마이페이지</li>
					<li class="active">문제풀기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				</ol>
			</section>
			<br> 
			<br>
			<!-- 첫번째헤더끝 -->

			<!-- 두번째섹션 -->
			<section class="content" id="secSection">
				<div class="row">
					<!-- ↓앞쪽에 한칸 띄워주므로 지우면안됌 -->
					<section class="col-lg-1 connectedSortable"></section>
					<!-- 선택영역 두번째 헤더시작 -->
					<div class="col-md-10">
						<div class="box box-danger">
							<div class="box-header with-border">
								<h3 class="box-title"></h3>
							</div>
							
							<!-- 박스form start -->
							<form class="form-horizontal">
								<div class="box-body">
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">문제풀기방식</label>
										<div class="col-sm-10" id="checkbox">
											<input type="checkbox" class="minimal-red" checked id="check1">OMR로 풀기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
											<input type="checkbox" class="minimal-red" id="check2"> 한문제씩 풀기
										</div>
										<br>
										<br>
										<br>
										
										 <!-- 분야선택시작 -->
										<label for="inputOption"
											class="col-sm-2 control-label" id="label1">분야선택</label>
										<div class="col-sm-10">
											<div class="input-group margin">
												<div class="input-group-btn">
													<button type="button" class="btn btn-danger" data-toggle="dropdown">
														선택<span class="fa fa-caret-down"></span>
													</button>
													<ul class="dropdown-menu">
														<li><a href="#">선택</a></li>
														<li><a href="#">기사</a></li>
														<li><a href="#">산업기사</a></li>
														<li><a href="#">기능사</a></li>
													</ul>
												</div>
												<input type="text" class="form-control" id="inputOption" placeholder="분야를 선택하세요">
											</div>
										</div>
									</div>
									<!-- 분야선택끝 -->

									<!-- 세부분야선택시작 -->
									<div class="form-group">
										<label for="inputOption2" class="col-sm-2 control-label" id="label2">세부분야선택</label>
										<div class="col-sm-10">
											<div class="input-group margin">
												<div class="input-group-btn">
													<button type="button" class="btn btn-danger" data-toggle="dropdown">
														선택<span class="fa fa-caret-down"></span>
													</button>
													<ul class="dropdown-menu">
														<li><a href="#">정보처리기사</a></li>
														<li><a href="#">인쇄기사</a></li>
														<li><a href="#">메카트로닉스기사</a></li>
													</ul>
												</div>
												<input type="text" class="form-control" id="inputOption" placeholder="세부분야를 선택하세요">
											</div>
										</div>
									</div>
									<!-- 세부분야선택끝 -->

									<!-- 년도지정선택 시작-->
									<div class="form-group">
										<label for="inputPassword3" class="col-sm-2 control-label" id="label3">년도지정</label>
										<div class="col-sm-10">
											<div class="input-group margin">
												<div class="input-group-btn">
													<button type="button" class="btn btn-danger" data-toggle="dropdown">
														선택<span class="fa fa-caret-down"></span>
													</button>
													<ul class="dropdown-menu">
														<li><a href="#">2016년03월06일</a></li>
													</ul>
												</div>
												<input type="Option3" class="form-control" id="inputOption" placeholder="년도를 선택하세요">
											</div>
										</div>
									</div>
									<!-- 년도지정선택 끝-->
									
									<!-- 문제풀러가기버튼 -->
									<div class="box-footer">
										<button type="submit" class="btn btn-block btn-warning btn-lg">문제풀러가기</button>
									</div>
									<!-- 문제풀러가기버튼 -->
							</form>
						</div>
					</div>
					<!-- 두번째box 헤더 끝 -->
					</div>
				</section>
			</div>
		</div>
	</div>
</body>
</html>
