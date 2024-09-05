<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp" %>
<link rel="stylesheet" type="text/css" href="../css/join.css?v=Y" />
<script type="text/javascript" src="../js/left_navi.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="/index">HOME</a></li>
				<li><a href="#">MEMBER</a></li>
				<li class="last">회원가입</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title2">MEMBER<span>회원</span></div>
				<ul>	
					<li><a href="/member/login" id="leftNavi1">로그인</a></li>
					<li><a href="#" id="leftNavi2" class="hover">회원가입</a></li>
					<li><a href="/member/idsearch" id="leftNavi3">아이디/<span>비밀번호 찾기</span></a></li>
					<li><a href="#" id="leftNavi4">회원약관</a></li>
					<li><a href="#" id="leftNavi5">개인정보<span>취급방침</span></a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(2,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="member">
					<h2><strong>회원가입</strong><span>회원으로 가입하시면 보다 더 다양한 혜택을 누리실 수 있습니다.</span></h2>
					
					<!-- STEP -->
					<div class="stepWrap">

						<div class="step">
							<p class="web">STEP 01</p>
							<p class="txt">약관 동의</p>
						</div>

						<div class="step stepon">
							<p class="web">STEP 02</p>
							<p class="txt"><span>회원정보</span> <span>입력</span></p>
							<p class="ck"><img src="../images/bg/bg_step.png" alt="현재위치"></p>
						</div>

						<div class="step">
							<p class="web">STEP 03</p>
							<p class="txt"><span>회원가입</span> <span>완료</span></p>
						</div>
					</div>
					<!-- //STEP -->
						

					<div class="attention">
						<ul>
							<li>* 표시된 항목은 필수 항목이므로 반드시 입력하셔야 회원가입이 진행됩니다.</li>
						</ul>
					</div>

<script>
var result;
function joinBtn(){
	// 이름은 한글만 입력가능
	let nameCheck = /^[가-힣]+$/;
	// 아이디는 첫글자는 영문. 영어, 숫자, _ 포함해서 4~16자리까지 만들 수 있음
	let idCheck = /^[a-zA-Z]{1}[a-zA-Z0-9_]{3,15}$/;
	// 비밀번호는 영어 대문자를 반드시 포함해야하며 첫글자 영문. 영어, 숫자, 특수기호 아래와 같이 4~20자리까지 만들 수 있음
	let pwCheck = /^(?=.*[A-Z])[a-zA-z]{1}[a-zA-Z0-9!@#$%^&*-_]{3,19}$/;
	
/* 	if(!nameCheck.test($("#name").val()) ){
		alert("이름은 한글만 입력가능합니다.");
	}
	if(!idCheck.test($("#id").val()) ){
		alert("아이디가 조건에 부합하지 않음\n 다시 입력해주세요");
	}
	if(!idCheck.test($("#pw").val()) ){
		alert("비밀번호가 조건에 부합하지 않음\n 다시 입력해주세요");
	}
	
	if($("#year").val() == "#" || $("#month").val() == "#" || $("#day").val() == "#"){
		alert("생년월일을 선택해주세요");
	}
	
	
	if(result != 1){
		alert("아이디 중복확인을 하셔야 합니다.");
	} else {
	} */
		jFrm.submit();
} // joinBtn()

function pwCk(){
	var pw = $("#pw").val();
	var pw2 = $("#pw2").val();
	
	if(pw == pw2){
		$("#pwCk").html('<span class="mvalign skyblue">* 비밀번호가 일치합니다.</span>')
	} else {
		$("#pwCk").html('<span class="mvalign red">* 비밀번호가 일치하지 않습니다.</span>')
	}
} // pwCk

function mailTval(){
	if($("#emailList").val()=="#"){
		$("#mailT").val("");
	} else {
		// 이메일 선택 시 입력, 수정 불가능하게
		$("#mailT").val($("#emailList").val());
	}
} // mailTval

function zipBtn(){
	new daum.Postcode({
        oncomplete: function(data) {
          $("#zip").val(data.zonecode);
          $("#addr1").val(data.address);
        }
    }).open();
} // zipBtn

function idChk(){
	$.ajax({
		url : "/member/idcheck",
		method :"post",
		data : {"id" : $("#id").val()},
		success : function(data){
			if(data == 1){
				result = data;
				alert("사용 가능한 아이디");
			} else {
				result = data;
				alert("이미 사용중인 아이디");
			}
		},
		error : function(){
			alert("실패");
		}
	}) // ajax
} // idChk
</script>

					<form action="/member/join03" method="post" name="jFrm">
						<input type="hidden" name="ps_agree" id="ps_agree" value="${ps_agree}">
						<input type="hidden" name="svc_agree" id="svc_agree" value="${svc_agree}">
					<div class="memberbd">
						<table summary="이름, 아이디, 비밀번호, 비밀번호 확인, 이메일, 이메일수신여부, 주소, 휴대폰, 생년월일 순으로 회원가입 정보를 등록할수 있습니다." class="memberWrite" border="1" cellspacing="0">
							<caption>회원가입 입력</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>이름 *</span></th>
									<td><input type="text" id="name" name="user_name">
										<ul class="pta">
											<li class="pt5"><span class="mvalign">이름은 한글만 입력 가능합니다.</span></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>아이디 *</span></th>
									<td>
										<ul class="pta">
											<li class="r10"><input type="text" name="user_id" id="id" class="w134" /></li>
											<li><a onclick="idChk()" class="nbtnMini">중복확인</a></li>
											<li class="pt5"><span class="mvalign">첫 글자는 영문으로 4~16자 까지 가능, 영문, 숫자와 특수기호 _ 만 사용 가능</span></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>비밀번호 *</span></th>
									<td>
										<ul class="pta">
											<li class="r10"><input type="password" name="user_pw" id="pw" class="w134" /></li>
											<li><span class="mvalign">※대문자 포함 영문 / 숫자 혼용으로 4~20자 까지 가능.</span></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>비밀번호 확인 *</span></th>
									<td>
										<ul class="pta">
											<li class="r10"><input type="password" id="pw2" class="w134" onkeyup="pwCk()" /></li>
											<li id="pwCk">
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>이메일 *</span></th>
									<td>
										<ul class="pta">
											<li><input type="text" name="mailH" id="mailH" class="w134" /></li>
											<li><span class="valign">&nbsp;@&nbsp;</span></li>
											<li class="r10"><input type="text" name="mailT" id="mailT" class="w134" /></li>
											<li>
												<select id="emailList" onchange="mailTval()">
													<option value="#" selected="selected">직접입력</option>
													<option value="naver.com">naver.com</option>
													<option value="daum.net">daum.net</option>
													<option value="hanmail.net">hanmail.net</option>
													<option value="nate.com">nate.com</option>    
													<option value="yahoo.co.kr">yahoo.co.kr</option>    
													<option value="paran.com">paran.com</option>    
													<option value="empal.com">empal.com</option>    
													<option value="hotmail.com">hotmail.com</option>    
													<option value="korea.com">korea.com</option>    
													<option value="lycos.co.kr">lycos.co.kr</option>    
													<option value="dreamwiz.com">dreamwiz.com</option>    
													<option value="hanafos.com">hanafos.com</option>    
													<option value="chol.com">chol.com</option>    
													<option value="gmail.com">gmail.com</option>    
													<option value="empas.com">empas.com</option>
												</select>&nbsp;&nbsp;&nbsp;
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>이메일 수신여부 *</span></th>
									<td>
										<p>메디슨에서 진행되는 이벤트와 쇼핑에 대한 정보를 이메일로 받아보시겠습니까?</p>
										<ul class="question">
											<li>
												<input type="radio" name="mkt_agree" id="mkt_yes" class="radio_t" checked="checked" value="Y"/><label for="receive_yes">예</label>
											</li>
											<li>
												<input type="radio" name="mkt_agree" id="mkt_no" class="radio_t"/ value="N"><label for="receive_no">아니오</label>
											</li>
										</ul>
										<p class="gray">* 거래관련 정보는 고객님의 거래안전을 위하여 이메일 수신거부와 관계없이 발송됩니다.</p>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>주소 *</span></th>
									<td>
										<ul class="pta">
											<li>
												<input type="text" id="zip" name="user_zip" class="w134" />&nbsp;
											</li>
											<li><a onclick="zipBtn()" class="addressBtn"><span>우편번호 찾기</span></a></li>
											<li class="pt5"><input type="text" id="addr1" name="addr1" class="addressType" /></li>
											<li class="pt5"><input type="text" id="addr2" name="addr2" class="addressType" /></li>
											
											<li class="cb">
												<span class="mvalign">※ 상품 배송 시 받으실 주소 중 하나입니다. 주소를 정확히 적어 주세요.</span>
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>휴대폰 *</span></th>
									<td>
										<ul class="pta">
											<li>
												<input type="text" name="phone1" id="phone1" class="w74" maxlength="4" required/>
											</li>
											<li>&nbsp;<span class="valign">-</span>&nbsp;</li>
											<li>
												<input type="text" name="phone2" id="phone2" class="w74" maxlength="4" required/>
												<span class="valign">-</span>&nbsp;
											</li>
											<li class="r10">
												<input type="text" name="phone3" id="phone3" class="w74" maxlength="4" required/>
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>성별 *</span></th>
									<td>
										<ul class="pta">
											<li>
												<input type="radio" name="user_gender" id="male" value="M" checked="checked"/>
												<label for="male">남성</label>
											</li>
											<li>
												<input type="radio" name="user_gender" id="female" value="F"/>
												<label for="female">여성</label>
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>생년월일 *</span></th>
									<td>
										<ul class="pta">
											<li>
												<select name="year">
													<option value='#' selected="selected">선택하세요</option>
													<script type="text/javascript">
													//<![CDATA[
														for(var i=1940; i<=2020; i++){
															document.write("<option value='"+i+"'>" + i + "년"+ "</option>");	
														};
													//]]>
													</script>
												</select>
											</li>
											<li>&nbsp;<span class="valign">년</span>&nbsp;&nbsp;&nbsp;</li>
											<li>
												<select name="month">
													<option value='#' selected="selected">선택하세요</option>
													<script type="text/javascript">
													//<![CDATA[
														for(var i=1; i<=12; i++){
															if(i<10){
																document.write("<option value='"+i+"'>0" + i + "월"+"</option>");
															}else{
																document.write("<option value='"+i+"'>" + i + "월"+ "</option>");
															};
														};
													//]]>
													</script>
												</select>
											</li>
											<li>&nbsp;<span class="valign">월</span>&nbsp;&nbsp;&nbsp;</li>
											<li>
												<select name="day">
													<option value='#' selected="selected">선택하세요</option>
													<script type="text/javascript">
													//<![CDATA[
														for(var i=1; i<=31; i++){
															if(i<10){
																document.write("<option value='"+i+"'>0" + i + "일"+"</option>");
															}else{
																document.write("<option value='"+i+"'>" + i + "일"+ "</option>");
															};
														};
													//]]>
													</script>
												</select>
											</li>
											<li class="r20">&nbsp;<span class="valign">일</span></li>
											<li class="pt5">
												<ul class="baseQues">
													<li>
														<input type="radio" name="birth" id="solar" class="radio_t" checked="checked"/><label for="solar">양력</label>
													</li>
													<li>
														<input type="radio" name="birth" id="lunar" class="radio_t"/><label for="lunar">음력</label>
													</li>
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
								<li><a href="#" class="nbtnbig">취소하기</a></li>
								<li><a onclick="joinBtn()" class="sbtnMini">가입하기</a></li>
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->
					</form>

<script type="text/javascript" src="../js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox-1.3.4.css" />
<script type="text/javascript">
$(function(){

	// business input
	var firstchk = $("input:radio[name=business]:checked").attr("id");
	$(".businessTy").css("display","none");
	$("#partner").click(function(){
		$(".businessTy").css("display","block");
	});
	$("#general").click(function(){
		$(".businessTy").css("display","none");
	});
	$("#"+firstchk).click();
	

	// popup
	var winWidth = $(window).width();
	if(winWidth > 767){
		var layerCheck = 540;
	}else{
		var layerCheck = 320;
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


});
</script>


				</div>
			</div>
			<!-- //contents -->


		</div>
	</div>
	<!-- //container -->




	<%@ include file="../footer/footer.jsp" %>