<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header/header.jsp" %>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="JARDIN SHOP" />
<meta name="keywords" content="JARDIN SHOP" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" type="text/css" href="/css/reset.css?v=Y" />
<link rel="stylesheet" type="text/css" href="/css/layout.css?v=Y" />
<link rel="stylesheet" type="text/css" href="/css/content.css?v=Y" />

<script>
console.log("${cartlist}")
</script>

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
					<h2><strong>주문/결제</strong></h2>
					
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
											<li>
												<a href="#">${cart.product.name }</a>
											</li>
										</ul>
									</td>
									<td class="tnone">
										${cart.product.price } 원

									</td>
									<td>${cart.count} 개</td>
									<td>${cart.product.price*cart.count} 원</td>
								</tr>
								    <c:set var="totalPrice" value="${totalPrice + (cart.product.price * cart.count)}" /> <!-- 가격 합산 -->
								    <c:set var="count" value="${cart.count}" /> <!-- 가격 합산 -->
								</c:forEach>
						
							</tbody>
						</table>
					</div>
					
                    <div class="poroductTotal">
						<ul>	
							<li> 배송비 <strong>2,500</strong> 원</li>
						</ul>
					</div>				
					<!-- //주문 상품 -->
					

			<!-- 주문자 주소 입력 -->
					<h3 class="diviLeft">주문자 주소 입력</h3>
			

					<div class="checkDiv">
						<table summary="주문자 주소를 입력할 수 있는 란으로 이름, 주소, 이메일, 휴대폰 번호, 전화번호 순으로 입력 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>주문자 주소 입력</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>이름</span></th>
									<td><input type="text" id="name" class="w134" value="${user.user_name}" /></td>
								</tr>

								<tr>
									<th scope="row"><span>주소</span></th>
									<td>
										<ul class="pta">
											<li><a onclick="zipBtn()"class="addressBtn" style="cursor:pointer;"><span>우편번호 찾기</span></a></li>
											<li class="pt5"><input type="text" id="zip" class="addressType2" value="${user.user_zip}"/></li>
											<li class="pt5"><input type="text" id="zip1"class="addressType2" value="${user.addr1}" /></li>											
											<li class="pt5"><input type="text" id="zip2"class="addressType2" value="${user.addr2}" /></li>
												<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
										</ul>
									</td>
								</tr>
<script>
var address = '';
var x = '';
var y = '';
function zipBtn() {
	
    new daum.Postcode({
        oncomplete: function(data) {
        	
       var newzc = $("#zip").val(data.zonecode);
       var newzip = $("#zip1").val(data.address);
       address = data.address;
       console.log(address);
       getCoordinates(address); // 주소가 설정된 후 위도와 경도를 가져옵니다.
       }
   }).open();
} // zipBtn

function getCoordinates(address) {
   var apiKey = 'a9bc0a2eeb1937f6e9ec22ef39ceb2b5'; // 여기에 카카오 REST API 키를 입력하세요.
   // JSP에서 주소를 URL 인코딩
    var encodedAddress = encodeURIComponent(address); // JavaScript에서 주소 인코딩

   // 백틱 대신 문자열 연결 사용
   var geocodeUrl = 'https://dapi.kakao.com/v2/local/search/address.json?query=' + encodedAddress;
   
    $.ajax({
       url: geocodeUrl,
       type: 'GET',
       headers: {
           'Authorization': 'KakaoAK ' + apiKey // 카카오 API 키를 Authorization 헤더에 추가
       },
       success: function(data) {
           if (data.documents.length > 0) {
               var location = data.documents[0].address;
               console.log("위도: " + location.y);
               console.log("경도: " + location.x);
               $("#x").val(location.x);
               $("#y").val(location.y);
               x = location.x;
               y = location.y;
           } else {
               console.error("주소를 찾을 수 없습니다.");
           }
       },
       error: function(xhr, status, error) {
           console.error("API 요청 실패: " + error);
       }
   });
}
</script>
								<tr>
									<th scope="row" ><span>이메일</span></th>
									<td >
										<input type="hidden"  id="email" value="${user.user_email }" />${user.user_email }
									</td>
								</tr>
									<tr>
									<th scope="row"><span>휴대전화 *</span></th>
									<td>
										<ul class="pta">
											<li>
												<select id="newph1">
												<c:if test="${user.phone1 != null }">
													<option value="${user.phone1 }" selected="selected">${user.phone1}</option>
													<option value="011">011</option>
													<option value="016">016</option>
													</c:if>
												
												<c:if test="${user.phone1 == null }">	
													<option value="010" selected="selected">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													</c:if>
												</select> 
						
											</li>
											<li>&nbsp;<span class="valign">-</span>&nbsp;</li>
											<li><input type="text" class="w74" id="newph2" maxlength="4" value="${user.phone2}"  /> <span class="valign">-</span>&nbsp;</li>

											<li class="r10"><input type="text"  id="newph3" class="w74" maxlength="4" value="${user.phone3 }" /></li>	
										
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>비밀번호</span></th>
									<td><input type="password" id="Pw" class="w134" /></td>
								</tr>
							</tbody>
						</table>
					</div>
			<!-- //주문자 주소 입력 -->


			<!-- 총 주문금액 -->
					<div class="amount">

						<!-- 회원 일때 -->
						<h4 class="member">총 주문금액</h4>
						<!-- 회원 일때 -->
						<!-- 비회원 일때  <h4>총 주문금액</h4> //비회원 일때 -->

						<ul class="info">
							<li>
								<span class="title">상품 합계금액</span>
								<span class="won"><strong>${totalPrice}</strong> 원</span>
							</li>
							<li>
								<span class="title">배송비</span>
								<span class="won"><strong>2,500</strong> 원</span>
							</li>

						</ul>

						<ul class="total">
							<li class="txt"><strong>결제 예정 금액</strong></li>
							<li class="money"><span>${totalPrice+2500}</span> 원</li>
						</ul>
					</div>
			<!-- //총 주문금액 -->



			<!-- 결제수단 선택 -->
					<h3 class="dep">결제수단 선택</h3>
					<div class="checkDiv">
						<table summary="신용카드 결제, 실시간 계좌이체, 가상계좌, 가상계좌(에스크로), 무통장 입금 순으로 결제수단을 선택하실 수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>결제수단 선택</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>결제수단</span></th>
									<td>
										<ul class="pta">
											<li>
												<input type="radio" id="method02" name="method" checked /><label for="method02">실시간 계좌이체</label>
											</li>
											
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				<!-- //결제수단 선택 -->

				
					<div class="disnone method02"><!-- 실시간 계좌이체 -->
						<p class="orderalert"><strong>[실시간 계좌이체]</strong> 주민번호, 계좌 정보, 공인인증서를 통해 실시간 계좌이체를 진행합니다.</p>
					</div>
		
		<!-- 포트원 결제 -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- 포트원 결제 -->

	
		


	
		
		
		<script type="text/javascript">
		//////////////////////////////////////////////////////////////////////////////////////////
			
		
		function buyFrm(){
			var phone = 	$("#newph1").val()+"-"+$("#newph2").val()+"-"+$("#newph3").val()  ;
			
		 	if($("#Pw").val() != "${user.user_pw}" || $("#Pw").val() == null) {
				alert(" 비밀번호가 일치하지 않으면 결제를 할 수 없습니다.\n다시입력해주세요");
				$("#Pw").val("");
				$("#Pw").focus();
				return false;
		 	}
		 	else {
		 		alert ("비밀번호가 일치합니다.\n 결제 화면으로 이동합니다 ")
		}
			
			console.log("${p_num}");
            
			 var today = new Date();
			var hours = today.getHours(); // 시
			var minutes = today.getMinutes();  // 분
			var seconds = today.getSeconds();  // 초
			var milliseconds = today.getMilliseconds();
			var makeMerchantUid = ""+today.getFullYear()+(today.getMonth()+1)+today.getDate()+hours+minutes+seconds+milliseconds;
 		var phone = 	$("#newph1").val()+"-"+$("#newph2").val()+"-"+$("#newph3").val()  ;
 		var merchant_uid= "${user.user_id}" + makeMerchantUid;
 		const userCode = "imp58355030";
			IMP.init(userCode); // 고객사 식별 코드를 넣어 모듈을 초기화해주세요.
			
			 console.log(makeMerchantUid);

			var plist=[];
			var tp = "${totalPrice+2500}";
		
           
			 
			 '<c:forEach var="cart" items="${cartlist}">'
			 plist.push("${cart.product.name}")			 
			 '</c:forEach >'
		     console.log(plist)   
		     console.log(tp)   
	
		     
			 IMP.request_pay(
			  {
				  pg: "tosspayments", // 반드시 "tosspayments"임을 명시해주세요.
				    merchant_uid: "${user.user_id}" + makeMerchantUid , // 결제 고유 번호
					 pay_method: "trans",
				     name: plist[0],
	                amount: tp,
				    buyer_name: $("#name").val(),
				    buyer_email: $("#email").val(),
				    buyer_tel: phone,
				    buyer_postcode: $("#zip").val(),
				    buyer_addr: $("#zip1").val(),
				    buyer_addr: $("#zip2").val(),
				    locale: "ko",
				    custom_data: { userId:"${user.user_id}" },
			  },
			    (response) => {  // PC 환경에서 결제 프로세스 완료 후 실행 될 로직
			    	console.log(response);
			         if (response.error_code == "F400") { 
			        	 
			        	     alert(`error:[${response.status}]\n결제요청이 승인된 경우 관리자에게 문의바랍니다.`);
			         
			          } else { // 결제완료 후 DB저장 실패시
			              alert('결제 완료!');  
			              event.preventDefault(); // 기본 링크 동작 방지
			              var p_num = "${cart.product.p_num}"; 
			              var count = "${cart.count}";
			              var name = $("#name").val();
			              var zip = $("#zip").val();
			              var zip1 = $("#zip1").val();
			              var zip2 = $("#zip2").val();
			              var email = $("#email").val();
			              var order_no = merchant_uid;
			              // URL 생성
			              var url = "/payment/order_check2?p_num=" + p_num + "&p_count=" + count + "&name=" + encodeURIComponent(name) + "&zip=" + zip + "&zip1=" + zip1 + "&zip2=" + zip2 + "&phone="+phone +"&email="+email+"&order_no="+order_no+"&x="+x+"&y="+y+"";
			              // 링크 리다이렉트
			              location.href = url;
			      } 

} // response end
			  );  //IMP.request_pay  end    
			  
		} // frm 종료
		</script>
		
		<script type="text/javascript">
		function backFrm(){
			location.href="/payment/state_return";
			
		}
		</script>
						
					
<br><br><br>
					<!-- Btn Area -->
					<div class="btnArea">
						<div class="orderCenter">
							<ul>
								<li><a onclick="backFrm()" class="nbtnbig iw0140">뒤로가기</a></li>
								<li><a onclick="buyFrm()"" class="sbtnMini iw0140"  style="cursor:pointer;">주문 / 결제</a></li>								
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->
				


				</div>
			</div>
			<!-- //maxcontents -->


<script type="text/javascript" src="../js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox-1.3.4.css" />
<script type="text/javascript">
$(function(){
	// select, radio - display check

	// 1 Step Radio
	var firstchk = $("input:radio[name=method]:checked").attr("id");
	$("div." + firstchk).css("display","block");
	$("input:radio[name=method]").click(function(){
		var divchk = $(this).attr("id");		
		$(".disnone").css("display","none");
		$("div." + divchk).css("display","block");
	});
	
	// 2 Step 영수증 Select
	var firstselect = $("select[name=receiptChk] option:selected").attr("value");
	$("div." + firstselect).css("display","block");
	$("select[name=bank]").css("width","125px");
	$("select[name=receiptChk]").css("width","112px");
	$("select[name=receiptChk]").change(function() {
        $(".receipt").css("display","none");
        if($(this).val() == "none"){ $(".receipt").css("display","none"); }
        else if($(this).val() == "individual"){ $(".individual").css("display","block"); }
		else{ $(".corporate").css("display","block"); }

		var firstindi = $("input:radio[name=individual]:checked").attr("id");
		var firstcorp = $("input:radio[name=corporate]:checked").attr("id");
		$("ul." + firstindi).css("display","block");		
		$("ul." + firstcorp).css("display","block");
    });
	
	// 3-1 Step 발급방식 - 개인
	var firstindi = $("input:radio[name=individual]:checked").attr("id");
	$("ul." + firstindi).css("display","block");
	$("input:radio[name=individual]").click(function(){
		var divchk = $(this).attr("id");
		$(".inform").css("display","none");
		$("ul." + divchk).css("display","block");
	});

	// 3-2 Step 발급방식 - 사업자
	var firstcorp = $("input:radio[name=corporate]:checked").attr("id");
	$("ul." + firstcorp).css("display","block");
	$("input:radio[name=corporate]").click(function(){
		var divchk = $(this).attr("id");
		$(".inform").css("display","none");
		$("ul." + divchk).css("display","block");
	});





	// layer popup
	var winWidth = $(window).width();
	if(winWidth > 767){
		var layerCheck = 540;
		var couponCheck = 760;
	}else{
		var layerCheck = 320;
		var couponCheck = 320;
	}

	$(".addressBtn").fancybox({
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

	$(".nbtn").fancybox({
		'autoDimensions'    : false,
		'showCloseButton'	: false,
		'width' : couponCheck,
		'padding' : 0,
		'type'			: 'iframe',
		'onComplete' : function() {
			$('#fancybox-frame').load(function() { // wait for frame to load and then gets it's height
			$('#fancybox-content').height($(this).contents().find('body').height());
			$('#fancybox-wrap').css('top','400px');
			$('html,body').animate({ scrollTop: 400 }, 500);
			});
		}
	});


});
</script>


		</div>
	</div>
	<!-- //container -->



<%@ include file="../footer/footer.jsp" %>



</div>
</div>
</body>
</html>