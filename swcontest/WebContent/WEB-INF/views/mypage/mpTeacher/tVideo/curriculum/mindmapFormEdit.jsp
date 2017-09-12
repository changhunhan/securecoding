<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mindmapFormEdit.css">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>SWCONTEST loginPage</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
  <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
</head>
<body class="hold-transition login-page">
<div class="login-box">

  <div class="login-logo">
    <a href="index.jsp">
    <h2 id="h2Style">글 작성하기</h2></a>
  </div>
  
  <!-- /.login-logo -->
  <div class="login-box-body">
    <section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary" style>
						<form id="uploadBoard" method="post" enctype="multipart/form-data">
							
								<!-- tools box -->
								<input type="text" id="midm_ori_num" name="midm_ori_num" hidden>
								<input type="text" id="midm_perent_num" name="midm_perent_num" hidden>
							
							
							<!-- /.box-header -->
							<div class="box-body pad">
								<div class="form-group">
							</div>
								<label id="labelStyle">커리큘럼/단원소개 : </label><br>
								<center><textarea id="mindmapcont_cont" name="mindmapcont_cont" rows="10" cols="35"></textarea></center>
								<br>
						</form>
					</div>

					<div class="box-footer">
						<div class="box-tools">
							<center>
								<input type="button" id="uploadBoardClick" class="btn btn-primary" value="작성완료">
								<button type="button" id="close" class="btn btn-primary" data-dismiss="modal" hidden>close</button>
							</center>
						</div>
					</div>
				</div>
			</div>
	 </section>
	</div>
  </div>



<!-- jQuery 2.2.0 -->
<script src="${pageContext.request.contextPath}/plugins/jQuery/jQuery-2.2.0.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
<script src="https://cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script>
<script>			
		$("#uploadBoardClick").click(function() {
			var formData = new FormData();
			
			formData.append("midm_key_num",$("#key").val());
			formData.append("midm_perent_num",$("#midm_perent_num").val());
			formData.append("midm_ori_num",$("#midm_ori_num").val());
			formData.append("midm_cont", $("#mindmapcont_cont").val());
						
			$.ajax({
				url : "${pageContext.request.contextPath}/mindmap/cirInsert",
				type: "POST",
				data : formData,
				async: false,
				cache: false,
				contentType: false,
				processData: false,
				success : function(res) {
				} 
			})
			$("#close").click();
			document.getElementById("uploadBoard").reset();		
		});
		

	</script>

</body>
</html>