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
				<li><a href="/">HOME</a></li>
				<li><a href="/event/event_list">EVENT</a></li>
				<li class="last">종료된 이벤트</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title2">EVENT<span>이벤트</span></div>
				<ul>	
					<li><a href="/event/event_list" id="leftNavi1">진행중 이벤트</a></li>
					<li><a href="/event/fin_event" class="last" id="leftNavi2">종료된 이벤트</a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(2,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>종료된 이벤트</strong><span>쟈뎅샵의 특별한 혜택이 가득했던 이벤트 목록을 확인하실 수 있습니다.</span></h2>
					
					<!-- list -->
					<div class="eventList">
						<ul>
							<!-- 반복 -->
							<c:forEach var="f" items="${flist}">
							<li>
								<div class="img" style="height:198px; width:850px; ">
									<img src="../image/${f.event_image}" alt="진행중 이벤트" style="height:198px; width:850px; "/>
								</div>
								<div class="txt" style="width : 850px;">
									<div class="subject">
										<span class="finishbtn">종료</span>&nbsp;
										${f.event_title }
									</div>
									<div class="day">종료된 이벤트
									</div>
								</div>
							</li>
							</c:forEach>
							<!-- //반복 -->
						</ul>
					</div>
					<!-- //list -->

					<div class="btnAreaList">
						<!-- 페이징이동1 -->
						<div class="allPageMoving1">
					<c:if test="${pageDto.page > 1 }">
						<a href="/event/fin_event?page=1" class="n">
							<img src="../images/btn/btn_pre2.gif" alt="처음으로"/>
						</a>
					</c:if>
					<c:if test="${pageDto.page == 1 }">
							<img src="../images/btn/btn_pre2.gif" alt="처음으로"/>
					</c:if>
					<!-- 처음페이지 -->
					
					<!-- 이전페이지 -->
					<c:if test="${pageDto.page>1}">
						<a href="/event/fin_event?page=${pageDto.page-1}" class="pre">
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
							<a href="/event/fin_event?page=${pnum}">${pnum}</a> 
						</c:if>
						<c:if test="${pnum == pageDto.page }">
							<strong>${pnum}</strong>
						</c:if>	
					</c:forEach>	
					<!-- 페이지 넘버링 -->	
					
					<!-- 다음페이지 -->
					<c:if test="${pageDto.page < pageDto.maxPage }">
						<a href="/event/fin_event?page=${pageDto.page + 1 }" class="next">
							<img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/>
						</a>
					</c:if>	
					<c:if test="${pageDto.page == pageDto.maxPage }">
							<img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/>
					</c:if>	
					<!-- 다음페이지 -->
					<!-- 마지막페이지 -->
					<c:if test="${pageDto.page < pageDto.endPage }">
						<a href="/event/fin_event?page=${pageDto.maxPage}" class="n">
							<img src="../images/btn/btn_next2.gif" alt="마지막페이지로"/>
						</a>
					</c:if>
					<c:if test="${pageDto.page == pageDto.endPage }">
							<img src="../images/btn/btn_next2.gif" alt="마지막페이지로"/>
					</c:if>
						</div>
						<!-- //페이징이동1 -->
					</div>
				</div>
			</div>
			<!-- //contents -->

		</div>
	</div>
	<!-- //container -->




	<%@ include file="../footer/footer.jsp" %>