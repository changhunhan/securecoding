<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<style type="text/css">
 div{width: 600px; padding: 5px;}
 

</style>

<meta charset="utf-8">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1">
<title>회원 가입 | SWCONTEST</title>
<link rel="stylesheet" href="http://suji4611.cafe24.com/gnuboard5/css/default.css">
<link rel="stylesheet" href="http://suji4611.cafe24.com/gnuboard5/skin/member/basic/style.css">

<script>
// 자바스크립트에서 사용하는 전역변수 선언
var g5_url       = "http://suji4611.cafe24.com/gnuboard5";
var g5_bbs_url   = "http://suji4611.cafe24.com/gnuboard5/bbs";
var g5_is_member = "";
var g5_is_admin  = "";
var g5_is_mobile = "";
var g5_bo_table  = "";
var g5_sca       = "";
var g5_editor    = "";
var g5_cookie_domain = "";
</script>
<script src="http://suji4611.cafe24.com/gnuboard5/js/jquery-1.8.3.min.js"></script>
<script src="http://suji4611.cafe24.com/gnuboard5/js/jquery.menu.js"></script>
<script src="http://suji4611.cafe24.com/gnuboard5/js/common.js"></script>
<script src="http://suji4611.cafe24.com/gnuboard5/js/wrest.js"></script>
<script>var g5_captcha_url  = "http://suji4611.cafe24.com/gnuboard5/plugin/kcaptcha";</script> 
 <script src="http://suji4611.cafe24.com/gnuboard5/plugin/kcaptcha/kcaptcha.js"></script>
</head>
<body>

<!-- 회원정보 입력/수정 시작 { -->
<div class="mbskin">

    <script src="http://suji4611.cafe24.com/gnuboard5/js/jquery.register_form.js"></script>
    
    <form id="fregisterform" name="fregisterform" action="http://suji4611.cafe24.com/gnuboard5/bbs/register_form_update.php" onsubmit="return fregisterform_submit(this);" method="post" enctype="multipart/form-data" autocomplete="off">
    <input type="hidden" name="w" value="">
 
    <input type="hidden" name="agree" value="1">
    <input type="hidden" name="agree2" value="1">
    <input type="hidden" name="cert_type" value="">
    <input type="hidden" name="cert_no" value="">
    <input type="hidden" name="mb_sex" value="">    
    <div class="tbl_frm01 tbl_wrap">
        <table>
        <caption>이용정보 입력</caption>
        <tbody>
        <tr>
            <th scope="row"><label for="reg_mem_id">아이디<strong class="sound_only">필수</strong></label></th>
            <td>
                <span class="frm_info">영문자, 숫자만 입력 가능. 최소 3자이상 입력하세요.</span>
                <input type="text" name="mem_id" value="" id="reg_mem_id" required  class="frm_input required " minlength="3" maxlength="20">
                <span id="msg_mem_id"></span>
                <span><input type="button" value="중복확인" onclick="location.href='${pageContext.request.contextPath}/idcheck'"></input></span>
            </td>
        </tr>
        
        <tr>
            <th scope="row"><label for="reg_mem_pass">비밀번호<strong class="sound_only">필수</strong></label></th>
            <td><input type="password" name="mem_pass" id="reg_mem_pass" required class="frm_input required" minlength="3" maxlength="20"></td>
        </tr>
        
        <tr>
            <th scope="row"><label for="reg_mem_pass_re">비밀번호 확인<strong class="sound_only">필수</strong></label></th>
            <td><input type="password" name="mem_pass_re" id="reg_mem_pass_re" required class="frm_input required" minlength="3" maxlength="20"></td>
        </tr>
        
        </tbody>
        </table>
    </div>

    <div class="tbl_frm01 tbl_wrap">
        <table>
        <caption>개인정보 입력</caption>
        <tbody>
        <tr>
            <th scope="row"><label for="reg_mem_name">이름<strong class="sound_only">필수</strong></label></th>
            <td>
             <input type="text" id="reg_mem_name" name="mem_name" value="" required  class="frm_input required " size="10">
            </td>
        </tr>
        
        <tr>
            <th scope="row"><label for="reg_mem_res_num">주민등록번호<strong class="sound_only">필수</strong></label></th>
            <td>
             <input type="text" id="reg_mem_res_num1" name="mem_res_num1" value="" required  class="frm_input required " size="15">-
             <input type="text" id="reg_mem_res_num2" name="mem_res_num2" value="" required  class="frm_input required " size="15">
            </td>
        </tr>
        
        
        <tr>
            <th scope="row"><label for="reg_mem_tel">핸드폰<strong class="sound_only">필수</strong></label></th>
            <td>
                <span class="frm_info">
                    공백없이 핸드폰 번호를 입력하세요.<br>
                    예)) 01022221111(-없이)
                </span>
                <input type="hidden" name="mem_tel" value="">
                <input type="text" name="mem_tel" value="" id="reg_mem_tel" required class="frm_input required nospace" size="20" maxlength="20">
                <span id="mem_tel"></span>
            </td>
        </tr>
     
        <tr>
            <th scope="row"><label for="reg_mem_email">E-mail<strong class="sound_only">필수</strong></label></th>
            <td>
                <input type="hidden" name="mem_email" value="">
                <input type="text" name="mem_email" value="" id="reg_mem_email" required class="frm_input email required" size="70" maxlength="100">
                </select>
            </td>
        </tr>
        
           
        <tr>
            <th scope="row"><label for="reg_mem_add1">주소<strong class="sound_only">필수</strong></label></th>
            
             <td>
                <input type="hidden" name="mem_add1" value="">
                <input type="text" name="mem_add1" value="" id="reg_mem_add1" required class="frm_input add1 required" size="10" maxlength="10">
           <span><button>우편번호찾기</button></span><br><br>
            <input type="hidden" name="mem_add1" value="">
                <input type="text" name="mem_add1" value="" id="reg_mem_add1" required class="frm_input add1 required" size="70" maxlength="100">
            </td>
             
         
        
        </tr>
        <tr>
            <th scope="row"><label for="reg_mem_add2">상세주소<strong class="sound_only">필수</strong></label></th>
            <td>
                <input type="hidden" name="mem_add2" value="">
                <input type="text" name="mem_add2" value="" id="reg_mem_add2" required class="frm_input add2 required" size="70" maxlength="100">
            </td>
        </tr>

                </tbody>
        </table>
    </div>

    <div class="tbl_frm01 tbl_wrap">
        <table>
        <caption>기타 개인설정</caption>
        <tbody>
        
 
        
       <!--  
        <tr>
            <th scope="row">자동등록방지</th>
            <td>
<script>var g5_captcha_url  = "http://suji4611.cafe24.com/gnuboard5/plugin/kcaptcha";</script>
<script src="http://suji4611.cafe24.com/gnuboard5/plugin/kcaptcha/kcaptcha.js"></script>
<fieldset id="captcha" class="captcha">
<legend><label for="captcha_key">자동등록방지</label></legend>
<img src="javascript:void(0);" alt="" id="captcha_img">
<button type="button" id="captcha_mp3"><span></span>숫자음성듣기</button>
<button type="button" id="captcha_reload"><span></span>새로고침</button><input type="text" name="captcha_key" id="captcha_key" required class="captcha_box required" size="6" maxlength="6">
<span id="captcha_info">자동등록방지 숫자를 순서대로 입력하세요.</span>


	<form action="http://yourserver/realPerson.php" method="post">
	<p><label>Other fields:</label><input type="text" id="field"></p>
	<p><label>Please enter the letters displayed:</label>
		<input type="text" id="defaultReal" name="defaultReal"></p>
	<p style="clear: both;"><label>&nbsp;</label><input type="submit" value="Submit"></p>
	</form> -->

</fieldset></td>
        </tr>
        </tbody>
        </table>
    </div>

    <div class="btn_confirm">
        <input type="submit" value="회원가입" id="btn_submit" class="btn_submit" accesskey="s">
        <a href="http://suji4611.cafe24.com/gnuboard5" class="btn_cancel">취소</a>
    </div>
    </form>

    <script>
    $(function() {
        $("#reg_zip_find").css("display", "inline-block");

                    });

    
    //아이디 중복검사
    
    function CheckId(){
    var userid=document.all.userid.value;
    if(userid){
    url="idcheck.php?userid="+userid;
    window.open(url,"chkid","width=500,height=500,menubar=no,toolbar=no");
    }else{
    alert("ID를 입력하세요!");
    }
    }

    function chkForm(){
    var checkId=document.all.checkid.value;
    if(checkId==0){
    alert("ID 중복체크를 하세요!");
    return false;
    }
    return true;
    }
  
    
    
    
    // submit 최종 폼체크
    function fregisterform_submit(f)
    {
        // 회원아이디 검사
        if (f.w.value == "") {
            var msg = mem_id_check();
            if (msg) {
                alert(msg);
                f.mem_id.select();
                return false;
            }
        }
        

        if (f.w.value == "") {
            if (f.mem_pass.value.length < 3) {
                alert("비밀번호를 3글자 이상 입력하십시오.");
                f.mem_pass.focus();
                return false;
            }
        }

        if (f.mem_pass.value != f.mem_pass_re.value) {
            alert("비밀번호가 같지 않습니다.");
            f.mem_pass_re.focus();
            return false;
        }

        if (f.mem_pass.value.length > 0) {
            if (f.mem_pass_re.value.length < 3) {
                alert("비밀번호를 3글자 이상 입력하십시오.");
                f.mem_pass_re.focus();
                return false;
            }
        }

        // 이름 검사
        if (f.w.value=="") {
            if (f.mem_name.value.length < 1) {
                alert("이름을 입력하십시오.");
                f.mem_name.focus();
                return false;
            }

          
        }

        
      

        // E-mail 검사
        if ((f.w.value == "") || (f.w.value == "u" && f.mem_email.defaultValue != f.mem_email.value)) {
            var msg = reg_mem_email_check();
            if (msg) {
                alert(msg);
                f.reg_mem_email.select();
                return false;
            }
        }


    </script>

</div>


</body>
</html>
