<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/updateCurriculum.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
		<br>
		<section class="content-header">
			<h1 id="title">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;동영상 업로드<small>커리큘럼 수정</small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-dashboard"></i> 마이페이지</li>
				<li class="active">강의관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			</ol>
		</section>
		<hr id="hr"></hr>
		<br><br>
		<!-- /.헤더 -->
		
		<section class="content">
		<div class="row">
			<section class="col-lg-2 connectedSortable"></section>
			<section class="col-lg-8"> 
				<div class="box box-primary">
					<br>
					<form action="${pageContext.request.contextPath}/video/curriculum/curriculumUpdateProcess" method="post">
						<div class="form-group has-feedback" style="margin: 10px">
							<label for="id">과목 분야</label> <input type="text" value="${vo.proce_name}" class="form-control input-sm" placeholder="Curriculum subject" readonly>
							<input type="hidden" value="${vo.proce_cfy_code}" name="proce_cfy_code">
						</div>
						<div class="form-group has-feedback" style="margin: 10px">
							<label for="id">커리큘럼 제목</label> 
							<input type="text" name="cur_title" class="form-control input-sm" value="${vo.cur_title}" >
							<input type="text" name="cur_num" id="cur_num" value="${vo.cur_num}" hidden>
						</div>
						<div class="form-group has-feedback" style="margin: 10px">
							<label for="id">커리큘럼 간단 설명</label> 
							<textarea class="textarea" name="cur_poss" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">${vo.cur_poss}</textarea>
						</div>
						<div class="row">
							<!-- /.col -->
							<p style="padding-left: 80%;">
								<button type="button" onclick="location.href='${pageContext.request.contextPath}/mindmapUpdate/${vo.cur_num}'" class="btn btn-primary btn-flat" >마인드맵 수정</button>
								<button type="submit" class="btn btn-primary btn-flat">수정완료</button>
							<p>
							<!-- /.col -->
						</div>
					</form>
				</div>
				</section>
				</div>
				</section>
			</div>
		</div>
</body>


</html>