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
					
					<div class="myInfo">
						<ul>
							<li class="info"><strong>${sessionName}</strong> 님의 정보를 한눈에 확인하세요.</li>
							<li class="last">총  문의 <br/><span class="num">${allcount}</span> <span class="unit">건</span></li>
						</ul>
					</div>


					<div class="orderDivNm">
						<table summary="NO, 종류, 적립포인트, 적립날짜, 상태 순으로 현재 적립된 포인트를 조회 하실수 있습니다." class="orderTable2" border="1" cellspacing="0">
							<caption>적립내역 보기</caption>
							<colgroup>
							<col width="9%" class="tnone" />
							<col width="14%" class="tw20" />
							<col width="*" />
							<col width="15%" class="tnone" />
							<col width="15%" class="tw30" />
							</colgroup>
							
							<thead>
								<th scope="col" class="tnone">NO.</th>
								<th scope="col">분류</th>
								<th scope="col">제목</th>
								<th scope="col" class="tnone">등록일</th>
								<th scope="col">처리상태</th>
							</thead>

							<tbody>
							<c:forEach var="inquiry" items="${list}">
								<tr>
									<td class="tnone">${inquiry.inquiry_no}</td>
									<td>${inquiry.inquiry_category}</td>
									<td class="left"><a href="/mypage/inquiry_view?inquiry_no=${inquiry.inquiry_no }"> ${inquiry.inquiry_title}</a></td>
									<td class="tnone">${inquiry.inquiry_date }</td>
									<td>
									<!-- 관리자 답변이 없을때 -->
										<c:if test="${inquiry.answer_content == null}">
										<ul class="state">
											<li><div class="nbtnMini iw83">답변대기</div></li>
										</ul>
										</c:if>
										
									<!-- 관리자 답변이 있을때 -->
										<c:if test="${inquiry.answer_content != null}">
										<ul class="state">
											<li><div class="obtnMini iw83"> 답변완료</div></li>
										</ul>
										</c:if>
									</td>
								</tr>
							</c:forEach>

							</tbody>
						</table>
					<br><br>
					</div>


					<div class="btnAreaList">
						
						<div class="bwright">
							<ul>
								<li><a href="/mypage/inquiry_write" class="writeBtn">글쓰기</a></li>
							</ul>
						</div>

						<!-- 페이징이동1 -->
						<div class="allPageMoving1">

						<a href="#" class="n"><img src="../images/btn/btn_pre2.gif" alt="처음으로"/></a><a href="#" class="pre"><img src="../images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
							<c:forEach var="num" begin="${pageDto.startPage }" 
											end="${pageDto.maxPage }" step="1">
						<c:if test="${num != pageDto.page }">
							<a href="/mypage/inquiry?page=${num }">${num }</a>
						</c:if>
						<c:if test="${num == pageDto.page }">
							<strong>${num }</strong>
						</c:if>
					</c:forEach>
						<a href="#" class="next"><img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/></a><a href="#" class="n"><img src="../images/btn/btn_next2.gif" alt="마지막페이지로"/></a>

						</div>
						<!-- //페이징이동1 -->
					</div>
					
					<br><br>

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