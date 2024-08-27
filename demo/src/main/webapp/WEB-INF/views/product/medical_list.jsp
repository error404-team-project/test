<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp" %>
<link rel="stylesheet" type="text/css" href="../css/layout.css?v=Y" />
	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="/index">HOME</a></li>
				<li>SHOP</li>
				<li class="last">의약품</li>
			</ol>
		</div>
					
		<!-- maxcontents -->
		<div id="maxcontents">
			<div class="banner"><img src="../images/img/medical_product.png" alt="원두커피, 원두커피 전문 기업 쟈뎅의 Coffee Master의 심혈을 기울인 엄선된 원두 선별, 일반 원두커피부터 간편하게 즐기는 원두커피백, POD까지 다양하게 구성되어 있습니다." class="web" /><img src="../images/img/product_banner01_m.jpg" alt="원두커피, 원두커피 전문 기업 쟈뎅의 Coffee Master의 심혈을 기울인 엄선된 원두 선별, 일반 원두커피부터 간편하게 즐기는 원두커피백, POD까지 다양하게 구성되어 있습니다." class="mobile" /></div>
			
			<h2 class="brand">의약품<span>다양한 의약품.</span></h2>

			<div class="brandTab">
				<ul>
					<li><a href="#" class="hover">항생제</a></li>
					<li><a href="#">소화제</a></li>
					<li><a href="#">비염</a></li>
					<li><a href="#">진통/소염제</a></li>
					<li><a href="#">항바이러스제</a></li>
					<li><a href="#">항염증제</a></li>
					<li><a href="#">연고</a></li>
					<li><a href="#">밴드</a></li>
				</ul>
			</div>

			<div class="brandList">
				<ul>
					<!-- 반복 -->
					<li>
						<a href="#">
							<div class="img"><img src="../images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>
					<!-- //반복 -->
			</div>

			<!-- quickmenu -->
			<div id="quick">
				<div class="cart"><a href="#">장바구니</a></div>
				<div class="wish">
					<p class="title">위시 리스트</p>
					<div class="list">
						<ul>	
						<!-- 10~15개정도 반복 -->
							<li><a href="#"><img src="../images/img/sample_wish.gif" alt="" /></a>
						<!-- 10~15개정도 반복 -->
						</ul>
					</div>

					<div class="total">
						<a href="#none" class="wishLeft"><img src="../images/btn/wish_left.gif" alt="" /></a>
						 <span class="page">1</span> / <span class="sum">5</span>
						<a href="#none" class="wishRight"><img src="../images/btn/wish_right.gif" alt="" /></a>
					</div>

				</div>

				<div class="top"><a href="#">TOP&nbsp;&nbsp;<img src="../images/ico/ico_top.gif" alt="" /></a></div>
			</div>
			<script type="text/javascript">
			$(function(){
				
				$(window).scroll(function(){
					var tg = $("div#quick");
					var xg = $("div#maxcontents");
					var limit = xg.height()- 165;
					var tmp = $(window).scrollTop();

					if (tmp > limit) {
						tg.css({"position" : "absolute","right" : "-150px","bottom" : "208px","top" : "auto"});
					}
					else {
						tg.css({"position" : "fixed","top" : "208px" , "margin-left" : "940px","right" : "auto"});
					}
				});

			});
			</script>
			<!-- //quickmenu -->

		</div>
		<!-- //maxcontents -->

	</div>
	<!-- //container -->
<%@ include file="../footer/footer.jsp" %>