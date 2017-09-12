<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<style type="text/css">
 div{width: 600px; padding: 10px;}

</style>

<meta charset="utf-8">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=10,chrom
e=1">
<title>회원가입약관 | SWCONTEST</title>
<link rel="stylesheet" href="http://suji4611.cafe24.com/gnuboard5/css/default.css">
<link rel="stylesheet" href="http://suji4611.cafe24.com/gnuboard5/skin/member/basic/style.css">

<script>
	// 자바스크립트에서 사용하는 전역변수 선언
	var g5_url       = "http://suji4611.cafe24.com/gnuboard5";
	var g5_bbs_url   = "http://suji4611.cafe24.com/gnuboard5/bbs";
</script>
<script src="http://suji4611.cafe24.com/gnuboard5/js/jquery-1.8.3.min.js"></script>
<script src="http://suji4611.cafe24.com/gnuboard5/js/jquery.menu.js"></script>
<script src="http://suji4611.cafe24.com/gnuboard5/js/common.js"></script>
<script src="http://suji4611.cafe24.com/gnuboard5/js/wrest.js"></script>

</head>
<body>

<!-- 회원가입약관 동의 시작 { -->
<div class="mbskin">
 <form  name="fregister" id="fregister" action="" onsubmit="return fregister_submit(this);" method="POST" autocomplete="off" >
    <p>회원가입약관 및 개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.</p>
    <section id="fregister_term">
        <h2>회원가입약관</h2>
        <textarea readonly>
        	이하 생략.
		</textarea>
        <fieldset class="fregister_agree">
            <label for="agree11">회원가입약관의 내용에 동의합니다.</label>
            <input type="checkbox" name="agree" value="1" id="agree11">
        </fieldset>
    </section>

    <section id="fregister_private">
        <h2>개인정보처리방침안내</h2>
        <textarea readonly>
        	이하 생략.
</textarea>
        <fieldset class="fregister_agree">
            <label for="agree21">개인정보처리방침안내의 내용에 동의합니다.</label>
            <input type="checkbox" name="agree2" value="1" id="agree21">
        </fieldset>
    </section>

    <div class="btn_confirm">
        <input type="submit" class="btn_submit" value="회원가입">
    </div>

    </form>

    <script>
    function fregister_submit(f)
    {
        if (!f.agree.checked) {
            alert("회원가입약관의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
            f.agree.focus();
            return false;
        }

        if (!f.agree2.checked) {
            alert("개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
            f.agree2.focus();
            return false;
        }

        return true;
    }
    </script>
</div>


</body>
</html>
