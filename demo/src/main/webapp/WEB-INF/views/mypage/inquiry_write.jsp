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
<script type="text/javascript">
function writeBtn() {
	
	wFrm.submit();
	
	/* var category= $("#category").val();
	var title= $("#Ititle").val();
	var image= $("#image").val();
	var content= $("#content").val();
	var user_seq = $("#user_seq").val();
	
	$.ajax({
		url:"/mypage/Inqury_dowrite",
		method:"post",
		data:{	"inquiry_category":category,
				"inquiry_title":title,
				"inquiry_image":image,
				"inquiry_content":content,
				"user_seq":user_seq},
		success: function(data){
			location.href="/mypage/inquiry";
			alert("1:1 문의 글 작성 완료 .");
		},
		error:function(){
			alert("실패");
		}
		});  //ajax */
}

</script>

	

	<!-- container -->
	<div id="container">

		<%@ include file="../mypageline.jsp" %>
				
			<script type="text/javascript">initSubmenu(7,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="mypage" >
					<h2><strong>1:1문의 글 작성</strong><span>쟈뎅에 궁금하신 사항을 남겨주시면 답변해드립니다.</span></h2>
					
			
					<form action="/mypage/Inqury_dowrite" method="post" name="wFrm" enctype="multipart/form-data">
					<div class="checkDiv">
						<table summary="분류, 제목, 상세내용, 첨부파일 순으로 궁금하신 점을 문의 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>1:1문의</caption>
							<colgroup>
							<col width="19%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
							<tr>
									<th scope="row"><span>분류</span></th>
									<td>
										<select id="category" name="inquiry_category">
											<option value="일반 문의">일반 문의</option>
											<option value="기술 오류 문의">기술 오류 문의</option>
											<option value="주문 관련 문의">주문 관련 문의</option>
											<option value="환불 요청 문의">환불 요청 문의</option>
											<option value="회원 관련 문의">회원 관련 문의</option>
											<option value="배송 관련 문의">배송 관련 문의</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>제목</span></th>
									<td>
										<input type="hidden" name="user_seq" id="user_seq" value="${sessionSeq}">
										<input type="text" class="wlong"  id="Ititle" name="inquiry_title"/>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>상세 내용</span></th>
									<td>
										<textarea class="tta" id="content" name="inquiry_content"></textarea>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>첨부파일</span></th>
									<td>
										<input type="file" id="image" name="file"class="fileType" />
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					
					<!-- Btn Area -->
					<div class="btnArea">
						<div class="bCenter">
							<ul>																
								<li><a href="#" class="nbtnbig">취소</a></li>
								<li><a onclick="writeBtn()" class="sbtnMini" style="cursor:pointer;">확인</a></li>
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

</div>
</div>
</body>
</html>