<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/aTeacherMain.css">
<head>

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
		<br>
		<section class="content-header">
			<h1 id="title">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;강사관리<small></small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-dashboard"></i> 고객센터</li>
				<li class="active">강사관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
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
										<th class="mailbox-subject">아이디</td>
										<th class="mailbox-subject">비밀번호</th>
										<th class="mailbox-subject">이름</td>
										<th class="mailbox-subject">연락처</td>
										<th class="mailbox-subject">생일</th>
										<th class="mailbox-subject">주민번호</th>
										<th class="mailbox-subject">주소</td>
										<th class="mailbox-subject">상세주소</td>
										<th class="mailbox-subject">이메일</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${teacherVo}" var="vo">
										<tr>
											<td class="tea_id">${vo.tea_id}</td>
											<td class="tea_pass">${vo.tea_pass}</td>
											<td class="tea_name">${vo.tea_name}</td>
											<td class="tea_tel">${vo.tea_tel}</td>
											<td>${vo.tea_bir}</td>
											<td>${vo.tea_reg_num1}-${vo.tea_reg_num2}</td>
											<td class="tea_add1">${vo.tea_add1}</td>
											<td class="tea_add2">${vo.tea_add2}</td>
											<td class="tea_email">${vo.tea_email}</td>
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
						<h3 class="box-title">강사 상세정보</h3>
					</div>
					<div class="box-body" style="text-align: center;" >
						<form action="${pageContext.request.contextPath}/aTeacher/teaJoin" method="post" id="form">
							<table style="border: thin;" id="fomat">
								<tr>
									<td>이름 : </td>
									<td><input type="text"  style="margin-left:20px;"  class="form-control" id="res_name" name="tea_name" placeholder="강사이름"></td>
								</tr>
								<tr>
									<td>아이디 : </td>
									<td colspan="2"><input type="text"  style="margin-left:20px;"  class="form-control" id="res_id" name="tea_id" placeholder="아이디"></td>
								</tr>
								<tr>
									<td>비밀번호 : </td>
									<td colspan="2"><input type="text" style="margin-left:20px;"  class="form-control" id="res_pass" name="tea_pass"placeholder="비밀번호"></td>
								</tr>
								<tr>
									<td>생일 : </td>
									<td colspan="2"><input type="text" style="margin-left:20px;"  class="form-control" id="res_bir" name="tea_bir"placeholder="생일"></td>
								</tr>
								<tr>
									<td>주민번호 앞자리 : </td>
									<td colspan="2"><input type="text" style="margin-left:20px;"  class="form-control" id="res_reg_num1" name="tea_reg_num1"placeholder="주민번호 앞자리"></td>
								</tr>
								<tr>
									<td>주민번호 뒷자리 : </td>
									<td colspan="2"><input type="text" style="margin-left:20px;"  class="form-control" id="res_reg_num2" name="tea_reg_num2"placeholder="주민번호 뒷자리"></td>
								</tr>
								<tr>
									<td>전화번호 : </td>
									<td colspan="2"><input type="text" style="margin-left:20px;"  class="form-control" id="res_tel" name="tea_tel" placeholder="전화번호"></td>
								</tr>
								<tr>
									<td>주소 : </td>
									<td colspan="2"><input type="text" style="margin-left:20px;"  class="form-control" id="res_add1" name="tea_add1"placeholder="주소"></td>
								</tr>
								<tr>
									<td>상세주소 : </td>
									<td colspan="2"><input type="text" style="margin-left:20px;"  class="form-control" id="res_add2" name="tea_add2"placeholder="상세주소"></td>
								</tr>
								<tr>
									<td>이메일 : </td>
									<td colspan="2"><input type="text" style="margin-left:20px;"  class="form-control" id="res_email" name="tea_email" placeholder="이메일"></td>
								</tr>
							</table>
							<br>
							<div class="input-group margin">
								<span class="input-group-btn">
									<button type="button" class="btn btn-info btn-flat" id="del">삭제</button>
									<button type="button" id="update" class="btn btn-info btn-flat">수정</button>
									<button type="submit" class="btn btn-info btn-flat">등록</button>
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
				   var id = this.getElementsByTagName("td")[0].innerText;
				   var pass = this.getElementsByTagName("td")[1].innerText;
				   var name = this.getElementsByTagName("td")[2].innerText;
				   var tel = this.getElementsByTagName("td")[3].innerText;
				   var bir = this.getElementsByTagName("td")[4].innerText;
				   var reg = this.getElementsByTagName("td")[5].innerText;
				   var add1 = this.getElementsByTagName("td")[6].innerText;
				   var add2 = this.getElementsByTagName("td")[7].innerText;
				   var email = this.getElementsByTagName("td")[8].innerText;
				   $("#res_name").val(name);
				   $("#res_pass").val(pass);
					$("#res_id").val(id);
					$("#res_tel").val(tel);
					$("#res_bir").val(bir);
					$("#res_add1").val(add1);
					$("#res_add2").val(add2);
					$("#res_email").val(email);
					$("#res_reg_num1").val(reg.substring(0,6));
					$("#res_reg_num2").val(reg.substring(7));
				});
		$("#del").click(function(){
			var tea_id = $("#res_id").val();
			if(confirm("삭제하시겠습니까?")==true) {
				$.ajax({
					url: "${pageContext.request.contextPath}/aTeacher/teaDel",
					type: 'GET',
					data: { tea_id : tea_id	},
					success : function(){
						window.location.reload(true);
					}
				})
			}
		})
		$("#update").click(function() {
			var formData = new FormData(document.getElementById('form'));
			if(confirm("수정하시겠습니까?")==true) {
			$.ajax({
				url: "${pageContext.request.contextPath}/aTeacher/teaUpdate",
				type:"POST",
				data : formData,
				async:false,
				cache: false,
				contentType: false,
				processData: false,
				success: function(res) {
					window.location.reload(true);
				},
				dataType:"text"
			})
			}
			
		})
		
			$('#example2').DataTable({
				"stateSave" : true
			});
			$('#example1').DataTable({
				"stateSave" : true
			});
		});
	</script>
</body>
</html>
