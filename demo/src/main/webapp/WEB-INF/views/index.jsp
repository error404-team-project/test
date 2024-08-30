<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="header/header.jsp" %>

<main>
	<!-- mainSection -->
	<div id="mainSection">

		<!-- main rolling -->
		<div id="mainRoll">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<a href="#"><img src="../images/img/medicine.jpg" alt="" /></a>
				</div>
				<div class="swiper-slide">
					<a href="#"><img src="../images/img/medicine.jpg" alt="" /></a>
				</div>
				<div class="swiper-slide">
					<a href="#"><img src="../images/img/medicine.jpg" alt="" /></a>
				</div>
				<div class="swiper-slide">
					<a href="#"><img src="../images/img/medicine.jpg" alt="" /></a>
				</div>
			</div>
			<div id="mainThum"></div>
		</div>
		<!-- //main rolling -->
		
		<!-- text scrolling -->
		<div id="scrollingContainer">
		  <div class="scrollingWrapper">
		    <div class="scrollingLine"></div>
		    <div class="scrollingText">
		      <div class="scrollingContent">
		        <div class="scrollingItem">Medicine and Drone</div>
		        <div class="scrollingItem">Medicine and Drone</div>
		        <div class="scrollingItem">Medicine and Drone</div>
		        <div class="scrollingItem">Medicine and Drone</div>
		        <div class="scrollingItem">Medicine and Drone</div>
		      </div>
		      <div class="scrollingContent">
		        <div class="scrollingItem">Medicine and Drone</div>
		        <div class="scrollingItem">Medicine and Drone</div>
		        <div class="scrollingItem">Medicine and Drone</div>
		        <div class="scrollingItem">Medicine and Drone</div>
		        <div class="scrollingItem">Medicine and Drone</div>
		      </div>
		       <div class="scrollingContent">
		        <div class="scrollingItem">Medicine and Drone</div>
		        <div class="scrollingItem">Medicine and Drone</div>
		        <div class="scrollingItem">Medicine and Drone</div>
		        <div class="scrollingItem">Medicine and Drone</div>
		        <div class="scrollingItem">Medicine and Drone</div>
		      </div>
		      <div class="scrollingContent">
		        <div class="scrollingItem">Medicine and Drone</div>
		        <div class="scrollingItem">Medicine and Drone</div>
		        <div class="scrollingItem">Medicine and Drone</div>
		        <div class="scrollingItem">Medicine and Drone</div>
		        <div class="scrollingItem">Medicine and Drone</div>
		      </div>
		    </div>
		    </div>
		    <div class="scrollingLine"></div>
		  </div>
		</div>
		
		<div class="horizontal-container">


  <!-- 텍스트 박스 -->
  <div class="text-box">
	    <h2>Drone, Medicine, Delivery</h2>
	    <p>We utilize advanced drone technology to deliver </p>
	    <p>your essential medicines safely and efficiently.</p>
	    <!-- 버튼 추가 -->
  		<div class="brand-button"><a href="brand-details.html" class="details-button">About Brand</a></div>
  </div>
	    <!-- 이미지 박스 -->
	  <div class="image-box">
	    <img src="../images/img/drone_01.jpg" alt="Medicine Image" />
	  </div>
	</div>
	
	<!-- main contents -->
	 <div class="product-info">
     	<h2>
     	<span class="highlight-background">드론으로 신속하게 배송</span><br>
     	<span class="highlight-text">당신의 소중한 상품을 안전하게</span>
     	</h2>
    	<p>우리의 드론 배송 서비스는 최첨단 기술을 이용하여 상품을 신속하고 안전하게 배송합니다.</p>
    	<p>어디에서든지, 어떤 상품이든지 드론을 통해 빠르고 효율적으로 배달해 드립니다. 믿을 수 있는 드론 배송으로 시간을 절약하고, 더 편리한 쇼핑 경험을 즐기세요.</p>
  	</div>
	<!-- 상품 이미지 박스 -->
	<div class="gallery-container">
  <a href="../product/medical_list" class="gallery-item">
    <img src="../images/img/product_medicine.jpg" alt="Medicines">
    <div class="overlay">
      <div class="text">Medicines</div>
    </div>
  </a>
  <a href="../product/household_list" class="gallery-item">
    <img src="../images/img/daily_product.jpeg" alt="Household Items">
    <div class="overlay">
      <div class="text">Household Items</div>
    </div>
  </a>
  <a href="../product/em_delivery" class="gallery-item">
    <img src="../images/img/emergency_kit.jpg" alt="Emergency Delivery">
    <div class="overlay">
      <div class="text">Emergency Delivery</div>
    </div>
  </a>
</div>
		</div>


	</div>

</main>
<%@ include file="footer/footer.jsp" %>
