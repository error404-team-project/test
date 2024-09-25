<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="../css/layout.css?v=Y" />
<style>
	.name{width:300px; height:36px; overflow : hidden;}
</style>
	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="/index">HOME</a></li>
				<li>SHOP</li>
				<li class="last">건강기능식품</li>
			</ol>
		</div>
<script>
function schBtn(){
//	alert(12341234);
	sFrm.submit();
}
function store(){
	var store_seq = $("#store").val();
	console.log(store_seq);
	location.href="/product/household_list?store_seq="+store_seq+"";
}

</script>
					
		<!-- maxcontents -->
		<div id="maxcontents">
			<div class="banner">
				<img src="../images/img/dailyBanner.jpg" alt="원두커피, 원두커피 전문 기업 쟈뎅의 Coffee Master의 심혈을 기울인 엄선된 원두 선별, 일반 원두커피부터 간편하게 즐기는 원두커피백, POD까지 다양하게 구성되어 있습니다." class="web" /><img src="../images/img/product_banner01_m.jpg" alt="원두커피, 원두커피 전문 기업 쟈뎅의 Coffee Master의 심혈을 기울인 엄선된 원두 선별, 일반 원두커피부터 간편하게 즐기는 원두커피백, POD까지 다양하게 구성되어 있습니다." class="mobile" />
			
			</div>
			
			<h2 class="brand">건강기능식품
				<span>
					<select id="store" onchange="store()">
						<option value="0">전체</option>
					<c:if test="${store_seq == 4}">
						<option value="4" selected>미래로365</option>
					</c:if>
					<c:if test="${store_seq != 4}">
						<option value="4">미래로365</option>
					</c:if>
					<c:if test="${store_seq == 7}">
						<option value="7" selected>하나약국</option>
					</c:if>
					<c:if test="${store_seq != 7}">
						<option value="7">하나약국</option>
					</c:if>
					</select>
				</span>
			</h2>
			
			<div class="brandTab">
			
				<ul>
				<form action="/product/household_list" method="post" name="sFrm">
				<input type="hidden" name="store_seq" id="stoer_seq" value="${store_seq }">
				<input type="hidden" name="health_category" value="${health_category}">
				<c:if test="${health_category == 0 }">
					<li><a href="/product/household_list" class="hover">전체</a></li>
				</c:if>
				<c:if test="${health_category != 0 }">
					<li><a href="/product/household_list">전체</a></li>
				</c:if>
				<c:if test="${health_category == 1 }">
					<li><a href="/product/household_list?health_category=1&store_seq=${store_seq}" class="hover">오메가3</a></li>
				</c:if>
				<c:if test="${health_category != 1 }">
					<li><a href="/product/household_list?health_category=1&store_seq=${store_seq}" >오메가3</a></li>
				</c:if>
				<c:if test="${health_category == 2 }">
					<li><a href="/product/household_list?health_category=2&store_seq=${store_seq}" class="hover">비타민</a></li>
				</c:if>
				<c:if test="${health_category != 2 }">
					<li><a href="/product/household_list?health_category=2&store_seq=${store_seq}">비타민</a></li>
				</c:if>
				<c:if test="${health_category == 3 }">
					<li><a href="/product/household_list?health_category=3&store_seq=${store_seq}" class="hover">유산균</a></li>
				</c:if>
				<c:if test="${health_category != 3 }">
					<li><a href="/product/household_list?health_category=3&store_seq=${store_seq}">유산균</a></li>
				</c:if>
				<c:if test="${health_category == 4 }">
					<li><a href="/product/household_list?health_category=4&store_seq=${store_seq}" class="hover">비오틴</a></li>
				</c:if>
				<c:if test="${health_category != 4 }">
					<li><a href="/product/household_list?health_category=4&store_seq=${store_seq}">비오틴</a></li>
				</c:if>
				<c:if test="${health_category == 5 }">
					<li><a href="/product/household_list?health_category=5&store_seq=${store_seq}" class="hover">루테인/지아잔틴</a></li>
				</c:if>
				<c:if test="${health_category != 5 }">
					<li><a href="/product/household_list?health_category=5&store_seq=${store_seq}">루테인/지아잔틴</a></li>
				</c:if>
				<c:if test="${health_category == 6 }">
					<li><a href="/product/household_list?health_category=6&store_seq=${store_seq}" class="hover">밀크씨슬/실리마린</a></li>
				</c:if>
				<c:if test="${health_category != 6 }">
					<li><a href="/product/household_list?health_category=6&store_seq=${store_seq}">밀크씨슬/실리마린</a></li>
				</c:if>
				<c:if test="${health_category == 7 }">
					<li><a href="/product/household_list?health_category=7&store_seq=${store_seq}" class="hover">프로폴리스</a></li>
				</c:if>
				<c:if test="${health_category != 7 }">
					<li><a href="/product/household_list?health_category=7&store_seq=${store_seq}">프로폴리스</a></li>
				</c:if>
				<c:if test="${health_category == 8 }">
					<li><a href="/product/household_list?health_category=8&store_seq=${store_seq}" class="hover">가르시니아/잔티젠</a></li>
				</c:if>
				<c:if test="${health_category != 8 }">
					<li><a href="/product/household_list?health_category=8&store_seq=${store_seq}">가르시니아/잔티젠</a></li>
				</c:if>
				<c:if test="${health_category == 9 }">
					<li><a href="/product/household_list?health_category=9&store_seq=${store_seq}" class="hover">녹차추출물/카테킨</a></li>
				</c:if>
				<c:if test="${health_category != 9 }">
					<li><a href="/product/household_list?health_category=9&store_seq=${store_seq}">녹차추출물/카테킨</a></li>
				</c:if>
				<c:if test="${health_category == 10 }">
					<li><a href="/product/household_list?health_category=10&store_seq=${store_seq}" class="hover">콜라겐</a></li>
				</c:if>
				<c:if test="${health_category != 10 }">
					<li><a href="/product/household_list?health_category=10&store_seq=${store_seq}">콜라겐</a></li>
				</c:if>
				<c:if test="${health_category == 11 }">
					<li><a href="/product/household_list?health_category=11&store_seq=${store_seq}" class="hover">글루코사민/MSM</a></li>
				</c:if>
				<c:if test="${health_category != 11 }">
					<li><a href="/product/household_list?health_category=11&store_seq=${store_seq}">글루코사민/MSM</a></li>
				</c:if>
				<c:if test="${health_category == 12 }">
					<li><a href="/product/household_list?health_category=12&store_seq=${store_seq}" class="hover">칼슘/마그네슘</a></li>
				</c:if>
				<c:if test="${health_category != 12 }">
					<li><a href="/product/household_list?health_category=12&store_seq=${store_seq}">칼슘/마그네슘</a></li>
				</c:if>
				<c:if test="${health_category == 13 }">
					<li><a href="/product/household_list?health_category=13&store_seq=${store_seq}" class="hover">아연/철분</a></li>
				</c:if>
				<c:if test="${health_category != 13 }">
					<li><a href="/product/household_list?health_category=13&store_seq=${store_seq}">아연/철분</a></li>
				</c:if>
				<c:if test="${health_category == 14 }">
					<li><a href="/product/household_list?health_category=14&store_seq=${store_seq}" class="hover">모나콜린K</a></li>
				</c:if>
				<c:if test="${health_category != 14 }">
					<li><a href="/product/household_list?health_category=14&store_seq=${store_seq}">모나콜린K</a></li>
				</c:if>
				<c:if test="${health_category == 15 }">
					<li><a href="/product/household_list?health_category=15&store_seq=${store_seq}" class="hover">마카/쏘팔메토</a></li>
				</c:if>
				<c:if test="${health_category != 15 }">
					<li><a href="/product/household_list?health_category=15&store_seq=${store_seq}">마카/쏘팔메토</a></li>
				</c:if>
				<c:if test="${health_category == 16 }">
					<li><a href="/product/household_list?health_category=16&store_seq=${store_seq}" class="hover">아르기닌</a></li>
				</c:if>
				<c:if test="${health_category != 16 }">
					<li><a href="/product/household_list?health_category=16&store_seq=${store_seq}">아르기닌</a></li>
				</c:if>
				<c:if test="${health_category == 17}">
					<li><a href="/product/household_list?health_category=17&store_seq=${store_seq}" class="hover">포스파티딜</a></li>
				</c:if>
				<c:if test="${health_category != 17 }">
					<li><a href="/product/household_list?health_category=17&store_seq=${store_seq}">포스파티딜</a></li>
				</c:if>
				<c:if test="${health_category == 18 }">
					<li><a href="/product/household_list?health_category=18&store_seq=${store_seq}" class="hover">옥타코사놀/폴리코사놀</a></li>
				</c:if>
				<c:if test="${health_category != 18 }">
					<li><a href="/product/household_list?health_category=18&store_seq=${store_seq}">옥타코사놀/폴리코사놀</a></li>
				</c:if>
				<c:if test="${health_category == 19 }">
					<li><a href="/product/household_list?health_category=19&store_seq=${store_seq}" class="hover">스피루라나</a></li>
				</c:if>
				<c:if test="${health_category != 19 }">
					<li><a href="/product/household_list?health_category=19&store_seq=${store_seq}">스피루라나</a></li>
				</c:if>
				<c:if test="${health_category == 20 }">
					<li><a href="/product/household_list?health_category=20&store_seq=${store_seq}" class="hover">글루타치온</a></li>
				</c:if>
				<c:if test="${health_category != 20 }">
					<li><a href="/product/household_list?health_category=20&store_seq=${store_seq}">글루타치온</a></li>
				</c:if>
				<c:if test="${health_category == 21 }">
					<li><a href="/product/household_list?health_category=21&store_seq=${store_seq}" class="hover">기타건강식품</a></li>
				</c:if>
				<c:if test="${health_category != 21 }">
					<li><a href="/product/household_list?health_category=21&store_seq=${store_seq}">기타건강식품</a></li>
				</c:if>
				</ul>
			</div>

			<div class="brandList">
				<ul>
					<!-- 반복 -->
					<c:forEach var="d" items="${mDList}">
					<li>
						<a href="/product/household_view?p_num=${d.p_num}&health_category=${health_category}">
							<div class="img">
								<img src="../image/${d.image}" alt="제품이미지" />
							</div>
							<div class="name">${d.name}</div>
							<c:if test="${d.stock != 0 }">
								<div class="price">${d.price }원</div>
							</c:if>
							<c:if test="${d.stock == 0 }">
								<div class="price">상품 입고 준비중</div>
							</c:if>
						</a>
					</li>
					</c:forEach>
					<!-- //반복 -->
			</div>
			<div class="searchWrap">
						<div class="search">
							<ul>
								<li class="web"><img src="../images/txt/txt_search.gif" alt="search" /></li>
								<li class="se">
									<select id="category" name="sCategory">
										<option value="name" />이름</option>
									</select>
								</li>
								<li><input type="text" id="sWord" name="sWord" class="searchInput" /></li>
								<li class="web"><a onclick="schBtn()"><img src="../images/btn/btn_search.gif" alt="검색" /></a></li>
								<li class="mobile"><a onclick="schBtn()"><img src="../images/btn/btn_search_m.gif" alt="검색" /></a></li>
							</ul>
						</div>
					</div>
				</form>
			<div class="btnAreaList">
						<!-- 페이징이동1 -->
						<div class="allPageMoving1">
					<!-- 처음페이지 -->
					<c:if test="${pageDto.page > 1 }">
						<a href="/product/household_list?page=1&health_category=${health_category}&sWord=${sWord}&store_seq=${store_seq}" class="n">
							<img src="../images/btn/btn_pre2.gif" alt="처음으로"/>
						</a>
					</c:if>
					<c:if test="${pageDto.page == 1 }">
							<img src="../images/btn/btn_pre2.gif" alt="처음으로"/>
					</c:if>
					<!-- 처음페이지 -->
					
					<!-- 이전페이지 -->
					<c:if test="${pageDto.page>1}">
						<a href="/product/household_list?page=${pageDto.page-1}&health_category=${health_category}&sWord=${sWord}&store_seq=${store_seq}" class="pre">
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
							<a href="/product/household_list?page=${pnum}&health_category=${health_category}&sWord=${sWord}&store_seq=${store_seq}">${pnum}</a> 
						</c:if>
						<c:if test="${pnum == pageDto.page }">
							<strong>${pnum}</strong>
						</c:if>	
					</c:forEach>	
					<!-- 페이지 넘버링 -->	
					
					<!-- 다음페이지 -->
					<c:if test="${pageDto.page < pageDto.maxPage }">
						<a href="/product/household_list?page=${pageDto.page + 1 }&health_category=${health_category}&sWord=${sWord}&store_seq=${store_seq}" class="next">
							<img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/>
						</a>
					</c:if>	
					<c:if test="${pageDto.page == pageDto.maxPage }">
							<img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/>
					</c:if>	
					<!-- 다음페이지 -->
					<!-- 마지막페이지 -->
					<c:if test="${pageDto.page < pageDto.endPage }">
						<a href="/product/household_list?page=${pageDto.maxPage}&health_category=${health_category}&sWord=${sWord}&store_seq=${store_seq}" class="n">
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
			<!-- quickmenu -->
			<div id="quick">
				<div class="cart"><a href="/product/cart">장바구니</a></div>
				<div class="wish">
					<p class="title">위시 리스트</p>
					<div class="list">
						<ul>	
						<!-- 10~15개정도 반복 -->
						<c:if test="${wList == null || user_seq == 0}">
							<li><a href="#"><img src="../images/img/sample_wish.gif" alt="" /></a>
						</c:if>
						<c:if test="${user_seq > 0}">
							<c:forEach var="w" items="${wList}">
							<c:if test="${w.product.product_category == 1 }">
								<li><a href="/product/medical_view?p_num=${w.p_num}&medical_category=${w.product.medical_category}"><img src="../image/${w.product.image }" alt="상품페이지로 이동" style="width:78px;height:78px" /></a>
							</c:if>
							<c:if test="${w.product.product_category == 2 }">
								<li><a href="/product/household_view?p_num=${w.p_num}&health_category=${w.product.health_category}"><img src="../image/${w.product.image }" alt="상품페이지로 이동" style="width:78px;height:78px" /></a>
							</c:if>
						</c:forEach>
						</c:if>
						<!-- 10~15개정도 반복 -->
						</ul>
					</div>

					<div class="total">
						<a href="#none" class="wishLeft"><img src="../images/btn/wish_left.gif" alt="" /></a>
						 <span class="page">1</span> / <span class="sum">5</span>
						<a href="#none" class="wishRight"><img src="../images/btn/wish_right.gif" alt="" /></a>
					</div>

				</div>

				<div class="top"><a href="#">TOP&nbsp;&nbsp;<img src="../images/ico/ico_top.gif" alt="" /></a></div>
			</div>
			<script type="text/javascript">
			$(function(){
				
				$(window).scroll(function(){
					var tg = $("div#quick");
					var xg = $("div#maxcontents");
					var limit = xg.height()- 165;
					var tmp = $(window).scrollTop();

					if (tmp > limit) {
						tg.css({"position" : "absolute","right" : "-150px","bottom" : "208px","top" : "auto"});
					}
					else {
						tg.css({"position" : "fixed","top" : "208px" , "margin-left" : "940px","right" : "auto"});
					}
				});

			});
			</script>
			<!-- //quickmenu -->

		</div>
		<!-- //maxcontents -->

	</div>
	<!-- //container -->
<%@ include file="../footer/footer.jsp" %>