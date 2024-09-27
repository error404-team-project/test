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
    
<script>

function leavebtn () {

// 첫번째로 현재 비밀번호가 session 비밀번호랑 일치해야겠지?
	if($("#pw").val() != "${chpw}" || $("#pw").val() == null) {
	alert("현재 비밀번호가 일치하지 않습니다.\n다시입력해주세요");
	$("#pw").val("");
	$("#pw").focus();
	return false;
}; 
	
	let id = $("#id").val();	
	
	$.ajax({
		url:"/mypage/leave",
		method:"post",
		data:{"user_id":id},
		success: function(data){
		 		alert("아이디와 비밀번호가 일치합니다.");
				
				alert("정말 탈퇴하시겠습니까? \n탈퇴후 복구 불가능 합니다.");
				$.ajax({
					url:"/mypage/doleave",
					method:"post",
					data:{"user_id":id},
					success: function(data){
					alert(data);	
					location.href="/main";
					},
					error:function(){
						alert("실패");
					}
					});  //ajax doleave
         	},	// success
		error:function(){
			alert("실패");
		}
		});  //ajax
}


</script>


	<!-- container -->
	<div id="container">

	<%@ include file="../mypageline.jsp" %>
	<script type="text/javascript">initSubmenu(9,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>회원 탈퇴</strong><span>회원 탈퇴 전 다음의 안내 사항을 꼭 숙지하시기 바랍니다.</span></h2>
					
					<%-- <%@ include file="../myinfo.jsp" %> --%>
					

					<div class="alertBox">
						<p class="chk">탈퇴 전 숙지사항</p>
						<ul>
						<li><h3>그동안 (주)medison 을 이용해 주신 고객님께 진심으로 감사드립니다.</h3></li>
							<li><h3>회원 탈퇴 시 회원 정보가 즉시 삭제 처리되어 모든 상황에서 환급되지 않으며, 재가입 하셔도 복구되지 않습니다.</h3></li>
							<li><h3>진행중인 거래(판매 또는 구매)내역이 존재하는 경우 회원 탈퇴가 불가능하며, 거래 종료 후 회원탈퇴 하실 수 있습니다.</li>
						</ul>
					</div>


					<h3 class="dep">회원정보 입력</h3>
					<div class="checkDiv">
						<table summary="반품/교환 분류선택, 기간별, 단어검색별로 주문/배송 조회를 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>주문/배송 조회</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>아이디</span></th>
									<td>${sessionId }<input type="hidden" id="id" name="id" value="${sessionId }" /></td>
								</tr>
								<tr>
									<th scope="row"><span>비밀번호</span></th>
									<td><input type="password" id="pw" name="pw" class="w186" /></td>
								</tr>
								<tr>
									<th scope="row"><span>탈퇴사유</span></th>
									<td>
										<select>
											<option value="">선택해주세요.</option>
											<option value="더이상 사이트를 이용하지 않음">더이상 사이트를 이용하지 않음</option>
											<option value="이 회원 계정을 더이상 사용하지 않음 ">이 회원 계정을 더이상 사용하지 않음</option>
											<option value="별 다른 이유 없음">별 다른 이유 없음</option>
										</select>
									</td>
											<td>
										<ul class="state">	
													<li><a onclick="leavebtn()" class="nbtnMini iw70" style="cursor:pointer;">탈퇴하기</a></li>
										
										<li id="test"> </li>
										</ul>										
									</td>
								</tr>
							</tbody>
						</table>
					</div>


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