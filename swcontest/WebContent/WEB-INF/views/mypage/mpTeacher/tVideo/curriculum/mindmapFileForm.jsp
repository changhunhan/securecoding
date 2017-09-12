<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mindmapFileForm.css">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>SWCONTEST loginPage</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  
</head>
<body class="hold-transition login-page">
<div class="login-box">  
  <!-- /.login-logo -->
  <div class="login-box-body">
    <section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
						<form id="fileUpload" method="post" enctype="multipart/form-data">
							<div class="box-header">
								<!-- tools box -->
								<!-- /. tools -->
							</div>
							<input type="text" id="midm_ori_num" name="midm_ori_num" hidden>
							<input type="text" id="midm_perent_num" name="midm_perent_num" hidden>
							<!-- /.box-header -->
							<div class="box-body pad">
								<div class="form-group">
									<fieldset id="fileset">
										<input type="file" id="uploadFiles"><br>
									</fieldset>
								</div>
								<form>
									<center><textarea id="mindmap_cont" name="mindmap_cont" rows="10" cols="35"></textarea></center>
								</form>
							</div>
						</form>
						
						<div class="box-footer">
							<input type="text" id="fileSubName" name="fileSubName" hidden>
							<ul id="file-list" class="milbox-attachments clearfix" style="list-style: none;"></ul>
							<input type="button" id="fileClose"  data-dismiss="modal" hidden/>
							<center>
								<input type="button" id="fileUploadClick" class="btn btn-primary" value="작성완료"><br>
							</center>
						</div>
					</div>
				</div>
			</div>
	 </section>
  </div>
</div>
</body>
</html>