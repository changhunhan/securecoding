<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/tLectureMain.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- 배경흰색으로하려고 box씌움 -->
		<div class="box" id="backBox">
			<div class="box-header"></div>
			<div class="content-wrapper" id="conWBground">
				<br>
				<section class="content-header">
				<h1 id="title">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;강의관리<small>커리큘럼</small>
				</h1>
				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i> 마이페이지</li>
					<li class="active">강의관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				</ol>
				</section>
				<hr id="hr"></hr>
				<br> 
				<br>
				<!--커리큘럼리스트 -->
				<section class="content">
				<div class="row">
					<section class="col-lg-1 connectedSortable"></section>
					<section class="col-lg-10"> 
					<section class="col-lg-12">
						<form name="totalSearch_form" method="POST" id="trectureOPform">
							<table>
								<div class="row" id="option">
									<div class="box-body" id="optionBox">
										<div class="input-group margin">
											<div class="input-group-btn">
												<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
													선택 <span class="fa fa-caret-down"></span>
												</button>
												<ul class="dropdown-menu">
													<li><a href="#">번호</a></li>
													<li><a href="#">제목</a></li>
												</ul>
											</div>
											<input type="text" class="form-control" >
											<span class="input-group-btn">
												<button type="button" class="btn btn-info btn-flat" id="optionBtn">검색</button>
											</span>
										</div>
									</div>
								</div>
							</table>
						</form>
					
						<div class="box-body no-padding">
							<form name="totalSearch_form" method="POST" id="form">
								<div class="box box-info" id="boxsize">
									<table class="table table-hover">
										<tr id="tr">
											<th>번호</th>
											<th>강의명</th>
											<th>강의보기</th>
											<th>시간[분]</th>
											<th></th>
										</tr>
										
										<tr>
											<td><td><td><td id="tdc">제1과목 커리큘럼</td></td></td></td>
											<td>
												<button type="button" class="btn btn-info btn-flat"><a href="${pageContext.request.contextPath }/tLecture/tLectureEdit" id="link">수정</a></button>
												<button type="button" class="btn btn-info btn-flat">삭제</button>
											</td>
										</tr>
											
										<tr>
											<td>01</td>
											<td>데이터베이스</td>
											<td>
												<img src="${pageContext.request.contextPath }/image/icons/play2.png" alt="동영상시청">&nbsp;&nbsp;&nbsp;
												<img src="${pageContext.request.contextPath }/image/icons/icon-download2.png" alt="다운로드">
											</td>
											<td>45</td>
											<td>
												<button type="button" class="btn btn-info btn-flat"><a href="${pageContext.request.contextPath }/tLecture/tLectureEdit2" id="link">수정</a></button>
												<button type="button" class="btn btn-info btn-flat">삭제</button>
											</td>
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
						<!-- 고객리스트 끝--> 
					</div>
				</section>
			</div>
		</div>
	</div>
</body>
</html>