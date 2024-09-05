<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="../css/content.css?v=Y" />
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- container -->
	<div id="container">
		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li>의약품</li>
			<c:if test="${medi.medical_category == 1}">
				<li class="last">항생제</li>
			</c:if>
			<c:if test="${medi.medical_category == 2}">
				<li class="last">소화제</li>
			</c:if>
			<c:if test="${medi.medical_category == 3}">
				<li class="last">비염</li>
			</c:if>
			<c:if test="${medi.medical_category == 4}">
				<li class="last">진통/소염제</li>
			</c:if>
			<c:if test="${medi.medical_category == 5}">
				<li class="last">항바이러스제</li>
			</c:if>
			<c:if test="${medi.medical_category == 6}">
				<li class="last">항염증제</li>
			</c:if>
			<c:if test="${medi.medical_category == 7}">
				<li class="last">연고</li>
			</c:if>
			<c:if test="${medi.medical_category == 8}">
				<li class="last">밴드</li>
			</c:if>
			</ol>
		</div>
					
		<!-- maxcontents -->
		<div id="maxcontents">
		<!-- product -->
			<div id="pDetail">
				
				<!-- Slide -->
				<div class="imgSlide">
					<div class="img">
						<ul>
						  <c:if test="${medi.stock != 0}">
							<li style="padding:0;"><img src="../images/img/${medi.image}" alt="제품이미지" style="width:348px; height:348px; margin:0 auto;"/></li>
						  </c:if>
						  <c:if test="${medi.stock == 0}">
							<li style="padding:0;"><img src="../images/img/stock0.png" alt="제품이미지" style="width:348px; height:348px; margin:0 auto;"/></li>
						  </c:if>
						</ul>
					</div>

				</div>
				<!-- //Slide -->
				

				<!-- info -->
				<div class="info">
					<p class="title">
						${medi.name}
					</p>

					<div class="priceInfo">
						<ul>
							<li>
								<div class="stit">제조사</div> <div class="heavygray">${medi.company }</div>
							</li>
							<li>
								<div class="stit">판매가</div> <div class="heavygray"><strong>${medi.price }원</strong></div>
							</li>
							<li>
								<div class="stit">원료/성분</div> <div>${medi.row_material }</div>
							</li>
							<li>
								<div class="stit">남은수량</div> <div>${medi.stock }</div>
							</li>
							<li>
								<c:if test="${medi.stock != 0}">
									<div class="stit">수량</div> <div class="num"><input name="p_count" id="spinner" value="1" /></div>
						  		</c:if>
								<c:if test="${medi.stock == 0}">
									<div class="stit"></div>
						  		</c:if>
							</li>
						</ul>
					</div>

<script>

function wBtn(){
	if(confirm("위시리스트에 추가하시겠습니까?")){
		$.ajax({
			url : "/product/insertWish",
			type : "post",
			data : {"user_seq" : ${sessionSeq},
					"p_num" : ${medi.p_num}},
			success : function(data){
				alert(data);
				$("#wl").html('<a onclick="wDBtn()" class="ty3">위시 <span>리스트 삭제</span></a>');
			},
			error : function(){
				alert("실패");
			}
		})//ajax
	};
} // wBtn

function wDBtn(){
	if(confirm("위시리스트에서 삭제하시겠습니까?")){
		$.ajax({
			url : "/product/deletetWish",
			type : "post",
			data : {"user_seq" : ${sessionSeq},
					"p_num" : ${medi.p_num}},
			success : function(data){
				alert(data);
				$("#wl").html('<a onclick="wBtn()" class="ty3">위시 <span>리스트 추가</span></a>');
			},
			error : function(){
				alert("실패");
			}
		})//ajax
	};
} // wDBtn

function inCart(){
	if(confirm("장바구니에 추가하시겠습니까?")){
		$.ajax({
			url : "/product/inCart",
			type : "post",
			data : {"user_seq" : ${sessionSeq},
					"p_num" : ${medi.p_num},
					"count" : $("#spinner").val()},
			success : function(data){
				alert(data);
				$("#pl").html('<a href="#" class="ty2">장바구니에 <span>담김</span></a>');
			},
			error : function(){
				alert("실패");
			}
		}) // ajax
	}
} // inCart
</script>


					<!-- 판매중 -->
					<c:if test="${medi.stock != 0}">
					<div class="infobtn">
						<ul>
							<li><a href="#" class="ty1">바로 <span>구매하기</span></a></li>
						  <c:if test="${cp_num == p_num}">
							<li id="pl"><a href="#" class="ty2">장바구니에 <span>담김</span></a></li>
						  </c:if>
						  <c:if test="${cp_num != p_num}">
							<li id="pl"><a onclick="inCart()" class="ty2">장바구니 <span>담기</span></a></li>
						  </c:if>
						  <c:if test="${wp_num == p_num }">
							<li class="last" id="wl"><a onclick="wDBtn()" class="ty3">위시 <span>리스트 삭제</span></a></li>
						  </c:if>
						  <c:if test="${wp_num != p_num }">
							<li class="last" id="wl"><a onclick="wBtn()" class="ty3">위시 <span>리스트 추가</span></a></li>
						  </c:if>
						</ul>
					</div>
					</c:if>
					<!-- //판매중 -->

					<!-- 판매중지 -->
					<c:if test="${medi.stock == 0}">
					<div class="endbtn"">
						<ul>
							<li><a href="#">판매중지</a></li>
							<li><a href="#">SOLD OUT</a></li>
						</ul>
					</div>
					</c:if>
					<!-- //판매중지 -->


				</div>
				<!-- //info -->

			</div>
		<!-- //product -->

		
		<!-- tab -->
			<div class="detailTab">
				<ul>
					<li class="dep"><a href="javascript:;" onclick="return false;" id="detailInfo">상품상세 정보</a></li>
					<li class="dep"><a href="javascript:;" onclick="return false;" id="goodsReview">부작용</a></li>
					<li><a href="javascript:;" onclick="return false;" id="goodsQna">주의사항</a></li>
					<li class="last"><a href="javascript:;" onclick="return false;" id="goodsNotice">정책 및 공지</a></li>
				</ul>
			</div><script type="text/javascript">$(function(){$(".detailTab ul li a:eq(0)").click();});</script>
		<!-- //tab -->


		<!-- detail content -->
			<div id="detailContent">

				<!-- detail info -->
				<div class="detailInfo disnone">
					<div class="checkInfoDiv">
						<table summary="제품의 정보를 알 수 있는 표로 제품명, 내용량, 제조원, 포장재질, 유통기한, 고객상담실, 식품의 유형, 유통전문판매원, 영양성분, 원재료명 및 함량, 업소명 및 소재지 순으로 나열되어 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>제품의 정보</caption>
							<colgroup>
							<col width="20%" class="tw22" />
							<col width="80%" />
							</colgroup>
								<tr>
									<th scope="row" class="info"><span>제품명</span></th>
									<td>${medi.name }</td>
								</tr>

								<tr>
									<th scope="row" class="info"><span>제조사</span></th>
									<td>${medi.company }</td>
								</tr>

								<tr>
									<th scope="row" class="info"><span>상품설명</span></th>
									<td>${medi.description }</td>
								</tr>

								<tr>
									<th scope="row" class="info"><span>사용방법</span></th>
									<td>${medi.howuse }</td>
								</tr>

								<tr>
									<th scope="row" class="info"><span>보관방법</span></th>
									<td colspan="3">${medi.storage }</td>
								</tr>
						</table>
					</div>
				</div>
				<!-- detail info -->

				<!-- goods review -->
				<div class="goodsReview disnone">
					<div class="headTitle">
						<strong>약품 복용 시 부작용&nbsp;</strong> 해당 약품 복용 시 다음과 같은 부작용이 발생할 수 있음
					</div>

					<div class="accordion">
						<table class="checkTable" border="1" cellspacing="0">
							<tr>
								<th scope="row" class="info"><span>부작용</span></th>
								<td>${medi.side_effects }</td>
							</tr>
						</table>
					</div>




				<!-- //포토 구매후기 -->

				</div>
				<!-- //goods review -->


				<!-- goods qna -->
					<div class="goodsQna disnone">
						<div class="headTitle depth">
							<strong>주의사항&nbsp;</strong> 의약품 복용 시 주의사항 및 피해야 할 음식, 약
						</div>

						<!-- 질문과 답변 -->
						<div class="accordion">
							<ul>
								<li>
									<div class="headArea">
										<div class="subject">
											<a href="javascript:;" class="accbtn">주의사항은 무엇인가요?</a>
										</div>
										<div class="day">
											
										</div>
									</div>

									<div class="hideArea">
										<div class="bodyArea">
											${medi.medical_precautions }
										</div>
									</div>
									
								</li>
								<li>
									<div class="headArea">
										<div class="subject">
											<a href="javascript:;" class="accbtn">주의해야 할 약 또는 음식이 있나요?</a>
										</div>
									</div>
									<div class="hideArea">
										<div class="bodyArea">
											${medi.medical_becareful}
										</div>
									</div>
								</li>
							</ul>
						</div>
						<!-- //질문과 답변 -->
					</div>
				<!-- //goods qna -->

				<!-- goods notice -->
					<div class="goodsNotice disnone">
						<div class="headTitle depth">
							<strong>정책 및 공지&nbsp;</strong>주문 전 필독 사항입니다.
						</div>

						<div class="detailDiv">
						<table summary="정책 및 공지 알림 게시판으로 회원가입안내, 주문안내, 결제안내, 배송안내, 교환/반품안내, 환불안내 순으로 조회 하실수 있습니다. " class="detailTable" border="1" cellspacing="0">
							<caption>정책 및 공지</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>회원가입<br/>안내</span></th>
									<td>
										<ul>
											<li>저희 쇼핑몰은 회원제로 운영합니다.</li>
											<li>회원가입비나 월회비, 연회비 등 어떠한 비용도 청구하지 않는 100% 무료입니다.</li>
											<li>회원님들께는 구매 시 포인트 혜택을 드립니다.</li>
										</ul>
									</td>
								</tr>

								<tr>
									<th scope="row"><span>주문 안내</span></th>
									<td>
										<ul>
											<li>Step 1 : 상품 검색</li>
											<li>Step 2 : 장바구니에 담기</li>
											<li>Step 3 : 회원 ID 로그인 또는 비회원으로 주문하기</li>
											<li>Step 4 : 주문 성공 화면(주문번호)</li>
										</ul>

										<p class="fn12">※비회원 주문인 경우 주문번호와 승인번호(카드 결제 시)를 꼭 메모해 두시기 바랍니다.<br/>&nbsp;&nbsp;&nbsp;</p>
									</td>
								</tr>
								
								<tr>
									<th scope="row"><span>결제 안내</span></th>
									<td>
										<ul>
											<li>카드 결제나 무통장 입금을 하시는 경우 입금/결제 확인 후 상품이 배송됩니다.</li>
											<li>무통장 입금 시 주문자와 입금자가 다른 경우 배송이 지연될 수 있습니다. 게시판에 정보를 남겨주셔야 합니다. </li>
										</ul>
									</td>
								</tr>
								
								<tr>
									<th scope="row"><span>배송 안내</span></th>
									<td>
										<ul>
											<li>배송 방법 : 드론 및 택배</li>
											<li>배송 지역 : 전국 지역 (제주 도서/산간지역 별도)</li>
											<li>배송 비용 : 기본 무료 단, 일부지역에 한해 추가금이 부과될 수 있음.</li>
											<li>배송 안내 : 24시간 이내 배송</li>
										</ul>
									</td>
								</tr>

								<tr>
									<th scope="row"><span>교환/반품<br/>안내</span></th>
									<td>
										<ul>
											<li>저희 쇼핑몰은 교환/반품 정책을 운영하고 있습니다.</li>
											<li>교환 시 제품을 수령한 날로부터 24시간 이내 1:1문의 게시판 혹은 고객센터로 연락을 주시고 3일 이내에 보내주신 상품에 한하여 교환됩니다.</li>
											<li>제품에 하자가 있는 경우에는 새 상품으로 재교환 해 드립니다.</li>
										</ul>
									</td>
								</tr>

								<tr>
									<th scope="row"><span>환불 안내</span></th>
									<td>
										<ul>
											<li>환불 시 반품 확인 여부를 확인 한 후 3일 이내에 결제금액을 환불해 드립니다.</li>
											<li>신용카드로 결제하신 경우, 신용카드 승인을 취소하면 결제 대금이 청구되지 않습니다. </li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
						</div>
					</div>
				<!-- //goods notice -->


			</div>
		<!-- //detail content -->








<script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script type="text/javascript" src="../js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox-1.3.4.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<style type="text/css">
.ui-corner-all{border-bottom-right-radius:0 !important; border-bottom-left-radius:0 !important; border-top-left-radius:0 !important; border-top-right-radius:0 !important;}
.ui-widget-content{border:0;}
.ui-spinner-input{width:70px; margin:0; border:1px #ddd solid; padding:2px 0 2px 5px; font-family:'Nanum Gothic' !important; font-size:12px !important;}
</style>

<script type="text/javascript">
$(document).ready(function() {

	// spinner
	var spinner = $( "#spinner" ).spinner({ min: 1 });
	

	// rolling
	function widthChk(){
		var winWidth = $(window).width();
		if(winWidth > 983){var twidth = 348;
		}else if(winWidth < 983 && winWidth > 767){var twidth = 298;
		}else{var twidth = 248;}
		return twidth
	}

	function slideChk(){
		var ulchk = widthChk() * $(".img ul li").size();
		$(".img ul").css("width",ulchk);
	}
	
	$(".thum ul li").click(function(){
		var winWidth = $(window).width();
		var thumNum = $(".thum ul li").index(this);	
		var ulLeft = widthChk() * thumNum ;
		$(".thum ul li").removeClass("hover");
		$(this).addClass("hover");
		$(".img ul").stop().animate({"left": - ulLeft}, 500);
	});
	

	// goods relation last margin
	function relationChk(){
		var winWidth = $(window).width();
		if(winWidth > 767){
			$(".relationList li").css("margin","0 20px 0 0");
			$(".relationList li:eq(4)").css("margin","0");
		}else if(winWidth < 768 && winWidth > 360){
			$(".relationList li").css("margin","0 10px 10px 0");
			$(".relationList li:eq(4)").css("margin","0");
		}else{
			$(".relationList li").css("margin","0 10px 10px 0");
			$(".relationList li:nth-child(2n)").css("margin","0 0 10px 0");
		}
	}

	// layer popup
	var winWidth = $(window).width();
	if(winWidth > 767){
		var layerCheck = 540;
		var popCheck = 768;
	}else{
		var layerCheck = 320;
		var popCheck = 320;
	}
	$(".passbtn").fancybox({
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

	$(".popBtn").fancybox({
		'autoDimensions'    : false,
		'showCloseButton'	: false,
		'width' : popCheck,
		'padding' : 0,
		'type'			: 'iframe',
		'onComplete' : function() {
			$('#fancybox-frame').load(function() { // wait for frame to load and then gets it's height
			$('#fancybox-content').height($(this).contents().find('body').height());
			});
		}
	});


	// resize
	$(window).resize(function(){
		$(".thum ul li:eq(0)").click();
		slideChk();
		relationChk();
	});


	$(".thum ul li:eq(0)").click();
	slideChk();
	relationChk();

});
</script>




		</div>
		<!-- //maxcontents -->

	</div>
	<!-- //container -->
<%@ include file="../footer/footer.jsp" %>