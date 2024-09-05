<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../header/header.jsp" %>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- container -->
	<div id="container">

	
			<script type="text/javascript">initSubmenu(3,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>장바구니</strong><span>장바구니에 담긴 상품을 확인해보세요.</span></h2>
					

				<!-- 장바구니에 상품이 있을경우 -->
					<!-- 장바구니 상품 -->
					<h3>장바구니에 담긴 상품 <span>장바구니에 담긴 상품은 30일간 보관됩니다.</span></h3>
					<div class="orderDivNm">
						<table summary="장바구니에 담긴 상품들을 전체선택, 상품명, 가격/포인트, 수량, 합계, 주문 순으로 조회 및 주문을 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
							<caption>장바구니 상품목록</caption>
							<colgroup>
							<col width="7%"/>
							<col width="*" />
							<col width="14%" class="tnone" />
							<col width="10%" class="tw14"/>
							<col width="14%" class="tw28"/>
							<col width="14%" class="tnone" />
							</colgroup>
							<thead>
								<th scope="col"><input type="checkbox" />전체</th>
								<th scope="col">상품명</th>
								<th scope="col" class="tnone">가격/포인트</th>
								<th scope="col">수량</th>
								<th scope="col">합계</th>
								<th scope="col" class="tnone">주문</th>
							</thead>
							<tbody>
							<c:forEach var="c" items="${list}">
								<tr>
									<td><input type="checkbox" /></td>
									<td class="left">
										<p class="img"><img src="../images/img/${c.product.image}" alt="상품" width="66" height="66" /></p>

										<ul class="goods">
											<li>
												<a href="#">${c.product.name }</a>
											</li>
										</ul>
									</td>
									<td ><sapn class="price">${c.product.price}</sapn> 원<br/></td>
									<td> <input type="text" id="inputbox" class="spinner" value="${c.count }"></td>
									<td ><span class="tPrice">${c.product.price * c.count }</span> 원</td>
									<td class="tnone">
										<ul class="order">	
											<li><a href="#" class="obtnMini iw70">바로구매</a></li>
											<li><a href="#" class="nbtnMini iw70">상품삭제</a></li>
										</ul>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>

<script>
$(function() {
    $(".inputbox").spinner();

    // 위로 버튼 클릭 이벤트
    $(document).on("click", ".ui-spinner-button.ui-spinner-up", function() {
        var row = $(this).closest("tr"); // 현재 행 찾기
        var pricetxt = row.find(".price").text(); // 가격 텍스트 가져오기
        var price = parseInt(pricetxt, 10); // 가격을 정수로 변환
        var count = row.find(".spinner").val(); // 스피너의 값을 가져오기
        count = parseInt(count, 10); // 수량을 정수로 변환
        var total = price * count; // 총 가격 계산
        row.find(".tPrice").text(total); // 총 가격을 표시
    });

    // 아래로 버튼 클릭 이벤트
    $(document).on("click", ".ui-spinner-button.ui-spinner-down", function() {
        var row = $(this).closest("tr"); // 현재 행 찾기
        var pricetxt = row.find(".price").text(); // 가격 텍스트 가져오기
        var price = parseInt(pricetxt, 10); // 가격을 정수로 변환
        var count = row.find(".spinner").val(); // 스피너의 값을 가져오기
        count = parseInt(count, 10); // 수량을 정수로 변환
        var total = price * count; // 총 가격 계산
        row.find(".tPrice").text(total); // 총 가격을 표시
    });
});
/* $("#inputbox").on("propertychange change keyup paste input", function(){
	alert("change");
}); */
	
</script>

					<div class="btnArea">
						<div class="bRight">
							<ul>
								<li><a href="#" class="selectbtn">전체선택</a></li>
								<li><a href="#" class="selectbtn2">선택수정</a></li>
								<li><a href="#" class="selectbtn2">선택삭제</a></li>
							</ul>
						</div>
					</div>
					<!-- //장바구니 상품 -->
					

					<!-- 총 주문금액 -->
					<div class="amount">
						<h4>총 주문금액</h4>
						<ul class="info">
							<li>
								<span class="title">상품 합계금액</span>
								<span class="won"><strong>1,132,310</strong> 원</span>
							</li>
							<li>
								<span class="title">배송비</span>
								<span class="won"><strong>2,500</strong> 원</span>
							</li>
						</ul>
						<ul class="total">
							<li class="mileage">(적립 마일리지 <strong>11,324</strong> Point) </li>
							<li class="txt"><strong>결제 예정 금액</strong></li>
							<li class="money"><span>1,134,810</span> 원</li>
						</ul>
					</div>
					<!-- //총 주문금액 -->

					<div class="cartarea">
						<ul>
							<li><a href="#" class="ty1">선택상품 <span>주문하기</span></a></li>
							<li><a href="#" class="ty2">전체상품 <span>주문하기</span></a></li>
							<li class="last"><a href="#" class="ty3">쇼핑 <span>계속하기</span></a></li>
						</ul>
					</div>

				<!-- //장바구니에 상품이 있을경우 -->


				<!-- 장바구니에 상품이 없을경우
					<div class="noting">
						<div class="point"><span class="orange">장바구니</span>에 담긴 상품이 없습니다.</div>

						<p>장바구니에 담긴 상품은 30일간만 보관됩니다.<br/>더 오래 보관하고 싶은 상품은 <u>위시리스트</u>에 담아주세요.</p>

						<a href="#">쇼핑 계속하기</a>
					</div>
				 //장바구니에 상품이 없을경우 -->

				</div>
			</div>
			<!-- //contents -->


<script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<style type="text/css">
.ui-corner-all{border-bottom-right-radius:0 !important; border-bottom-left-radius:0 !important; border-top-left-radius:0 !important; border-top-right-radius:0 !important;}
.ui-widget-content{border:0;}
 .ui-spinner-input{width:44px; margin:0; border:1px #ddd solid; padding:2px 0 2px 5px; font-family:'Nanum Gothic' !important; font-size:12px !important;}
</style>

<script type="text/javascript">
$(function() {
	var spinner = $( ".spinner" ).spinner({ min: 1, max: 999 });
});
</script>



		</div>
	</div>
	<!-- //container -->
	<%@ include file="../footer/footer.jsp" %>