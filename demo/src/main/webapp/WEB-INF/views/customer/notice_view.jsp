<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
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
				<li class="last">NOTICE</li>
			</ol>
		</div>
		
		 <div id="outbox">        
        <div class="box" id="left">
            <div id="title2">CUSTOMER<span>고객센터</span></div>
            <ul>    
                <li><a href="/customer/notice_list" id="leftNavi1">공지사항</a></li>
                <li><a href="/customer/inquiry_list" id="leftNavi2">1:1문의</a></li>
                <li><a href="/customer/faq" id="leftNavi3">자주 묻는 질문</span></a></li>
                <li class="last"><a href="#" id="leftNavi4">카카오톡 문의</a></li>
            </ul>            
        </div>		
		<script type="text/javascript">initSubmenu(1,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="customer">
					<h2><strong>NOTICE</strong><span>메디슨 소식을 전해드립니다.</span></h2>

					<div class="viewDivMt">
						<div class="viewHead">
							<div class="subject">
								<ul>
									<li>${n.notice_title}</li>
								</ul>
							</div>
							<div class="day">
								<p class="txt">작성일
								<span>
								<fmt:formatDate value="${n.notice_date}" pattern="yyyy-MM-dd"/>
								</span></p>
							</div>
						</div>

						<div class="viewContents">
							${n.notice_content }
						</div>
						<div class="viewContents">
							<img src="../image/${n.notice_image}" alt="" style="width:100%;" />
						</div>
					</div>


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
									<c:if test="${prev != null}">
										<td><a href="/customer/notice_view?notice_no=${prev.notice_no}">${prev.notice_title}</a></td>
									</c:if>
									<c:if test="${prev == null}">
										<td>이전 게시글이 없습니다</td>
									</c:if>
								</tr>

								<tr>
									<th class="next">NEXT</th>
									<c:if test="${next != null}">
										<td><a href="/customer/notice_view?notice_no=${next.notice_no}">${next.notice_title}</a></td>
									</c:if>
									<c:if test="${next == null}">
										<td>이전 게시글이 없습니다</td>
									</c:if>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //이전다음글 -->


					<!-- Btn Area -->
					<div class="btnArea btline">
						<div class="bRight">
							<ul>
								<li><a href="/customer/notice_list" class="sbtnMini mw">목록</a></li>
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