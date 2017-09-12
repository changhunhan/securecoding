<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>
	<header class="main-header"> 
	<a href="${pageContext.request.contextPath}/main/main" class="logo">
		<!-- mini logo for sidebar mini 50x50 pixels --> <span
		class="logo-mini"><b>SW</b></span> <!-- logo for regular state and mobile devices -->
		<span class="logo-lg"><b>SWCONTEST</b></span>
	</a> <!-- Header Navbar: style can be found in header.less --> <nav
		class="navbar navbar-static-top"> <!-- Sidebar toggle button-->
	<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button"> <span class="sr-only">Toggle navigation</span>
	</a>

	<div class="navbar-custom-menu">
		<ul class="nav navbar-nav">
			<li class="dropdown messages-menu">
				<div id="notice5" class="news" style="margin-top: 10px; margin-right: 5px;">
					<div class="open-event fl" style="width: 200px;">
						<ul class="notice-list" style="padding-left: 0px;">
							<c:forEach var="banner" items="${bannerVoList}">
								<c:if test="${banner.bann_date >= '0'}">
									<li class="sp01">${banner.bann_cont}&nbsp+${banner.bann_date}</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
					<script type="text/javascript">
						fn_article3('notice5', 'bt5', true);
					</script>
				</div>
			</li>
			<!-- Messages: style can be found in dropdown.less-->
			
			<li class="dropdown messages-menu">
				<a href="#" class="dropdown-toggle" id="mail" data-toggle="dropdown" style="height: 50px">
					<i class="fa fa-envelope-o"></i> 
					<span id='cccc' class="label label-success">${notec.note_check}</span>
				</a>
				
				
				<ul class="dropdown-menu">
					<div class="nav-tabs-custom">
							<ul class="nav nav-tabs pull-right">
								<li><a href="#sendnote"  class="abc" onclick="cli()" >보낸쪽지</a></li>
								<li><a href="#note" id="sendnoteTabBtn" class="abc" onclick="cli()" >받은쪽지</a></li>
								<li><a href="#write" class="abc" onclick="cli()" >작성하기</a></li>
							</ul>
					</div>
					
					<div class="tab-content no-padding">
							<div class="chart tab-pane" id="note" style="position: relative;">
								<li>
									<ul class="menu">
						  				<c:forEach items="${note}" var="vo" varStatus="status">
						  					<c:set var="noteCheck" value="${vo.note_check}" />
											<li>
												<a href="#">
													<h4>${vo.note_send_pers} <small>
														<i class="fa fa-clock-o"></i> ${vo.note_send_date}</small>
														<c:if test="${noteCheck eq 'no'}"><span id="check" class="label label-success">new</span> </c:if>
													</h4>
													<p>${vo.note_cont}</p>
												</a>
											</li>
										</c:forEach>
									</ul>
								</li>
							</div>

						<div class="chart tab-pane" id="sendnote"
							style="position: relative;">
							<li>
								<ul class="menu">
									<c:forEach items="${noteSend}" var="vo1" varStatus="status">
										<li><a href="#">

												<h4>${vo1.note_rece_pers}
													<small> <i class="fa fa-clock-o"></i>
														${vo1.note_send_date}
													</small>
												</h4>
												<p>${vo1.note_cont}</p>
										</a></li>
									</c:forEach>
								</ul>
							</li>
						</div>

						<div class="chart tab-pane" id="write" style="position: relative; margin: 2.5%">
							<form method="post">
								<label for="pwd">아이디:</label>
								 <input type="text" class="form-control" name="note_rece_pers" id="note_rece_pers" style="width:95%;"/><br>
								<label>내용:</label>
								 <textarea rows="5" cols="40" name="note_cont" id="note_cont"></textarea><br><br>
								<button type="button" onclick="insert()" class="btn btn-primary btn-block btn-flat" value="작성완료" style="width:95%;">작성완료</button>
							</form>					
						</div>
					</div>
				</ul>
			</li>
					
			
			<!-- User Account: style can be found in dropdown.less -->
			<li class="dropdown user user-menu"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown" style="height: 50px">
					<img src="${pageContext.request.contextPath}/filesave/${img.mem_img_rename}" class="user-image" alt="User Image"> 
					<span class="hidden-xs">${mem_id}</span>
			</a>
				<ul class="dropdown-menu">
					<!-- User image -->
					<li class="user-header">
					<img src="${pageContext.request.contextPath}/filesave/${img.mem_img_rename}"
						class="img-circle" alt="User Image">

						<p>
							${mem_id}
						</p></li>
					
					<!-- Menu Footer-->
					<li class="user-footer">
						<div class="pull-left">
						<c:set value="${state}" var="id"/>
							 <c:if test="${id eq 'teacher'}">
							<a href="${pageContext.request.contextPath}/tInformation/tInformationLock" 
							class="btn btn-default btn-flat">Profile</a>
						</c:if>
						<c:set value="${state}" var="id"/>
							 <c:if test="${id eq 'student'}">
							<a href="${pageContext.request.contextPath}/sInformation/sInformationLock" 
							class="btn btn-default btn-flat">Profile</a>
						</c:if>
						</div>
						<div class="pull-right">
							<a href="${pageContext.request.contextPath}/returnIndexPage"
								class="btn btn-default btn-flat">로그아웃</a>
						</div>
					</li>
				</ul></li>
		</ul>
	</div>
	</nav> </header>
</body>
<script>
function cli(){
	
}

function insert(){
	var recive = document.getElementById("note_rece_pers").value;
	var cont = document.getElementById("note_cont").value;
	var value={note_rece_pers:recive,note_cont:cont};
	$.ajax({
		url : "${pageContext.request.contextPath}/noteInsert",
		type: "POST",
		data: value,
		success : function(res) {
			if(res=="ok"){
				location.href="${pageContext.request.contextPath}/main/main";
				alert("보내기 성공");
			}
			else{
				alert("아이디가 존재하지 않습니다");
			}
		}		
	})
}
$(document).ready(function(){
	$('.abc').on("click", function(e){
	    $(this).tab('show');
	    e.stopPropagation();
	    e.preventDefault();
	  });
	 $('#mail').on("click", function(){
	    $(this).dropdown();
	    $('#sendnoteTabBtn').trigger('click');
	    document.getElementById('cccc').innerHTML = '0';
	     $.ajax({
			url : "${pageContext.request.contextPath}/noteUpdate",
			type: "GET",
			success : function(res) {
			} 
		})
	  }); 
	
});

</script>
</html>