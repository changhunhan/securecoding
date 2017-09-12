<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script>
	function checkPassword() {
		var id = "<%=(String)session.getAttribute("mem_id")%>";
		var pass = $("#password").val();
		  $.ajax({
			  url:'${pageContext.request.contextPath}/checkPassword',
			  type:'post',
			  data: {'mem_id' : id},
			  success:function(res){
				  if(pass==res) {
					  $("#lockSubmit").submit();
				  } else {
					  alert("잘못 입력하셨습니다.");
				  }
			  },
			  dataType : 'json'
		  })
		  return false;
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="content-wrapper" style="padding:200px">
		<!-- Automatic element centering -->
			<div class="lockscreen-logo">
				<a href="${pageContext.request.contextPath}/main/main"><b>Do</b>Tv</a>
			</div>

			<!-- START LOCK SCREEN ITEM -->
			<div class="lockscreen-item" >
				<!-- lockscreen image -->
				<div class="lockscreen-image">
					<img src="${pageContext.request.contextPath}/dist/img/user1-128x128.jpg" alt="User Image">
				</div>
				<!-- /.lockscreen-image -->

				<!-- lockscreen credentials (contains the form) -->
				<form class="lockscreen-credentials" id="lockSubmit" action="${pageContext.request.contextPath}/myupdate/studentMyInfoUpdate">
					<div class="input-group">
						<input type="password" id="password" class="form-control" placeholder="password">

						<div class="input-group-btn">
							<button type="button" onclick="checkPassword()" class="btn">
								<i class="fa fa-arrow-right text-muted"></i>
							</button>
						</div>
					</div>
				</form>
				<!-- /.lockscreen credentials -->

			</div>
			<!-- /.lockscreen-item -->
		</div>

</body>
</html>