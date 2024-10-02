<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp" %>

<link rel="stylesheet" type="text/css" href="../css/login.css?v=Y" />
<script type="text/javascript" src="../js/left_navi.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

	<!-- container -->
	<div id="container">
		<div id="location">
			<ol>
				<li><a href="/index">HOME</a></li>
				<li><a href="#">MEMBER</a></li>
				<li class="last">로그인</li>
			</ol>
		</div>
			
			<div id="outbox">        
        <div class="box" id="left">
            <div id="title2">MEMBER<span>회원</span></div>
            <ul>    
                <li><a href="/member/login" id="leftNavi1">로그인</a></li>
                <li><a href="/member/join" id="leftNavi2">회원가입</a></li>
                <li><a href="/member/idsearch" id="leftNavi3">아이디/<span>비밀번호 찾기</span></a></li>
            </ul>            
        </div>
        <script type="text/javascript">initSubmenu(1,0);</script>

<script>
var result = "${result}";
if(result == 2){
	alert("아이디 또는 비밀번호 틀림\n다시 로그인해주세요");
	result = 1;
}
if(result == 3){
	alert("아직 가입 승인이 나지 않았습니다. \n 최대한 빠르게 확인 후 이메일로 발송해드리겠습니다.");
	result = 1;
}
if(result == 4){
	alert("처방전 리스트는 로그인 후 이용 가능합니다.");
	result = 1;
}
function lBtn(){
	if($("#user_pw").val() == ''){
		alert("비밀번호를 입력해주세요");
	}
	if($("#user_id").val() == ''){
		alert("아이디를 입력해주세요");
	}
	lFrm.submit();
	
	
} // lBtn
</script>

			<!-- contents -->
			<div id="contents">
				<div id="member">
					<h2><strong>로그인</strong><span>로그인 후 주문하시면 다양한 혜택을 받으실 수 있습니다.</span></h2>
					<h3>회원 로그인</h3>
					<form action="/member/login" method="post" name="lFrm">
					<div class="informbox">
						<div class="inform">
							<ul>
								<li><input type="text" class="loginType" id="user_id" name="user_id" onfocus="this.className='idfocus'" onblur="if (this.value.length==0) {this.className='loginType'}else {this.className='idfocusnot'}" style="ime-mode:inactive;" /></li>
								<li><input type="password" class="passType" id="user_pw" name="user_pw" onfocus="this.className='pwfocus'" onblur="if (this.value.length==0) {this.className='passType'}else {this.className='pwfocusnot'}" style="ime-mode:inactive;" /></li>
							</ul>

							<div class="btn"><a onclick="lBtn()" class="sbtnMini">로그인</a></div>

							<div class="point">
								<p>아이디 혹은 비밀번호를 잊으셨나요?</p>
								<a href="/member/idsearch" class="nbtn">아이디/비밀번호 찾기</a>
							</div>
						</div>
					</div>
					</form>
				</div>
			</div>
			<!-- //contents -->
		</div>
	</div>
	<!-- //container -->
<%@ include file="../footer/footer.jsp" %>