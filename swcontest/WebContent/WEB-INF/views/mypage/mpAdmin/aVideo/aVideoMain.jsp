<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/aVideoMain.css">
</head>
<script>
	$(function() {
		$(document).on("click", "#deleteLecture", function() {
			var num = $(this).parent().find("#lec_num").val();
			if(confirm("삭제하시겠습니까?") == true) {
				$.ajax({
					url:"${pageContext.request.contextPath}/aVideo/aVideoDelete",
					data: {'num':num},
					type: "POST",
					success: function(res) {
						 location.reload();
					},
					dataType:"text"
				})
			}
		})
	})
</script>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
			<br>
			<section class="content-header">
				<h1 id="title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;동영상관리<small></small></h1>
				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i> 마이페이지</li>
					<li class="active">동영상관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				</ol>
			</section>
			<hr id="hr"></hr>
			<br> 
			<br>
			
			<section class="content">
				<!-- 검색,text입력시작 -->
				<div class="row" id="option">
				<section class="col-lg-1 connectedSortable"></section>
				<!-- section class="col-lg-10 이거없으면content-wrapper적용안됨 --> 
				<section class="col-lg-10">
					<div class="box-body" id="optionBox">
						<div class="box-footer">
						<c:choose>
							<c:when test="${empty aVideoList}">
								등록된 강의가 없습니다.
							</c:when>
							<c:otherwise>
								 <ul class="mailbox-attachments clearfix">
								 <c:forEach items="${aVideoList}" var="videoVo">
									<li>
					                  <span class="mailbox-attachment-icon has-img"><img src="${pageContext.request.contextPath}/filesave/${videoVo.vio_poster_path}" style="height:200px; width:200px" alt="poster"></span>
					
					                  <div class="mailbox-attachment-info">
					                    <a href="${pageContext.request.contextPath}/video/watchVideo?num=${videoVo.lec_num}" class="mailbox-attachment-name">${videoVo.lec_title}</a>
					                        <span class="mailbox-attachment-size">
					                          ${videoVo.tea_name}
					                          <a id="deleteLecture" class="btn btn-default btn-xs pull-right"><i class="fa fa-fw fa-trash"></i></a>
					                          <input type="hidden" id="lec_num" value="${videoVo.lec_num}">
					                        </span>
					                  </div>
					                </li>
								 </c:forEach>
			             		 </ul>
							</c:otherwise>
						</c:choose>
			             
			            </div>
					</div>
			          <!-- /.box-footer -->
			         </div>
			         <!-- /.box -->
		         </section>
		         <!-- /.col-lg-10 -->
		         </div>
		         <!-- /.row -->
	         </section>
	         <!-- /.content -->
       </div>
      <!-- /.content-wrapper -->
     </div>
    <!--wrapper -->
</body>
</html>