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
			<li class="last">처방전</li>
		</ol>
	</div>
<script>
if(${user_seq == 0}){
	alert("로그인 후 이용 가능합니다.");
	location.href="/member/login";
} //if

</script>  
    <div id="outbox">        
        <div class="box" id="left">
            <div id="title2">CUSTOMER<span>고객센터</span></div>
            <ul>    
                <li><a href="/customer/notice_list" id="leftNavi1">공지사항</a></li>
                <li><a href="/customer/inquiry_list" id="leftNavi2">1:1문의</a></li>
                <li><a href="/customer/faq" id="leftNavi3">자주 묻는 질문</span></a></li>
                <li class="last"><a href="#" id="leftNavi4">처방전</a></li>
            </ul>            
        </div>
        <script type="text/javascript">initSubmenu(4,0);</script>
	
			<!-- contents -->
			<div id="contents">
				<div id="customer">
					<h2><strong>처방전 등록</strong><span>본인이 올린 처방전만 열람 가능합니다</span></h2>
					<div class="wbtnArea">
                    <div class="wCenter">
                        <ul>                                                                
                            <li><a href="/customer/prescription_write?user_seq=${sessionSeq}" class="writebtn">글작성</a></li>
                        </ul>
                    </div>
                </div>
					
					<div class="orderDivMt">
						<table summary="NO, 제목, 등록일, 조회수 순으로 공지사항을 조회 하실수 있습니다." class="orderTable2" border="1" cellspacing="0">
							<caption>공지사항 보기</caption>
							<colgroup>
							<col width="10%" class="tnone" />
							<col width="*" />
							<col width="14%" class="tw25" />
							</colgroup>
							<thead>
								<th scope="col" class="tnone">NO.</th>
								<th scope="col">제목</th>
								<th scope="col">약국 확인유무</th>
							</thead>
							<tbody>
							<c:forEach var="p" items="${list}">
								<tr>
									<td class="tnone">${p.prescription_no}</td>
									<td class="left">
										<a href="/customer/prescription_view?prescription_no=${p.prescription_no}">${p.prescription_title}</a>
										<img src="../images/ico/ico_new.gif" alt="NEW" />
									</td>
									<td>${p.store_check }</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
						


					<div class="btnAreaList">
						<!-- 페이징이동1 -->
						<div class="allPageMoving1">
<!-- 처음페이지 -->
					<c:if test="${pageDto.page > 1 }">
						<a href="/customer/prescription_list?page=1&user_seq=${sessionSeq}" class="n">
							<img src="../images/btn/btn_pre2.gif" alt="처음으로"/>
						</a>
					</c:if>
					<c:if test="${pageDto.page == 1 }">
							<img src="../images/btn/btn_pre2.gif" alt="처음으로"/>
					</c:if>
					<!-- 처음페이지 -->
					
					<!-- 이전페이지 -->
					<c:if test="${pageDto.page>1}">
						<a href="/customer/prescription_list?page=${pageDto.page-1}&user_seq=${sessionSeq}" class="pre">
							<img src="../images/btn/btn_pre1.gif" alt="앞페이지로"/>
						</a>
					</c:if>
					<c:if test="${pageDto.page==1}">
							<img src="../images/btn/btn_pre1.gif" alt="앞페이지로"/>
					</c:if>
					<!-- 이전페이지 -->
					
					<!-- 페이지 넘버링 -->	
					<c:forEach var="pnum" begin="${pageDto.startPage}" end="${pageDto.endPage }" step="1">
						<c:if test="${pnum != pageDto.page }">
							<a href="/customer/prescription_list?page=${pnum}&user_seq=${sessionSeq}">${pnum}</a> 
						</c:if>
						<c:if test="${pnum == pageDto.page }">
							<strong>${pnum}</strong>
						</c:if>	
					</c:forEach>	
					<!-- 페이지 넘버링 -->	
					
					<!-- 다음페이지 -->
					<c:if test="${pageDto.page < pageDto.maxPage }">
						<a href="/customer/prescription_list?page=${pageDto.page + 1 }&user_seq=${sessionSeq}" class="next">
							<img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/>
						</a>
					</c:if>	
					<c:if test="${pageDto.page == pageDto.maxPage }">
							<img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/>
					</c:if>	
					<!-- 다음페이지 -->
					<!-- 마지막페이지 -->
					<c:if test="${pageDto.page < pageDto.endPage }">
						<a href="/customer/prescription_list?page=${pageDto.maxPage}&user_seq=${sessionSeq}" class="n">
							<img src="../images/btn/btn_next2.gif" alt="마지막페이지로"/>
						</a>
					</c:if>
					<c:if test="${pageDto.page == pageDto.endPage }">
							<img src="../images/btn/btn_next2.gif" alt="마지막페이지로"/>
					</c:if>
					<!-- 마지막페이지 -->

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