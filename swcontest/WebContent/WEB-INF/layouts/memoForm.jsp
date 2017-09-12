<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/cuNoticeForm.css">

<head>
</head>
<body>
	<div class="wrapper" id="wrapper">
		<div class="content-wrapper" id="conWBground">
		<br>
			<section class="content">
			<div class="row">
				<section class="col-lg-10"> 
					<form id="uploadBoard" method="post" enctype="multipart/form-data">
						<div class="box-header">
							<!-- tools box -->
							<div class="box-tools pull-right">
								<input type="button" id="uploadBoardClick"
									class="btn btn-info btn-block btn-flat" value="작성완료">
							</div>
							<!-- /. tools -->
						</div>
						
							<!-- /.box-header -->
							<div class="box-body pad">
								<div class="form-group">
									<label for="exampleInputEmail1">Title</label> 
									<input type="text" class="form-control" id="note_rece_pers" placeholder="받는이">
								</div>
								<form>
									<input type="hidden" id="note_send_pers" value="${mem_id}">
									<textarea id="note_cont" rows="10" cols="80"></textarea>
								</form>
							</div>
						</form>
					</section>
				</div>
				</section>
			</div>
		<div class="control-sidebar-bg"></div>
	</div>

</body>
</html>
