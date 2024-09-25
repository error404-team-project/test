<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp" %>
<link rel="stylesheet" type="text/css" href="../css/idsearch.css?v=Y" />
<script type="text/javascript" src="../js/left_navi.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li><a href="#">MEMBER</a></li>
				<li class="last">아이디/비밀번호 찾기</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title2">MEMBER<span>회원</span></div>
				<ul>	
					<li><a href="/member/login" id="leftNavi1">로그인</a></li>
					<li><a href="/member/join01" id="leftNavi2">회원가입</a></li>
					<li><a href="#" id="leftNavi3" class="hover">아이디/<span>비밀번호 찾기</span></a></li>
					<li><a href="#" id="leftNavi4">회원약관</a></li>
					<li><a href="#" id="leftNavi5">개인정보<span>취급방침</span></a></li>
					<li class="last"><a href="#" id="leftNavi6">이메일무단<span>수집거부</span></a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(3,0);</script>

<script>
function fIdBtn(){ // 아이디찾기 눌렀을때
	var name = $("#name").val();
	var email = $("#email").val();
	console.log("이름 : "+name);
	console.log("이메일 : "+email);
	 $.ajax({
		url : "/member/findId",
		method : "post",
		data : {"user_name" : name,
				"user_email" : email},
		success : function(data){
			if(data == '1'){
				alert("이름 혹은 이메일을 잘못 입력하셨습니다.");
			} else {
				alert(name+"님의 아이디는 "+data+" 입니다.");
			}
		},
		error : function(){
			alert("실패");
		}
	}); // ajax 
}

function fPwBtn(){
	var id = $("#id").val();
	var email = $("#email2").val();
	console.log("이름 : "+id);
	console.log("이메일 : "+email);
	 $.ajax({
			url : "/member/findPw",
			method : "post",
			data : {"user_id" : id,
					"user_email" : email},
			success : function(data){
				if(data == "1"){
					alert("아이디 혹은 이메일을 잘못 입력하셨습니다.");
				} else {
					alert(data);					
				}
			},
			error : function(){
				alert("아이디 혹은 이메일을 잘못 입력하셨습니다.");
			}
		}); // ajax 
}
</script>


			<!-- contents -->
			<div id="contents">
				<div id="member">
					<h2><strong>아이디/비밀번호 찾기</strong><span>회원님께서 가입하신 아이디와 비밀번호를 찾아드립니다.</span></h2>
					<h3>아이디 찾기</h3>
					<div class="informbox">
						<div class="inform">
							<ul>
								<li><input type="text" name="user_name" id="name" class="nameType" onfocus="this.className='idfocus'" onblur="if (this.value.length==0) {this.className='nameType'}else {this.className='idfocusnot'}" style="ime-mode:inactive;" /></li>
								<li><input type="text" name="user_email" id="email" class="emailType" onfocus="this.className='pwfocus'" onblur="if (this.value.length==0) {this.className='emailType'}else {this.className='pwfocusnot'}" style="ime-mode:inactive;" /></li>
							</ul>

							<div class="btn"><a onclick="fIdBtn()" class="nbtnbig">아이디 찾기</a></div>
						</div>
					</div>

					<h3>비밀번호 찾기</h3>
					<div class="informbox">
						<div class="inform">
							<ul>
								<li><input type="text" id="id" name="user_id" class="loginType" onfocus="this.className='idfocus'" onblur="if (this.value.length==0) {this.className='loginType'}else {this.className='idfocusnot'}" /></li>
								<li><input type="text" id="email2" class="emailType" onfocus="this.className='pwfocus'" onblur="if (this.value.length==0) {this.className='emailType'}else {this.className='pwfocusnot'}" /></li>
							</ul>

							<div class="btn"><a onclick="fPwBtn()" class="nbtnbig">비밀번호 찾기</a></div>
						</div>
					</div>


					<p class="alert">Medison. 에서는 2012년 8월 18일로 시행되는 정보통신망 이용 촉진 및 정보 보호 등에 관한 법률 “주민등록번호의 <span>사용 제한”과 관련하여 주민등록번호를 수집하지 않습니다.</span></p>

				</div>
			</div>
			<!-- //contents -->


		</div>
	</div>
	<!-- //container -->
<%@ include file="../footer/footer.jsp" %>