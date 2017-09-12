<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>   
<html>
<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script>
	function fn_article3(containerID, buttonID, autoStart) {
		var $element = $('#' + containerID).find('.notice-list');
		var $prev = $('#' + buttonID).find('.prev');
		var $next = $('#' + buttonID).find('.next');
		var $play = $('#' + containerID).find('.control > a.play');
		var $stop = $('#' + containerID).find('.control > a.stop');
		var autoPlay = autoStart;
		var auto = null;
		var speed = 2000;
		var timer = null;

		var move = $element.children().outerHeight();
		var first = false;
		var lastChild;

		lastChild = $element.children().eq(-1).clone(true);
		lastChild.prependTo($element);
		$element.children().eq(-1).remove();

		if ($element.children().length == 1) {
			$element.css('top', '0px');
		} else {
			$element.css('top', '-' + move + 'px');
		}

		if (autoPlay) {
			timer = setInterval(moveNextSlide, speed);
			auto = true;
		} else {
			$play.hide();
			$stop.hide();
		}

		$element.find('>li').bind({
			'mouseenter' : function() {
				if (auto) {
					clearInterval(timer);
				}
			},
			'mouseleave' : function() {
				if (auto) {
					timer = setInterval(moveNextSlide, speed);
				}
			}
		});
		function movePrevSlide() {
			$element.each(function(idx) {
				if (!first) {
					$element.eq(idx).animate({
						'top' : '0px'
					}, 'normal', function() {
						lastChild = $(this).children().eq(-1).clone(true);
						lastChild.prependTo($element.eq(idx));
						$(this).children().eq(-1).remove();
						$(this).css('top', '-' + move + 'px');
					});
					first = true;
					return false;
				}
				$element.eq(idx).animate(
						{
							'top' : '0px'
						},
						'normal',
						function() {
							lastChild = $(this).children()
									.filter(':last-child').clone(true);
							lastChild.prependTo($element.eq(idx));
							$(this).children().filter(':last-child').remove();
							$(this).css('top', '-' + move + 'px');
						});
			});
		}
		function moveNextSlide() {
			$element.each(function(idx) {

				var firstChild = $element.children().filter(':first-child')
						.clone(true);
				firstChild.appendTo($element.eq(idx));
				$element.children().filter(':first-child').remove();
				$element.css('top', '0px');

				$element.eq(idx).animate({
					'top' : '-' + move + 'px'
				}, 'normal');

			});
		}
	}
</script>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SWCONTEST</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}//bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"	href="${pageContext.request.contextPath}/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"	href="${pageContext.request.contextPath}/dist/css/skins/_all-skins.min.css">
<!-- iCheck -->
<link rel="stylesheet"	href="${pageContext.request.contextPath}/plugins/iCheck/flat/blue.css">
<!-- Morris chart -->
<link rel="stylesheet"	href="${pageContext.request.contextPath}/plugins/morris/morris.css">
<!-- jvectormap -->
<link rel="stylesheet"	href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<!-- Date Picker -->
<link rel="stylesheet"	href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
<!-- Daterange picker -->
<link rel="stylesheet"	href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker-bs3.css">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet"	href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-rolling.css" />
<!-- DataTables -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div id="wrapper">
		<div id="header">
			<tiles:insertAttribute name="header"/>
		</div>
		<div id="menu">
			<tiles:insertAttribute name="menu"/>
		</div>
		<div id="body">
			<tiles:insertAttribute name="body"/>
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer"/>
		</div>
	</div>
<!-- jQuery 2.2.0 -->
	<script	src="${pageContext.request.contextPath}/plugins/jQuery/jQuery-2.2.0.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>$.widget.bridge('uibutton', $.ui.button);</script>
	<!-- Bootstrap 3.3.6 -->
	<script	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	<!-- Morris.js charts -->
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<!-- 	<script src="plugins/morris/morris.min.js"></script> -->
	<!-- Sparkline -->
	<script	src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script	src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script	src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<!-- jQuery Knob Chart -->
	<script	src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
	<!-- daterangepicker -->
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<script	src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- datepicker -->
	<script	src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
	<!-- Bootstrap WYSIHTML5 -->
	<script	src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<!-- Slimscroll -->
	<script	src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script	src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="${pageContext.request.contextPath}/dist/js/app.min.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<!-- 	<script src="dist/js/pages/dashboard.js"></script> -->
	<!-- AdminLTE for demo purposes -->
	<script src="${pageContext.request.contextPath}/dist/js/demo.js"></script>
	
	<script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
	
	
	<script src='${pageContext.request.contextPath}/plugins/fullcalendar/moment.min.js'></script>
	<script src="${pageContext.request.contextPath}/plugins/fullcalendar/fullcalendar.min.js"></script>
	<script src='${pageContext.request.contextPath}/plugins/fullcalendar/lang-all.js'></script>
	<script type='text/javascript' src='${pageContext.request.contextPath}/plugins/fullcalendar/gcal.js'></script>
	
	
</body>
</html>