.<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<li><a href="#">MY PAGE</a></li>
				<li class="last">주문/배송 조회</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title">MY PAGE<span>마이페이지</span></div>
				<ul>	
					<li><a href="/mypage/order" id="leftNavi1">주문/배송 조회</a></li>
					<br>
					<li><a href="/mypage/return_state" id="leftNavi2">반품 현황</a></li>
					<br>
					<li><a href="/mypage/inquiry" id="leftNavi7">1:1문의</a></li>
					<br>
					<li><a href="/mypage/change" id="leftNavi8">회원정보 수정</a></li>
					<br>
					<li class="last"><a href="get_leave" id="leftNavi9">회원 탈퇴</a></li>
				</ul>			
			</div>
			
           <script type="text/javascript">initSubmenu(2,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>반품 신청 </strong> <br><span> 구매하신 상품은 7일 이내 반품 신청 하실 수 있습니다.</span></h2>
					

					<h3>반품 상품정보</h3>
					<div class="orderDivNm">
						<table summary="주문일자/주문번호, 상품명, 가격, 수량, 주문상태 순으로 조회를 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
							<caption>반품/교환 상품정보</caption>
							<colgroup>
							<col width="25%" class="tw28" />
							<col width="*" />
							<col width="15%" class="tnone" />
							<col width="8%" class="tnone" />
							<col width="18%" class="tw30" />
							</colgroup>
							<thead>
								<th scope="col">주문일자 <span>/ 주문번호</span></th>
								<th scope="col">상품명</th>
								<th scope="col" class="tnone">가격</th>
								<th scope="col" class="tnone">수량</th>
								<th scope="col">주문상태</th>
							</thead>
							<tbody>
								<c:forEach var="r" items="${list}">
								<tr>
								<td>
										<p class="day" id="date">${r.order_date }</p>
										<p class="orderNum" id="order_no">${r.order_no}</p>
									</td>
										 <td class="left" >
										${r.product.name}
									</td>
									<td class="tnone">${r.product.price }원</td>
									<td class="tnone" id="count">${r.order_count }개</td>
									<td>
										<span class="heavygray" id="status">${r.order_status}</span>
									</td>
								</tr>
<input type="hidden" id="p_num" value="${r.p_num}">
								</c:forEach> 
							</tbody>
						</table>

						<div class="noData">
							등록된 상품이 없습니다.
						</div>
					</div>



					<h3 class="dep">반품 사유</h3>
					<div class="checkDiv">
						<table summary="분류, 자세한 이유 순으로 반품 사유를 작성 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>반품 사유</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>분류</span></th>
									<td>
										<select>										
											<option>선택해주세요.</option>
											<option value="의약품">의약품</option>
											<option value="건강기능식품">건강기능식품</option>
											<option value="배송">배송</option>
											<option value="서비스 문제">서비스 문제</option>											
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>자세한 이유</span></th>
									<td>
										<textarea class="tta" id="reason"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
		
					<script type="text/javascript">
					function returnFrm() {
						alert("반품하시겠습니까?");
						
						
						 var p_num = '';
					     var count = '';
					     var order_no= '';
					     var order_date= '';
						var status = '';
						var reason =$("#reason").val();
						
						'<c:forEach var="r" items="${list}">'
					 p_num += "${r.p_num}"+",";			
					 count +=  "${r.order_count }"+",";						
					 order_no += "${r.order_no}"+",";			
					 order_date +=  "${r.order_date }"+",";	
					 status +=  "${r.order_status}"+",";	
					 '</c:forEach >'
						
						    	console.log(p_num);
						    	console.log(count);
						    	console.log(order_date);
						    	console.log(status);
						    	console.log(order_no);
						    	console.log(reason);
						 
							
						$.ajax({
							url:"/mypage/return_dv_do",
							method:"post",
							data:{"p_num":p_num,"count":count,"order_no":order_no,"order_date":order_date,"status":status,"reason":reason},
							success: function(data){
							alert("반품 요청 완료되었습니다.");
							console.log(data);
							
						//	location.href="/mypage/return_state";
							},
							error:function(){
								alert("실패");
							}
							});  //ajax 
						
					}
					</script>

					<!-- Btn Area -->
					<div class="btnArea">
						<div class="bCenter">
							<ul>								
								<li><a onclick="returnFrm()" class="sbtnMini">반품 신청</a></li>
								<li><a href="/index" class="nbtnbig">취소</a></li>
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->
					



<script type="text/javascript">
$(function(){
	function distance(){
		var winWidth = $(window).width();
		if(winWidth > 767){
			$(".productList ul li:nth-child(4n+4)").css("padding","0 0 0 0");
		}else{
			$(".productList ul li:nth-child(4n+4)").css("padding","0 10px");
		}
	}
	distance();
	$(window).resize(function(){distance();});
});
</script>



				</div>
			</div>
			<!-- //contents -->


		</div>
	</div>
	<!-- //container -->



<%@ include file="../footer/footer.jsp" %>


</div>
</div>
</body>
</html>