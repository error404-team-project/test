 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
					<h2><strong>주문이 완료되었습니다</strong></h2>
					
					<!-- 주문 상품 -->
					<h3 class="dep">주문 제품 확인</h3>
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
								<th scope="col">상품명</th>
								<th scope="col" class="tnone">가격</th>
								<th scope="col">수량</th>
								<th scope="col">합계</th>
							</thead>
							<tbody>
								
								<c:forEach var="cart" items="${cartlist}">
								<tr>
									<td class="left">
										<p class="img"><img src="../image/${cart.product.image}" alt="상품" width="66" height="66" /></p>
										
										<ul class="goods">
											<li style="text-align: center;">
												<a href="#"  >${cart.product.name}</a>
											</li>
										</ul>
									</td>
									<td class="tnone">
										${cart.product.price} 원
										
									</td>
									<td>${cart.count} 개</td>
									<td>${cart.product.price*cart.count}원</td> <!-- 가격 총 합계 -->  
								</tr>
						    <c:set var="totalPrice" value="${totalPrice + (cart.product.price * cart.count)}" /> <!-- 가격 합산 -->
								</c:forEach>
							</tbody>
						</table>
					</div>
	
					<!-- //주문 상품 -->


			<!-- 총 주문금액 -->
					<div class="amount">

						<!-- 회원 일때 -->
						<h4 class="member">총 주문금액</h4>
						<!-- 회원 일때 -->
						<!-- 비회원 일때  <h4>총 주문금액</h4> //비회원 일때 -->

						<ul class="info">
							<li>
								<span class="title">상품 합계금액</span>
								<!-- medi 에 값이  없을때 -->
								<!-- household 에 값이 없을때 -->
						
								<span class="won"><strong>${totalPrice}</strong> 원</span>
							
							</li>
							<li>
								<span class="title">배송비</span>
								<span class="won"><strong>2,500</strong> 원</span>
							</li>
							
						</ul>

						<ul class="total">
							

							<li class="txt"><strong>결제 예정 금액</strong></li>
								<!-- medi 에 값이  없을때 -->
								<!-- household 에 값이 없을때 -->
								<li class="money"><span>${totalPrice +2500}</span> 원</li>
							
						</ul>
					</div>
			<!-- //총 주문금액 -->
					

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
									<td>${name}</td>
									<th scope="row"><span>이메일</span></th>
									<td>${email}</td>
								</tr>

								<tr>
									<th scope="row" rowspan="2"><span>주소</span></th>
									<td rowspan="2">${zip1}<br/>${zip2}</td>
									<th scope="row"><span>휴대폰 <u>번호</u></span></th>
									<td>${phone}</td>
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
									
								
									<td>${totalPrice}원</td>
																		
									<th scope="row"><span>배송비</span></th>
									<td>2,500 원 (선불)</td>
								</tr>

								<tr>
									<th scope="row"><span>총 결제<u>금액</u></span></th>
								
									<td colspan="3"><strong>${totalPrice +2500} 원</strong></td>
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
									<td>${order_no}</td>
									<th scope="row"><span>결제수단</span></th>
									<td>실시간 계좌이체</td>
								</tr> 
								<tr>
									<th scope="row"><span>주문일</span></th>
									<td>${formattedDate}</td>
									<th scope="row"><span>입금은행</span></th>
									<td>토스뱅크 (주)medison</td>
								</tr>
							</tbody>
						</table>
					</div>
			<!-- //주문 정보 확인 -->
			
			<!--  배송시 요청사항  -->	
				<h3 class="dep">배송시 요청사항</h3>
					<div class="checkDiv">
						<table summary="주문정보를 주문번호, 결제수단, 주문일, 입금은행, 요구사항, 입금자 명 순으로 확인 하실수 있습니다." class="checkTableM" border="1" cellspacing="0">
							<caption>배송시 요청사항</caption>
							<colgroup>
							<col width="17%" class="tw20" />
							<col width="*" />
							<col width="17%" class="tw20" />
							<col width="*" class="tw25" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>배송시 요청사항</span></th>
									<td><input type="text" id="carry" class="addressType2" /></td>
								</tr> 
							</tbody>
						</table>
					</div>
<script type="text/javascript">


function paybutton() {
	
 var products = []; // 상품 정보를 담을 배열

'<c:forEach var="cart" items="${cartlist}">'
    var p_num = "${cart.product.p_num}"; // 상품 번호
    var p_count = "${cart.count}"; // 수량

    products.push({ "p_num": p_num, "order_count": p_count }); // 배열에 추가
'</c:forEach>'
	
   if (!$("#carry").val()) { // carry가 비어 있거나 undefined일 때
    var carry= "배송 요청사항 없음" ;
} else {
var carry = $("#carry").val(); // carry의 값 가져오기 
} 
	var carry_zip = "${zip1}" +"/"+ "${zip2}" ;
	var formattedDate = "${formattedDate}";
	var order_no = "${order_no}";
 var user_seq = "${sessionSeq}";
 var emergency = "N";
 var order_status = "결제 완료";
 
 var pnums='';
 var cnts='';
 
 '<c:forEach var="cart" items="${cartlist}">'
 pnums += "${cart.product.p_num}"+",";			
 cnts +=  "${cart.count}"+",";	
 '</c:forEach >'
 console.log(pnums)   
 console.log(cnts)   

 var x = "${x}";
var y = "${y}";
 
 
 console.log()

  	$.ajax({
		url:"/payment/DBorderList",
		method:"post",
		data:{"order_request":carry,"order_no":order_no,"carry_zip":carry_zip,
			"user_seq":user_seq,"emergency":emergency,"order_status":order_status,"pnums":pnums,"cnts":cnts,"x":x,"y":y},
		success: function(data){
		alert("상품 구매가 완료되었습니다. \n 메인페이지로 이동합니다 ");	
		location.href = "/index";
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