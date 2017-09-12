<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/videoUpload.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link href="${pageContext.request.contextPath}/css/video-js.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/videojs.markers.css"
	rel="stylesheet">

<script>
	
	var timeMap = new Map();
	var textMap = new Map();
	var contMap = new Map();
	var count = 0;
	var checkMarker = true;
	$(function() {
		$("#lecture").on("timeupdate", function() {
			$("#currentTime").val(this.currentTime);
		})
		$('#videoUpload').click(function(e) {
			e.preventDefault();
			$('#video').click();
		});
		$("#posterUpload").click(function(e) {
			e.preventDefault();
			$("#poster").click();
		})
		
		var player = videojs('lecture');
		
		$(document).on("click", "#addBookMark", function() {
			var currentTime = parseInt(player.currentTime());
			var text = $("#bookMarkText").val();
			var cont = $("#bookMarkCont").val();
			
			if(checkMarker) {
				player.markers({
					   markers: [{
					        time : currentTime,
							text : text
					   }],
					   onMarkerClick: function(marker) {
						   $("#bookMarkText").val(textMap.get(getTimeKey(parseInt(marker.time))));
						   $("#bookMarkCont").val(contMap.get(getTimeKey(parseInt(marker.time))));
					   }
				});
			}
			if(getTimeKey(currentTime) != 0) {
				if(getTimeKey(currentTime) == "-1") {
					player.markers.add([{
						time: currentTime,
						text: text
					}])
					timeMap.set(count, currentTime);
					textMap.set(count, text);
					contMap.set(count, cont);
					count++;
				} else {
					alert("북마크가 등록된 지점입니다.");
				}
			} else {
				player.markers.add([{
					time: currentTime,
					text: text
				}])
				timeMap.set(count, currentTime);
				textMap.set(count, text);
				contMap.set(count, cont);
				count++;
			}
			
			
			$("#bookMarkText").val("");
			$("#bookMarkCont").val("");
			checkMarker = false;
		})
		$(document).on("change", "#video", function() {
							var videoName = $("#video")[0].files[0];
							if (videoName == undefined) {
								document.getElementById("video").value = "";
								document.getElementById("videoName").value = "";
								document.getElementById("vio_size").value = "0";
								$("#lecture").css("display", "none");
								$("#posterDiv").css("display", "none");
								$("#bookMarkDiv").css("display", "none");
							} else {
								var dot = videoName.name.lastIndexOf(".");
								var ext = videoName.name.substring(dot)
										.toLowerCase();
								if (ext != ".mp4" && ext != ".webm"
										&& ext != ".ogg") {
									alert("지원되지 않는 형식입니다. 다시 입력해주세요");
									document.getElementById("video").value = "";
									document.getElementById("videoName").value = "";
									document.getElementById("vio_size").value = "0";
									$("#lecture").css("display", "none");
									$("#posterDiv").css("display", "none");
									$("#bookMarkDiv").css("display", "none");
								} else {
									document.getElementById("videoName").value = videoName.name;
									loadVideo();
								}
							}
						})
		$(document).on("change", "#poster", function() {
			var poster = $("#poster")[0].files[0];
			var imgURL = window.URL.createObjectURL(poster);
			$("#posterImage").attr('src', imgURL);
			loadVideo();
		})
		$(document).on("click", "#register", function() {
			var formData = new FormData(document.getElementById("uploadVideo"));
			var textIter = textMap.values();
			var timeIter = timeMap.values();
			var contIter = contMap.values();
			for(var i = 0; i < count; i++) {
				formData.append("text", textIter.next().value);
				formData.append("time", timeIter.next().value);
				formData.append("cont", contIter.next().value);
			}
			
			$.ajax({
				url: "${pageContext.request.contextPath}/video/lectureVideoUpload",
				type: "POST",
				data : formData,
				async : false,
				cache : false,
				contentType : false,
				processData : false,
				success : function(res) {
					if(res == 0) {
						location.href="${pageContext.request.contextPath}/video/curriculum/curriculumList";
					}
				}
			})
		})
		$(document).on("click", "#deleteBookMark", function() {
			var key = getTimeKey(parseInt($("#currentTime").val()));
			var markerKey = getMarkerKey(parseInt($("#currentTime").val()));
			if(key != "-1" && markerKey != "-1") {
				player.markers.remove([markerKey]);
				timeMap.delete(key);
				textMap.delete(key);
				contMap.delete(key);
				$("#bookMarkText").val("");
				$("#bookMarkCont").val("");
			} else {
				alert("해당 지점에 북마크가 없습니다.");
			}
		})
		function getMarkerKey(value) {
			var markers = player.markers.getMarkers();
			var flag = false;
			var keyVal;
			for(var i = 0; i < markers.length; i++) {
				if(markers[i].time == value) {
					flag = true;
					keyVal = i;
					break;
				}
			}
			if(flag) {
				return keyVal;
			} else {
				return "-1";
			}
		}
		function getTimeKey(value){
		    var flag=false;
		    var keyVal;
		    var timeIter = timeMap.values();
		    for (var i = 0; i < count; i++){
		         if (timeMap.get(i) == value){
		             flag=true;
		             keyVal=i;
		             break;
		         }
		    }
		    if(flag){
		         return keyVal;
		    }
		    else{
		         return "-1";
		    }
		}
	});
	
	function loadVideo() {
		var player = videojs("lecture", {}, function() {
			this.on('ended', function() {
				this.currentTime('0');
			})
		});
		$("#lecture").css("display", "block");
		$("#posterDiv").css("display", "block");
		$("#bookMarkDiv").css("display", "block");
		var fileUrl = URL.createObjectURL($("#video")[0].files[0]);
		var fileType = $("#video")[0].files[0].type;
		document.getElementById("vio_size").value = $("#video")[0].files[0].size;
		player.src({
			type : fileType,
			src : fileUrl
		});
		var poster = $("#poster")[0].files[0];
		if (poster != undefined) {
			var imgURL = window.URL.createObjectURL(poster);
			$("#lecture_html5_api").attr("poster", imgURL);
		}
		player.load();
	}
	function duration() {
		var player = videojs("lecture");
		if ($("#video")[0].files[0] != undefined) {
			document.getElementById("tol_vio_time").value = player.duration();
		} else {
			document.getElementById("tol_vio_time").value = "0";
		}

	}
</script>
<style>
#video, #poster {
	display: none;
}

#lecture, #posterDiv, #bookMarkDiv {
	display: none;
}

</style>
<body>
<div class="wrappers">
		<div class="content-wrapper" id="conWBground">
		<br>
		<section class="content-header">
			<h1 id="title">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;동영상업로드 <small></small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-dashboard"></i> 마이페이지</li>
				<li class="active">강의관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			</ol>
		</section>
		<hr id="hr"></hr>
		<br><br>
		<!-- /.헤더 -->
		
		<!-- 메인content -->
		<section class="content">
		<div class="row">
			<section class="col-lg-2 connectedSortable"></section>
			<section class="col-lg-8"> 
				<div class="box box-primary">
					<br>
			<div class="box-body no-padding">
				<form id="uploadVideo" method="post" enctype="multipart/form-data">
					<div class="row" style="margin-top: 10px">
						<div class="col-xs-4" style="margin-left: 10px">
							<label for="id">동영상 업로드</label> <input type="text" id="videoName"
								name="vio_name" class="form-control input-sm"
								placeholder="Video Upload" readonly>
						</div>
						<div class="form-group" style="margin-top: 22.5px">
							<input type="file" id="video" name="video" accept="video/*">
							<button type="button" id="videoUpload" class="btn btn-primary"
								style="background-color: #3c8dbc; border: none">
								<b>동영상 찾기</b>
							</button>
							<small style="opacity: 0.5;">지원 형식은 .mp4 .webm .ogg입니다.</small>
						</div>
					</div>
					<div class="row" style="margin: 10px;">
						<div class="col-lg-8">
							<video id="lecture" class="video-js vjs-default-skin"
								style="width:100%; max-height:500px; min-height:400px" controls preload="auto" 
								data-setup='{"controls":true, "playbackRates": [0.5, 1.0, 1.5, 2.0, 2.5, 3.0]}'>
							</video>
						</div>
						<input type="hidden" id="tol_vio_time" name="tol_vio_time">
						<input type="hidden" id="vio_size" name="vio_size">
						<div class="col-lg-4">
						<div class="box box-success box-solid" id="bookMarkDiv">
							<div class="box-header with-border">
								<h3 class="box-title">북마크 추가</h3>
								<!-- /.box-tools -->
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<label for="id">현재 시간</label> <input type="text" id="currentTime" class="form-control input-sm"
									value="0">
								<label for="id">북마크 제목</label> <input type="text" id="bookMarkText" class="form-control input-sm"
									placeholder="Bookmark Title">
								<label for="id">북마크 내용</label> <input type="text" id="bookMarkCont" class="form-control input-sm"
									placeholder="Bookmark Cont">
								<button type="button" id="addBookMark" class="btn btn-block btn-success" style='margin-top:5px;'>북마크 추가</button>
								<button type="button" id="deleteBookMark" class="btn btn-block btn-success" style='margin-top:5px;'>북마크 삭제</button>
								</div>
							<!-- /.box-body -->
						</div>
						</div>
					</div>
					<div class="form-group has-feedback"
						style="margin: 10px; margin-top: 0px" id="posterDiv">
						<img src="http://placehold.it/150x100"
							style="width: 150px; height: 100px;" id="posterImage"
							alt="poster" class="margin"> <input type="file" id="poster"
							name="poster" accept="image/*">
						<button type="button" id="posterUpload" class="btn btn-primary"
							style="background-color: #3c8dbc; border: none">
							<b>동영상 포스터 등록</b>
						</button>
					</div>
					<div class="form-group has-feedback"
						style="margin: 10px; margin-top: 0px">
						<label for="id">강의 제목</label> <input type="text" name="lec_title"
							class="form-control input-sm" placeholder="Video Title">
						<span class="glyphicon glyphicon-pencil form-control-feedback"></span>
						<input type="hidden" name="cur_num" value="${cur_num}" value="">
					</div>
					<div class="form-group has-feedback" style="margin: 10px">
						<label for="id">동영상 간단 설명</label>
						<textarea class="textarea" name="lec_cont"
							placeholder="Place some text here"
							style="width: 100%; height: 75px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
					</div>
					<div class="row">
						<!-- /.col -->
						<div class="col-xs-2" id="register">
							<button type="button" id="저장" onclick="duration()"
								class="btn btn-primary btn-block btn-flat"
								style="background-color: #3c8dbc; border: none">저장</button>
						</div>
						<!-- /.col -->
					</div>
				</form>
				</div>
			</div>
			</section>
		</div>
		</section>
	</div>
	</div>
	
</body>
<script src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
<script src="http://vjs.zencdn.net/ie8/1.1.2/videojs-ie8.min.js"></script>
<script src="http://vjs.zencdn.net/5.10.4/video.js"></script>
<script src="${pageContext.request.contextPath}/js/videojs-markers.js"></script>
</html>