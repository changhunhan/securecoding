<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>


</head>
<style>
</style>
<body>
	<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
				<div id="dd" style=" height: 680px;"></div>

				<textarea id="mySavedModel" style="width: 100%; height: 680px" hidden>${mmind.text}</textarea>

				<input type="text" id="midm_num" name="midm_num" hidden> 
				<input type="text" id="mindKey" name="mindKey" value="${mmind.key}" hidden>
				<input type="text" id="path" name="path" value="${vo.path}" hidden>
				
				
			
				<button type="button" id="close" class="btn btn-primary btn-block btn-flat" data-dismiss="modal" hidden>close</button>
			</div>
		</div>
	</div>

	</section>

</body>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery.minicolors/2.0.4/jquery.minicolors.js"></script>


</html>