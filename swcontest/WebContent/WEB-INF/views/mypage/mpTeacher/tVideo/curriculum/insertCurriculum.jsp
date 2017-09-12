<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/insertCurriculum.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrappers">
		<div class="content-wrapper" id="conWBground">
		<br>
		<section class="content-header">
			<h1 id="title">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;강의관리<small>커리큘럼 추가</small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-dashboard"></i> 마이페이지</li>
				<li class="active">강의관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			</ol>
		</section>
		<hr id="hr"></hr>
		<br><br>
		<!-- /.헤더 -->
		
		<!-- 메인content -->
		<section class="content">
		<div class="row">
			<section class="col-lg-2 connectedSortable"></section>
			<section class="col-lg-8"> 
				<div class="box box-primary">
					<br>
					<form action="${pageContext.request.contextPath}/video/curriculum/curriculumInsertProcess" method="post">
						<div class="form-group has-feedback" style="margin: 10px">
							<label for="id">과목 분야</label> <input type="text" value="${vo.proce_name}" class="form-control input-sm" placeholder="Curriculum subject" readonly>
							<input type="hidden" value="${vo.proce_cfy_code}" name="proce_cfy_code">
						</div>
						<div class="form-group has-feedback" style="margin: 10px">
							<label for="id">커리큘럼 제목</label> <input type="text" name="cur_title"
								class="form-control input-sm" placeholder="Curriculum Title">
						</div>
						<div class="form-group has-feedback" style="margin: 10px">
							<label for="id">커리큘럼 간단 설명</label> 
							<textarea class="textarea" name="cur_poss" placeholder="Place some text here" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
						</div>
						<div class="row">
							<!-- /.col -->
							<div class="col-xs-2" id="register">
								<button type="submit" class="btn btn-primary btn-block btn-flat">저장</button>
							</div>
							<!-- /.col -->
						</div>
					</form>
				</div>
				</section>
			</div>
			</section>
		</div>
		</section>
		</div>
	</div>
</body>


</html>