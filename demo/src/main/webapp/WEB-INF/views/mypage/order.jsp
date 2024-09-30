<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%@ include file="../header/header.jsp" %>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="JARDIN SHOP" />
<meta name="keywords" content="JARDIN SHOP" />

<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no"><link rel="stylesheet" type="text/css" href="/css/reset.css?v=Y" />
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
		
	<%@ include file="../mypageline.jsp" %>
	
	
	<script type="text/javascript">initSubmenu(1,0);</script>

			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>주문/배송 조회</strong><span>회원님이 구매하신 주문내역 및 배송정보를 확인하실 수 있습니다.</span></h2>
					
					<%@ include file="../myinfo.jsp" %>

					<h3>주문/배송 조회</h3>
					<div class="checkDiv">
						<table  summary="기간별, 상태별, 단어검색별로 주문/배송 조회를 하실수 있습니다." class="checkTableM" border="1" cellspacing="0">
							<caption>주문/배송 조회</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody >
						
								<tr >
									<th scope="row"  ><span>상태별 검색</span></th>
									<td >
										<select>
										    <option value="product">전체</option>
											<option value="medicine">의약품</option>
											<option value="daily_product">생필품</option>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				

					<div class="orderDiv">
						<table summary="주문일자/주문번호, 상품명, 가격, 수량, 주문상태 순으로 조회를 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
							<caption>주문게시판</caption>
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
							<tbody id="tbody">
							
							</tbody>
							
						</table>

						<div class="noData">
							등록된 상품이 없습니다.
						</div>
					</div>
					<script type="text/javascript">
					// 반품 신청 하기
					function returnFrm() {

						var order_no=[];
						var order_list="";
						
						var order_num=[];
						var order_p_num="";
					
						// console.log($("input[name=return]:checked").length)
						if($("input[name=return]:checked").length != 0){
						
							$("input[name=return]:checked").each(function() {
							   order_no.push($(this).val());
							   var pNumberValue = $(this).siblings('.p_number').val(); 
							   order_num.push(pNumberValue);
							   
							});
							  
							// order_list에 값 넣기
					for(var i=0; i<order_no.length; i++ ){
							order_list += String(order_no[i])+"/";	
							
					// console.log(order_list);
					}
					      // order_p_num에 값 넣기
					for(var i=0; i<order_num.length; i++ ){
						order_p_num += String(order_num[i])+"/";	
						  // 마지막 슬래시 제거
		
					}
					 console.log(order_p_num);
						  var url = "/mypage/return_dv?order_list="+order_list+ "&order_p_num=" + order_p_num ; 
				 		   location.href=url;
						}else {
					            alert("반품 하려면 상품이 선택되어야 합니다.");
					        }
						
					}  // returnFrm
					</script>
					<div >
						<ul>	
													<li><a onclick="returnFrm()" class="nbtnMini iw40" style="cursor:pointer;">반품 신청 하기</a></li>
						</ul>
					</div>
					
					<div class="btnAreaList">
						<!-- 페이징이동1 -->
						<div class="allPageMoving1">

						<a href="#" class="n"><img src="../images/btn/btn_pre2.gif" alt="처음으로"/></a><a href="#" class="pre"><img src="../images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
						<c:forEach var="num" begin="${pageDto.startPage }" 
											end="${pageDto.maxPage }" step="1">
						<c:if test="${num != pageDto.page }">
							<a href="/mypage/order?page=${num }">${num }</a>
						</c:if>
						<c:if test="${num == pageDto.page }">
							<strong>${num }</strong>
						</c:if>
					</c:forEach>
						<a href="#" class="next"><img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/></a><a href="#" class="n"><img src="../images/btn/btn_next2.gif" alt="마지막페이지로"/></a>

						</div>
						<!-- //페이징이동1 -->
					</div>

<script type="text/javascript">
// order 리스트 출력
if(${result == 2}){
	alert("로그인 후 이용 가능합니다");
	location.href="/member/login";
}
		var orderlist=[];
		var order = [];
		'<c:forEach var="order" items="${list }">'
		order.push("${order.order_date}")
		order.push("${order.order_no}")
		order.push("${order.product.name}")		
		order.push("${order.product.price}")
		order.push("${order.order_count}")
		order.push("${order.order_status}")
		order.push("${order.p_num}")  // 어제 밤에 추가한 부분
		
		orderlist.push(order);
		order=[]
		'</c:forEach>'
		//console.log(orderlist)
		
		
		var str = '';
		var cnt = 0;
		var newcnt = 0;
		var id;
		for(var i = 0; i <orderlist.length; i ++){
			str += '<tr>'
			for(var j = 0; j <orderlist.length; j ++){
				if(orderlist[i][1]==orderlist[j][1]){
					cnt++;
					id = orderlist[i][1]		
				}
			}
			if( orderlist[i][1] == id )
			{
				if(cnt > 1)
				{
					if (newcnt == 0){
						str+='<td rowspan="'+cnt+'" style="border-bottom : 1px solid black; border-left : 1px solid black; border-right : 1px solid black;">'
						str+='<br>'
						str+='<p class="day">'+orderlist[i][0]+'</p>'
						str+='<br>'
						str+='<p class="orderNum">'+orderlist[i][1]+'</p>'
						str+='</td>'
					}
				}else if(cnt==1){
					str+='<td style="border-bottom : 1px solid black; border-left : 1px solid black; border-right : 1px solid black;" >'
					str+='<br>'
					str+='<br>'
					str+='<p class="day">'+orderlist[i][0]+'</p>'
					str+='<br>'
					str+='<p class="orderNum">'+orderlist[i][1]+'</p>'
					str+='</td>'
				}
						
				str+='<td class="left" style= "text-align: center; border-bottom : 1px solid black;">'
				str+='<input type="checkbox" id="return" name="return" value="'+orderlist[i][1]+'">'
				str+='<input type="hidden" class="p_number" value="'+orderlist[i][6]+'">' // 추가한 부분
				str+= '&nbsp;&nbsp;&nbsp;'
				str+=orderlist[i][2]
				str+='	</td >'
				str+='<td class="tnone" style="border-bottom : 1px solid black;">'+orderlist[i][3]+'원 </td>'
				str+='<td class="tnone" style="border-bottom : 1px solid black;">'+orderlist[i][4]+'개 </td>'
								
				if(cnt > 1)
				{
					if (newcnt == 0){
						str+='<td rowspan="'+cnt+'" style="border-bottom : 1px solid black; border-right : 1px solid black">'
						str+='<span class="heavygray">'+orderlist[i][5]+'</span>'
						str+='<ul class="state"><li><a href="#" class="reviewbtn">리뷰작성</a></li></ul></td>'
						
					}
					newcnt++;
					if (cnt == newcnt) newcnt=0;
				}else if(cnt==1){
					str+='<td style="border-bottom : 1px solid black; border-right : 1px solid black">'
					str+='<span class="heavygray">'+orderlist[i][5]+'</span>'
					str+='<ul class="state"><li><a href="#" class="reviewbtn">리뷰작성</a></li></ul></td>'
				}
			}
			cnt=0;
			str+='</tr>'
		}
		console.log(str);
		$("#tbody").html(str)

		</script>
					


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


	// layer popup
	var winWidth = $(window).width();
	if(winWidth > 767){
		var layerCheck = 760;
	}else{
		var layerCheck = 320;
	}

	$(".iw40").fancybox({
		'autoDimensions'    : false,
		'showCloseButton'	: false,
		'width' : layerCheck,
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