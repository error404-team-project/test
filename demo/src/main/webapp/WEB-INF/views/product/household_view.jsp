<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp" %>
<link rel="stylesheet" type="text/css" href="../css/content.css?v=Y" />
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li>생활용품</li>
				<li class="last">카테고리 넣기</li>
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
							<li><img src="../images/img/sample_brand.jpg" alt="제품이미지" /></li>
						</ul>
					</div>

					<div class="thum">
						<ul>
							<li><img src="../images/img/sample_brand.jpg" alt="썸네일 제품이미지" /></li>
						</ul>
					</div>
				</div>
				<!-- //Slide -->
				

				<!-- info -->
				<div class="info">
					<p class="title">
						<span>[오리지널]</span>
						쟈뎅 오리지널 콜롬비아 페레이라 원두커피백 15p
					</p>

					<div class="priceInfo">
						<ul>
							<li>
								<div class="stit">제조사</div> <div class="heavygray">어딜까</div>
							</li>
							<li>
								<div class="stit">판매가</div> <div class="heavygray"><strong>4,330원</strong></div>
							</li>
							<li>
								<div class="stit">용량</div> <div>3.8kg+15p</div>
							</li>
							<li>
								<div class="stit">수량</div> <div class="num"><input name="p_count" id="spinner" value="1" /></div>
							</li>
						</ul>
					</div>

					<!-- 판매중 -->
					<div class="infobtn">
						<ul>
							<li><a href="#" class="ty1">바로 <span>구매하기</span></a></li>
							<li><a href="#" class="ty2">장바구니 <span>담기</span></a></li>
							<li class="last"><a href="#" class="ty3">위시 <span>리스트</span></a></li>
						</ul>
					</div>
					<!-- //판매중 -->

					<!-- 판매중지 -->
					<div class="endbtn" style="display:none;">
						<ul>
							<li><a href="#">판매중지</a></li>
							<li><a href="#">SOLD OUT</a></li>
						</ul>
					</div>
					<!-- //판매중지 -->


				</div>
				<!-- //info -->

			</div>
		<!-- //product -->

		
		<!-- tab -->
			<div class="detailTab">
				<ul>
					<li class="dep"><a href="javascript:;" onclick="return false;" id="detailInfo">상품상세 정보</a></li>
					<li><a href="javascript:;" onclick="return false;" id="goodsRelation">용법/용량</a></li>
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
							<col width="*" />
							<col width="18%" class="tw22" />
							<col width="*" class="tw25" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="info"><span>제품명</span></th>
									<td>원두커피백</td>
								</tr>

								<tr>
									<th scope="row" class="info"><span>제조사</span></th>
									<td>JARDIN</td>
								</tr>

								<tr>
									<th scope="row" class="info"><span>상품설명</span></th>
									<td>제조일로부터 OO개월</td>
								</tr>

								<tr>
									<th scope="row" class="info"><span>사용방법</span></th>
									<td>인스턴트 커피</td>
								</tr>

								<tr>
									<th scope="row" class="info"><span>보관방법</span></th>
									<td colspan="3">인스턴트 커피, 합성 헤이즐넛향</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
				<!-- detail info -->


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
											<li>사이즈 교환에 한하여는 1회 교환이 가능합니다. (단, 택배비는 고객 부담입니다.)</li>
											<li>교환 시 제품을 수령한 날로부터 24시간 이내 1:1문의 게시판 혹은 고객센터로 연락을 주시고 3일 이내에 보내주신 상품에 한하여 교환됩니다.</li>
											<li>제품에 하자가 있는 경우에는 동일 사이즈, 동일 디자인으로 재교환 해 드립니다.</li>
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