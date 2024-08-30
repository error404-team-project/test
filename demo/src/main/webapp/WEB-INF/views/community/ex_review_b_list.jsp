<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>   

<%@ include file="../header/header.jsp" %>



	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li><a href="#">COMMUNITY</a></li>
				<li class="last">사용 후기</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title2">COMMUNITY<span>커뮤니티</span></div>
						
			</div><script type="text/javascript">initSubmenu(2,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>귀 기울여 듣겠습니다.</strong><span></span></h2>
					
					<div class="productTab normaltab">
						<ul>
							
							<li class="last"><a href="#" class="on">남기시는 글들</a></li>
						</ul>						
					</div>


					<!-- 상품평 -->
					<div class="orderDiv">
					<table summary="상품평 게시판으로 NO, 제품명, 제목, 작성자, 평점/등록일, 조회수 순으로 조회 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
						<caption>주문 제품 확인</caption>
						<colgroup>
						<col width="8%" class="tnone" />
						<col width="12%" class="tw20" />
						<col width="*" />
						<col width="14%" class="tw20" />
						<col width="14%" class="tnone" />
						<col width="10%" class="tnone" />
						</colgroup>
						<thead>
							<th scope="col" class="tnone">NO.</th>
							<th scope="col">상품명</th>
							<th scope="col">내용</th>
							<th scope="col">작성자</th>
							<th scope="col" class="tnone">평점/등록일</th>
							<th scope="col" class="tnone">조회수</th>
						</thead>
						<tbody>
						
							<tr>
								<td class="tnone"></td>
								<td></td>
								<td class="left">
									<a href="/ex_review_b_view">
										<span class="orange"></span>
										<img src="../images/ico/ico_new.gif" alt="new" />
									</a>
								</td>
								<td></td>
								<td class="tnone">
									<img src="../images/ico/ico_star.gif" alt="별점" />
									<img src="../images/ico/ico_star.gif" alt="별점" />
									<img src="../images/ico/ico_star.gif" alt="별점" />
									<img src="../images/ico/ico_star.gif" alt="별점" />
									<img src="../images/ico/ico_star.gif" alt="별점" />

									<br/>
								</td>
								<td class="right tnone"></td>
							</tr>
			
						
						</tbody>
					</table>
					</div>

					<div class="btnAreaList">
						<div class="bwright">
							<ul>
								<li><a href="ex_review_b_write" class="sbtnMini">글쓰기</a></li>
							</ul>
						</div>

						<!-- 페이징이동1 -->
						<div class="allPageMoving1">

						<a href="#" class="n"><img src="../images/btn/btn_pre2.gif" alt="처음으로"/></a><a href="#" class="pre"><img src="../images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
						<strong>1</strong>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">4</a>
						<a href="#">5</a>
						<a href="#">6</a>
						<a href="#">7</a>
						<a href="#">8</a>
						<a href="#">9</a>
						<a href="#">10</a>
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
					<!-- //상품평 -->

				</div>
			</div>
			<!-- //contents -->

		</div>
	</div>
	<!-- //container -->



<%@ include file="../footer/footer.jsp" %>
