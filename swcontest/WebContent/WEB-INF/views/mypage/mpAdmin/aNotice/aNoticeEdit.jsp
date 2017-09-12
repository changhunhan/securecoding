<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/aNoticeEdit.css">

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
		<br>
		<!-- 헤더시작 -->
		<section class="content-header">
			<h1 id="title">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공지사항<small>수정하기</small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-dashboard"></i> 고객센터</li>
				<li class="active">공지사항&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			</ol>
		</section>
		<!-- /.헤더 -->
		<br>
		<br>
		
			<section class="content">
			<div class="row">
			<section class="col-lg-1 connectedSortable"></section>
				<section class="col-lg-10"> 
						<form id="uploadBoard" method="post" enctype="multipart/form-data">
							<div class="box-header">
								<!-- tools box -->
								<div class="box-tools pull-right">

									<a
										href="${pageContext.request.contextPath}/aNotice/aNoticeDetail/${aNoticeVo.bor_num}"
										class="btn btn-info pull-right">취소</a> <input type="button"
										id="uploadBoardClick" class="btn btn-info pull-right"
										value="완료">
								</div>
								<!-- /. tools -->
							</div>
							<!-- /.box-header -->
							<div class="box-body pad">
								<div class="form-group">
									<label for="exampleInputEmail1">Title</label> <input
										type="text" class="form-control" id="bor_title"
										name="bor_title" placeholder="Title"
										value="${aNoticeVo.bor_title}"> <input type="hidden"
										id="bor_num" name="bor_num" value="${aNoticeVo.bor_num}">
									<fieldset>
										<input type="file" id="uploadFiles" multiple><br>
										<br>
									</fieldset>
								</div>
								<textarea id="bor_cont" name="bor_cont" rows="10" cols="80">${aNoticeVo.bor_cont}</textarea>
							</div>
					<!-- /.수정div -->
						</form>
						
						<div class="box-footer">
							<ul id="file-list" class="mailbox-attachments clearfix">
								<c:forEach items="${fileVo}" var="vo">
									<c:set var="oriname" value="${vo.bor_file_name}" />
									<c:set var="name" value="${fn:substringAfter(oriname,'.')}" />
									<c:choose>
										<c:when test="${name eq 'jpg' || name eq 'png'}">
											<li id="${vo.bor_file_num}"><span
												class="mailbox-attachment-icon"> <i
													class="fa fa-file-image-o"></i>
											</span>
												<div class="mailbox-attachment-info">
														${vo.bor_file_name}<span class="mailbox-attachment-size">
														 ${vo.bor_file_size} </span> </a>
												</div> <input type="button" class="btn btn-block btn-danger btn-sm"
												value="삭제" onclick="fileDelete(this)"></li>
										</c:when>
			
										<c:when test="${name eq 'pdf'}">
											<li id="${vo.bor_file_num}"><span
												class="mailbox-attachment-icon"> <i
													class="fa fa-file-pdf-o"></i></span>
												<div class="mailbox-attachment-info">
			
													  ${vo.bor_file_name}
													  <span class="mailbox-attachment-size">
														${vo.bor_file_size} </span></a>
												</div> <input type="button" class="btn btn-block btn-danger btn-sm"
												value="삭제" onclick="fileDelete(this)"></li>
										</c:when>
										<c:when test="${name eq 'hwp'}">
											<li id="${vo.bor_file_num}"><span
												class="mailbox-attachment-icon"> <i
													class="fa fa-file-word-o"></i></span>
												<div class="mailbox-attachment-info">
														${vo.bor_file_name} <span class="mailbox-attachment-size"> ${vo.bor_file_size} </span></a>
												</div> <input type="button" class="btn btn-block btn-danger btn-sm"
												value="삭제" onclick="fileDelete(this)"></li>
										</c:when>
										<c:when test="${name eq 'xlsx' || name eq 'xls'}">
			
											<li id="${vo.bor_file_num}"><span
												class="mailbox-attachment-icon"> <i
													class="fa fa-file-excel-o"></i></span>
												<div class="mailbox-attachment-info">
			
													 ${vo.bor_file_name}
													 <span class="mailbox-attachment-size">
														${vo.bor_file_size} </span></a>
												</div> <input type="button" class="btn btn-block btn-danger btn-sm"
												value="삭제" onclick="fileDelete(this)"></li>
										</c:when>
										<c:otherwise>
											<li id="${vo.bor_file_num}"
												style='float: left; width: 200px; border: 1px solid #eee; margin-bottom: 10px; margin-right: 10px;'>
												<span class="mailbox-attachment-icon"> 
												<i class="fa fa-file"></i></span>
												<div class="mailbox-attachment-info">
													
														${vo.bor_file_name}
														<span class="mailbox-attachment-size">
														 ${vo.bor_file_size} </span></a>
												</div> <input type="button" class="btn btn-block btn-danger btn-sm"
												value="삭제" onclick="fileDelete(this)">
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</ul>
						</div>
						<!--/.box-footer -->
				</section>
				<!-- /.col-lg-10 -->
			</div>
			<!-- ./row --> 
		</section>
		<!-- /.Main content -->
		</div>
		<!-- /.content-wrapper -->
	</div>
	<!-- /.wrapper -->

		<div class="control-sidebar-bg"></div>

	<!-- CK Editor -->
	<script src="https://cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script>
	<!-- Bootstrap WYSIHTML5 -->
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<script>
		$(function() {
			// Replace the <textarea id="editor1"> with a CKEditor
			// instance, using default configuration.
			CKEDITOR.replace('bor_cont');
			//bootstrap WYSIHTML5 - text editor
			$(".textarea").wyihtml5();
		});
		
		var filesUpload = document.getElementById("uploadFiles");
		var fileList = new Map();
		var count = 0;
		var fileArray= new Array();
		function traverseFiles(files) {
			var li, file, fileInfo;
			for (var i = 0; i < files.length; i++) {
				var li = "";
				file = files[i];
				fileInfo = file.name;
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
											+ "</div><input type=\"button\" value=\"삭제\" onclick=\"del(this,"
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
			formData.append("bor_title", $("#bor_title").val());
			formData.append("bor_num", $("#bor_num").val());
			formData.append("bor_cont", CKEDITOR.instances.bor_cont.getData());
			var mapIter = fileList.values();
			for(var i = 0; i < fileList.size; i++) {
				formData.append("uploadFiles", mapIter.next().value);
			}
			document.write(fileArray.toString(), '<br /><br />');
			formData.append("tempFile",fileArray);
			
			
			$.ajax({
				url : "${pageContext.request.contextPath}/aNotice/aNoticeEdit",
				type: "POST",
				data : formData,
				async: false,
				cache: false,
				contentType: false,
				processData: false,
				success : function(res) {
					location.href="${pageContext.request.contextPath}/aNotice/aNoticeMain";
				} 
			})
		});
		
		function del(a, b) {
			fileList.delete(b);
			$(a).parent().remove();
		}
		
		function fileDelete(obj){	
			var bor_file_num = $(obj).parent().attr("id");
			var li = $(obj).parent();
			fileArray.push(bor_file_num);
			$(li).remove();			
		}
	</script>
</body>
</html>
