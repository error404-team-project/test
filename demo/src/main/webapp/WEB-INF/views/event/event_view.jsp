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
				<li class="last">진행중 이벤트</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title2">EVENT<span>이벤트</span></div>
				<ul>	
	                <li><a href="/event/event_list" id="leftNavi1">진행중 이벤트</a></li>
	                <li><a href="/event/fin_event" id="leftNavi2">종료된 이벤트</a></li>
            </ul>			
			</div><script type="text/javascript">initSubmenu(1,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>진행중 이벤트</strong><span>메디슨의 특별한 혜택이 가득한 이벤트에 참여해 보세요.</span></h2>
					
					<div class="viewDivMt">
						<div class="viewHead">
							<div class="subject">
								<ul>
									<li>${eve.event_title }</li>
								</ul>
							</div>
							<div class="day">
								<p class="txt">이벤트 기간<span>
										<fmt:formatDate value="${eve.event_start_date }" pattern="yyyy-MM-dd"/>
									  ~ <fmt:formatDate value="${eve.event_end_date }" pattern="yyyy-MM-dd"/></span></p>
							</div>
						</div>

						<div class="viewContents">
							<img src="../image/${eve.event_image}" alt="" style="width:100%;" />
						</div>
						<div class="viewContents">
							${eve.event_content}
						</div>
					</div>


					<!-- 이전다음글 -->
					<div class="pnDiv web">
						<table summary="이전다음글을 선택하여 보실 수 있습니다." class="preNext" border="1" cellspacing="0">
							<caption>이전다음글</caption>
							<colgroup>
							<col width="100px" />
							<col width="*" />
							<col width="100px" />
							</colgroup>
							<tbody>
								<tr>
									<th class="pre">PREV</th>
									<c:if test="${prev != null}">
										<td><a href="/event/event_view?event_no=${prev.event_no}">${prev.event_title}</a></td>
									</c:if>
									<c:if test="${prev == null}">
										<td>이전 게시글이 없습니다</td>
									</c:if>
								</tr>

								<tr>
									<th class="next">NEXT</th>
									<c:if test="${next != null}">
										<td><a href="/event/event_view?event_no=${next.event_no}">${next.event_title}</a></td>
									</c:if>
									<c:if test="${next == null}">
										<td>다음 게시글이 없습니다</td>
									</c:if>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //이전다음글 -->




					<!-- Btn Area -->
					<div class="btnArea">
						<div class="bRight">
							<ul>
								<li><a href="/event/event_list" class="sbtnMini mw">목록</a></li>
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->
					
				</div>
			</div>
			<!-- //contents -->


<script type="text/javascript" src="../js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox-1.3.4.css" />
<script type="text/javascript">
$(function(){
	
	var winWidth = $(window).width();
	if(winWidth > 767){
		var layerCheck = 540;
	}else{
		var layerCheck = 320;
	}

	$(".passwordBtn").fancybox({
		'autoDimensions'    : false,
		'showCloseButton'	: false,
		'width' : layerCheck,
		'padding' : 0,
		'type'			: 'iframe',
		'onComplete' : function() {
			$('#fancybox-frame').load(function() { // wait for frame to load and then gets it's height
			$('#fancybox-content').height($(this).contents().find('body').height());
			});
		}
	});


});
</script>

		</div>
	</div>
	<!-- //container -->
	<%@ include file="../footer/footer.jsp" %>