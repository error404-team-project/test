<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>   
<%@ include file="header/header.jsp" %>

<script>
document.addEventListener("DOMContentLoaded", function() {
    const imageBoxes = document.querySelectorAll('.image-box');
    let lastScrollTop = 0; // 마지막 스크롤 위치를 저장

    function checkVisibility() {
        const currentScrollTop = window.scrollY; // 현재 스크롤 위치

        imageBoxes.forEach(box => {
            const rect = box.getBoundingClientRect();
            const windowHeight = window.innerHeight;

            // 이미지 박스가 화면에 보일 때 애니메이션 클래스 추가
            if (rect.top < windowHeight && rect.bottom > 0) {
                if (currentScrollTop > lastScrollTop) { // 스크롤을 내릴 때
                    if (box.classList.contains('left')) {
                        box.classList.add('animate-left');
                    }
                } else { // 스크롤을 올릴 때
                    if (box.classList.contains('right')) {
                        box.classList.add('animate-right');
                    }
                }
            } else {
                // 이미지 박스가 화면에서 벗어날 때 애니메이션 클래스 제거
                box.classList.remove('animate-left', 'animate-right');
            }
        });

        lastScrollTop = currentScrollTop; // 마지막 스크롤 위치 업데이트
    }

    // 스크롤 이벤트 리스너 추가
    window.addEventListener('scroll', checkVisibility);
    // 페이지 로드 시 초기 체크
    checkVisibility();
});
</script>


<style>
.banner {
    position: relative;
    text-align: center;
    color: #505050;
}
.banner img {
    width: 100%;
    height: 500px;
    opacity: 0.8;
}
.banner-text {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 38px;
    font-weight: 800;
    line-height: 2.0; /* 줄 간격 조정 */
}
.content-section {
    padding: 40px;
    text-align: center;
}
.content-section h2 {
    font-size: 28px;
    margin-bottom: 20px;
}
.content-section p {
    font-size: 18px;
    line-height: 1.6;
    color: #555;
}
        
.horizontal-container {
  display: flex;
  align-items: center; /* 이미지와 텍스트를 수직으로 정렬 */
  gap: 20px; /* 이미지와 텍스트 간격 */
  padding: 0 0 0 150px; /* 패딩 추가 */
}

.image-box {
  flex-basis: 60%; /* 이미지 박스의 기본 너비를 50%로 설정 */
  max-width: 60%; /* 이미지 박스가 화면의 절반을 넘지 않도록 제한 */
}

.image-box img {
  width: 100%; /* 이미지가 부모 요소의 너비를 모두 차지하도록 설정 */
  height: 500px; /* 이미지 비율 유지 */
  display: block;
}

.text-box {
  flex-basis: 50%; /* 텍스트 박스의 기본 너비를 50%로 설정 */
  max-width: 50%; /* 텍스트 박스가 화면의 절반을 넘지 않도록 제한 */
  color: #333; /* 텍스트 색상 */
}

.text-box h2 {
  font-size: 40px;
  margin-bottom: 10px;
  color: #5fbaf1;
  border-bottom: 1px solid #333; /* h2 아래에 실선 추가 */
  padding-bottom: 15px; /* 실선과 텍스트 사이의 여백 */
  display: inline-block; /* 텍스트 길이만큼 실선 */
}

.text-box p {
  font-size: 18px;
  line-height: 1.6;
  color: #666; /* 보조 텍스트 색상 */
}


.horizontal-container.reverse {
  flex-direction: row-reverse; /* 이미지와 텍스트의 순서를 반대로 설정 */
  display: flex;
  align-items: center; /* 이미지와 텍스트를 수직으로 정렬 */
  gap: 145px; /* 이미지와 텍스트 간격 */
  padding: 0 0 0 0px; /* 패딩 추가 */
}

@keyframes slideInLeft {
    from {
        transform: translateX(-100%);
        opacity: 0;
    }
    to {
        transform: translateX(0);
        opacity: 1;
    }
}

@keyframes slideInRight {
    from {
        transform: translateX(100%);
        opacity: 0;
    }
    to {
        transform: translateX(0);
        opacity: 1;
    }
}

.image-box.left.animate-left {
    animation: slideInLeft 0.5s forwards; /* 왼쪽에서 등장하는 애니메이션 */
}

.image-box.right.animate-right {
    animation: slideInRight 0.5s forwards; /* 오른쪽에서 등장하는 애니메이션 */
}

}

* item card */
.product-info {
  padding: 150px 0 0 16px; /* 카드 내부 여백 */
  display: flex;
  flex-direction: column;
  align-items: center; /* 텍스트 중앙 정렬 */
  justify-content: center; /* 카드의 내용 수직 중앙 정렬 */
  height: 100%; /* 카드 높이 전체를 사용 */
}

.product-info h2 {
  font-size: 35px; /* 제목 크기 */
  color: #333333; /* 제목 색상 */
  margin: 0 0 10px; /* 제목의 하단 여백 */
  line-height: 1.4; /* 제목 줄 높이 */
}

.product-info .highlight-background {
  background-color: #5fbaf1; /* 하늘 색 배경 */
  color: #fff; /* 배경 위 텍스트 색상 */
  padding: 5px 10px; /* 텍스트 주위 여백 */
  border-radius: 4px; /* 배경 둥글기 */
}

.product-info .highlight-text {
  color: #333; /* 텍스트 색상 */
  font-weight: bold; /* 텍스트 두껍게 */
  padding: 5px; /* 텍스트 주위 여백 */
}

.product-info p {
  font-size: 20px; /* 본문 텍스트 크기 */
  color: #666; /* 본문 텍스트 색상 */
  line-height: 1.6; /* 본문 줄 높이 */
}
        
</style>


   <div class="banner">
        <img src="../images/img/brand.jpg" alt="medison brand">
        <div class="banner-text">드론으로 빠르고 안전하게,<br> 
        필요한 순간 Medison이 함께합니다</div>
    </div>

<div class="horizontal-container">


  <!-- 텍스트 박스 -->
  <div class="text-box">
	    <h2>Drone</h2>
	    <p>We utilize advanced drone technology to deliver </p>
	    <p>your essential medicines safely and efficiently.</p>	
  </div>
	    <!-- 이미지 박스 -->
	  <div class="image-box right">
	    <img src="../images/img/drone_01.jpg" alt="Medicine Image" />
	  </div>
</div>
<div class="horizontal-container reverse">


  <!-- 텍스트 박스 -->
  <div class="text-box">
	    <h2>Delivery</h2>
	    <p>We utilize advanced drone technology to deliver </p>
	    <p>your essential medicines safely and efficiently.</p>
  </div>
	    <!-- 이미지 박스 -->
	  <div class="image-box left">
	    <img src="../images/img/delivery.jpg" alt="Medicine Image" />
	  </div>
</div>

<div class="product-info">
     	<h2>
     	<span class="highlight-background">드론으로 신속하게 배송</span><br>
     	<span class="highlight-text">당신의 소중한 상품을 안전하게</span>
     	</h2>
    	<p>우리의 드론 배송 서비스는 최첨단 기술을 이용하여 상품을 신속하고 안전하게 배송합니다.</p>
    	<p>어디에서든지, 어떤 상품이든지 드론을 통해 빠르고 효율적으로 배달해 드립니다. 믿을 수 있는 드론 배송으로 시간을 절약하고, 더 편리한 쇼핑 경험을 즐기세요.</p>
 </div>
<%@ include file="footer/footer.jsp" %>
