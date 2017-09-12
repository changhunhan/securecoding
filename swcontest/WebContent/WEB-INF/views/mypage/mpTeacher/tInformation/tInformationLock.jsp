<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/sInformationLock.css">

<script>
	function checkPassword() {
		var id = "<%=(String)session.getAttribute("mem_id")%>";
		var pass = $("#password").val();
		alert(pass);
		  $.ajax({
			  url:'${pageContext.request.contextPath}/tInformation/check',
			  type:'post',
			  data: {'tea_id' : id},
			  success:function(res){
				  if(pass==res) {
					  $("#lockSubmit").submit();
				  } else {
					  alert("잘못 입력하셨습니다.");
				  }
			  },
			  dataType : 'text'
		  })
		  return false;
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="content-wrapper" style="padding-top:10%" id="conWBground">
	<section class="col-lg-4 col-lg-offset-4">
	<div class="box-body" id="boxStyle">
		<!-- Automatic element centering -->
			<div class="lockscreen-logo">
				<a href="${pageContext.request.contextPath}/main/main"><b>SWCONTEST</b></a>
			</div>

			<!-- START LOCK SCREEN ITEM -->
			<div class="lockscreen-item" >
				<!-- lockscreen image -->
				<div class="lockscreen-image">
					<img src="${pageContext.request.contextPath}/filesave/${img.mem_img_rename}" alt="User Image">
				</div>
				<!-- /.lockscreen-image -->

				<!-- lockscreen credentials (contains the form) -->
				<form class="lockscreen-credentials" id="lockSubmit" action="${pageContext.request.contextPath}/tInformation/teacherMyInfoUpdate">
					<div class="input-group">
						<input type="password" id="password" class="form-control" placeholder="password">

						<div class="input-group-btn">
							<button type="button" onclick="checkPassword()" class="btn">
								<i class="fa fa-arrow-right text-muted" id="larrow"></i>
							</button>
						</div>
					</div>
				</form>
				<!-- /.lockscreen credentials -->
			</div>
			<!-- /.lockscreen-item -->
			
			</div>
			</section>
			
		</div>

</body>
</html>