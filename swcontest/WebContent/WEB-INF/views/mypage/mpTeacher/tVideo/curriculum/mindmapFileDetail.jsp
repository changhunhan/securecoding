<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

  <!-- /.login-logo -->
 

			<div class="row">
				<div class="col-md-12">
					<div class="box box-success" >
						<form id="fileUpload" method="post" enctype="multipart/form-data" style="width:400px;">
							<div class="box-header">
								 <h3 class="box-title" style="color:#6cb115;">첨부파일보기</h3>
							</div>
							<input type="text" id="midm_ori_num" name="midm_ori_num" hidden>
							<!-- /.box-header -->
							<div class="box-body pad">
								<div class="form-group">
								</div>
								<form>
									<p id="mindmapFile_cont" name="mindmapFile_cont" rows="10" cols="35"></p>
								</form>
							</div>
						</form>
						<div class="box-footer">
							<ul id="file-Detaillist" class="milbox-attachments clearfix" style="list-style: none;">
							</ul>
							<input type="button" id="fileClose"  data-dismiss="modal" hidden/>
						</div>
					</div>
				</div>
			</div>
	
 


</body>
</html>