<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome -->
    <link href="fonts/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- 로그인CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="plugins/iCheck/all.css">
</head>
<body>
	<div class="contain_box">
		<div class="container">
			<div class="row">
				<div class="page-header">
				<h2>멀티모달 테스트</h2>
				</div>
			</div>
			<a data-toggle="modal" href="#myModal" class="btn btn-primary">Launch modal</a>
			<div class="row 2nd">
			</div>
		</div>
	</div>
	<%@include file="modalTest02.jsp"%>
	<%@include file="modalTest03.jsp"%>
	<%@include file="modalTest04.jsp"%>
	<%@include file="modalTest05.jsp"%>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="plugins/jQuery/jQuery-2.2.0.min.js"></script>
<script src="plugins/iCheck/icheck2.js"></script>
<script>
  $(function () {
    
    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue'
    });
   
  });
</script>
</body>
</html>