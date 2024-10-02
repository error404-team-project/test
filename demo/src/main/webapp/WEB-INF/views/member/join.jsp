<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp" %>
<link rel="stylesheet" type="text/css" href="../css/join.css?v=Y" />
<script type="text/javascript" src="../js/left_navi.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
					<li><a href="/member/idsearch"id="leftNavi3">아이디/<span>비밀번호 찾기</span></a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(2,0);</script>


			<!-- contents -->
			<form action="/member/join01" method="post" name="jFrm">
			<div id="contents" style="margin:0 0 0 80px;">
			<h2><strong>회원가입</strong><span>가입유형을 선택해주세요.</span></h2>
			</div>
			
<script>
function uBtn(){
	$("#auth_id").val("user");
	location.href="/member/ujoin01?auth_id=user";
}

function sBtn(){
	$("#auth_id").val("store");
	location.href="/member/sjoin01?auth_id=store";
}
</script>


					<!-- Btn Area -->
					<div class="btnArea">
						<div class="bCenter">
							<ul>
								<li><a onclick="uBtn()" class="nbtnbig" >일반이용자</a></li>
								<li><a onclick="sBtn()" class="sbtnMini" >약국</a></li>
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->
				</form>


				</div>
			</div>
			<!-- //contents -->


		</div>
	</div>
	<!-- //container -->




	<%@ include file="../footer/footer.jsp" %>