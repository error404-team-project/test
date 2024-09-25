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
				<li class="last">의약품</li>
			</ol>
		</div>
<script>
function store(){
	var store_seq = $("#store").val();
	console.log(store_seq);
	location.href="/product/medical_list?store_seq="+store_seq+"";
}
</script>			
		<!-- maxcontents -->
		<div id="maxcontents">
			<div class="banner"><img src="../images/img/medical_product.png" alt="원두커피, 원두커피 전문 기업 쟈뎅의 Coffee Master의 심혈을 기울인 엄선된 원두 선별, 일반 원두커피부터 간편하게 즐기는 원두커피백, POD까지 다양하게 구성되어 있습니다." class="web" /><img src="../images/img/product_banner01_m.jpg" alt="원두커피, 원두커피 전문 기업 쟈뎅의 Coffee Master의 심혈을 기울인 엄선된 원두 선별, 일반 원두커피부터 간편하게 즐기는 원두커피백, POD까지 다양하게 구성되어 있습니다." class="mobile" /></div>
			
			<h2 class="brand">의약품
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
			<form action="/product/medical_list" method="post" name="sFrm">
			<input type="hidden" name="medical_category" value="${medical_category}">
				<ul>
				<c:if test="${medical_category == 0 }">
					<li><a href="/product/medical_list" class="hover">전체</a></li>
				</c:if>
				<c:if test="${medical_category != 0 }">
					<li><a href="/product/medical_list">전체</a></li>
				</c:if>
				<c:if test="${medical_category == 1 }">
					<li><a href="/product/medical_list?medical_category=1&store_seq=${store_seq}" class="hover">항생제</a></li>
				</c:if>
				<c:if test="${medical_category != 1 }">
					<li><a href="/product/medical_list?medical_category=1&store_seq=${store_seq}" >항생제</a></li>
				</c:if>
				<c:if test="${medical_category == 2 }">
					<li><a href="/product/medical_list?medical_category=2&store_seq=${store_seq}" class="hover">소화제</a></li>
				</c:if>
				<c:if test="${medical_category != 2 }">
					<li><a href="/product/medical_list?medical_category=2&store_seq=${store_seq}">소화제</a></li>
				</c:if>
				<c:if test="${medical_category == 3 }">
					<li><a href="/product/medical_list?medical_category=3&store_seq=${store_seq}" class="hover">비염</a></li>
				</c:if>
				<c:if test="${medical_category != 3 }">
					<li><a href="/product/medical_list?medical_category=3&store_seq=${store_seq}">비염</a></li>
				</c:if>
				<c:if test="${medical_category == 4 }">
					<li><a href="/product/medical_list?medical_category=4&store_seq=${store_seq}" class="hover">진통/소염제</a></li>
				</c:if>
				<c:if test="${medical_category != 4 }">
					<li><a href="/product/medical_list?medical_category=4&store_seq=${store_seq}">진통/소염제</a></li>
				</c:if>
				<c:if test="${medical_category == 5 }">
					<li><a href="/product/medical_list?medical_category=5&store_seq=${store_seq}" class="hover">항바이러스제</a></li>
				</c:if>
				<c:if test="${medical_category != 5 }">
					<li><a href="/product/medical_list?medical_category=5&store_seq=${store_seq}">항바이러스제</a></li>
				</c:if>
				<c:if test="${medical_category == 6 }">
					<li><a href="/product/medical_list?medical_category=6&store_seq=${store_seq}" class="hover">항염증제</a></li>
				</c:if>
				<c:if test="${medical_category != 6 }">
					<li><a href="/product/medical_list?medical_category=6&store_seq=${store_seq}">항염증제</a></li>
				</c:if>
				<c:if test="${medical_category == 7 }">
					<li><a href="/product/medical_list?medical_category=7&store_seq=${store_seq}" class="hover">연고</a></li>
				</c:if>
				<c:if test="${medical_category != 7 }">
					<li><a href="/product/medical_list?medical_category=7&store_seq=${store_seq}">연고</a></li>
				</c:if>
				<c:if test="${medical_category == 8 }">
					<li><a href="/product/medical_list?medical_category=8&store_seq=${store_seq}" class="hover">밴드</a></li>
				</c:if>
				<c:if test="${medical_category != 8 }">
					<li><a href="/product/medical_list?medical_category=8&store_seq=${store_seq}">밴드</a></li>
				</c:if>
				</ul>
			</div>

			<div class="brandList">
				<ul>
					<!-- 반복 -->
					
					<c:forEach var="m" items="${mCList}">
					<li>
						<a href="/product/medical_view?p_num=${m.p_num}&medical_category=${medical_category}">
							<div class="img">
							<img src="../image/${m.image}" alt="제품이미지" />
							</div>
							<div class="name">${m.name }</div>
							<c:if test="${m.stock == 0}">
							<div class="price">상품 입고 준비중</div>
							</c:if>
							<c:if test="${m.stock > 0}">
							<div class="price">${m.price  }</div>
							</c:if>
						</a>
					</li>
					</c:forEach>
					<!-- //반복 -->
			</div>
<script>
function schBtn(){
//	alert($("#category").val());
//	alert($("#sWord").val());
sFrm.submit();
}
</script>
		
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
						<a href="/product/medical_list?page=1&medical_category=${medical_category}&sWord=${sWord}&store_seq=${store_seq}" class="n">
							<img src="../images/btn/btn_pre2.gif" alt="처음으로"/>
						</a>
					</c:if>
					<c:if test="${pageDto.page == 1 }">
							<img src="../images/btn/btn_pre2.gif" alt="처음으로"/>
					</c:if>
					<!-- 처음페이지 -->
					
					<!-- 이전페이지 -->
					<c:if test="${pageDto.page>1}">
						<a href="/product/medical_list?page=${pageDto.page-1}&medical_category=${medical_category}&sWord=${sWord}&store_seq=${store_seq}" class="pre">
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
							<a href="/product/medical_list?page=${pnum}&medical_category=${medical_category}&sWord=${sWord}&store_seq=${store_seq}">${pnum}</a> 
						</c:if>
						<c:if test="${pnum == pageDto.page }">
							<strong>${pnum}</strong>
						</c:if>	
					</c:forEach>	
					<!-- 페이지 넘버링 -->	
					
					<!-- 다음페이지 -->
					<c:if test="${pageDto.page < pageDto.maxPage }">
						<a href="/product/medical_list?page=${pageDto.page + 1 }&medical_category=${medical_category}&sWord=${sWord}&store_seq=${store_seq}" class="next">
							<img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/>
						</a>
					</c:if>	
					<c:if test="${pageDto.page == pageDto.maxPage }">
							<img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/>
					</c:if>	
					<!-- 다음페이지 -->
					<!-- 마지막페이지 -->
					<c:if test="${pageDto.page < pageDto.endPage }">
						<a href="/product/medical_list?page=${pageDto.maxPage}&medical_category=${medical_category}&sWord=${sWord}&store_seq=${store_seq}" class="n">
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