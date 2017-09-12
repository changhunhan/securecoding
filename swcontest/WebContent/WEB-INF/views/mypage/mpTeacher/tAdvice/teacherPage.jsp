<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/teacherPage.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.local-video {
	width: 200px;
	height: 150px;
	position: absolute;
	top : 170px;
	right : 20%;
}

.remote-video {
	margin: 20px;
	width: 400px;
	height: 300px;
}
</style>
<script>
$(function() {
		$(document).on("keypress", "#sendMessage", function(e) {
			if(e.keyCode == 13) {
				$("#send").click();
			}
				
		})
	})
</script>
<body>
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
		<br>
			<!-- 헤더시작 -->
			<section class="content-header">
				<h1 id="title">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상담하기<small>선생님 상담페이지</small></h1>
				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i> 마이페이지</li>
					<li class="active">상담하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				</ol>
			</section>
			<hr id="hr"></hr>
			<br>
			<br>
			<!-- /.헤더 -->
			
			<section class="content">
			<div class="box-body">
			<section class="col-lg-1 connectedSortable"></section>
				<section class="col-lg-10"> 
				<div class="box-header">
					<div class="box-tools pull-right">
					<button class="btn btn-warning" id="createChannel" style="margin:10px">
										채팅방 입장&nbsp<span class="glyphicon glyphicon-phone-alt"
											aria-hidden="true"></span>
									</button></div>
				</div>
				<div class="box-body">
					<div class="container">
						<div class="col-md-1"></div>
							<div class="col-md-10">
										<label class="sr-only" for="createChannelId">Channel
											Id</label> <input class="form-control" type="hidden"
											id="createChannelId"
											placeholder="Create and connect the channel." value=""
											readonly>
									
								<video class="remote-video center-block" id="callerRemoteVideo"></video>
								<video class="local-video pull-right" id="callerLocalVideo"></video>
							</div>
							<div class="row">
							<div class="col-lg-2"></div>
							<div class="col-lg-10 col-lg-offset-1">
								<input type="hidden" class="form-control" id="recevedMessage"
									readonly>
								
									<div class="box box-success direct-chat direct-chat-success">
										<!-- /.box-header -->
										<div class="box-body">
											<!-- Conversations are loaded here -->
											<div id="chat" class="direct-chat-messages"></div>
											<!-- /.box-body -->
											<div class="box-footer">
												<div class="input-group">
													<input type="text" name="message" id="sendMessage"
														placeholder="Type Message ..." class="form-control">
													<span class="input-group-btn">
														<button id="send" class="btn btn-success btn-flat">Send</button>
													</span>
												</div>
											</div>
											<!-- /.box-footer-->
										</div>
										<!--/.direct-chat -->
										<input type="hidden" id="updateKey">
									</div>
								</div>
							</div>
						</div>
					</div>
					</section>
					</div>
			</section>
		</div>
	</div>
</body>
</html>
<script src="https://www.playrtc.com/sdk/js/playrtc.js"></script>
<script>
	'use strict';
	var createChannelButton = document.querySelector('#createChannel');
	var createChannelId = document.querySelector('#createChannelId');
	var sendButton = document.querySelector('#send');
	var sendMessage = document.querySelector('#sendMessage');
	var recevedMessage = document.querySelector('#recevedMessage');
	var appCaller;
	var num = "${num}";
	$(function() {
		$(window).on('beforeunload', function(){
			$.ajax({
				url: "${pageContext.request.contextPath}/tAdvice/keyUpdate",
				type: "POST",
				data: {'num' : num},
				success: function(res) {
					
				},
				dataType :"text"
				})
            return 'Are you sure you want to leave?';
     	});
		$("#updateKey").click(function() {
			$.ajax({
				url : "${pageContext.request.contextPath}/tAdvice/teacherKey",
				type : "POST",
				data : {
					'num' : num,
					'key' : createChannelId.value
				},
				success : function(res) {
				},
				dataType : "text"
			})
		})
	})
	appCaller = new PlayRTC({
		projectKey : "2f6f2a66-92b4-4937-8af7-d6f41685bf98",
		localMediaTarget : "callerLocalVideo",
		remoteMediaTarget : "callerRemoteVideo"
	});
	appCaller
			.on(
					'connectChannel',
					function(channelId) {
						createChannelId.value = channelId;
						$("#chat")
								.append(
										"<div class='direct-chat-msg right'><div class='direct-chat-info clearfix'><span class='direct-chat-timestamp pull-left'>" + new Date() + "</span></div><div class='direct-chat-text'>선생님이 입장하셨습니다.</div></div>");
						setTimeout('$("#updateKey").click()', 1000);
						$("#chat").scrollTop($("#chat")[0].scrollHeight);
					});
	createChannelButton.addEventListener('click', function(e) {
		e.preventDefault();
		appCaller.createChannel();
	}, false);
	sendButton
			.addEventListener(
					'click',
					function(event) {
						var data = sendMessage.value;
						$("#chat")
								.append(
										"<div class='direct-chat-msg right'><div class='direct-chat-info clearfix'><span class='direct-chat-timestamp pull-left'>" + new Date() + "</span></div><div class='direct-chat-text'>"
												+ sendMessage.value
												+ "</div></div>");
						$("#chat").scrollTop($("#chat")[0].scrollHeight);
						event.preventDefault();
						if (!data) {
							return false;
						}
						;
						appCaller.sendText(data);
						sendMessage.value = "";
						return false;
					}, false);

	appCaller
			.on(
					'addDataStream',
					function(pid, uid, dataChannel) {
						dataChannel
								.on(
										'message',
										function(message) {
											if (message.type === 'text') {
												recevedMessage.value = message.data;
												$("#chat")
														.append(
																"<div class='direct-chat-msg'><div class='direct-chat-info clearfix'><span class='direct-chat-timestamp pull-right'>" + new Date() + "</span></div><div class='direct-chat-text'>"
																		+ message.data
																		+ "</div></div>");
												$("#chat").scrollTop($("#chat")[0].scrollHeight);
											}
										});

						dataChannel.on('error', function(event) {
							alert('ERROR. See the log.');
						});
					});
</script>