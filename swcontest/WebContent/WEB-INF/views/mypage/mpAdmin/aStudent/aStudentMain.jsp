<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/aStudentMain.css">
<head>

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
		<br>
		<section class="content-header">
			<h1 id="title">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원관리<small></small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-dashboard"></i> 고객센터</li>
				<li class="active">회원관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			</ol>
		</section>
		<hr id="hr"></hr>
		<!-- 헤더끝 -->
		<br>
		<br>
			<section class="content">
			<div class="row">
				<section class="col-lg-1 connectedSortable"></section>
				<section class="col-lg-7"> 
					<!-- /.box-header -->
					
					<div class="tab-content no-padding">
						<div class="chart tab-pane active" id="notice"
							style="position: relative;">
							<table id="example1" class="table table-bordered table-hover dataTable">
								<thead>
									<tr>
										<th class="mailbox-name">회원번호</td>
										<th class="mailbox-subject">아이디</td>
										<th class="mailbox-subject">이름</td>
										<th class="mailbox-subject">연락처</td>
										<th class="mailbox-subject">생일 </th>
										<th class="mailbox-subject">주소</td>
										<th class="mailbox-subject">상세주소</td>
										<th class="mailbox-subject">이메일</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${memberVo}" var="vo" varStatus="status">
										<tr >
											<td class="mailbox-name">${status.count}</td>
											<td class="mem_id">
												${vo.mem_id}
											</td>
<%-- 											<td class="mailbox-subject" id="mem_id" >${vo.mem_id}</td> --%>
											<td class="mem_name">${vo.mem_name}</td>
											<td class="mem_tel">${vo.mem_tel}</td>
											<td class="mem_bir">${vo.mem_bir}</td>
											<td class="mem_add1">${vo.mem_add1}</td>
											<td class="mem_add2">${vo.mem_add2}</td>
											<td class="mem_email">${vo.mem_email}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							
							<div class="box-footer clearfix no-border">
							</div>
						</div>
					</div>
					<!-- 작성하기위치 -->
			</section>
			<section class="col-lg-3">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">회원 상세정보</h3>
					</div>
					<div class="box-body" style="text-align: center;">
						<form action="${pageContext.request.contextPath}/aStudent/memJoin">
							<table style="border: thin;">
								<tr>
									<td>이름 : </td>
									<td><input type="text" style="margin-left:20px;" class="form-control" id="res_name" name="mem_name" placeholder="회원이름"></td>
								</tr>
								<tr>
									<td>아이디 : </td>
									<td><input type="text" style="margin-left:20px;" class="form-control" id="res_id" name="mem_id" placeholder="아이디"></td>
								</tr>
								<tr>
									<td>생일 : </td>
									<td><input type="text" style="margin-left:20px;" class="form-control" id="res_bir" name="mem_bir"placeholder="생일"></td>
								</tr>
								<tr>
									<td>전화번호 : </td>
									<td><input type="text" style="margin-left:20px;" class="form-control" id="res_tel" name="mem_tel"placeholder="전화번호"></td>
								</tr>
								<tr>
									<td>주소 : </td>
									<td><input type="text" style="margin-left:20px;" class="form-control" id="res_add1" name="mem_add1"placeholder="주소"></td>
								</tr>
								<tr>
									<td>상세주소 : </td>
									<td><input type="text" style="margin-left:20px;" class="form-control" id="res_add2" name="mem_add2"placeholder="상세주소"></td>
								</tr>
								<tr>
									<td>이메일 : </td>
									<td><input type="text" style="margin-left:20px;" class="form-control" id="res_email" name="mem_email"placeholder="이메일"></td>
								</tr>
							</table>
							<br>
							<div class="input-group margin">
								<span class="input-group-btn">
									<button type="button" class="btn btn-info btn-flat" id="del" style="width: 50%;">삭제</button>
								</span>
							</div>
						</form>
						
					</div>
					
				</div>
			</section>
			</div>
			<!-- /.box -->
		</section>
		<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
	</div>
	<!-- /.wrapper -->
	<div class="control-sidebar-bg"></div>
	
	<script type="text/javascript">
		$(function(){
			$(document).on("click", "#example1 tr", function() {
				   var id = this.getElementsByTagName("td")[1].innerText;
				   var name = this.getElementsByTagName("td")[2].innerText;
				   var tel = this.getElementsByTagName("td")[3].innerText;
				   var bir = this.getElementsByTagName("td")[4].innerText;
				   var add1 = this.getElementsByTagName("td")[5].innerText;
				   var add2 = this.getElementsByTagName("td")[6].innerText;
				   var email = this.getElementsByTagName("td")[7].innerText;
				   $("#res_name").val(name);
					$("#res_id").val(id);
					$("#res_tel").val(tel);
					$("#res_bir").val(bir);
					$("#res_add1").val(add1);
					$("#res_add2").val(add2);
					$("#res_email").val(email);
				});
		
		$("#del").click(function(){
			var mem_id = $("#res_id").val();
			if(confirm("삭제하시겠습니까?") == true) {
				$.ajax({
					url: "${pageContext.request.contextPath}/aStudent/memDel",
					type: 'GET',
					data: { mem_id : mem_id	},
					success : function(){
						window.location.reload(true);
					}
				})
			}
		})
			$('#example2').DataTable({
				"stateSave" : true
			});
			$('#example1').DataTable({
				"stateSave" : true
			});
			
		})
	</script>
</body>
</html>
