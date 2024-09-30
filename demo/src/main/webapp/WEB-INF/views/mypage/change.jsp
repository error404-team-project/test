.<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header/header.jsp" %>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ssl.daumcdn.net/dapi/postcode.v2.js"></script>
	

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
    
    
					<script>
						
 function hbCr(){   // 이건 이메일 
						$("#email").val($("#emailList").val());
					}
function modiFrm() {  // 이거 수정 최종 버튼

	 var emailId = $("#emailId").val();
	 var emailId1 = $("#email").val();
	 var Email= emailId+"@"+emailId1;
	 
	 var phone1 = $("#newph1").val();
	 var phone2 = $("#newph2").val();
	 var phone3 = $("#newph3").val();
	 var newPhone = phone1+"-"+phone2+"-"+phone3 ;
	 
	 var Name= $("#newName").val();
	 var Id= $("#newId").val();
	 var Pw= $("#newPw2").val();	
	 
	 var yes= $("#receive_yes").val();	 
	 var no= $("#receive_no").val();	 
	 
	 var Pw= $("#newPw2").val();	 
	 var newzip = $("#zip").val();
     var newaddr =	$("#ziip").val();
     
     var x = $("#x").val();
     var y = $("#y").val();
	 
	var marketing = $("input[name=receive1]:checked").val() ;
    
	 // 첫번째로 현재 비밀번호가 session 비밀번호랑 일치해야겠지?
 	if($("#Pw").val() != "${chpw}" || $("#Pw").val() == null) {
		alert("현재 비밀번호가 일치하지 않습니다.\n다시입력해주세요");
		$("#Pw").val("");
		$("#Pw").focus();
		return false;
	}; 
	// 두번째로 현재 비밀번호가 새로운 비밀번호랑 달라야 겠지?
	if($("#Pw").val() == $("#newPw").val() || $("#newPw").val() == null) {
		alert("새 비밀번호가 기존의 비밀번호랑 같습니다.\n다시입력해주세요");
		$("#newPw").val("");
		$("#newPw").focus();
		return false;
	};
	// 세번째로  새로운 비밀번호가 새비밀번호 재입력 부분이랑 일치해야겠지?
	if($("#newPw").val() != $("#newPw2").val() || $("#newPw2").val() == null) {
		alert("새 비밀번호가 새 비밀번호 재입력 과 일치하지 않습니다.\n다시입력해주세요");
		$("#newPw2").val("");
		$("#newPw2").focus();
		return false;
	}; 
	

	$.ajax({
		url:"/mypage/updateM",
		method:"post",
		data:{"user_id":Id,"user_name":Name,"user_pw":Pw,"user_email":Email,"mkt_agree":marketing,
			"user_zip":newzip,"user_addr":newaddr,"user_phone":newPhone,"x":x,"y":y},
		success: function(data){	
		alert("회원 정보 수정이 완료되었습니다.")
		location.href="../";
		},
		error:function(){
			alert("실패");
		}
		});  //ajax

		
	} 
</script>
	<!-- container -->
	<div id="container">

<%@ include file="../mypageline.jsp" %>
		
			<script type="text/javascript">initSubmenu(8,0);</script>

			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>회원정보 수정</strong><span>회원님의 개인 정보를 수정하실 수 있습니다.</span></h2>
					
						<br>
                        
					<div class="attention">
						<ul>
							<li><h3>* 표시된 항목은 필수 항목이므로 반드시 입력하셔야 합니다.</h3></li>
						</ul>
					</div>

					<div class="memberbd">
						<table summary="이름, 아이디, 비밀번호, 비밀번호 확인, 이메일, 이메일수신여부, 주소, 휴대폰, 유선전화, 생년월일 순으로 회원가입 정보를 수정할수 있습니다." class="memberWrite" border="1" cellspacing="0">
							<caption>회원가입 수정</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>이름 *</span></th>
									<td>
									<input type="text" id="newName" class="w134" value="${member.user_name }" />
									</td>
								</tr>
								<tr>
									<th scope="row"><span>아이디 *</span></th>
									<td><input type="text" id="newId" class="w134" value="${member.user_id}" readonly="readonly" />
									</td>
								
								</tr>
							
									<tr>
									<th scope="row" colspan="2" style="text-align:center;"><span>비밀번호 변경 *</span></th>				
								</tr>
									<tr>
						<th scope="row" style="border-top : 2px solid black;border-left : 2px solid black" ><span>현재 비밀번호</span></th>
						<td style="border-top : 2px solid black;border-right : 2px solid black"><input type="password" id="Pw" name="Pw" class="w215"></td>
					</tr>
					<tr>
						<th scope="row" style="border-left : 2px solid black"><span>새로운 비밀번호</span></th>
						<td style="border-right : 2px solid black"><input type="password" id="newPw" name="newPw" class="w215" /></td>
					</tr>
					<tr>
						<th scope="row" style="border-bottom : 2px solid black;border-left : 2px solid black"><span>새로운 비밀번호 <u>재입력</u></span></th>
						<td style="border-bottom : 2px solid black; border-right : 2px solid black"><input type="password" id="newPw2" name="nwePw2" class="w215" /></td>
					</tr>
							
								<tr>
									<th scope="row"><span>이메일</span></th>
									<td>
										<ul class="pta">
											<li><input type="text" id="emailId" class="w134" value="${member.email1 }" /></li>
											<li><span class="valign">&nbsp;@&nbsp;</span></li>
											<li class="r10"><input type="text" id="email" name="email" class="w134" value="${member.email2 }"  /></li>
											<li>
												<select id="emailList" onchange="hbCr()">
													<option value="#" selected="selected">직접입력</option>
													<option value="naver.com">naver.com</option>
													<option value="daum.net">daum.net</option>
													<option value="hanmail.net">hanmail.net</option>
													<option value="nate.com">nate.com</option>    
													<option value="yahoo.co.kr">yahoo.co.kr</option>    
													<option value="paran.com">paran.com</option>    
													<option value="hotmail.com">hotmail.com</option>    
													<option value="korea.com">korea.com</option>    
													<option value="dreamwiz.com">dreamwiz.com</option>      
													<option value="gmail.com">gmail.com</option>    
												</select>&nbsp;&nbsp;&nbsp;
											</li>
										</ul>
									</td>
								</tr>
							
								<tr>
									<th scope="row"><span>마케팅정보수신동의여부 *</span></th>
									<td>
										<p> 마케팅 정보에 대한 수신을 동의 하시겠습까?</p>
										<ul class="question">
												<c:if test="${member.mkt_agree == 'Y' }">
											<li>
												<input type="radio" name="receive1" id="receive_yes" class="radio_t" value="y" checked /><label for="receive_yes">예</label>
											</li>
											<li> 
												<input type="radio" name="receive1" id="receive_no" class="radio_t" value="n"/><label for="receive_no">아니오</label>
											</li>
												</c:if>
												<c:if test="${member.mkt_agree == 'N' || member.mkt_agree == null}">
											<li>
												<input type="radio" name="receive1" id="receive_yes" class="radio_t" value="y" /><label for="receive_yes">예</label>
											</li>
											<li>
												<input type="radio" name="receive1" id="receive_no" class="radio_t" checked="checked" value="n" /><label for="receive_no">아니오</label>
											</li>
											</c:if>
										</ul>
										<p class="gray">* 거래관련 정보는 고객님의 거래안전을 위하여  수신거부와 관계없이 발송됩니다.</p>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>주소 *</span></th>
									<td>
										<ul class="pta">
											<li><a onclick="zipBtn()" class="addressBtn"><span>우편번호 찾기</span></a></li>
											<li class="pt5"><input type="text" class="w134" class="addressType" id="zip" value="${member.user_zip}" /></li>
											<li>
												<input type="text" class="addressType" id="ziip" value="${member.user_addr}"/>&nbsp;
												<input type="hidden" name="x" id="x" value="">
												<input type="hidden" name="y" id="y" value="">
											</li>		
											<li>
											<c:if test=""></c:if>
											<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

var address='';
function zipBtn() {
    new daum.Postcode({
        oncomplete: function(data) {
        $("#zip").val(data.zonecode);
        $("#ziip").val(data.address);
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
												<span class="mvalign">※ 상품 배송 시 받으실 주소입니다. 주소를 정확히 적어 주세요.</span>
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>휴대전화 *</span></th>
									<td>
										<ul class="pta">
											<li>
												<select id="newph1">
												<c:if test="${member.phone1 != null }">
													<option value="${member.phone1 }" selected="selected">${member.phone1}</option>
													<option value="011">011</option>
													<option value="016">016</option>
													</c:if>
												
												<c:if test="${member.phone1 == null }">	
													<option value="010" selected="selected">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													</c:if>
												</select>
						
											</li>
											<li>&nbsp;<span class="valign">-</span>&nbsp;</li>
											<li><input type="text" class="w74" id="newph2" maxlength="4" value="${member.phone2}"  /> <span class="valign">-</span>&nbsp;</li>

											<li class="r10"><input type="text"  id="newph3" class="w74" maxlength="4" value="${member.phone3}" /></li>	
										
										</ul>
									</td>
								</tr>
								
								<tr>
									<th scope="row"><span>생년월일</span></th>
									<td>
										<ul class="pta">
											<li>
											<!-- 1. 생년월일 데이터가 있을때 -->
												<c:if test="${member.birth1 != null }">
												<select>
													<option value="${member.birth1 }" selected="selected">${member.birth1}</option>
												</select>
												</c:if>
												<!-- 2. 생년월일 데이터가 없을때 -->
													<c:if test="${member.birth1 == null }">
													<select>
												<option value='' selected="selected">선택하세요</option>
													<script type="text/javascript">
													//<![CDATA[
														for(var i=1950; i<=2020; i++){
															document.write("<option value=''>" + i + "년"+ "</option>");	
														};
													//]]>
													</script>
													</select>
														</c:if>
											</li>
											<li>&nbsp;<span class="valign">년</span>&nbsp;&nbsp;&nbsp;</li>
											<li>
											   <!-- 1. 생년월일 데이터가 있을때 -->
												<c:if test="${member.birth2 != null }">
												<select>
													<option value="${member.birth2 }"selected="selected">${member.birth2}</option>
												</select>
												</c:if>
												<!-- 2. 생년월일 데이터가 없을때 -->
												<c:if test="${member.birth2 == null }">
												<select>
													<option value='' selected="selected">선택하세요</option>
													<script type="text/javascript">
													//<![CDATA[
														for(var i=1; i<=12; i++){
															if(i<10){
																document.write("<option value=''>0" + i + "월"+"</option>");
															}else{
																document.write("<option value=''>" + i + "월"+ "</option>");
															};
														};
													//]]>
													</script>
													</select>
													</c:if>
											</li>
											<li>&nbsp;<span class="valign">월</span>&nbsp;&nbsp;&nbsp;</li>
											<li>
											<!-- 1. 생년월일 데이터가 있을때 -->
												<c:if test="${member.birth3 != null }">
												<select>
													<option value="${member.birth3 }" selected="selected">${member.birth3 }</option>
												</select>
												</c:if>
											<!-- 2. 생년월일 데이터가 없을때 -->		
												<c:if test="${member.birth3 == null }">
												<select>
													<option value='' selected="selected">선택하세요</option>
													<script type="text/javascript">
													//<![CDATA[
														for(var i=1; i<=31; i++){
															if(i<10){
																document.write("<option value=''>0" + i + "일"+"</option>");
															}else{
																document.write("<option value=''>" + i + "일"+ "</option>");
															};
														};
													//]]>
													</script>
												</select>
													</c:if>
											</li>
											<li class="r20">&nbsp;<span class="valign">일</span></li>
											<li class="pt5">
												<ul class="baseQues">
												</ul>
											</li>
										</ul>
									</td>
								</tr>
							</tbody>
							</table>
						</div>	

					</div>

					
					<!-- Btn Area -->
					<div class="btnArea">
						<div class="bCenter">
							<ul>
								<li><a href="" class="nbtnbig">취소하기</a></li>
								<li><a onclick="modiFrm()" class="sbtnMini" style="cursor:pointer;">수정하기</a></li>
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->


<script type="text/javascript" src="../js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox-1.3.4.css" />
<script type="text/javascript">
$(function(){
	
	var winWidth = $(window).width();
	if(winWidth > 767){
		var layerCheck = 540;
	}else{
		var layerCheck = 320;
	}

	$(".addressBtn, .nbtnMini").fancybox({
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