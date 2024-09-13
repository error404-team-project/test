<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>   
    
<%@ include file="../header/header.jsp" %>

<link rel="stylesheet" type="text/css" href="../css/inquiry.css?v=Y" />
<script type="text/javascript" src="../js/left_navi.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<div id="container">
  	<div id="location">
		<ol>
			<li><a href="#">HOME</a></li>
			<li><a href="#">CUSTOMER</a></li>
			<li class="last">공지사항</li>
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
        <div class="box" id="contents">
            <div id="customer">
                <h2><strong>공지사항 작성</strong><span>메디슨 회원분들에게 알릴 공지사항을 작성해주세요</span></h2>
<script>
function wBtn(){
	if(confirm("공지사항을 등록하시겠습니까?")){
		wFrm.submit();
		alert("등록이 완료되었습니다.");
	}
}
</script>           
                <div class="checkMt">
                <form action="/customer/notice_write" method="post" name="wFrm" enctype="multipart/form-data">
                    <table summary="분류, 제목, 상세내용, 첨부파일 순으로 궁금하신 점을 문의 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
                        <caption>1:1문의</caption>
                        <colgroup>
                        <col width="19%" class="tw30" />
                        <col width="*" />
                        </colgroup>
                        <tbody>
                        	<input type="hidden" name="user_seq" id="user_seq" value="${sessionSeq}"/>
                            <tr>
                                <th scope="row"><span>제목</span></th>
                                <td>
                                    <input type="text" name="notice_title" class="wlong" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span>상세 내용</span></th>
                                <td>
                                    <textarea class="tta" name="notice_content" style="height:150px;"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span>첨부파일</span></th>
                                <td>
                                    <input type="file" name="file" class="fileType" />
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
                            <li><a onclick="wBtn()" class="sbtnMini">등록</a></li>
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




	