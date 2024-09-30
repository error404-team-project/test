<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>   

<%@ include file="../header/header.jsp" %>

<link rel="stylesheet" type="text/css" href="../css/content.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/inquiry.css?v=Y" />
<script type="text/javascript" src="../js/left_navi.js"></script>

	<!-- container -->
	<div id="container">

		<div id="location">
		<ol>
			<li><a href="#">HOME</a></li>
			<li><a href="#">CUSTOMER</a></li>
			<li class="last">1:1문의</li>
		</ol>
	</div>
    
    <div id="outbox">        
        <div class="box" id="left">
            <div id="title2">CUSTOMER<span>고객센터</span></div>
            <ul>    
                <li><a href="/customer/notice_list" id="leftNavi1">공지사항</a></li>
                <li><a href="/customer/inquiry_list" id="leftNavi2">1:1문의</a></li>
                <li><a href="/customer/faq" id="leftNavi3">자주 묻는 질문</span></a></li>
                <li class="last"><a href="/customer/prescription_list?user_seq=${sessionSeq }" id="leftNavi4">처방전</a></li>
            </ul>            
        </div>
        <script type="text/javascript">initSubmenu(2,0);</script>
	
			<!-- contents -->
			<div id="contents">
				<div id="customer">
					<h2><strong>1:1 문의</strong><span>메디슨에 궁금하신 사항을 남겨주시면 답변해드립니다.</span></h2>
					<div class="wbtnArea">
                    <div class="wCenter">
                        <ul>                                                                
                            <li><a href="/mypage/inquiry_write" class="writebtn">글작성</a></li>
                        </ul>
                    </div>
                </div>
					
					<div class="orderDivMt">
						<table summary="NO, 제목, 등록일, 조회수 순으로 공지사항을 조회 하실수 있습니다." class="orderTable2" border="1" cellspacing="0">
							<caption>공지사항 보기</caption>
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
					</div>
						


					<div class="btnAreaList">
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

					<div class="searchWrap">
						<div class="search">
							<ul>
								<li class="web"><img src="../images/txt/txt_search.gif" alt="search" /></li>
								<li class="se">
									<select>
										<option value="" />제목</option>
									</select>
								</li>
								<li><input type="text" class="searchInput" /></li>
								<li class="web"><a href="#"><img src="../images/btn/btn_search.gif" alt="검색" /></a></li>
								<li class="mobile"><a href="#"><img src="../images/btn/btn_search_m.gif" alt="검색" /></a></li>
							</ul>
						</div>
					</div>
					<!-- //포토 구매후기 -->


				</div>
			</div>
			<!-- //contents -->

		</div>
	</div>
	<!-- //container -->


<%@ include file="../footer/footer.jsp" %>