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
	<!-- container -->
	<div id="container">
	
		<%@ include file="../mypageline.jsp" %>

		<script type="text/javascript">initSubmenu(7,0);</script>

			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>1:1문의</strong><span>쟈뎅에 궁금하신 사항을 남겨주시면 답변해드립니다.</span></h2>
					

					<div class="viewDiv">
						<div class="viewHead">
							<div class="subject">
								<ul>
									<li class="cate">[${inquiry.inquiry_category}]</li>
									<li>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${inquiry.inquiry_title }</li>
								</ul>
							</div>
							<div class="day">
								<p class="txt">등록일<span>${inquiry.inquiry_date}</span></p>
								
										<c:if test="${inquiry.answer_content == null}">
									<p class="btn"><span class="nbtnMini">답변대기</span></p>	
										</c:if>
								
										<c:if test="${inquiry.answer_content != null}">
											<p class="btn"><span class="obtnMini">답변완료</span></p>	
										</c:if>
															
							</div>
						</div>

						<div class="viewContents">
							${inquiry.inquiry_content}
						</div>
						
						<div class="inquiry_image" style="text-align: center;">
							<img src = "/image/${inquiry.inquiry_image}" alt="" style="width:450px; height:350px; margin:0 auto; "/>
							
						</div>
					</div>
						
						<br><br><br><br>
						
					
					<!-- 답변 -->
					<div class="answer" style="border-top : 2px solid black;">
						<div class="inbox">
							<div class="aname">
								<p>담당자 <span>${inquiry.inquiry_date}</span></p>
							</div>

							<div class="atxt">
							${inquiry.answer_content}
							</div>
								
						</div>
					</div><br><br>
					<!-- //답변 -->
					

<!-- 					<script type="text/javascript">
	function commentBtn(){
		let ccontent = $(".replyType").val();
		let cpw = $(".replynum").val();
		let id = "${sessionId}";
		let bno = "${board.bno}";
		// 로그인 하지 않으면 글을 쓸수 없게 막아놓음 
		if(id==""){
			alert("로그인하셔야 댓글을 다실 수 있습니다");
			location.href="/member/login";
		}
		$.ajax({
			url : "/board/commentInsert",
			method: "post",
			data : {"id":id, "cpw":cpw, "ccontent":ccontent, "bno":bno},
			success: function(data){
				let str='';
				str += '<ul id='+data.cno+'>';
				str += '<li class="name">'+data.id+'<span>['+data.cdate+']</span></li>';
				str += '<li class="txt">'+data.ccontent+'</li>';
				str += '<li class="btn">';
				str+= '<a onclick="updateBtn('+data.cno+',\''+ data.id +'\',\''+ data.cdate +'\',\''+ data.ccontent + '\')" class="rebtn">수정</a>';
				str+= '&nbsp;<a onclick="deleteBtn('+data.cno+')" class="rebtn">삭제</a>';
				str += '</li>';
				str += '</ul>';
				$(".replyBox").prepend(str);
				
				var n = $("#comNum").text();
				console.log(n);  // 기존의 댓글의 수 
				console.log(typeof(n)); // 문자열이다. 		
				//javascript에서 문자를 숫자 Number()
				var commentNum = Number(n)+1;
				$("#comNum").text(commentNum);
				$(".replyType").val("");
				$(".replynum").val("");
				
				
				
			},
			error : function(){
				alert("실패");
			}
		});// ajax
	}
//---- 댓글삭제 --------------------------
function deleteBtn(cno){
	if(confirm("댓글을 삭제하시겠습니까? ")){
		//alert("삭제 : " + cno);
		$.ajax({
			url:"/board/commentDelete",
			method:"post",
			data:{"cno":cno},
			success: function(data){
				alert(data);
				// html에서 제거하기
				$("#"+cno).remove();
				// 총 댓글 수 수정 
				var commentNum = Number($("#comNum").text())-1;
				$("#comNum").text(commentNum);
			},
			error:function(){
				alert("실패");
			}
		});//ajax
	}// if-confirm
} // delbtn
//----------- 댓글 수정하기----------------------------------------------------
function updateBtn(cno, id, cdate, ccontent){
	if(confirm("댓글을 수정하시겠습니까? ")){
		//alert(cno);	alert(id);alert(cdate);	alert(ccontent);	
		let str='';
		str += '<li class="name">'+id+'<span>[ '+ cdate +' ]</span>';
		str += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호&nbsp;&nbsp;';
		str += '<input type="password" class="replynum" id="updatePw" />';
		str += '</li>';
		str += '<li class="txt"><textarea id="updateContent" class="replyType">'+ccontent+'</textarea></li>';
		str += '<li class="btn">';
		str += '<a onclick="updateSave('+cno+')" class="rebtn">저장</a>&nbsp;&nbsp;&nbsp;';
		str += '<a onclick="cancelBtn('+cno+',\''+ id +'\',\''+ cdate +'\',\''+ ccontent + '\')" class="rebtn">취소</a>';
		str += '</li>';
		$("#"+cno).html(str);
	}
}
// 원래대로 되돌리기 
function cancelBtn(cno, id, cdate, ccontent){
	alert('취소버튼');
	console.log(cno);	console.log(id);
	console.log(cdate);	console.log(ccontent);
	var str = '';
	str+= '<li class="name"> '+id+' <span> '+cdate+' </span></li>';
	str+= '<li class="txt"> '+ccontent+' </li>';
	str+= '<li class="btn">';
	str+= '<a onclick="updateBtn('+cno+',\''+ id +'\',\''+ cdate +'\',\''+ ccontent + '\')" class="rebtn">수정</a>';
	str+= '&nbsp;<a onclick="deleteBtn('+cno+')" class="rebtn">삭제</a>';
	str+= '</li>';
	$("#"+cno).html(str);
}
// --- 수정된 값 저장하기 
function updateSave(cno){
	if(confirm("저장하시겠습니까?")){
		$.ajax({
			url : "/board/commentUpdate",
			method: "post",
			data: {"cno": cno, "cpw":$("#updatePw").val(), 
				"ccontent":$("#updateContent").val() },
			success: function(data){
				alert("댓글 수정 성공");
				console.log(data);
				var str = '';
				str+= '<li class="name"> '+data.id+' <span> '+data.cdate+' </span></li>';
				str+= '<li class="txt"> '+data.ccontent+' </li>';
				str+= '<li class="btn">';
				str+= '<a onclick="updateBtn('+data.cno+',\''+ data.id +'\',\''+ data.cdate +'\',\''+ data.ccontent + '\')" class="rebtn">수정</a>';
				str+= '&nbsp;<a onclick="deleteBtn('+data.cno+')" class="rebtn">삭제</a>';
				str+= '</li>';
				$("#"+cno).html(str);
				
				
				
			},
			error:function(){
				alert("실패");
			}
		}) ; //ajax
	} // if-confirm
}//updateSave
</script>

 -->

					<!-- 댓글-->
					<div class="replyWrite" style="border-top : 2px solid black;">
						<ul>
							<li class="in">
								<p class="txt">총 <span class="orange" id="comNum" >${comList.size() }</span> 개의 댓글이 달려있습니다.</p>
								<p class="password">비밀번호&nbsp;&nbsp;
								<input type="password" class="replynum" /></p>
								<textarea class="replyType"></textarea>
							</li>
							<li class="btn"><a onclick="commentBtn()" class="replyBtn">등록</a></li>
						</ul>
						<p class="ntic">※ 비밀번호를 입력하시면 댓글이 비밀글로 등록 됩니다.</p>
					</div>

					<div class="replyBox">
						
						<%-- <c:forEach var="cdto" items="${comList }">
							<ul id="${cdto.cno }">
								<li class="name">${cdto.id } <span>${cdto.cdate }</span></li>
								
								<!-- 비밀글일때 아이디와 세션아이디가 같을때만 보여야함. 비밀번호가 있을때만 비밀글-->
								<c:if test="${ sessionId != cdto.id && cdto.cpw !=null }">
								    <li class="txt"><span class="orange">※ 비밀글입니다.</span></li>
								</c:if>
								<!-- 비밀글이 아닐때  -->
								<c:if test="${ !(sessionId != cdto.id && cdto.cpw !=null) }">
									<li class="txt">${cdto.ccontent }</li>
								</c:if>
								<!-- 댓글쓴 아이디와 로그인한 아이디(세션아이디)가 같을경우만 버튼을 노출함  -->
								<c:if test="${sessionId == cdto.id}">
									<li class="btn">
										<a onclick="updateBtn(${cdto.cno }, '${cdto.id }', '${cdto.cdate }', '${cdto.ccontent }')" class="rebtn">수정</a>
										<a onclick="deleteBtn(${cdto.cno })" class="rebtn">삭제</a>
									</li>
								</c:if>
							</ul>
						</c:forEach> --%>

						 <ul>
							<li class="name">jjabcde <span>[2014-03-04&nbsp;&nbsp;15:01:59]</span></li>
							<li class="txt">대박!!! 이거 저한테 완전 필요한 이벤트였어요!!</li>
							<li class="btn">
								<a href="#" class="rebtn">수정</a>
								<a href="#" class="rebtn">삭제</a>
							</li>
						</ul>

					</div> <br><br>
					<!-- //댓글 -->


					<!-- 이전다음글 -->
					<div class="pnDiv web">
						<table summary="이전다음글을 선택하여 보실 수 있습니다." class="preNext" border="1" cellspacing="0">
							<caption>이전다음글</caption>
							<colgroup>
							<col width="100px" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th class="pre">PREV</th>
								<c:if test="${prev.inquiry_no != null }">
									<td><a href="/mypage/inquiry_view?inquiry_no=${prev.inquiry_no}">${prev.inquiry_title }</a></td>
								</c:if>	
								<c:if test="${prev.inquiry_no == null }">
									<td>이전 글이 없습니다.</td>
								</c:if>
								</tr>

								<tr>
									<th class="next">NEXT</th>
								<c:if test="${next.inquiry_no != null }">
									<td><a href="/mypage/inquiry_view?inquiry_no=${next.inquiry_no}">${next.inquiry_title }</a></td>
								</c:if>	
								<c:if test="${next.inquiry_no == null }">
									<td>다음 글이 없습니다.</td>
								</c:if>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //이전다음글 -->
					
					

<script type="text/javascript">
function delFrm() {
	
	alert("정말 삭제 하시겠습까?");
	
	$.ajax({
		url:"/mypage/Inqury_delete",
		method:"post",
		data:{ "inquiry_no":"${inquiry.inquiry_no}"},
		success: function(data){
			location.href="/mypage/inquiry";
			alert("1:1 문의 글 삭제 완료 .");
		},
		error:function(){
			alert("실패");
		}
		});  //ajax


	
}
</script>

					<!-- Btn Area -->
					<div class="btnArea">
						<div class="bRight">
							<ul>
								<li><a href ="/mypage/inquiry_modi?inquiry_no=${inquiry.inquiry_no}" class="nbtnbig mw">수정</a></li>
								<li><a onclick="delFrm()" class="nbtnbig mw">삭제</a></li>
								<li><a href="/mypage/inquiry" class="sbtnMini mw">목록</a></li>
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->
					
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