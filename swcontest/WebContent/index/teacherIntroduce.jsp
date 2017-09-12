<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="top: 160px;">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			<li data-target="#carousel-example-generic" data-slide-to="3"></li>
			<li data-target="#carousel-example-generic" data-slide-to="4"></li>
		</ol>
		<!-- Wrapper for slides 메인 슬라이드-->
		<div class="carousel-inner">
			<div class="item active">
				<img src="${pageContext.request.contextPath }/image/index/timg5.png"
					alt="...">
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath }/image/index/timg2.png"
					alt="...">
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath }/image/index/timg3.png"
					alt="...">
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath }/image/index/timg4.png"
					alt="...">
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath }/image/index/timg1.png"
					alt="...">
				<div class="carousel-caption"></div>
			</div>
		</div>

		<!-- Controls  이건뭔지 나도몰라...-->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left"></span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span>
		</a>
	</div>
</body>
</html>