<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> -->
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta name="keywords" content=" 홈페이지제작, 기업용 홈페이지, 홈페이지 제작 업체, 중소기업용 홈페이지 제작, 저렴한 홈페이지, 주문형 홈페이지 제작, 다국어 홈페이지 제작, 웹호스팅, 웹메일 ">
<meta name="description" content="홈페이지제작, 기업용 홈페이지, 홈페이지 제작 업체, 중소기업용 홈페이지 제작, 저렴한 홈페이지, 주문형 홈페이지 제작, 다국어 홈페이지 제작, 웹호스팅, 웹메일">
<title>회원아이디/패스워드 찾기</title>
<link rel="stylesheet" type="text/css" href="../scss/substyle.css" charset="euc-kr" media="all" />
<script type="text/javascript">
//<![CDATA[
// 자바스크립트에서 사용하는 전역변수 선언
var g4_path      = "..";
var g4_bbs       = "bbs";
var g4_bbs_img   = "img";
var g4_bbs_path  = "../bbs";
var g4_url       = "http://www.goyes.co.kr";
var g4_https_url = "";
var g4_is_member = "";
var g4_is_admin  = "";
var g4_bo_table  = "";
var g4_sca       = "";
var g4_charset   = "euc-kr";
var g4_cookie_domain = ".goyes.co.kr";
var g4_is_gecko  = navigator.userAgent.toLowerCase().indexOf('gecko') != -1;
var g4_is_ie     = navigator.userAgent.toLowerCase().indexOf('msie') != -1;
//]]>
</script>
<script type="text/javascript" src="../sjs/jquery-1.6.2.min.js"></script>
<script type="text/javascript" language="JavaScript" src="../sjs/jquery-ui-1.8.12.custom.min.js"></script>
<script type="text/javascript" language="JavaScript" src="../sjs/jquery-footer.js"></script>
<script type="text/javascript" src="../sjs/common.js"></script>
<script type="text/javascript" src="../sjs/common_sub.js"></script>
<script type="text/javascript" src="../sjs/wrest.js"></script>
<script type="text/javascript" src="../sjs/ui.js"></script>


</head>
<body topmargin="0" leftmargin="0" >
<a name="g4_head"></a><div id="wrap">

	<div id="header">
		<div class="venture"><img src="../simg/venturenumber.png" alt="슈퍼어글리는 벤처확인기업입니다." /></div>
		<h1 class="logo">
			<a href=".."><img src="../simg/logo.gif" alt="슈퍼어글리" /></a>
		</h1>
		
		

		<div class="tnb">
			<h2 class="blind">멤버메뉴</h2>
			<ul class="membermenu">
				<li><a href=".."><img src="../simg/top_home.gif" onmouseover="this.src='../simg/top_home_ov.gif'" onmouseout="this.src='../simg/top_home.gif'" alt="홈으로" /></a></li>
								<li><a href="../bbs/login.php"><img src="../simg/top_login.gif" onmouseover="this.src='../simg/top_login_ov.gif'" onmouseout="this.src='../simg/top_login.gif'" alt="로그인" /></a></li>
				<li><a href="../bbs/register.php"><img src="../simg/top_join.gif" onmouseover="this.src='../simg/top_join_ov.gif'" onmouseout="this.src='../simg/top_join.gif'" alt="회원가입" /></a></li>
								<li><a href="../sub/sub.php?npage=contactus"><img src="../simg/top_contactus.gif" onmouseover="this.src='../simg/top_contactus_ov.gif'" onmouseout="this.src='../simg/top_contactus.gif'" alt="찾아오시는 길" /></a></li>
				<li><a href="../bbs/sitemap.php"><img src="../simg/top_sitemap.gif" onmouseover="this.src='../simg/top_sitemap_ov.gif'" onmouseout="this.src='../simg/top_sitemap.gif'" alt="사이트맵" /></a></li>
							</ul>
			<p><img src="../simg/top_hotline.gif" alt="디자인 슈퍼어글리 전화번호" /><a href="../bbs/board.php?bo_table=super_portfolio"><img src="../simg/top_portfolio.gif" alt="포트폴리오 보기" /></a></p>
		</div>
	</div><!--// header-->
	<div id="container">
		<div id="content"><div class="full">

	<div class="LOST_idpw">

		<div class="pagetop">
			<img src="../subimg/lost_idpw_top.png" class="png24" alt="아이디,비밀번호찾기" />
		</div>

		<div class="LOST_idpw_box">
			<div class="find_id">
				<form name="fidlost" method="post" onsubmit="return fidlost_submit(this);" action="${pageContext.request.contextPath }/returnMainPage" method="post">
				
				<input type="hidden" name="findtype" value="id">
				<fieldset>
				<legend><img src="../subimg/lost_idpw_id.gif" alt="아이디 찾기" /></legend>
				<ul>
					<li>
						<dl>
							<dt class="space"><label for="">이름</label></dt>
							<dd class="show"><input type="text" id="mb_name" name="mb_name" title="이름" class="textstyle required" /></dd>
						</dl>
					</li>

					<li>
						<dl>
							<dt class="space"><label for="">가입메일 주소</label></dt>
							<dd class="show"><input type="text" id="mb_email" name="mb_email" title="가입메일 주소" class="textstyle required email" /></dd>
						</dl>
					</li>

					<li class="btn"><label for="" class="blind">아이디 찾기</label><input type="image" src="../subimg/lost_idpw_btn.gif" id="" title="확인" /></li>
				</ul>
								</fieldset>
				</form>
			</div><!--// find_id-->

			<div class="find_pw">
				<form name="fpasswordlost" method="post" onsubmit="return fpasswordlost_submit(this);">
				<input type="hidden" name="findtype" value="password">
				<fieldset>
				<legend><img src="../subimg/lost_idpw_pw.gif" alt="비밀번호 찾기" /></legend>
				<ul>
					<li>
						<dl>
							<dt class="space"><label for="">이름</label></dt>
							<dd class="show"><input type="text" id="mb_name" name="mb_name" title="이름" class="textstyle required" /></dd>
						</dl>
					</li>

					<li>
						<dl>
							<dt class="space"><label for="">아이디</label></dt>
							<dd class="show"><input type="text" id="mb_id" name="mb_id" title="아이디" class="textstyle required" /></dd>
						</dl>
					</li>

					<li>
						<dl>
							<dt class="space"><label for="">가입메일주소</label></dt>
							<dd class="show"><input type="text" id="mb_email" title="가입메일주소" name="mb_email" class="textstyle required email" /></dd>
						</dl>
					</li>

					<li>
						<ul>
							<li class="code"><img id='kcaptcha_image' /></li>
							<li><label for="" class="blind">코드입력</label><input type="text" id="wr_key" name="wr_key" title="코드" class="textstyle required" /><p><strong>왼쪽의 코드</strong>를 입력하세요.</p></li>
						</ul>			
					</li>
					<li class="btn"><label for="" class="blind">비밀번호 찾기</label><input type="image" src="../subimg/lost_idpw_btn.gif" id="" title="확인" /></li>
				</ul>
														</div><!--// find_pw-->
			</fieldset>
			</form>
		</div><!--// LOST_idpw_box-->
	</div><!--// LOST_idpw	-->

</div><!--// full-->



<script type="text/javascript" src="../sjs/md5.js"></script>
<script type="text/javascript" src="/sjs/jquery.kcaptcha.js"></script>
<script type="text/javascript">
//<![CDATA[
$(function() {
    $("fidlost").attr("autocomplete", "off");
    $("#mb_email").css("ime-mode", "disabled").focus().select();
});

function fidlost_submit(f)
{
    f.action = './password_lost2.php';
    return true;
}

$(function() {
    $("fpasswordlost").attr("autocomplete", "off");
    $("#mb_email").css("ime-mode", "disabled").focus().select();
});

function fpasswordlost_submit(f){
    if (!check_kcaptcha(f.wr_key)) {
        return false;
    }

	f.action = './password_lost2.php';
    return true;
}
//]]>
</script>
		</div><!--// content-->
	</div><!--// container-->
	<div id="footer">
		<ul class="bottom">
			<li class="sns"><span><img src="../simg/bottom_mot.gif" alt="" /></span><a href="http://www.facebook.com/gaonplus" target="_blank"><img src="../simg/bottom_facebook.gif" alt="가온플러스 페이스북" /></a><a href="http://www.twitter.com/gaonplus" target="_blank"><img src="../simg/bottom_twitter.gif" alt="가온플러스 트윗터" /></a></li>
			<li class="hotline"><img src="../simg/bottom_hotline.gif" alt="" /></li>
			<li class="menu">
			<h2 class="blind">하단메뉴</h2>
				<ul>
					<li class="download bordernone"><a href="#"><img src="../simg/bottom_download.gif" alt="계약서 다운로드" /></a><a href="#" class="txt">계약서 다운로드</a></li>
					<li class="important"><a href="../bbs/privacy.php">개인정보 취급방침</a>
						<a href="../bbs/agreement.php">이용약관</a>
						<a href="../bbs/email.php" class="pop_email" onclick="return false">이메일 무단수집 거부</a>
					</li>
					<li class="webhard"><span><a href="http://www.webhard.co.kr/" target="_blank"><img src="../simg/bottom_webhard.gif" alt="웹하드" /></a></span>
						<span>id<em>/</em><strong>gaond</strong></span>
						<span>pw<em>/</em><strong>0000</strong></span>
					</li>
									</ul>
			</li>
			<li><img src="../simg/bottom_copyright.gif" alt="카피라이트" /></li>
		</ul>
	</div><!--// footer-->

</div><!--// wrap-->
</body>
</html>
