<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <title>Insert title here</title>
</head>
<body>
	<div class="box box-success" style="width:400px;">
            <div class="box-header with-border">
              <h3 class="box-title" style="color:#6cb115;">커리큘럼/단원소개</h3>
            </div>
            <div class="box-body">
            <input type="text" id="midm_ori_num" name="midm_ori_num" hidden>
              
              <br>
              <p id="mindmap_cont" name="mindmap_cont" rows="10" cols="35"></p>
              <br>
              
            </div>
            <!-- /.box-body -->
          </div>
          <div class="box-footer">
				<ul id="file-list" class="milbox-attachments clearfix" style="list-style: none;">
				</ul>
			<input type="button" id="fileClose"  data-dismiss="modal" hidden/>
		  </div>


</body>
</html>