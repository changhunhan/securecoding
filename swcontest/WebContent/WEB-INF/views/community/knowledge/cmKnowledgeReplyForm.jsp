<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/cmKnowledgeReplyForm.css">

</head>
<body>
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
		<br>
		<!-- 헤더시작 -->
		<section class="content-header">
			<h1 id="title">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지식인<small>답글작성하기</small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-dashboard"></i> 커뮤니티</li>
				<li class="active">지식인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			</ol>
		</section>
		<!-- /.헤더 -->
		<hr id="hr"></hr>
		<br>
		<br>
		<section class="content">
			<div class="row">
			<section class="col-lg-1 connectedSortable"></section>
				<section class="col-lg-10"> 
					<form id="uploadBoard" method="post" enctype="multipart/form-data">
						<div class="box-header">
							<div class="box-tools pull-right">
								<input type="button" id="uploadBoardClick" class="btn btn-info btn-block btn-flat" value="작성완료">
							</div>
						</div>
						<div class="box-body pad">
							<div class="form-group">
								
								<label for="exampleInputEmail1">Title</label> <input
									type="text" class="form-control" id="ans_bor_title"
									placeholder="Title">
								<fieldset>
									<input type="file" id="uploadFiles" multiple><br>
									<br>
								</fieldset>
							</div>
								<input type="hidden" id="ans_bor_wri_pers" name="ans_bor_wri_pers" value="${mem_id}">
								<input type="hidden" id="ans_bor_gup_num" name="ans_bor_gup_num" value="${ans_bor_gup_num}">
								<input type="hidden" id="ans_bor_ori_num" name="ans_bor_ori_num" value="${ans_bor_ori_num}">
								<input type="hidden" id="ans_bor_next_num" name="ans_bor_next_num" value="${ans_bor_next_num}">
								<textarea id="ans_bor_cont" rows="10" cols="80"></textarea>
						</div>
					</form>
					<div class="box-footer">
						<ul id="file-list" class="milbox-attachments clearfix"
							style="list-style: none;">
						</ul>
					</div>
				</section>
				<!-- /.col-lg-10 -->
			</div>
			<!-- /.row -->
		</section>
		<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
	</div>
	<!-- /.wrapper -->
	
	<div class="control-sidebar-bg"></div>
	
	<!-- CK Editor -->
	<script src="https://cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script>
	<script>
		$(function() {
			// Replace the <textarea id="editor1"> with a CKEditor
			// instance, using default configuration.
			CKEDITOR.replace('ans_bor_cont');
			//bootstrap WYSIHTML5 - text editor
			$(".textarea").wysihtml5();
		});
		
		var filesUpload = document.getElementById("uploadFiles");
		var fileList = new Map();
		var count = 0;
		function traverseFiles(files) {
			var li, file, fileInfo;
			for (var i = 0; i < files.length; i++) {
				var li = "";
				file = files[i];
				fileInfo =  file.name;
				fileInfo += "<span class=\"mailbox-attachment-size\">"
						+ file.size + " </span>";
				count++;
				fileList.set(count, files[i]);
				var name = (file.name).substr((file.name).length - 3);
				if (name == 'jpg' || name == 'png') {
					$("#file-list")
							.append(
									"<li style='float: left; width: 200px; border: 1px solid #eee; margin-bottom: 10px; margin-right: 10px;' ><span class=\"mailbox-attachment-icon\"><i class=\"fa fa-file-image-o\"></i></span><div class=\"mailbox-attachment-info\">"
											+ fileInfo
											+ "</div><input type=\"button\" class=\"btn btn-block btn-danger btn-sm\" value=\"삭제\" onclick=\"del(this,"
											+ count + ");\"></li>");
				} else if (name == 'pdf') {
					$("#file-list")
							.append(
									"<li style='float: left; width: 200px; border: 1px solid #eee; margin-bottom: 10px; margin-right: 10px;' ><span class=\"mailbox-attachment-icon\"><i class=\"fa fa-file-pdf-o\"></i></span><div class=\"mailbox-attachment-info\">"
											+ fileInfo
											+ "</div><input type=\"button\" class=\"btn btn-block btn-danger btn-sm\" value=\"삭제\" onclick=\"del(this,"
											+ count + ");\"></li>");
				} else if (name == 'hwp') {
					$("#file-list")
							.append(
									"<li style='float: left; width: 200px; margin-bottom: 10px; margin-right: 10px;' ><span class=\"mailbox-attachment-icon\"><i class=\"fa fa-file-word-o\"></i></span><div class=\"mailbox-attachment-info\">"
											+ fileInfo
											+ "</div><input type=\"button\" class=\"btn btn-block btn-danger btn-sm\" value=\"삭제\" onclick=\"del(this,"
											+ count + ");\"></li>");
				} else if (name == 'lsx' || name == 'xls') {
					$("#file-list")
							.append(
									"<li style='float: left; width: 200px; border: 1px solid #eee; margin-bottom: 10px; margin-right: 10px;' ><span class=\"mailbox-attachment-icon\"><i class=\"fa fa-file-excel-o\"></i></span><div class=\"mailbox-attachment-info\">"
											+ fileInfo
											+ "</div><input type=\"button\" class=\"btn btn-block btn-danger btn-sm\" value=\"삭제\" onclick=\"del(this,"
											+ count + ");\"></li>");
				} else {
					$("#file-list")
							.append(
									"<li style='float: left; width: 200px; border: 1px solid #eee; margin-bottom: 10px; margin-right: 10px;' ><span class=\"mailbox-attachment-icon\"><i class=\"fa fa-file\"></i></span><div class=\"mailbox-attachment-info\">"
											+ fileInfo
											+ "</div><input type=\"button\" class=\"btn btn-block btn-danger btn-sm\" value=\"삭제\" onclick=\"del(this,"
											+ count + ");\"></li>");
				}
				

			};

		};
		filesUpload.onchange = function() {
			traverseFiles(this.files);
		};
		
		$("#uploadBoardClick").click(function() {
			var formData = new FormData();
			formData.append("ans_bor_title", $("#ans_bor_title").val());
			formData.append("ans_bor_wri_pers", $("#ans_bor_wri_pers").val());
			formData.append("ans_bor_gup_num", $("#ans_bor_gup_num").val());
			formData.append("ans_bor_ori_num", $("#ans_bor_ori_num").val());
			formData.append("ans_bor_next_num", $("#ans_bor_next_num").val());
			formData.append("ans_bor_cont", CKEDITOR.instances.ans_bor_cont.getData());
			var mapIter = fileList.values();
			for(var i = 0; i < fileList.size; i++) {
				formData.append("uploadFiles", mapIter.next().value);
			}
			
			$.ajax({
				url : "${pageContext.request.contextPath}/community/cmKnowledgeReply",
				type: "POST",
				data : formData,
				async: false,
				cache: false,
				contentType: false,
				processData: false,
				success : function(res) {
					location.href="${pageContext.request.contextPath}/community/cmKnowledgeList";
				} 
			})
		});
		
		function del(a, b) {
			fileList.delete(b);
			$(a).parent().remove();
		}
		

	</script>
</body>
</html>
