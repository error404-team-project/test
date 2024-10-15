 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../header/header.jsp" %>

    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="JARDIN SHOP" />
<meta name="keywords" content="JARDIN SHOP" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" type="text/css" href="/css/reset.css?v=Y" />
<link rel="stylesheet" type="text/css" href="/css/layout.css?v=Y" />
<link rel="stylesheet" type="text/css" href="/css/content.css?v=Y" />
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/top_navi.js"></script>
<script type="text/javascript" src="/js/left_navi.js"></script>
<script type="text/javascript" src="/js/main.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="/js/idangerous.swiper-2.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.anchor.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    

	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li class="last">주문/결제</li>
			</ol>
		</div>
		
		<div id="outbox">		
			
			<!-- maxcontents -->
			<div id="maxcontents">
				<div id="mypage">
					<h2><strong>반품 요청</strong></h2>
					
					<!-- 주문 상품 -->
					<h3 class="dep">반품 제품 확인</h3>
					<div class="orderDivNm">
						<table summary="주문 제품 확인 게시판으로 상품명, 가격, 수량, 합계순으로 조회 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
							<caption>주문 제품 확인</caption>
							<colgroup>
							<col width="*" />
							<col width="16%" class="tnone" />
							<col width="14%" />
							<col width="16%" class="tw28"/>
							</colgroup>
							<thead>							
								<th scope="col">반품 번호</th>
								<th scope="col">반품 상품</th>								
								<th scope="col">상품명</th>
								<th scope="col" class="tnone">가격</th>
								<th scope="col">수량</th>
								<th scope="col">합계</th>
							</thead>
							<tbody>
								
								<tr>
									<td class="tnone">
										${re.return_no}
									</td>
									<td class="left"  style="text-align : center;">
										<img src="../image/${product.image}" alt="상품" width="66" height="66" />
									</td>
									<td>
									${product.name }
									</td>
									<td class="tnone">
										${product.price } 원
									</td>
									<td>${re.return_count} 개</td>
									<td>${product.price*re.return_count}원</td> <!-- 가격 총 합계 -->  
								</tr>

							</tbody>
						</table>
					</div>
	
					<!-- //주문 상품 -->


		

			<!-- 주문자 정보확인 -->
					<h3 class="dep">주문자 정보</h3>
					<div class="checkDiv">
						<table summary="주문자 정보를 이름, 주소, 이메일, 휴대폰 번호, 전화번호 순으로 확인 하실수 있습니다." class="checkTableM" border="1" cellspacing="0">
							<caption>주문자 정보확인</caption>
							<colgroup>
							<col width="17%" class="tw20" />
							<col width="*" />
							<col width="17%" class="tw20" />
							<col width="*" class="tw25" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>이름</span></th>
									<td>${mem.user_name}</td>
									<th scope="row"><span>이메일</span></th>
									<td>${mem.user_email}</td>
								</tr>

								<tr>
									<th scope="row" rowspan="2"><span>주소</span></th>
									<td rowspan="2">${mem.user_addr}</td>
									<th scope="row"><span>휴대폰 <u>번호</u></span></th>
									<td>${mem.user_phone}</td>
								</tr>

							</tbody>
						</table>
					</div>
			<!-- //주문자 정보확인 -->



			<!-- 결제금액 확인 -->
					<h3 class="dep">결제금액</h3>
					<div class="checkDiv">
						<table summary="결제되는 금액를 총 주문금액, 쿠폰할인, 배송비, 포인트사용, 총 결제금액 순으로 확인 하실수 있습니다." class="checkTableM" border="1" cellspacing="0">
							<caption>결제금액확인</caption>
							<colgroup>
							<col width="17%" class="tw20" />
							<col width="*" />
							<col width="17%" class="tw20" />
							<col width="*" class="tw25" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>총 주문<u>금액</u></span></th>

									<td>${product.price*re.return_count}원</td>
					
									<th scope="row"><span>배송비</span></th>
									<td>2,500 원 (선불)</td>
								</tr>

								<tr>
									<th scope="row"><span>총 결제<u>금액</u></span></th>
									
									<td colspan="3"><strong>${product.price*re.return_count+2500} 원</strong></td>
						
								</tr>
							</tbody>
						</table>
					</div>
			<!-- //결제금액 확인 -->

			<!-- 주문 정보 확인 -->
					<h3 class="dep">주문 정보</h3>
					<div class="checkDiv">
						<table summary="주문정보를 주문번호, 결제수단, 주문일, 입금은행, 요구사항, 입금자 명 순으로 확인 하실수 있습니다." class="checkTableM" border="1" cellspacing="0">
							<caption>주문 정보</caption>
							<colgroup>
							<col width="17%" class="tw20" />
							<col width="*" />
							<col width="17%" class="tw20" />
							<col width="*" class="tw25" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>주문번호</span></th>
									<td>${re.order_no}</td>
									<th scope="row"><span>결제수단</span></th>
									<td>실시간 계좌이체</td>
								</tr> 
								<tr>
									<th scope="row"><span>반품 요청일</span></th>
									<td><fmt:formatDate value="${re.request_date }" pattern="yyyy년 MM월 dd일"/></td>

									<th scope="row"><span>입금은행</span></th>
									<td>토스뱅크 (주)medison</td>
								</tr>
							</tbody>
						</table>
					</div>
			<!-- //주문 정보 확인 -->
			
			<!--  배송시 요청사항  -->	
				<h3 class="dep">반품사유</h3>
					<div class="checkDiv">
						<table summary="주문정보를 주문번호, 결제수단, 주문일, 입금은행, 요구사항, 입금자 명 순으로 확인 하실수 있습니다." class="checkTableM" border="1" cellspacing="0">
							<caption>반품 사유</caption>
							<colgroup>
							<col width="17%" class="tw20" />
							<col width="*" />
							<col width="17%" class="tw20" />
							<col width="*" class="tw25" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>반품 사유</span></th>
									<td>${re.return_reason}</td>
								</tr> 
							</tbody>
						</table>
					</div>
<script type="text/javascript">



function paybutton() {
	

  	$.ajax({
		url:"/adminPage/return_docheck",
		method:"post",
		data:{
			"user_seq":"${re.user_seq}","return_no":"${re.return_no}"},
		success: function(data){
		alert("상품 구매가 완료되었습니다. \n 메인페이지로 이동합니다 ");	
		
		},
		error:function(){
			alert("실패");
		}
		});  //ajax 

	
}
</script>

					<!-- Btn Area -->
					<div class="btnArea2">
						<a onclick ="paybutton()" class="nbtnbig iw0140">확인</a>
					</div>
					<!-- //Btn Area -->


				</div>
			</div>
			<!-- //maxcontents -->


		</div>
	</div>
	<!-- //container -->




<%@ include file="../footer/footer.jsp" %>



</body>
</html>