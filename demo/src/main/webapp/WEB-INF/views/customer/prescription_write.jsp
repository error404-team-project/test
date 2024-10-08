<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>   
    
<%@ include file="../header/header.jsp" %>

<link rel="stylesheet" type="text/css" href="../css/inquiry.css?v=Y" />
<script type="text/javascript" src="../js/left_navi.js"></script>


<div id="container">
   <div id="location">
		<ol>
			<li><a href="#">HOME</a></li>
			<li><a href="#">CUSTOMER</a></li>
			<li class="last">처방전 등록</li>
		</ol>
	</div>
    
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
<script>
if(${sessionSeq == null}){
	alert("로그인 후 이용 가능합니다.");
	location.href="/member/login";
}
function sBtn(){
	pFrm.submit();
}
</script>
        <!-- contents -->
        <div class="box" id="contents">
            <div id="customer">
                <h2><strong>처방전 등록</strong><span>처방전 사진을 올려주시면 확인 후 약품을 발송해드립니다</span><span>처방전 등록 후 꼭 다시 확인해주세요! 사진에 이상이 있으면 수정 부탁드립니다.</span></h2>
                
                <div class="checkMt">
                    <table summary="분류, 제목, 상세내용, 첨부파일 순으로 궁금하신 점을 문의 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
                    <form action="/customer/prescription_write" method="post" name="pFrm" enctype="multipart/form-data">
                    <input type="hidden" name="user_seq" value="${sessionSeq}">
                        <caption>처방전 등록</caption>
                        <colgroup>
                        <col width="19%" class="tw30" />
                        <col width="*" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span>상세 내용 </span><br/><span>(요청사항)</span></th>
                                <td>
                                    <textarea class="tta" style="height:200px;" name="prescription_content"></textarea>
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
                            <li><a onclick="sBtn()" class="sbtnMini">저장</a></li>
                            
                        </ul>
                    </div>
                </div>
                </form>
                <!-- //Btn Area -->
                
            </div>
        </div>
        <!-- //contents -->
    </div>
</div>
<!-- //container -->



<%@ include file="../footer/footer.jsp" %>




	