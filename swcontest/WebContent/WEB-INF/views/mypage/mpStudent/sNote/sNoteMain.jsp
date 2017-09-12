<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/sNoteMain.css">

</head>
<!-- 헤더시작 -->
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper" id="wrapper">
		<div class="content-wrapper" id="conWBground">
			<br>
			<section class="content-header">
				<h1 id="title">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;오답노트<small></small>
				</h1>
				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i> 마이페이지</li>
					<li class="active">오답노트&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				</ol>
			</section>
			<!-- 헤더끝 -->
			
			<br>
			<br>
			<!-- 옵션선택및 검색시작 -->
			<section class="content">
				<div class="row">
					<section class="col-lg-1 connectedSortable"></section>
					<section class="col-lg-10"> 
						<div class="row" id="option">
							<div class="box-body" id="optionBox">
								<div class="input-group margin">
									<div class="input-group-btn">
										<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
											선택 <span class="fa fa-caret-down"></span>
										</button>
										<ul class="dropdown-menu">
											<li><a href="#">제목</a></li>
											<li><a href="#">번호</a></li>
										</ul>
									</div>
									<input type="text" class="form-control" >
									<span class="input-group-btn">
										<button type="button" class="btn btn-info btn-flat" id="optionBtn">검색</button>
									</span>
								</div>
							</div>
						</div>
					
						<!-- 오답리스트 시작-->
						<section class="col-lg-6 connectedSortable">
							<div class="box-body no-padding">
								<div class="box box-info" id="boxsize">
										<table class="table table-hover">
											<tr>
								             <th>번호</th>
								             <th>제목</th>
								             <th></th>
								          	</tr>
								         
								            <tr>
								             <td>1</td>
								             <td>2015 정보처리기사1회</td>
								       		<td>
									       		<button type="submit" name="search" id="search-btn" class="badge bg-yellow">다시풀기</button>
									          	<button type="submit" name="search" id="search-btn" class="badge bg-red">삭제</button>
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
							</div>
						</section> 
						<!-- 오답리스트 끝-->
						
						<!-- 오답문제풀기 시작-->
						<section class="col-lg-6 connectedSortable">
							<div class="box box-warning" id="detailbox">
							   <div class="box-header with-border">
					              <h3 class="box-title">오답문제풀기</h3>
					              <div class="box-tools pull-right">
					                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
					                </button>
					              </div>
					              <!-- /.box-tools -->
					            </div>
					            <!-- /.box-header -->
					            <div class="box-body">
					             <h6>2016년04월10일 기출문제</h6>
					             <h5 style="font-weight: bold;">1.TCP/IP계층 중 다른 계층에서 동작하는 프로토콜은?</h5><br>
					             	<h5>
						             	가.IP<br>
						             	나.ICMP<br>
						             	다.IGMP<br>
						             	라.IGMP<br>
						             	<br><br>
						             	입력한답:나<br> 
						             	정답 :[ ]
					             	</h5>
					             	<input type="button" class="btn btn-block btn-warning btn-xs" value="정답보기" style="width: 100px;">
					            </div>
							</div>
						</section>
						<!-- 오답문제풀기 끝-->
					</section>
					<!-- col-lg-10 색션끝 -->
				</div>
				<!-- row div끝 -->
			</section>
			<!-- 옵션선택및 검색끝 -->
		</div>
		<!-- content-wrapper끝  -->
	</div>
	<!-- wrapper끝 -->
</body>
</html>