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
			<li class="last">1:1문의</li>
		</ol>
	</div>
    
    <div id="outbox">        
        <div class="box" id="left">
            <div id="title2">CUSTOMER<span>고객센터</span></div>
            <ul>    
                <li><a href="#" id="leftNavi1">공지사항</a></li>
                <li><a href="#" id="leftNavi2">1:1문의</a></li>
                <li><a href="#" id="leftNavi3">자주 묻는 질문</span></a></li>
                <li class="last"><a href="#" id="leftNavi4">카카오톡 문의</a></li>
            </ul>            
        </div>
        <script type="text/javascript">initSubmenu(2,0);</script>

        <!-- contents -->
        <div class="box" id="contents">
            <div id="customer">
                <h2><strong>1:1문의</strong><span>메디슨에 궁금하신 사항을 남겨주시면 답변해드립니다.</span></h2>
                
                <div class="checkMt">
                    <table summary="분류, 제목, 상세내용, 첨부파일 순으로 궁금하신 점을 문의 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
                        <caption>1:1문의</caption>
                        <colgroup>
                        <col width="19%" class="tw30" />
                        <col width="*" />
                        </colgroup>
                        <tbody>
                           <th scope="row"><span>분류</span></th>
						        <td>
						            <select id="drop_inquiry" >
						                <option value="" disabled selected>선택해주세요.</option>
						                <option value="option1">옵션 1</option>
						                <option value="option2">옵션 2</option>
						                <option value="option3">옵션 3</option>
						            </select>
						        </td>
                            <tr>
                                <th scope="row"><span>제목</span></th>
                                <td>
                                    <input type="text" class="wlong" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span>상세 내용</span></th>
                                <td>
                                    <textarea class="tta"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span>첨부파일</span></th>
                                <td>
                                    <input type="file" class="fileType" />
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
                            <li><a href="#" class="sbtnMini">확인</a></li>
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




	