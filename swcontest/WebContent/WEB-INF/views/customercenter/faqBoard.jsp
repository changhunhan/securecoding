<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/faqBoard.css">
<style type="text/css">

div {
    display: block;
}
.info_cont ul.gyTab>li {
    float: left;
    height: 50px;
    width: 16.666%;
    
}
.info_tab1 li {
    float: left;
    margin-bottom: -1px;
}
.info_tab1 {
    margin-left: 40px;
}
.info_cont ul.gyTab>li>a {
    display: block;
    font-size: 15px;
    color: #333333;
    text-align: center;
    line-height: 48px;
    border: 1px solid #4e4e4e;
    border-left: none;
    background: #fff;
}
.info_cont ul.gyTab>li>a.hover {
		background: yellow;
	}
    ul, ol {
    list-style: none;
}
.info_cont {
    position: relative;
    height: 70px;
}
.info_tab1 a {
    display: block;
    position: relative;
    margin-left: -1px;
    padding: 10px 0 10px;
    width: 150px;
    border: 1px solid #ddd;
    background: #f7f7f7;
    color: #888;
    text-align: center;
    letter-spacing: -0.1em;
    line-height: 1.2em;
    cursor: pointer;
}
.info_tab1 .on {
    z-index: 2;
    border: 1px solid #565e60;
    background: #fff;
    color: #565e60;
    font-weight: bold;
}
h5.type1 {
    font-size: 18px;
    font-weight: bold;
    color: #555555;
    padding-left: 25px;
    background: url(image/ic_title.gif) 0 6px no-repeat;
    line-height: 25px;
    margin: 0 0 20px 0;
}
	</style>
</head>
<!-- 헤더시작 -->
<body>
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
			<br>
			<section class="content-header">
				<h1 id="title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FAQ<small>자주하는 질문</small></h1>
				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i> 고객센터</li>
					<li class="active">FAQ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				</ol>
			</section>
			<hr id="hr"></hr><br><br>
			<section class="content">
				<div class="row">
					<section class="col-lg-2 connectedSortable"></section>
					<section class="col-lg-8"> 
						<!-- 시스템관련,수강관련,학습방법,로그인,기타이용안내 -->
						<section id="testInfo" class="section section-padded">
							<div class="container">
								<div class="row text-center title">
									<div class="subContainer">
										<div class="info_cont" style="margin: auto;">
											<ul class="gyTab">    
											<li class="on" style="border-left: 1px solid;">
												<a onclick="faqSystem();" style="font-size:10pt; font-weight:bold; cursor:pointer;">시스템관련</a></li>
											<li><a onclick="faqLecture();" style="font-size:10pt; font-weight:bold; cursor:pointer;">수강관련</a></li>
											<li><a onclick="faqStudy();" style="font-size:10pt; font-weight:bold; cursor:pointer;">학습방법</a></li>
											<li><a onclick="faqLogin();" style="font-size:10pt; font-weight:bold; cursor:pointer;">로그인</a></li>
											<li><a onclick="faqEct();" style="font-size:10pt; font-weight:bold; cursor:pointer;">기타이용</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</section>
					</section>
				</div>
				<div class="row">
					<section class="col-lg-2 connectedSortable"></section>
					<section class="col-lg-8"><div id="frame"></div></section>
				</div>
			</section>
		</div>
	</div>
	
<script type="text/javascript">
$(function(){
	$("#frame").load("${pageContext.request.contextPath}/faqBoard/faqSystem.jsp");
})
function faqSystem(){
	$("#frame").load("${pageContext.request.contextPath}/faqBoard/faqSystem.jsp");
}
function faqLecture(){
	$("#frame").load("${pageContext.request.contextPath}/faqBoard/faqLecture.jsp");
}
function faqStudy(){
	$("#frame").load("${pageContext.request.contextPath}/faqBoard/faqStudy.jsp");
}
function faqLogin(){
	$("#frame").load("${pageContext.request.contextPath}/faqBoard/faqLogin.jsp");
}
function faqEct(){
	$("#frame").load("${pageContext.request.contextPath}/faqBoard/faqEct.jsp");
	
}
</script>
</body>
</html>