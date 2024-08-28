<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp" %>

<link rel="stylesheet" type="text/css" href="../css/login.css?v=Y" />
<script type="text/javascript" src="../js/left_navi.js"></script>


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
                <li><a href="/member/join01" id="leftNavi2">회원가입</a></li>
                <li><a href="/member/idsearch" id="leftNavi3">아이디/<span>비밀번호 찾기</span></a></li>
                <li><a href="#" id="leftNavi4">회원약관</a></li>
				<li><a href="#" id="leftNavi5">개인정보<span>취급방침</span></a></li>
				<li class="last"><a href="#" id="leftNavi6">이메일무단<span>수집거부</span></a></li>
            </ul>            
        </div>
        <script type="text/javascript">initSubmenu(1,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="member">
					<h2><strong>로그인</strong><span>로그인 후 주문하시면 다양한 혜택을 받으실 수 있습니다.</span></h2>
					<h3>회원 로그인</h3>
					<div class="informbox">
						<div class="inform">
							<ul>
								<li><input type="text" class="loginType" onfocus="this.className='idfocus'" onblur="if (this.value.length==0) {this.className='loginType'}else {this.className='idfocusnot'}" style="ime-mode:inactive;" /></li>
								<li><input type="password" class="passType" onfocus="this.className='pwfocus'" onblur="if (this.value.length==0) {this.className='passType'}else {this.className='pwfocusnot'}" style="ime-mode:inactive;" /></li>
							</ul>

							<div class="btn"><a href="#" class="sbtnMini">로그인</a></div>

							<div class="point">
								<p>아이디 혹은 비밀번호를 잊으셨나요?</p>
								<a href="/member/idsearch" class="nbtn">아이디/비밀번호 찾기</a>
							</div>
						</div>
					</div>



					<h3>비회원 주문 조회</h3>
					<div class="informbox">
						<div class="inform">
							<ul>
								<li><input type="text" class="ordererType" onfocus="this.className='idfocus'" onblur="if (this.value.length==0) {this.className='ordererType'}else {this.className='idfocusnot'}" /></li>
								<li><input type="text" class="ordernumType" onfocus="this.className='pwfocus'" onblur="if (this.value.length==0) {this.className='ordernumType'}else {this.className='pwfocusnot'}" /></li>
							</ul>

							<div class="btn"><a href="#" class="nbtnbig">조회하기</a></div>
							<div class="point">
								<p>아직 Medison 회원이 아니신가요? <span>회원가입 후 다양한 상품을 배송받아보세요</span></p>
								<a href="#" class="nbtn">회원가입</a>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- //contents -->


		</div>
	</div>
	<!-- //container -->
<%@ include file="../footer/footer.jsp" %>