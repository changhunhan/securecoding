<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/studentPage.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
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
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상담하기<small>학생 상담페이지</small></h1>
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
						<button class="btn btn-warning" id="connectChannel" style="margin:10px">
										채팅방 입장&nbsp<span class="glyphicon glyphicon-earphone"
											aria-hidden="true"></span>
									</button></div>
					</div>
				</div>
				<div class="box-body">
					<div class="container">
						<div class="row">
						<div class="col-md-1"></div>
							 <div class="col-md-10">
						            <label class="sr-only" for="connectChannelId">Channel Id</label>
						            <input class="form-control" type="hidden" id="connectChannelId" placeholder="Enter the channel id." value="">
						          
						
						        <video class="remote-video center-block" id="calleeRemoteVideo"></video>
						        <video class="local-video pull-right" id="calleeLocalVideo"></video>
						
						      </div>
						      <div class="row">
							<div class="col-lg-1"></div>
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
									</div>
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
    var connectChannelId = null;
    var connectChannelButton = document.querySelector('#connectChannel');
    var sendButton = document.querySelector('#send');
	var sendMessage = document.querySelector('#sendMessage');
    var recevedMessage = document.querySelector('#recevedMessage');
    var appCallee;
    var joinCheck = true;
    var num = "${num}";
    appCallee = new PlayRTC({
      projectKey: "2f6f2a66-92b4-4937-8af7-d6f41685bf98",
      localMediaTarget: "calleeLocalVideo",
      remoteMediaTarget: "calleeRemoteVideo"
    });
    appCallee.on('addDataStream', function (pid, uid, dataChannel) {
        dataChannel.on('message', function (message) {
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

        dataChannel.on('error', function (event) {
          alert('ERROR. See the log.');
        });
      });
    connectChannelButton.addEventListener('click', function(e) {
    	var id;
    
    	$.ajax({
    		url:"${pageContext.request.contextPath}/sAdvice/studentKey",
    		type:"POST",
    		data : {'num':num},
    		success:function(res) {
    			if(res == "") {
    				alert("선생님이 아직 채팅방을 개설하지 않았습니다.");
    			} else {
    				 e.preventDefault();
    			      var channelId = res;
    			      if (!channelId) { return };
    			      appCallee.connectChannel(channelId);
    			}
    		},
    		dataType:"text"
    	})
     
      if(joinCheck) {
    	  setTimeout('$("#sendMessage").val("학생이 입장했습니다")', 3500);
    	  setTimeout('$("#send").click()', 3500);
    	  joinCheck = false;
      }
      
    }, false);
    
    sendButton.addEventListener('click', function (event) {
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
	      };
	      appCallee.sendText(data);
	      sendMessage.value = "";
	      return false;
	    }, false);
  </script>