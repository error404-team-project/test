.<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header/header.jsp" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

    
	<!-- container -->
	<div id="container">

		<%@ include file="../mypageline.jsp" %>
				
			<script type="text/javascript">initSubmenu(2,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>반품 현황</strong><span>회원님이 구매하신 상품의 반품 신청 및 내역을 확인하실 수 있습니다.</span></h2>
					
					<div class="myInfo">
						<ul>
							<li class="info"><strong>${sessionName}</strong> 님의 정보를 한눈에 확인하세요.</li>
							<li class="last">진행중인 반품 요청 <br/><span class="num">${allcount}</span> <span class="unit">건</span></li>
						</ul>
					</div>

					<h3>반품 현황</h3>
					<div class="checkDiv">
						<table summary="반품 분류선택, 기간별, 단어검색별로 주문/배송 조회를 하실수 있습니다." class="checkTableM" border="1" cellspacing="0">
							<caption>주문/배송 조회</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>분류 선택</span></th>
									<td>
										<ul class="pta">
											<li><input type="radio" id="return" name="category" checked /><label for="return">반품</label></li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>


					<div class="orderDiv">
						<table summary="주문일자/주문번호, 분류, 상품명, 가격, 상태, 사유 순으로 반품/교환 현황을 조회 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
							<caption>반품 현황 사유보기</caption>
							<colgroup>
							<col width="25%" class="tw30" />
							<col width="7%" class="tnone" />
							<col width="*" />
							<col width="13%" class="tnone" />
							<col width="10%" class="tw18"/>
							<col width="15%" class="tnone" />
							</colgroup>
							<thead>
								<th scope="col">요청일자 <span>/ 반품번호</span></th>
								<th scope="col" class="tnone">분류</th>
								<th scope="col">상품명</th>
								<th scope="col">상태</th>
							</thead>
							<tbody>
						
							 <c:forEach var="return1" items="${list}"> 
								<tr>
									<td>
										<p class="day"><fmt:formatDate value="${return1.request_date }" pattern="yyyy년 MM월 dd일"/></p>
										<p class="orderNum">${return1.return_no}</p>
									</td>
									<td class="tnone"><span class="heavygray">반품</span></td>
									<td class="left" style="text-align:center;">
										${return1.product.name}
									</td>
									<td><span class="orange">${return1.return_state}</span></td>
								</tr>		
								  <input type="hidden" class="reno${return1.return_no}" value="${return1.return_no}"/>			
							 </c:forEach> 
							</tbody>
						</table>

<script type="text/javascript">
function reason1(no) {
	console.log(no);
var return_no= $(".reno"+no).val();

console.log(return_no);
	
	url="/mypage/reason?return_no="+return_no;
	location.href=url
}
</script>
						<div class="noData">
							등록된 상품이 없습니다.
						</div>
					</div>
					

					<div class="btnAreaList">
						<!-- 페이징이동1 -->
						<div class="allPageMoving1">

						<a href="#" class="n"><img src="../images/btn/btn_pre2.gif" alt="처음으로"/></a><a href="#" class="pre"><img src="../images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
						<strong>1</strong>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">4</a>
						<a href="#">5</a>
						<a href="#" class="next"><img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/></a><a href="#" class="n"><img src="../images/btn/btn_next2.gif" alt="마지막페이지로"/></a>

						</div>
						<!-- //페이징이동1 -->
					</div>
					



					



<script type="text/javascript" src="../js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox-1.3.4.css" />
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

	$(".iwc80").fancybox({
		'autoDimensions'    : false,
		'showCloseButton'	: false,
		'width' : 486,
		'padding' : 0,
		'type'			: 'iframe',
		'onComplete' : function() {
			$('#fancybox-frame').load(function() { // wait for frame to load and then gets it's height
			$('#fancybox-content').height($(this).contents().find('body').height());
			});
		}
	});

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