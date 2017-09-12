<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="${pageContext.request.contextPath}/css/video-js.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/videojs.markers.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/go.js"></script>
<script src="https://gojs.net/latest/extensions/DataInspector.js"></script>

<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/watchVideo.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<script>

	$(function() {
		
		
		var player = videojs('lecture');
		var time = "${lecWatVo.lec_play_time}";
		var watTime = "${lecWatVo.lec_wat_time}";
		var curNum = "${lectureVo.cur_num}";
		player.currentTime(parseInt(time));
		$("#memo").val("${lecWatVo.lec_wat_memo}");
		$(window).on('beforeunload ',function() {
			var currentTime = parseInt(player.currentTime()).toString();
			var date = new Date();
			date = date.getFullYear() + "-" + pad((date.getMonth()+1),2) + "-" + pad(date.getDate(),2) + " " + pad(date.getHours(),2) + ":" + pad(date.getMinutes(),2) + ":" + pad(date.getSeconds(),2);
			var lec_num = "${lectureVo.lec_num}";
			var cont = $("#memo").val();
			var tolTime = parseInt("${videoVo.tol_vio_time}");
			var achieve = 'n';
			if((watTime/tolTime)*100 > 70) {
				achieve = 'y';
			}
			var formData = new FormData();
			
			formData.append('lec_num',lec_num);
			formData.append('lec_play_time', currentTime);
			formData.append('lec_play_date',date);
			formData.append('lec_wat_memo', cont);
			formData.append('cur_num', curNum);
			formData.append('lec_wat_time', watTime);
			formData.append('lec_achieve', achieve);
			$.ajax({
				url:"${pageContext.request.contextPath}/video/watch/updateStartTime",
				type: "POST",
				data: formData,
				async : false,
				cache : false,
				contentType : false,
				processData : false,
				success:function(res) {
					
				}
			})
		    return 'Are you sure?';
		});
		
		<c:if test="${bookMarkList.size() ne 0}">
			player.markers({
				markers: [
					<c:forEach var="i" begin="0" end="${size}">
						{time : parseInt("${bookMarkList.get(i).bkmark_time}"), text : "${bookMarkList.get(i).bkmark_title}"},
					</c:forEach>
				]
			})
		</c:if>
		$(document).on("click", "#addComment", function() {
			var cont = $("#lec_comm_cont").val();
			var date = new Date();
			var num = "${lectureVo.lec_num}";
			date = date.getFullYear() + "-" + pad((date.getMonth()+1),2) + "-" + pad(date.getDate(),2) + " " + pad(date.getHours(),2) + ":" + pad(date.getMinutes(),2) + ":" + pad(date.getSeconds(),2);
			var formData = new FormData();
			
			formData.append("lec_comm_date", date);
			formData.append("lec_comm_cont", cont);
			formData.append("lec_num", num);
			var values = [];
			$.ajax({
				url:"${pageContext.request.contextPath}/video/watch/addComment",
				type:"POST",
				data:formData,
				async : false,
				cache : false,
				contentType : false,
				processData : false,
				success: function(res) {
					$("#refresh").empty();
					values = res.lecComList;
					var code = "";
					$.each(values, function(index, value) {
						code += "<div class='col-md-10'>";
						code += "<div class='post'>";
		                code += "<div class='user-block'>";
		                code += "<img class='img-circle img-bordered-sm' src='${pageContext.request.contextPath}/image/프로필.jpg' alt='user image'>";
		                code += "<span class='username'>";
		                code += "<a>"+ value.lec_comm_wri_pers +"</a>";
		                code += "<button type='button' id='deleteComment' class='pull-right btn-box-tool' style='border:0'><i class='fa fa-times'></i></button>";
		                code += "<input type='hidden' id='key' value='" + value.lec_comm_num + "'>";
		                code += "</span>";
		                code += "<span class='description'>" + value.lec_comm_date + "</span>";
		                code += "</div>";
		                code += "<p>" + value.lec_comm_cont + "</p>";
		                code += "</div></div>";
					})
					$('#refresh').html(code);
				} 
			})
			$("#lec_comm_cont").val("");
		})
		$(document).on("click", "#deleteComment", function() {
			var key = $(this).parent().find("#key").val();
			if(confirm("삭제하시겠습니까?") == true) {
				$.ajax({
					url:"${pageContext.request.contextPath}/video/watch/deleteComment",
					type:"POST",
					data:{'key':key},
					success:function(res) {
						alert("삭제되었습니다.");
					}
				})
				$(this).parent().parent().parent().parent().remove();
			} else {
				return;
			} 
		})
		
		setInterval(function(){ watTime++; }, 1000);
		$("#mindModal").on("show.bs.modal", function(e) {
			$("body").css("overflow-y", "hidden");
			$("#mindModal").css("overflow-y","hidden");
		})
		$("#mindModal").on("hidden.bs.modal", function(e) {
			$("body").css("overflow-y", "auto");
		})
		$("#nomalModal").on("show.bs.modal", function(e) {
			$("body").css("overflow-y", "hidden");
		})
		$("#fileModal").on("show.bs.modal", function(e) {
			$("body").css("overflow-y", "hidden");
		})
		$("#nomalModal").on("hidden.bs.modal", function(e) {
			$("body").css("overflow-y", "hidden");
		})
		$("#fileModal").on("hidden.bs.modal", function(e) {
			$("body").css("overflow-y", "hidden");
		})
		
	})
	function pad(n, width) {
	  n = n + '';
	  return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
	}
	
	
	var myDiagram;
	var myModel;
	$(function() {
				var $ = go.GraphObject.make;
				myDiagram = $(go.Diagram, "dd", {
					initialContentAlignment: go.Spot.Center,
					layout : $(FlatTreeLayout, // custom Layout, defined below
					{
						angle : 90,
						compaction : go.TreeLayout.CompactionNone
					})
				});
				
				myDiagram.linkTemplate = $(go.Link, go.Link.Orthogonal, {
					corner : 5,
					relinkableFrom : true,
					relinkableTo : true
				}, $(go.Shape, {
					strokeWidth : 4,
					stroke : "#8ecaf5"
				}))

				myDiagram.nodeTemplate = $(go.Node, "Vertical", {
					selectionObjectName : "TEXT"
				}, $(go.Panel, "Auto", $(go.Shape, "Ellipse", {
					width : 120,
					height : 120,
					fill : "#7fcbe1",
					stroke : "#f3faff"
				}, new go.Binding("fill", "color"), new go.Binding("width",
						"넓이"), new go.Binding("height", "높이")), $(go.TextBlock,
						"Default Text", {
							name : "TEXT",
							stroke : "white",
							minSize : new go.Size(20, 15),
							editable : true
						}, new go.Binding("text", "text")), {
					click : mindmapCont
				}

				), $(go.Panel, "Auto", // this is underneath the "BODY"
				{
					height : 15
				}, // always this height, even if the TreeExpanderButton is not visible
				$("TreeExpanderButton")));

			});

	function mindmapCont(e, obj) {

		var clicked = obj.part;
		var diagram = clicked.diagram;
		var olddata = clicked.data;
		var p = olddata.parent;
		var n = olddata.number;
		var type = olddata.type;

		//내용+첨부파일
		if (type == 'small') {
			document.getElementById("midm_ori_num").value = n;
			var midm_ori_num = n;
		
			var midm_key_num = document.getElementById("mindKey").value;
			
			var value = {
				midm_ori_num : midm_ori_num,
				midm_key_num : midm_key_num
			};
			$.ajax({
						url : "${pageContext.request.contextPath}/mindmap/selectBy",
						type : 'POST',
						data : value,
						success : function(res) {

							if (res[0] != null) {
								
								document.getElementById("mindmapFile_cont").innerHTML = res[0].midm_cont;
								document.getElementById("midm_num").value = res[0].midm_num;
								
								title = res[1].midm_file_name;
								
								size = res[1].midm_file_size;
								num = res[0].midm_num;
								
								var fileInfo = "<a href=\"#\" onclick=\"fileDown("+num+")\" class=\"mailbox-attachment-name\">"
								+title+
								"</span></a>";
							
										
								fileInfo += "<span class=\"mailbox-attachment-size\">"
										+ size + " </span>";
								var name = (res[1].midm_file_name)
										.substr((res[1].midm_file_name).length - 3);

								if (document.getElementById("fileapp") != null) {
									document.getElementById("fileapp").remove();
								}
								if (name == "jpg" || name == "png") {
									$("#file-Detaillist")
											.append(
													"<li id=\"fileapp\" style='float: left; width: 100px; border: 1px solid #eee; margin-bottom: 10px; margin-right: 10px;' ><span class=\"mailbox-attachment-icon\"><i class=\"fa fa-file-image-o\"></i></span><div class=\"mailbox-attachment-info\">"
															+ fileInfo
															+ "</div></li>");
								} else if (name == "pdf") {
									$("#file-Detaillist")
											.append(
													"<li id=\"fileapp\" style='float: left; width: 200px; border: 1px solid #eee; margin-bottom: 10px; margin-right: 10px;' ><span class=\"mailbox-attachment-icon\"><i class=\"fa fa-file-pdf-o\"></i></span><div class=\"mailbox-attachment-info\">"
															+ fileInfo
															+ "</div></li>");
								} else if (name == "hwp") {
									$("#file-Detaillist")
											.append(
													"<li id=\"fileapp\" style='float: left; width: 200px; margin-bottom: 10px; margin-right: 10px;' ><span class=\"mailbox-attachment-icon\"><i class=\"fa fa-file-word-o\"></i></span><div class=\"mailbox-attachment-info\">"
															+ fileInfo
															+ "</div></li>");
								} else if (name == "lsx" || name == "xls") {
									$("#file-Detaillist")
											.append(
													"<li id=\"fileapp\" style='float: left; width: 200px; border: 1px solid #eee; margin-bottom: 10px; margin-right: 10px;' ><span class=\"mailbox-attachment-icon\"><i class=\"fa fa-file-excel-o\"></i></span><div class=\"mailbox-attachment-info\">"
															+ fileInfo
															+ "</div></li>");
								} else {
									$("#file-Detaillist")
											.append(
													"<li id=\"fileapp\" style='float: left; width: 200px; border: 1px solid #eee; margin-bottom: 10px; margin-right: 10px;' ><span class=\"mailbox-attachment-icon\"><i class=\"fa fa-file\"></i></span><div class=\"mailbox-attachment-info\">"
															+ fileInfo
															+ "</div></li>");
								}
							} else if (res[0] == null) {

								if (document.getElementById("fileapp") != null) {
									document.getElementById("fileapp").remove();
								}

								document.getElementById("mindmap_cont").value = null;
								document.getElementById("fileSubName").value = null;
							}
						},
						dataType : 'json'
					})
			$("#searchModalStart").click();

		}

		//내용
		else if (type == 'middle' || type == 'big') {
			document.getElementById("midm_ori_num").value = n;
			var midm_ori_num = n;
			var midm_key_num = document.getElementById("mindKey").value;
			var value = {
				midm_ori_num : midm_ori_num,
				midm_key_num : midm_key_num
			};
			$.ajax({
						url : "${pageContext.request.contextPath}/mindmap/selectBy",
						type : 'POST',
						data : value,
						success : function(res) {
							if (res[0] != null) {
								document.getElementById("mindmap_cont").innerHTML = res[0].midm_cont;
								document.getElementById("midm_num").value = res[0].midm_num;
							} else if (res[0] == null) {

								document.getElementById("mindmap_cont").value = null;
							}
						},
						dataType : 'json'
					})
			$("#searchModalContent").click();
		}
		
	}
	function fileDown(num){
		var midm_img_num=num;
		
		location.href="${pageContext.request.contextPath}/mindfile.do?midm_img_num="+num;
	}

	function FlatTreeLayout() {
		go.TreeLayout.call(this); // call base constructor
	}
	go.Diagram.inherit(FlatTreeLayout, go.TreeLayout);

	function load() {    
		
		var image=new Image();
		image.src=document.getElementById("path").value;
		myDiagram.model = go.Model.fromJson(document.getElementById("mySavedModel").value);
		
	}
	$(document).on("click","#mindmapPrint",function(){
				var num= "${lectureVo.lec_num}";
				$.ajax({
			    	url : "${pageContext.request.contextPath}/resultmindmap",
			    	type :'POST',
			    	data : {"lec_num":num},
			    	success : function(res) {
			    		document.getElementById("mySavedModel").value = res.text;
			    		document.getElementById("mindKey").value = res.key;
			    		document.getElementById("path").value = res.path;
			    		 $("#ModalResult").click();
			    		 load();
			    		
			    	}
				})
			})
</script>
<style>
.vjs-poster{
    background-size: 100%!important;
}
</style>
<body>
	<div class="wrapper">
		<div class="content-wrapper"  id="conWBground">
		<br>
			<section class="content-header">
			<h1 id="title">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;강의시청<small></small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-dashboard"></i> 강의시청</li>
			</ol>
		</section>
		<hr id="hr"></hr>
		<!-- 헤더끝 -->
		<br>
		
			<section class="content">
				<div class="box-body no-padding">
					<div class="row" style="margin-top: 10px; padding-bottom:0px">
						<div class="col-lg-1"></div>
						<div class="col-lg-6">
							<video id="lecture" class="video-js vjs-default-skin"
								style="width:99.95%; height:500px;" controls preload="auto"
								data-setup='{"controls":true, "playbackRates": [0.5, 1.0, 1.5, 2.0, 2.5, 3.0]}'
								poster="${pageContext.request.contextPath}/filesave/${videoVo.vio_poster_path}">
								<source src="${pageContext.request.contextPath}/filesave/${videoVo.vio_path}">
							</video>
						</div>
						<input type="hidden" id="tol_vio_time" name="tol_vio_time">
						<input type="hidden" id="vio_size" name="vio_size">
						<div class="col-lg-4">
							<div class="box box-success box-solid" id="bookMarkDiv" style="height:240px;">
								<div class="box-header with-border">
									<h3 class="box-title">북마크</h3>
									<!-- /.box-tools -->
								</div>
								<!-- /.box-header -->
								<div class="box-body" style="height:90%; overflow:auto">
								<table class="table" >
									<thead>
										<tr>
											<td>시간</td>
											<td>내용</td>
										</tr>
									</thead>
									<tbody>
									<c:choose>
									<c:when test="${empty bookMarkList}">
									<tr>
										<td colspan="2">북마크가 없습니다.</td>				
									</tr>
									</c:when>
									<c:otherwise>
									<c:forEach items="${bookMarkList}" var="bookMarkVo">
										<tr>
											<td>${bookMarkVo.bkmark_time}</td>
											<td>${bookMarkVo.bkmark_cont}</td>
										</tr>
									</c:forEach>	
									</c:otherwise>
									</c:choose>
									</tbody>
								</table>
								</div>
								<!-- /.box-body -->
							</div>
						</div>
						<div class="col-lg-4">
							<div class="box box-success box-solid" id="bookMarkDiv" style="height:240px;">
								<div class="box-header with-border">
									<h3 class="box-title">메모</h3>
									<!-- /.box-tools -->
								</div>
								<!-- /.box-header -->
								<div class="box-body" style="height:90%; overflow:auto">
									<textarea id="memo" style="height:90%; width:100%; resize: none;"></textarea>
								</div>
								<!-- /.box-body -->
							</div>
						</div>
					</div>
					<div class="col-lg-1"></div>
					<div class="col-lg-10" style="padding-left:0">
						<h1 style="margin-top:0">${lectureVo.lec_title}&nbsp&nbsp<small>${lectureVo.lec_cont}</small><button type="button" id="mindmapPrint" class="btn btn-warning pull-right" style="width: 510px;">마인드맵</button></h1>
						<input type="hidden" id="ddd" name="ddd" value="${lecWatVo.lec_wat_num}">
						<hr>
						<h4 style="margin-left:27px; font-weight:bold; color:#77bb21; ">의견 쓰기</h4>
						<div class="row">
						<div class="col-md-1" style="margin-left:20px; margin-top: 7px;">
						<img class="profile-user-img img-responsive img-circle" src="${pageContext.request.contextPath}/image/reImg.png" alt="User profile picture">
						</div>
						<div class="col-md-8">
						<textarea id="lec_comm_cont" name="lec_comm_cont" style="width:93%; height:100px; margin-left:20px; resize: none;"></textarea>
						</div>
						<div class="col-md-2">
							<button type="button" id="addComment" class="btn btn-block btn-success btn-lg" style="width:93%; height:100px; margin-left:20px; margin-right: 30px;">작성하기</button>
						</div>
						</div>
						<hr>
						<div id="refresh">
						<c:choose>
						<c:when test="${empty lecComList}">
						<div class="col-lg-3"></div>
						<div class="col-lg-5" style="padding-bottom:50px">
							댓글이 없습니다.	
						</div>	
						</c:when>
						<c:otherwise>
							<c:forEach items="${lecComList}" var="lecComVo">
								<div class="col-md-10">
								<div class="post">
				                  <div class="user-block">
				                    <img class="img-circle img-bordered-sm" src="${pageContext.request.contextPath}/filesave/${lecComVo.comm_img}" alt="user image">
				                        <span class="username">
				                          <a>${lecComVo.lec_comm_wri_pers}</a>
				                          <button type="button" id="deleteComment" class="pull-right btn-box-tool" style="border:0"><i class="fa fa-times"></i></button>
				                          <input type="hidden" id="key" value="${lecComVo.lec_comm_num}">
				                        </span>
				                    <span class="description">${lecComVo.lec_comm_date}</span>
				                  </div>
				                  <p>
				                  	${lecComVo.lec_comm_cont}
				                  </p>
				                  </div>
			                  </div>
							</c:forEach>
						</div>	
		                </c:otherwise> 
		                </c:choose>
					</div>
				</div>
			
			</section>
		</div>
		<a href="#" data-toggle="modal" data-target="#mindModal" id="ModalResult"></a>
		<a href="#" data-toggle="modal" data-target="#nomalModal" id="searchModalContent"></a>
		<a href="#" data-toggle="modal" data-target="#fileModal" id="searchModalStart"></a>			
					<input type="text" id="midm_num" name="midm_num" hidden>

					<div class="modal fade" id="mindModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" style="width:70%; height:100%; ">
							<div class="modal-content modal-popup" style="width:100%; height:80%; ">
								<%@include
									file="/WEB-INF/views/mypage/mpTeacher/tVideo/curriculum/resultmindmap.jsp"%>
							</div>
						</div>
					</div>
				<div class="modal fade" id="nomalModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog"  style="width: 400px;">
						<div class="modal-content modal-popup">
							<%@include
								file="/WEB-INF/views/mypage/mpTeacher/tVideo/curriculum/mindmapDetail.jsp"%>
						</div>
					</div>
				</div>
				
				
				
				<div class="modal fade" id="fileModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
					<div class="modal-dialog" style="width: 400px;" >
						<div class="modal-content modal-popup">
							<%@include
								file="/WEB-INF/views/mypage/mpTeacher/tVideo/curriculum/mindmapFileDetail.jsp"%>
						</div>
					</div>
				</div>
	</div>
					

</body>
<script>
$(function() {
	var cou=0;
	if(cou==0){
		cou=1;
	 $("#ModalResult").click();
	  load(); 
	 
	}
})
	
</script>
<script src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
<script src="http://vjs.zencdn.net/ie8/1.1.2/videojs-ie8.min.js"></script>
<script src="http://vjs.zencdn.net/5.10.4/video.js"></script>
<script src="${pageContext.request.contextPath}/js/videojs-markers.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery.minicolors/2.0.4/jquery.minicolors.js"></script>
</html>