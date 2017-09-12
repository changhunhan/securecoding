var userAgent = navigator.userAgent;
if(userAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null)
{
	$(function(){ setTimeout(loaded, 100); }); function loaded(){ window.scrollTo(0, 1); }//二쇱냼李� �④린湲�
}

//focus check
$(function(){
	var $focusForm = $(".focusChk");
	$focusForm.focus(function(){
		$(this).prev("label").hide();
	});
	$focusForm.focusout(function(){
		if ($(this).val()) {
			$(this).prev("label").hide();
		} else {
			$(this).prev("label").show();
		}
	});
});

//�듯빀寃���
$(function(){
	var $focusForm1 = $(".iTxt2");
	$focusForm1.focus(function(){
		$(".searchWord").show();
		$(".searchBox2 .srchInp").addClass("on");

	});
	$focusForm1.focusout(function(){
		$(".searchWord").hide();
		$(".searchBox2 .srchInp").removeClass("on");
	});
	$(".searchWord .srchClose").click(function(){
		$(".searchWord").hide();
		$(".searchBox2 .srchInp").removeClass("on");
	});
});

var menu_tid = "";
function menu_st()
{
	menu_tid = setInterval("menu_rol()", 5000);
}

function menu_et()
{
	clearInterval(menu_tid);
}

function menu_rol(){
	var btn = "";

	if($("#menu01").hasClass("on"))
	{
		btn = $("#menu02 > a");
		btn.click();
	}else if($("#menu02").hasClass("on")){
		btn = $("#menu03 > a");
		btn.click();
	}else if($("#menu03").hasClass("on")){
		btn = $("#menu04 > a");
		btn.click();
	}else if($("#menu04").hasClass("on")){
		btn = $("#menu05 > a");
		btn.click();
	}else if($("#menu05").hasClass("on")){
		btn = $("#menu01 > a");
		btn.click();
	}
}

function mobileGNBProc() {
	mobileGNBProc1();
	mobileGNBProc2();
	mobileGNBProc3();
	mobileGNBProc4();
}

function mobileGNBProc1() {
//$(document).ready(function(){
	/*吏꾨떒�쇳꽣 硫붿씤*/
	$("#menu01 > a").click(function(){
		$("#menu01").addClass('on');
		$(".jop_list .list01").show();
		$("#menu02, #menu03, #menu04, #menu05").removeClass('on');
		$(".jop_list .list02, .jop_list .list03, .jop_list .list04, .jop_list .list05").hide();
		menu_et();
		//$(".content_warp .count .nam").
	});
	$("#menu02 > a").click(function(){
		$("#menu02").addClass('on');
		$(".jop_list .list02").show();
		$("#menu01, #menu03, #menu04, #menu05").removeClass('on');
		$(".jop_list .list01, .jop_list .list03, .jop_list .list04, .jop_list .list05").hide();
		menu_et();
	});
	$("#menu03 > a").click(function(){
		$("#menu03").addClass('on');
		$(".jop_list .list03").show();
		$("#menu01, #menu02, #menu04, #menu05").removeClass('on');
		$(".jop_list .list01, .jop_list .list02, .jop_list .list04, .jop_list .list05").hide();
		menu_et();
	});
	$("#menu04 > a").click(function(){
		$("#menu04").addClass('on');
		$(".jop_list .list04").show();
		$("#menu01, #menu02, #menu03, #menu05").removeClass('on');
		$(".jop_list .list01, .jop_list .list02, .jop_list .list03, .jop_list .list05").hide();
		menu_et();
	});
	$("#menu05 > a").click(function(){
		$("#menu05").addClass('on');
		$(".jop_list .list05").show();
		$("#menu01, #menu02, #menu03, #menu04").removeClass('on');
		$(".jop_list .list01, .jop_list .list02, .jop_list .list03, .jop_list .list04").hide();
		menu_et();
	});

	/*吏꾨떒�쇳꽣 硫붿씤濡ㅻ쭅*/
	menu_st();

	$("#m_menu01 > a").click(function(){
		$("#m_menu01").addClass('on');
		$(".jop_list .list01").show();
		$("#m_menu02, #m_menu03").removeClass('on');
		$(".jop_list .list02, .jop_list .list03").hide();
		menu_et();
		//$(".content_warp .count .nam").
	});
	$("#m_menu02 > a").click(function(){
		$("#m_menu02").addClass('on');
		$(".jop_list .list02").show();
		$("#m_menu01, #m_menu03").removeClass('on');
		$(".jop_list .list01, .jop_list .list03").hide();
		menu_et();
	});
	$("#m_menu03 > a").click(function(){
		$("#m_menu03").addClass('on');
		$(".jop_list .list03").show();
		$("#m_menu01, #m_menu02").removeClass('on');
		$(".jop_list .list01, .jop_list .list02").hide();
		menu_et();
	});
	$("#m_menu04 > a").click(function(){
		$("#m_menu04").addClass('on');
		$(".jop_list .list04").show();
		$("#m_menu05").removeClass('on');
		$(".jop_list .list05").hide();
		menu_et();
	});
	$("#m_menu05 > a").click(function(){
		$("#m_menu05").addClass('on');
		$(".jop_list .list05").show();
		$("#m_menu04").removeClass('on');
		$(".jop_list .list04").hide();
		menu_et();
	});


	//�ㅼ떆�붽만��
	$(".location_tab .rough").click(function(){
		$(".rough_map").show();
		$(".naver_map").hide();
		$(".location_tab .rough p").addClass("on");
		$(".location_tab .naverMap p").removeClass("on");
	});
	$(".location_tab .naverMap").click(function(){

		$(".rough_map").hide();
		$(".naver_map").show();
		$(".location_tab .naverMap p").addClass("on");
		$(".location_tab .rough p").removeClass("on");
	});

	/* �뺣낫梨꾨꼸 痍⑥뾽遺꾩빞�뺣낫 而⑦뀗痢� �닿퀬�リ린 */
	$(".work_step dt a").click(function(){
		if($(this).parent().next().css('display')==('none')){
			$(this).parent().next().css("display","block");
			$(this).parent().addClass("open");
		}else{
			$(this).parent().next().css("display","none");
			$(this).parent().removeClass("open");
		}
	});

	/* �숈뒿�쇳꽣 �섍컯�� */
	$(".comm_body .comm_li a.ellips_C").click(function(){
		if($(this).parent().parent().next().css("display")==("block")){
			$(this).parent().parent().removeClass('open');
			$(this).parent().parent().next().hide();
		}else{
			$(".comm_body .comm_cont").hide();
			$(".comm_body .comm_li").removeClass('open');
			$(this).parent().parent().addClass('open');
			$(this).parent().parent().next().show();
		}
	});
	
	/* �숈뒿�쇳꽣 異붿쿇怨쇱젙 濡ㅻ쭅 */
	$('.class_rotation .ro_prev').click(function(){
		$('.class_rotation li:first-child').clone().appendTo('.class_rotation ul');
		$('.class_rotation li:first-child').remove();
	});
	$('.class_rotation .ro_next').click(function(){
		$('.class_rotation li:last-child').clone().prependTo('.class_rotation ul');
		$('.class_rotation li:last-child').remove();
	});

	/*�숈뒿�쇳꽣 �⑥삤�꾨씪�� 怨쇱젙 ��찓��*/
	$(".blended_list dt a").click(function(){
		$(".blended_list dd").hide();
		$(".blended_list dt").removeClass('on');
		if($(this).parent().next().css("display")==("block")){
			$(this).parent().removeClass('on');
			$(this).parent().next().hide();
		}else{
			$(this).parent().addClass('on');
			$(this).parent().next().show();
		}
	});

	/*�숈뒿�쇳꽣 �섎쭔�� 怨쇱젙 怨쇱젙 ��찓��*/
	$(".searchClass dt.blen1 a").click(function(){
		$(".searchClass dt.blen2").removeClass('on');
		$(".searchClass dt.blen1").addClass('on');
		$(".searchClass dd.keyword_area").css("z-index","5");
		$(".searchClass dd.keyword").css("z-index","10");
	});
	$(".searchClass dt.blen2 a").click(function(){
		$(".searchClass dt.blen1").removeClass('on');
		$(".searchClass dt.blen2").addClass('on');
		$(".searchClass dd.keyword").css("z-index","5");
		$(".searchClass dd.keyword_area").css("z-index","10");
	});

	/* �숈뒿�쇳꽣 吏곸뾽踰쇰젮 援먯쑁怨쇱젙 而⑦뀗痢� �닿퀬�リ린 */
	$(".careerTit h4 a").click(function(){
		if($(this).parent().next().css('display')==('none')){
			$(".careerTit > div").css("display","none");
			$(".careerTit div dd").css("display","none");
			$(".careerTit h4").removeClass("open");
			$(this).parent().next().css("display","block");
			$(this).parent().addClass("open");
		}else{
			$(".careerTit div dd").css("display","none");
			$(this).parent().next().css("display","none");
			$(this).parent().removeClass("open");
		}
	});

	$(".careerTit div dt a").click(function(){
		if($(this).parent().next().css('display')==('none')){
			$(".careerTit div dd").css("display","none");
			$(".careerTit div dt").removeClass("open");
			$(this).parent().next().css("display","block");
			$(this).parent().addClass("open");
		}else{
			$(this).parent().next().css("display","none");
			$(this).parent().removeClass("open");
		}
	});

	/* 1:1 痍⑥뾽�곷떞 �앹뾽  �섏쓽 吏꾨떒�꾪솴 ��찓�� */
	$(".panelInner .myState dt a").click(function(){
		$(".panelInner .myState dt").removeClass('on');
		$(".panelInner .myState dd").hide();
		if($(this).parent().next().css("display")==("block")){
			$(this).parent().removeClass('on');
			$(this).parent().next().hide();
		}else{
			$(this).parent().addClass('on');
			$(this).parent().next().show();
		}
	});

	/*1:1 痍⑥뾽�곷떞 �앹뾽 紐⑤컮�� */
	$(".chatRoom .chatInput a.panelMore").click(function(){
		$(".popContConsult .panelMenu").css("display","block");
	});
	$(".panelMenu a.pClose").click(function(){
		$(".popContConsult .panelMenu").css("display","none");
	});

	
	/*1:1 痍⑥뾽�곷떞 �앹뾽 �⑤꼸 由ъ뒪��*/
	if($('div').hasClass('panelist')){
		$('.panelist .listUp').click(function(){
			$('.panelist li:first-child').clone().appendTo('.panelist ul');
			$('.panelist li:first-child').remove();
		});
		$('.panelist .listDw').click(function(){
			$('.panelist li:last-child').clone().prependTo('.panelist ul');
			$('.panelist li:last-child').remove();
		});
	};

	//李쎌뾽 遺꾩빞 �뺣낫 ��찓�� ,吏꾨떒�쇳꽣 吏곸뾽�뺣낫�곸꽭蹂닿린 �앹뾽 ��찓��
	$(".tab_menu_w.establish > li:eq(0)").click(function(){
		$(".tab_menu_w  li").removeClass("on");
		$(this).addClass("on");
		
		$(".workerDetail2").css("display","none");
		$(".tbl_job_info").css("display","none");
		$("#tbl_est_step1").css("display","block");
	});
	$(".tab_menu_w.establish > li:eq(1)").click(function(){
		$(".tab_menu_w  li").removeClass("on");
		$(this).addClass("on");
		
		$(".workerDetail2").css("display","none");
		$(".tbl_job_info").css("display","none");
		$("#tbl_est_step2").css("display","block");
	});
	$(".tab_menu_w.establish > li:eq(2)").click(function(){
		$(".tab_menu_w > li").removeClass("on");
		$(this).addClass("on");
		
		$(".workerDetail2").css("display","none");
		$(".tbl_job_info").css("display","none");
		$("#tbl_est_step3").css("display","block");
	});

	//痍⑥뾽 遺꾩빞 �뺣낫 ��찓��
	$(".tab_menu_w2 > li:eq(0)").click(function(){
		$(".tab_menu_w2 > li").removeClass("on");
		$(".tab_menu_w2 > li:eq(0)").addClass("on");
		
		$(".workerDetail").css("display","none");
		$(".workStep5").css("display","none");
		$("#tbl_work_detail_step1").css("display","block");
	});
	$(".tab_menu_w2 > li:eq(1)").click(function(){
		$(".tab_menu_w2 > li").removeClass("on");
		$(".tab_menu_w2 > li:eq(1)").addClass("on");
		
		$(".workerDetail").css("display","none");
		$(".workStep5").css("display","none");
		$("#tbl_work_detail_step2").css("display","block");
	});
	$(".tab_menu_w2 > li:eq(2)").click(function(){
		$(".tab_menu_w2 > li").removeClass("on");
		$(".tab_menu_w2 > li:eq(2)").addClass("on");
		
		$(".workerDetail").css("display","none");
		$(".workStep5").css("display","none");
		$("#tbl_work_detail_step3").css("display","block");
	});

	$(".tab_menu_w2 > li:eq(3)").click(function(){
		$(".tab_menu_w2 > li").removeClass("on");
		$(".tab_menu_w2 > li:eq(3)").addClass("on");
		
		$(".workerDetail").css("display","none");
		$(".workStep5").css("display","none");
		$("#tbl_work_detail_step4").css("display","block");
	});

	$(".tab_menu_w2 > li:eq(4)").click(function(){
		$(".tab_menu_w2 > li").removeClass("on");
		$(".tab_menu_w2 > li:eq(4)").addClass("on");
		
		$(".workerDetail").css("display","none");
		$(".workStep5").css("display","block");
		$("#tbl_work_detail_step5").css("display","block");
	});

	/* �섏쓽媛뺤쓽�� �⑥삤�꾨씪�� 而⑦뀗痢� �닿퀬�リ린 */
	$(".perWrap .perfoTop a").click(function(){

		if($(this).parent().next().css('display')==('none')){
			$(this).parent().next().css("display","block");
			$(this).parent().addClass("on");

		}else{
			$(this).parent().next().css("display","none");
			$(this).parent().removeClass("on");
		}
	});

	//吏꾨떒�쇳꽣 �꾩�留� �앹뾽
	$("table.diagChck th.diagChckTit > a").click(function(){
		$("table.diagChck th.diagChckTit .diagTip").hide();
		$("table.diagChck th.diagChckTit > a").removeClass("on");
		if($(this).next().css('display')==('none')){
			$(this).next().css("display","block");
			$(this).addClass("on");
			$("table.diagChck th.diagChckTit .diagTip .topArea a").click(function(){
				$(this).parent().parent().css("display","none");
				$(this).parent().parent().prev().removeClass("on");
			});

		}else{
			$(this).next().css("display","none");
			$(this).removeClass("on");
		}
	});


	/* 吏꾨떒�쇳꽣 �λ��좏삎蹂� �뱀꽦 �앹뾽 ��찓�� */
	$(".popCon01").show();
	$(".popCon02").hide();
	$(".popCon03").hide();
	$(".popCon04").hide();
	$(".popCon05").hide();
	$(".popCon06").hide();

	$(".favorTab li.fTab01").click(function(){
		$(".popCon01").show();
		$(".popCon02").hide();
		$(".popCon03").hide();
		$(".popCon04").hide();
		$(".popCon05").hide();
		$(".popCon06").hide();
		$(".favorTab li.fTab01").addClass("on");
		$(".favorTab li.fTab02").removeClass("on");
		$(".favorTab li.fTab03").removeClass("on");
		$(".favorTab li.fTab04").removeClass("on");
		$(".favorTab li.fTab05").removeClass("on");
		$(".favorTab li.fTab06").removeClass("on");
	});

	$(".favorTab li.fTab02").click(function(){
		$(".popCon02").show();
		$(".popCon01").hide();
		$(".popCon03").hide();
		$(".popCon04").hide();
		$(".popCon05").hide();
		$(".popCon06").hide();
		$(".favorTab li.fTab02").addClass("on");
		$(".favorTab li.fTab01").removeClass("on");
		$(".favorTab li.fTab03").removeClass("on");
		$(".favorTab li.fTab04").removeClass("on");
		$(".favorTab li.fTab05").removeClass("on");
		$(".favorTab li.fTab06").removeClass("on");
	});
	
	$(".favorTab li.fTab03").click(function(){
		$(".popCon03").show();
		$(".popCon01").hide();
		$(".popCon02").hide();
		$(".popCon04").hide();
		$(".popCon05").hide();
		$(".popCon06").hide();
		$(".favorTab li.fTab03").addClass("on");
		$(".favorTab li.fTab01").removeClass("on");
		$(".favorTab li.fTab02").removeClass("on");
		$(".favorTab li.fTab04").removeClass("on");
		$(".favorTab li.fTab05").removeClass("on");
		$(".favorTab li.fTab06").removeClass("on");
	});
	
	$(".favorTab li.fTab04").click(function(){
		$(".popCon04").show();
		$(".popCon01").hide();
		$(".popCon02").hide();
		$(".popCon03").hide();
		$(".popCon05").hide();
		$(".popCon06").hide();
		$(".favorTab li.fTab04").addClass("on");
		$(".favorTab li.fTab01").removeClass("on");
		$(".favorTab li.fTab02").removeClass("on");
		$(".favorTab li.fTab03").removeClass("on");
		$(".favorTab li.fTab05").removeClass("on");
		$(".favorTab li.fTab06").removeClass("on");
		
	});
	
	$(".favorTab li.fTab05").click(function(){
		$(".popCon05").show();
		$(".popCon01").hide();
		$(".popCon02").hide();
		$(".popCon03").hide();
		$(".popCon04").hide();
		$(".popCon06").hide();
		$(".favorTab li.fTab05").addClass("on");
		$(".favorTab li.fTab01").removeClass("on");
		$(".favorTab li.fTab02").removeClass("on");
		$(".favorTab li.fTab03").removeClass("on");
		$(".favorTab li.fTab04").removeClass("on");
		$(".favorTab li.fTab06").removeClass("on");
	});
	
	$(".favorTab li.fTab06").click(function(){
		$(".popCon06").show();
		$(".popCon01").hide();
		$(".popCon02").hide();
		$(".popCon03").hide();
		$(".popCon04").hide();
		$(".popCon05").hide();
		$(".favorTab li.fTab06").addClass("on");
		$(".favorTab li.fTab01").removeClass("on");
		$(".favorTab li.fTab02").removeClass("on");
		$(".favorTab li.fTab03").removeClass("on");
		$(".favorTab li.fTab04").removeClass("on");
		$(".favorTab li.fTab05").removeClass("on");
	});

	/* 硫붿씤 ��찓�� */
	var gnb_on;
	
	// ��, �뚮툝由� �쇰븣 ��찓��
	$(".diagMainCont dd").hide();
	$(".diagMainCont dt.on").next().show();
	
	$(".diagMainCont dt").click(function(){
		gnb_on=$(".diagMainCont dt.on");

		if(gnb_on.hasClass("on")){
			gnb_on.next().hide();
		}

		gnb_on.removeClass("on");
		$(this).addClass("on");
		$(this).next().show();
	});

	// 紐⑤컮�쇱씪�뚮쭔 ��찓��
	$(".mMaincont01 dd").hide();
	$(".mMaincont01 dt.on").next().show();
	
	$(".mMaincont01 dt").click(function(){
		gnb_on=$(".mMaincont01 dt.on");

		if(gnb_on.hasClass("on")){
			gnb_on.next().hide();
		}

		gnb_on.removeClass("on");
		$(this).addClass("on");
		$(this).next().show();
	});

	// 紐⑤컮�쇱씪�뚮쭔 ��찓��
	$(".mMaincont02 dd").hide();
	$(".mMaincont02 dt.on").next().show();
	
	$(".mMaincont02 dt").click(function(){
		gnb_on=$(".mMaincont02 dt.on");

		if(gnb_on.hasClass("on")){
			gnb_on.next().hide();
		}

		gnb_on.removeClass("on");
		$(this).addClass("on");
		$(this).next().show();
	});
	
	//紐⑤컮�� search 踰꾪듉
		$('.title_box form').hide();
	$('.btn_mSearch').click(function(){
		if($('.title_box form').css('display')==('none')){
			$('.title_box form').css('display','block');
			$('.btn_mSearch').css('background-image','url("/dream/common/img/comm/btn_mzoom.jpg")');
		}else{
			$('.title_box form').hide();
			$('.btn_mSearch').css('background-image','url("/dream/common/img/comm/btn_mzoom_off.png")');
		}
	});

	//function move_Layer(size){
	//	$('html, body').animate({ scrollTop: size }, 500);
	//}
//});
}

function mobileGNBProc2() {
// 紐⑤컮�� gnb �믪씠媛�
//$(document).ready(function(){
	var wrap_h = $('#wrap').outerHeight();
	var mgnb_h = $('.m_gnb dl').outerHeight();
	$(".m_gnb dl").css("height", wrap_h + "px");
//});
}

/*---------------gnb --------------------------------------*/
function move_Layer(size){
	$('html, body').animate({ scrollTop: size }, 500);
}

function mobileGNBProc3(flag) {
	//$(document).ready(function(){
	//紐⑤컮�쇱슜 gnb
	$(".m_gnb_btn").click(function(){
		mobileGNBProc2();
		if($('.m_gnb dl').css('display')==('none')){
			$(".m_gnb dt.btn_back").hide();
			$(".m_gnb dl").css("display","block");
			$("header,.container,footer").css("margin-left","241px");
			$(".m_gnb_btn a").css("background","url('/dream/common/img/comm/icon_mclose.jpg') no-repeat 0 0");
			$(".m_gnb_btn a").css("font-size",'0');
		}else{
			$(".m_gnb dl").css("display","none");
			$(".m_gnb dd").hide();
			$(".m_gnb dt").show();
			$(".m_gnb dt.btn_back").hide();
			$(".m_gnb dt a").removeClass("on");
			$("header,.container,footer").css("margin-left","0");
			$(".m_gnb_btn a").css("background","url('/dream/common/img/comm/img_mgnb.png') no-repeat 0 0");
			$(".m_gnb_btn a").css("font-size",'10pt');
		}
	});
	
	if(flag != null){
		return ;
	}
	//function move_Layer(size){
	//	$('html, body').animate({ scrollTop: size }, 500);
	//}
	
	//gnb 硫붾돱 �좏깮 ��
	$(".m_gnb dt a").click(function(){
		if($(this).parent().next().css('display')==('none')){
			$(".m_gnb dd").hide();
			$(".m_gnb dt").hide();
			$(".m_gnb dt.btn_back").show();
			$(this).parent().show();
			$(this).parent().next().css("display","block");
			$(this).addClass("on");

			var move=0;
			move_Layer(move);
		}else{
			$(this).parent().next().css("display","none");
			$(this).removeClass("on");
		}
	});

	//�댁쟾硫붾돱 �좏깮 ��
	$(".m_gnb dt.btn_back").click(function(){
		$(".m_gnb dd").hide();
		$(".m_gnb dt").show();
		$(".m_gnb dt.btn_back").hide();
		$(".m_gnb dt a").removeClass("on");
	});
	
	/* �붾컮�댁뒪蹂� gnb dl �대옒�� 異붽� */
	if($(window).width() > 750)
	{
		$(".gnb dl > dt.btn_back,.gnb dl > dt.gnb_total").css("display", "none");
		$(".gnb dl").addClass("wgnbBox");
		$(".gnb dl").removeClass("mgnbBox");

	}else if($(window).width() < 751)
	{
		$(".gnb dl").addClass("mgnbBox");
		$(".gnb dl").removeClass("wgnbBox");
		
	}
	
	//pc�� gnb �꾩껜蹂닿린
	$(".gnb a.btn_gnb_all").click(function(){
		$(".gnb_all").show();
	});
	$(".gnb .gnb_all .btn_gnb_close").click(function(){
		$(".gnb_all").hide();
	});

	//�섏쓽 媛뺤쓽�� 硫붾돱蹂닿린
	/*$(".mc_menuBtn a").click(function(){
		if($('.mc_rightInner').css('display')==('none')){
			$(".mc_rightInner").css("display","block");
			$(".mc_header,.mc_container, .mc_footer").css("margin-left","211px");
			$(".mc_menuBtn a").css("background","url('/dream/common/img/comm/icon_mclose.jpg') no-repeat 0 0");
		}else{
			$(".mc_rightInner").css("display","none");
			$(".mc_header,.mc_container, .mc_footer").css("margin-left","0");
			$(".mc_menuBtn a").css("background","url('/dream/common/img/comm/img_mgnb.png') no-repeat 0 0");
		}
	});*/
	
		//痍⑥뾽 遺꾩빞 �뺣낫 ��찓��
	$(".tab_menu_w > li:eq(0)").click(function(){
		$(".tab_menu_w > li").removeClass("on");
		$(".tab_menu_w > li:eq(0)").addClass("on");
		
		$(".tbl_work_detail").css("display","none");
		$("#tbl_work_detail_step1").css("display","block");
	});
	$(".tab_menu_w > li:eq(1)").click(function(){
		$(".tab_menu_w > li").removeClass("on");
		$(".tab_menu_w > li:eq(1)").addClass("on");
		
		$(".tbl_work_detail").css("display","none");
		$("#tbl_work_detail_step2").css("display","block");
	});
	$(".tab_menu_w > li:eq(2)").click(function(){
		$(".tab_menu_w > li").removeClass("on");
		$(".tab_menu_w > li:eq(2)").addClass("on");
		
		$(".tbl_work_detail").css("display","none");
		$("#tbl_work_detail_step3").css("display","block");
	});
//});
}

$(window).resize(function(){
	/*
	if($(window).width() > 768)
	{
		$(".header_inner,.container,footer").css("margin","0 auto");
		//�섏쓽媛뺤쓽��
		$(".mc_rightInner").css("display", "block");
		$(".mc_header,.mc_container,mc_footer").css("margin-left","0px");

	}else if($(window).width() < 768)
	{
		$("header,.container,footer").css("margin-left","0");

		//$(".m_gnb_btn a").css("background","url('/dream/common/img/comm/img_mgnb.png') no-repeat 0 0px");
		$(".m_gnb dl").css("display","none");
		$(".m_gnb dt a").removeClass("on");

		//�섏쓽媛뺤쓽��
		$(".mc_rightInner").css("display", "none");
		$(".mc_header,.mc_container,mc_footer").css("margin-left","0px");
		//$(".mc_menuBtn a").css("background","url('/dream/common/img/comm/img_mgnb.png') no-repeat 0 0px");
	}
	*/
});

/* �붿옄�� ���됲듃 */
$(function(){
	$('.srchSlt01').jqTransform();
	$('.srchSlt02').jqTransform();
	$('.srchSlt03').jqTransform();
	
	$('.header_select').jqTransform();
	$('.newsSrchSlt').jqTransform();

	$('.tableTopSlt').jqTransform();
	$('.scrhClassSlt').jqTransform();
	$('.workSelect').jqTransform();
	$('.msgListSlt').jqTransform();
	$('.proSelect01').jqTransform();
	$('.proSelect02').jqTransform();
	//$('.planSelect').jqTransform();
	
	/*梨꾩슜�뺣낫 ���됲듃*/
	$('.work_select01').jqTransform();
	$('.work_select02').jqTransform();
	$('.work_select03').jqTransform();
	$('.work_select04').jqTransform();
});

/* �곗튂�щ씪�대뱶 */
$(function(){
	var mySwiper = new Swiper('.swiper-container',{
	pagination: '.pagination',
	loop:true,
	grabCursor: true,
	paginationClickable: true
	});
	$('.arrow-left').on('click', function(e){
	e.preventDefault();
	mySwiper.swipePrev();
	});
	$('.arrow-right').on('click', function(e){
	e.preventDefault();
	mySwiper.swipeNext();
	});
});

/* �숈뒿�쇳꽣 硫붿씤 �꾩퐫�붿뼵 */
function mobileGNBProc4() {
//$(document).ready(function(){
	$(".studyCategori01 h4 a").click(function(e){
		e.preventDefault();
		$('.studyCategori01').css('width','66.3%');
		$('.studyCategori02,.studyCategori03').css('width','16.5%');

		$('.studyCategori01 h4').css("display", "none");
		$('.studyCategori02 h4,.studyCategori03 h4').css("display", "block");
	});
	$(".studyCategori02 h4 a").click(function(e){
		e.preventDefault();
		$('.studyCategori02').css('width','66.3%');
		$('.studyCategori01,.studyCategori03').css('width','16.5%');
		
		$('.studyCategori02 h4').css("display", "none");
		$('.studyCategori01 h4,.studyCategori03 h4').css("display", "block");
	});
	$(".studyCategori03 h4 a").click(function(e){
		e.preventDefault();
		$('.studyCategori03').css('width','66.3%');
		$('.studyCategori01,.studyCategori02').css('width','16.5%');

		$('.studyCategori03 h4').css("display", "none");
		$('.studyCategori01 h4,.studyCategori02 h4').css("display", "block");
	});
	
	/* quick */
	$('.go_top').click(
		function() {
			$('html, body').animate({scrollTop: '0px'}, 500);
		}
	);
	$('.btm-scroll').click(
		function() {
			$('html, body').animate({scrollTop: $("div.wrap").height()}, 500);
		}
	);
	
	$(window).scroll(function(){
		var head = $("header").height(),
			quick = $("div.quick_menu"),
			quickHeight = quick.height(),
			contentsHeight = $("div.container").height(),
			limit = contentsHeight - quickHeight,
			winscrolltop = $(window).scrollTop();
		if (winscrolltop > 160) {
			$(quick).css({"position" : "fixed","top" : "14px" , "margin-left" : "982px","right" : "auto"});
		}
		else {
			$(quick).css({"position" : "absolute", "margin-left" : "0","right" : "-120px"});
		}
	
		if (winscrolltop > limit) {
			$('.quick_menu').addClass('btmScroll');
		}
	});
	
	$(function () {
		var $win = $(window);
		function limitScroll() {
			var quick = $("div.quick_menu"),
				footer = $("footer"),
				footerTop = footer.offset().top,
				quickHeight = quick.outerHeight(),
				limit = footerTop - quickHeight,
				tmp = $(window).scrollTop();
			if (tmp > limit) {
				$(quick).addClass('btmScroll');
			}
		}
		limitScroll();
		$win.bind('scroll resize', limitScroll);
	});
//});
}
/*
 * 硫붿씤 �숈쁺�� �뚮젅�� 遺�遺� �⑥닔濡� 蹂�寃�
 */
function mainRolling() {
	/* �붾�遺� �꾨� �ｌ뼱二쇱떆硫� �섏슂~ */
	$(function () {
		$('.mainVisual ul').after('<div class="nav">').cycle({
			fx: 'scrollHorz',
			speed: 'slow',
			timeout: 4000,
			next: '.next',
			prev: '.prev',
			sync: 2,
			width: 'auto'
		});
	
		//play,stop 踰꾪듉
		$(".pause").click(function(e){
			var theBtn=$(">img",this);
			if(theBtn.attr("alt")=="�쇱떆�뺤�"){
				theBtn.attr("src",theBtn.attr("src").replace("btn_pause.png","btn_play.png")).attr("alt","�ъ깮");
				$('.mainVisual ul').cycle('pause');
			}else{
				theBtn.attr("src",theBtn.attr("src").replace("btn_play.png","btn_pause.png")).attr("alt","�쇱떆�뺤�");
				$('.mainVisual ul').cycle('resume');
			}
			e.preventDefault();
		});
	
		//�뺤��덉쓣 �� �댁쟾 踰꾪듉 �쒗깮�� play
		$('.prev').click(function(){
			$('.mainVisual ul').cycle('resume');
			$('.pause img').attr('src',$('.pause img').attr('src').replace('btn_pre.png','btn_pause.png')).attr('alt','�쇱떆�뺤�');//異붽�
		});
	
		//�뺤��덉쓣 �� �ㅼ쓬 踰꾪듉 �쒗깮�� play
		$('.next').click(function(){
			$('.mainVisual ul').cycle('resume');
			$('.pause img').attr('src',$('.pause img').attr('src').replace('btn_pre.png','btn_pause.png')).attr('alt','�쇱떆�뺤�');//異붽�
		});
	});
}


/* 痍⑥뾽�곷떞 �대젰�쒗겢由щ땳 �댁슜諛⑸쾿 */
function page(a){
	if (a == '01'){
		$(".device_w .imgClinicView li").hide();
		$(".device_w .imgClinicView li.clinic1").css("display","block");
		$(".proClinic li").removeClass("on");
		$(".proClinic li.p_step1").addClass("on");
		$(".expClinic.device_w ul").hide();
		$(".expClinic.device_w ul.exp1").css("display","block");
	}
	else if (a == '02'){
		$(".device_w .imgClinicView li").hide();
		$(".device_w .imgClinicView li.clinic2").css("display","block");
		$(".proClinic li").removeClass("on");
		$(".proClinic li.p_step2").addClass("on");
		$(".expClinic.device_w ul").hide();
		$(".expClinic.device_w ul.exp2").css("display","block");
	}
	else if (a == '03'){
		$(".device_w .imgClinicView li").hide();
		$(".device_w .imgClinicView li.clinic3").css("display","block");
		$(".proClinic li").removeClass("on");
		$(".proClinic li.p_step3").addClass("on");
		$(".expClinic.device_w ul").hide();
		$(".expClinic.device_w ul.exp3").css("display","block");
	}
}

function page_mp(a){
	if (a == '01'){
		$(".device_mp .imgClinicView li").hide();
		$(".device_mp .imgClinicView li.clinic1").css("display","block");
		$(".proClinic li").removeClass("on");
		$(".proClinic li.p_step1").addClass("on");
		$(".expClinic.device_mp ul").hide();
		$(".expClinic.device_mp ul.exp1").css("display","block");
	}
	else if (a == '02'){
		$(".device_mp .imgClinicView li").hide();
		$(".device_mp .imgClinicView li.clinic2").css("display","block");
		$(".proClinic li").removeClass("on");
		$(".proClinic li.p_step2").addClass("on");
		$(".expClinic.device_mp ul").hide();
		$(".expClinic.device_mp ul.exp2").css("display","block");
	}
	else if (a == '03'){
		$(".device_mp .imgClinicView li").hide();
		$(".device_mp .imgClinicView li.clinic3").css("display","block");
		$(".proClinic li").removeClass("on");
		$(".proClinic li.p_step3").addClass("on");
		$(".expClinic.device_mp ul").hide();
		$(".expClinic.device_mp ul.exp3").css("display","block");
	}
}
/*硫붿씤 �ㅽ겕由쏀듃*/
/*�대떖�� �댁뒋*/
$(function(){
	if($('div').hasClass('timelineCont')){
		$('.timelineCont .btn_timePre').click(function(){
			$('.timelineCont li:first-child').clone().appendTo('.timelineCont ul');
			$('.timelineCont li:first-child').remove();
		});
		$('.timelineCont .btn_timeNext').click(function(){
			$('.timelineCont li:last-child').clone().prependTo('.timelineCont ul');
			$('.timelineCont li:last-child').remove();
		});
	};
});

/* ��釉붾┸�쇰븣 �댁슜�덈궡*/
$(function(){
	if($('div').hasClass('maininfo')){
		$('.mainConBody2 .maininfo .btn_padPre').click(function(){
			$('.mainConBody2 .maininfo li:first-child').clone().appendTo('.maininfo ul');
			$('.mainConBody2 .maininfo li:first-child').remove();
		});
		$('.mainConBody2 .maininfo .btn_padNext').click(function(){
			$('.maininfo li:last-child').clone().prependTo('.maininfo ul');
			$('.maininfo li:last-child').remove();
		});
	};
});

/* ��釉붾┸�쇰븣 �ㅽ뵂肄섑뀗痢�*/
$(function(){
	if($('div').hasClass('openCon')){
		$('.mainConBody2 .openCon .btn_padPre').click(function(){
			$('.mainConBody2 .openCon li:first-child').clone().appendTo('.openCon ul');
			$('.mainConBody2 .openCon li:first-child').remove();
		});
		$('.mainConBody2 .openCon .btn_padNext').click(function(){
			$('.mainConBody2 .openCon li:last-child').clone().prependTo('.openCon ul');
			$('.mainConBody2 .openCon li:last-child').remove();
		});
	};
});

/*�대㈃�뚯썝 蹂몄씤�뺤씤*/
$(function(){
	$('.dormant_wrap > section > ul.list > li > a.nam').on("click", function(e){
		$('.dormant_wrap > section > .inhabitant').css("display",'block');
		$('.dormant_wrap > section > .ipin').css("display",'none');
		$('.dormant_wrap > section > ul.list > li').addClass("on");
		$('.dormant_wrap > section > ul.list > li.ipin').removeClass("on");
	});
	$('.dormant_wrap > section > ul.list > li > a.ipin').on("click", function(e){
		$('.dormant_wrap > section > .inhabitant').css("display",'none');
		$('.dormant_wrap > section > .ipin').css("display",'block');
		$('.dormant_wrap > section > ul.list > li').removeClass("on");
		$('.dormant_wrap > section > ul.list > li.ipin').addClass("on");
	});
});

	//�쇰뵒�ㅻ쾭�� �붿옄��
$(function(){
	$("#d_radio1").on("click",function(e){
		$('input:radio[name=email]').attr("checked", "checked");
		$(".d_radio1 label").addClass("on");
		$(".d_radio2 label").removeClass("on");
	});

	$("#d_radio2").on("click",function(e){
		$('input:radio[name=email]').attr("checked", "checked"); 
		$(".d_radio2 label").addClass("on");
		$(".d_radio1 label").removeClass("on");
	});

	$("#d_radio3").on("click",function(e){
		$('input:radio[name=sms]').attr("checked", "checked");
		$(".d_radio3 label").addClass("on");
		$(".d_radio4 label").removeClass("on");
	});

	$("#d_radio4").on("click",function(e){
		$('input:radio[name=sms]').attr("checked", "checked"); 
		$(".d_radio4 label").addClass("on");
		$(".d_radio3 label").removeClass("on");
	});
});