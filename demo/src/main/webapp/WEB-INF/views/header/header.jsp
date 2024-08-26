<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title> MEDISON </title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="JARDIN SHOP" />
<meta name="keywords" content="JARDIN SHOP" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" type="text/css" href="../css/reset.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/index.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/content.css?v=Y" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/top_navi.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../js/idangerous.swiper-2.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.anchor.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="../js/html5.js"></script>
<script type="text/javascript" src="../js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
$(document).ready(function() {
	
	var mySwiper = new Swiper('#mainRoll',{
		pagination: '#mainThum',
		paginationClickable: true,
		slidesPerView: 1,
		loop: true,
		autoplay:5000
	});

	var mySwiper2 = new Swiper('#bestseller',{
		paginationClickable: true,
		slidesPerView: 3,
		loop: true,
		autoplay:3000
	});

	var mySwiper3 = new Swiper('#mainSale',{
		paginationClickable: true,
		slidesPerView: 5,
		loop: true,
		autoplay:3000
	});
	
	$(window).bind('resize', function() {
		rollwidth();	
	});

	function rollwidth(){
		var winWidth = $(window).width();
		if(winWidth < 768){
			mySwiper2.params.slidesPerView = 1;
			mySwiper3.params.slidesPerView = 2;
		}else{
			mySwiper2.params.slidesPerView = 3;
			mySwiper3.params.slidesPerView = 5;
		}
	}
	$('.arrowLeft').bind('click', function(e){
		e.preventDefault()
		mySwiper2.swipePrev()
	});
	$('.arrowRight').bind('click', function(e){
		e.preventDefault()
		mySwiper2.swipeNext()
	});

	$('.saleLeft').bind('click', function(e){
		e.preventDefault()
		mySwiper3.swipePrev()
	});
	$('.saleRight').bind('click', function(e){
		e.preventDefault()
		mySwiper3.swipeNext()
	});

	rollwidth();


	var myWish = new Swiper('#wishList',{
		paginationClickable: true,
		slidesPerView: 3,
		loop: true,
		autoplay:3000
	});


});
</script>
</head>
<body>



<!--익스레이어팝업-->
<div id="ieUser" style="display:none">
	<div class="iewrap">	
		<p class="img"><img src="../images/ico/ico_alert.gif" alt="알림" /></p>
		<p class="txt">IE버전이 낮아 홈페이지 이용에 불편함이 있으므로 <strong>IE9이상이나 다른 브라우저</strong>를 이용해 주세요. </p>
		<ul>
			<li><a href="http://windows.microsoft.com/ko-kr/internet-explorer/download-ie" target="_blank"><img src="../images/ico/ico_ie.gif" alt="IE 최신브라우저 다운" ></a></li>
			<li><a href="https://www.google.com/intl/ko/chrome/browser" target="_blank"><img src="../images/ico/ico_chrome.gif" alt="IE 최신브라우저 다운" ></a></li>
			<li><a href="http://www.mozilla.org/ko/firefox/new" target="_blank"><img src="../images/ico/ico_mozila.gif" alt="MOZILA 최신브라우저 다운" ></a></li>
			<li><a href="http://www.apple.com/safari" target="_blank"><img src="../images/ico/ico_safari.gif" alt="SAFARI 최신브라우저 다운" ></a></li>
			<li><a href="http://www.opera.com/ko/o/ie-simple" target="_blank"><img src="../images/ico/ico_opera.gif" alt="OPERA 최신브라우저 다운" ></a></li>		
		</ul>
		<p class="btn" onclick="msiehide();"><img src="../images/ico/ico_close.gif" alt="닫기" /></p>
	</div>
</div>
<!--//익스레이어팝업-->
<!--IE 6,7,8 사용자에게 브라우저 업데이터 설명 Div 관련 스크립트-->
 <script type="text/javascript">

     var settimediv = 200000; //지속시간(1000= 1초)
     var msietimer;

     $(document).ready(function () {
         msiecheck();
     });

     var msiecheck = function () {
         var browser = navigator.userAgent.toLowerCase();
         if (browser.indexOf('msie 6') != -1 ||
                browser.indexOf('msie 7') != -1 ||
				 browser.indexOf('msie 8') != -1) {
             msieshow();			 
         }
         else {
             msiehide();
         }
     }

     var msieshow = function () {
        $("#ieUser").show();
        msietimer = setTimeout("msiehide()", settimediv);
     }

     var msiehide = function () {
		$("#ieUser").hide();
        clearTimeout(msietimer);
     }
</script>

<div id="allwrap">
<div id="wrap">

	<div id="header">
		<div class="header">
    <div class="container">
        <!-- 왼쪽 버튼들 -->
        <div class="left-buttons">
        	<div class="dropdown">
		        <a href="/event" class="button">EVENT</a>
		        <div class="dropdown-content">
		        </div>
    		</div>
    		<div class="dropdown">    		
            	<a href="/customer" class="button">CUSTOMER</a>
            	<div class="dropdown-content">
		            <a href="/event1">공지사항</a>
		            <a href="/event2">1:1 문의</a>
		            <a href="/event3">자주 묻는 질문</a>
		            <a href="/event4">카카오톡 문의</a>
		        </div>
    		</div>
    		<div class="dropdown">    		
            	<a href="/community" class="button">COMMUNITY</a>
            	<div class="dropdown-content">
		            <a href="/event1">자유 게시판</a>
		            <a href="/event2">후기 게시판</a>
		        </div>
    		</div>
    		<div class="dropdown">
	            <a href="/shop" class="button">SHOP</a>
	            <div class="dropdown-content">
		            <a href="/event1">의약품</a>
		            <a href="/event2">생활용품</a>
		            <a href="/event3">긴급 배송</a>
		        </div>
    		</div>
        </div>
        
        <!-- 중앙 로고 -->
        <div class="logo">
            <h3 class="logo-text"><span>Medison</span><a href="../">.</a></h3>
        </div>
        
        <!-- 오른쪽 버튼들 -->
        <div class="right-buttons">
            <a href="/login" class="button">LOGIN</a>
            <a href="/join" class="button">JOIN</a>
            <a href="/mypage" class="button">MYPAGE</a>
            <a href="/cart" class="button">CART</a>
            <a href="/admin" class="button">ADMIN</a>
        </div>
    </div>
</div>
</div>



	<!-- GNB -->
	<div id="gnb">
		<div id="top">
			<ul>
				<li class="t2"><a href="#" id="topNavi2"></a>
					<ul id="topSubm2">
						<li></li>
						<li></li>
						<li></li>
						<li></li>
					</ul>
				</li>
				<li class="t1"><a href="#" id="topNavi3"></a>
					<ul id="topSubm3">
						<li></li>
						<li></li>
						<li></li>
					</ul>
				</li>
				<li class="t2"><a href="#" id="topNavi4"></a>
					<ul id="topSubm4">
						<li></li>
						<li></li>
						<li></li>
					</ul>
				</li>
				<li class="t1"><a href="#" id="topNavi5"></a>
					<ul id="topSubm5">
						<li></li>
						<li></li>
						<li></li>
					</ul>
				</li>
				<li class="t2"><a href="#" id="topNavi6"></a>
					<ul id="topSubm6">
						<li></li>
						<li></li>
						<li></li>
					</ul>
				</li>
				<li class="t1"><id="topNavi7"></a></li>
				<li class="t2"><id="topNavi8"></a></li>
			</ul>
		</div>

		<script type="text/javascript">initTopMenu();</script>
	</div>
	<!-- //GNB -->