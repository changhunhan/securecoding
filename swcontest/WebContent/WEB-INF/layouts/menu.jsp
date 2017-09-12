<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		String state = (String) session.getAttribute("state");
	%>
	
	<!-- Left side column. contains the logo and sidebar -->
	<aside class="main-sidebar">
	 <!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
	 <!-- Sidebar user panel -->
	<div class="user-panel">
		<div class="pull-left image">
			<img src="${pageContext.request.contextPath}/filesave/${img.mem_img_rename}" class="img-circle" alt="User Image">
		</div>
		<div class="pull-left info">
			<p>${mem_id}</p>
			<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
		</div>
	</div>

	<!-- /.search form --> <!-- sidebar menu: : style can be found in sidebar.less -->
	<!-- 	<!-- search form -->
<!-- 	<form action="#" method="get" class="sidebar-form"> -->
<!-- 		<div class="input-group"> -->
<!-- 			<input type="text" name="q" class="form-control" placeholder="Search..."> -->
<!-- 				<span class="input-group-btn"> -->
<!-- 				<button type="submit" name="search" id="search-btn" class="btn btn-flat"> -->
<!-- 					<i class="fa fa-search"></i> -->
<!-- 				</button> -->
<!-- 			</span> -->
<!-- 		</div> -->
<!-- 	</form> -->
	<ul class="sidebar-menu">
		<li class="header">네비게이터</li>
		<li><a href="${pageContext.request.contextPath}/main/main"> <i
				class="fa fa-th"></i> <span>메인메뉴</span>
		</a></li>
		<li class="treeview" id="watch">
		<a href="#">
		<i class="fa fa-laptop"></i>
		<span>강의시청</span>
		<i class="fa fa-angle-left pull-right"></i>
		</a>
			<ul class="treeview-menu">
				<li id="01"><a href="#"><i class="fa fa-circle-o"></i> 기사 <i
						class="fa fa-angle-left pull-right"></i></a>
					<ul class="treeview-menu">
						<li><a
							href="${pageContext.request.contextPath}/video/teacherList?testCode=1&proceCode=1"><i
								class="fa fa-circle-o"></i> 전자계산기조식응용기사</a></li>
						<li><a
							href="${pageContext.request.contextPath}/video/teacherList?testCode=1&proceCode=2"><i
								class="fa fa-circle-o"></i> 정보처리기사</a></li>
						<li><a
							href="${pageContext.request.contextPath}/video/teacherList?testCode=1&proceCode=3"><i
								class="fa fa-circle-o"></i> 정보보안기사</a></li>
						<li><a
							href="${pageContext.request.contextPath}/video/teacherList?testCode=1&proceCode=4"><i
								class="fa fa-circle-o"></i> 방송통신기사</a></li>
						<li><a
							href="${pageContext.request.contextPath}/video/teacherList?testCode=1&proceCode=5"><i
								class="fa fa-circle-o"></i> 무선설비기사</a></li>
						<li><a
							href="${pageContext.request.contextPath}/video/teacherList?testCode=1&proceCode=6"><i
								class="fa fa-circle-o"></i> 전파통신기사</a></li>
						<li><a
							href="${pageContext.request.contextPath}/video/teacherList?testCode=1&proceCode=7"><i
								class="fa fa-circle-o"></i> 정보통신기사</a></li>
					</ul></li>
				<li id="02"><a href="#"><i class="fa fa-circle-o"></i> 기능사
						<i class="fa fa-angle-left pull-right"></i></a>
					<ul class="treeview-menu">
						<li><a
							href="${pageContext.request.contextPath}/video/teacherList?testCode=2&proceCode=8"><i
								class="fa fa-circle-o"></i> 전자계산기조식응용기능사</a></li>
						<li><a
							href="${pageContext.request.contextPath}/video/teacherList?testCode=2&proceCode=9"><i
								class="fa fa-circle-o"></i> 정보처리기능사</a></li>
						<li><a
							href="${pageContext.request.contextPath}/video/teacherList?testCode=2&proceCode=10"><i
								class="fa fa-circle-o"></i> 정보보안기능사</a></li>
						<li><a
							href="${pageContext.request.contextPath}/video/teacherList?testCode=2&proceCode=11"><i
								class="fa fa-circle-o"></i> 방송통신기능사</a></li>
						<li><a
							href="${pageContext.request.contextPath}/video/teacherList?testCode=2&proceCode=12"><i
								class="fa fa-circle-o"></i> 무선설비기능사</a></li>
						<li><a
							href="${pageContext.request.contextPath}/video/teacherList?testCode=2&proceCode=13"><i
								class="fa fa-circle-o"></i> 전파통신기능사</a></li>
						<li><a
							href="${pageContext.request.contextPath}/video/teacherList?testCode=2&proceCode=14"><i
								class="fa fa-circle-o"></i> 정보통신기능사</a></li>
					</ul></li>
				<li id="03"><a href="#"><i class="fa fa-circle-o"></i> 산업기사
						<i class="fa fa-angle-left pull-right"></i></a>
					<ul class="treeview-menu">
						<li><a
							href="${pageContext.request.contextPath}/video/teacherList?testCode=3&proceCode=15"><i
								class="fa fa-circle-o"></i> 전자계산기제어산업기사</a></li>
						<li><a
							href="${pageContext.request.contextPath}/video/teacherList?testCode=3&proceCode=16"><i
								class="fa fa-circle-o"></i> 전자산업기사</a></li>
						<li><a
							href="${pageContext.request.contextPath}/video/teacherList?testCode=3&proceCode=17"><i
								class="fa fa-circle-o"></i> 정보처리산업기사</a></li>
						<li><a
							href="${pageContext.request.contextPath}/video/teacherList?testCode=3&proceCode=18"><i
								class="fa fa-circle-o"></i> 컴퓨터응용가공산업기사</a></li>
					</ul></li>
			</ul></li>
					
			<li class="treeview"><a href="#"> <i class="fa fa-edit"></i>
					<span>커뮤니티</span> <i class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li><a href="${pageContext.request.contextPath}/community/cmKnowledgeList"><i class="fa fa-circle-o"></i> 지식인</a></li>
					<li><a href="${pageContext.request.contextPath}/returnAfterexam"><i class="fa fa-circle-o"></i> 시험후기</a></li>
					<li><a href="${pageContext.request.contextPath}/returnStudy"><i class="fa fa-circle-o"></i> 학습게시판</a></li>
					<li><a href="${pageContext.request.contextPath}/community/answerBoard"><i class="fa fa-circle-o"></i> 가답안/확정답안</a></li>
				</ul></li>
				
		<%
			if (state.equals("student")) {
		%>
		<li class="treeview"><a href="#"> <i class="fa fa-user"></i>
				<span>마이페이지(회원)</span> <i class="fa fa-angle-left pull-right"></i>
		</a>
			<ul class="treeview-menu">
				<li><a
					href="${pageContext.request.contextPath}/sLecture/sLectureList/${mem_id}"><i
						class="fa fa-circle-o"></i> 수강신청현황</a></li>
				<li><a
					href="${pageContext.request.contextPath}/sInformation/sInformationLock"><i
						class="fa fa-circle-o"></i> 내정보수정</a></li>
				<li><a
					href="${pageContext.request.contextPath}/sAdvice/sAdviceMain"><i
						class="fa fa-circle-o"></i> 상담신청</a></li>
<!-- 				<li><a -->
<%-- 					href="${pageContext.request.contextPath}/sNote/sNoteMain"><i --%>
<!-- 						class="fa fa-circle-o"></i> 오답노트</a></li> -->
				<li><a
					href="${pageContext.request.contextPath}/sInquire/sInquireMain"><i
						class="fa fa-circle-o"></i> 나의 질문 내역</a></li>
<!-- 				<li><a -->
<%-- 					href="${pageContext.request.contextPath}/sQuestion/sQuestionMain"><i --%>
<!-- 						class="fa fa-circle-o"></i> 문제풀기</a></li> -->
			</ul></li>
		<%
			} else if (state.equals("teacher")) {
		%>
		<li class="treeview"><a href="#"> <i class="fa fa-user"></i>
				<span>마이페이지(강사)</span> <i class="fa fa-angle-left pull-right"></i>
		</a>
			<ul class="treeview-menu">
				<li><a href="${pageContext.request.contextPath}/tStudent/tStudentMain">
				<i class="fa fa-circle-o"></i> 수강학생관리</a></li>
				<li><a href="${pageContext.request.contextPath}/tInformation/tInformationLock">
				<i class="fa fa-circle-o"></i> 내정보수정</a></li>
				<li><a href="${pageContext.request.contextPath}/tAdvice/tAdviceMain">
				<i class="fa fa-circle-o"></i> 상담신청관리</a></li>
				<li>
					<a href="${pageContext.request.contextPath}/video/curriculum/curriculumList">
					<i class="fa fa-circle-o"></i> 강의 관리</a></li>
				<li><a
					href="${pageContext.request.contextPath}/video/teacherEdit?testCode=1&proceCode=2"><i
						class="fa fa-circle-o"></i> 프로필 관리</a></li>
			</ul></li>
		<%
			} else {
		%>
		<li class="treeview"><a href="#"> <i class="fa fa-user"></i>
				<span>마이페이지(관리자)</span> <i class="fa fa-angle-left pull-right"></i>
		</a>
			<ul class="treeview-menu">
				<li><a
					href="${pageContext.request.contextPath}/aStudent/aStudentMain"><i
						class="fa fa-circle-o"></i> 회원관리</a></li>
				<li><a
					href="${pageContext.request.contextPath}/aTeacher/aTeacherMain"><i
						class="fa fa-circle-o"></i> 강사관리</a></li>
				<li><a
					href="${pageContext.request.contextPath}/aBanner/aBannerMain"><i
						class="fa fa-circle-o"></i> 배너관리</a></li>
				<li><a
					href="${pageContext.request.contextPath}/aVideo/aVideoMain"><i
						class="fa fa-circle-o"></i> 동영상관리</a></li>
			</ul></li>

		<%
			}
		%>
		<%
			if (state.equals("student")) {
		%>
		<li class="treeview"><a href="#"> <i class="fa fa-bullhorn"></i>
				<span>고객센터</span> <i class="fa fa-angle-left pull-right"></i>
		</a>
			<ul class="treeview-menu">
				<li><a href="${pageContext.request.contextPath}/returnNotice">
				<i class="fa fa-circle-o"></i> 공지사항</a></li>
				<li><a href="${pageContext.request.contextPath}/returntNotice">
				<i class="fa fa-circle-o"></i> 선생님 공지사항</a></li>
				<li><a href="${pageContext.request.contextPath}/returnFAQ">
				<i class="fa fa-circle-o"></i> FAQ</a></li>
				<li><a href="${pageContext.request.contextPath}/returnInquire">
				<i class="fa fa-circle-o"></i> 1:1문의</a></li>
			</ul></li>
		<%
			} else if (state.equals("teacher")) {
		%>
		<li class="treeview"><a href="#"> <i class="fa fa-bullhorn"></i>
				<span>고객센터</span> <i class="fa fa-angle-left pull-right"></i>
		</a>
			<ul class="treeview-menu">
				
				<li><a href="${pageContext.request.contextPath}/returnNotice">
				<i class="fa fa-circle-o"></i> 공지사항</a></li>
				<li><a href="${pageContext.request.contextPath}/returntNotice">
				<i class="fa fa-circle-o"></i> 선생님 공지사항</a></li>
				<li><a href="${pageContext.request.contextPath}/returnFAQ">
				<i class="fa fa-circle-o"></i> FAQ</a></li>
				<li><a href="${pageContext.request.contextPath}/returnInquire">
				<i class="fa fa-circle-o"></i> 1:1문의</a></li>
			</ul></li>
		<%
			} else {
		%>
		<li class="treeview"><a href="#"> <i class="fa fa-bullhorn"></i>
				<span>고객센터(관리자)</span> <i class="fa fa-angle-left pull-right"></i>
		</a>
			<ul class="treeview-menu">
				
				<li><a href="${pageContext.request.contextPath}/returnNotice">
				<i class="fa fa-circle-o"></i> 공지사항</a></li>
				<li><a href="${pageContext.request.contextPath}/returntNotice">
				<i class="fa fa-circle-o"></i> 선생님 공지사항</a></li>
				<li><a href="${pageContext.request.contextPath}/returnFAQ">
				<i class="fa fa-circle-o"></i> FAQ</a></li>
				<li><a href="${pageContext.request.contextPath}/adminInquire">
				<i class="fa fa-circle-o"></i> 1:1문의</a></li>
			</ul></li>
		<%
			}
		%>
	</ul>
	</section> <!-- /.sidebar --> </aside>
</body>
</html>