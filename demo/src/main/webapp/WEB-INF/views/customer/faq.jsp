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
            <li><a href="/customer/faq">CUSTOMER</a></li>
            <li class="last">FAQ</li>
        </ol>
    </div>

    <div id="outbox">
        <div class="box" id="left">
            <div id="title2">CUSTOMER<span>고객센터</span></div>
            <ul>    
                <li><a href="/customer/notice_list" id="leftNavi1">공지사항</a></li>
                <li><a href="/customer/inquiry_list" id="leftNavi2">1:1문의</a></li>
                <li><a href="/customer/faq" id="leftNavi3">FAQ</a></li>
                <li class="last"><a href="#" id="leftNavi4">카카오톡 문의</a></li>
            </ul>            
        </div><script type="text/javascript">initSubmenu(3,0);</script>
        
        <!-- contents -->
        <div id="contents">
            <div id="faq">
                <h2><strong>자주 묻는 질문</strong><span>자주 묻는 질문에 대한 답변을 찾아보세요.</span></h2>
                
                <!-- FAQ Categories -->
                <div class="faq-category">
                    <h3>의약품</h3>
                    <div class="faq-item">
                        <button class="faq-question">의약품 배송은 얼마나 걸리나요?</button>
                        <div class="faq-answer">
                            <p>의약품 배송은 일반적으로 24시간 내에 완료됩니다. 다만, 지역에 따라 약간의 차이가 있을 수 있습니다.</p>
                        </div>
                    </div>
                    <div class="faq-item">
                        <button class="faq-question">처방전 없이 의약품을 주문할 수 있나요?</button>
                        <div class="faq-answer">
                            <p>일부 의약품은 처방전 없이도 구매할 수 있지만, 대부분의 전문 의약품은 처방전이 필요합니다.</p>
                        </div>
                    </div>
                </div>
                
                <div class="faq-category">
                    <h3>생활용품</h3>
                    <div class="faq-item">
                        <button class="faq-question">생활용품은 어떻게 포장되어 배송되나요?</button>
                        <div class="faq-answer">
                            <p>생활용품은 안전하게 포장되어 손상 없이 고객님께 배송됩니다. 포장은 재사용 가능한 친환경 소재로 이루어져 있습니다.</p>
                        </div>
                    </div>
                    <div class="faq-item">
                        <button class="faq-question">생활용품의 배송비는 얼마인가요?</button>
                        <div class="faq-answer">
                            <p>일반적으로 배송비는 무료입니다. 하지만 주문 금액이 일정 금액 이하인 경우에는 소정의 배송비가 부과될 수 있습니다.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //contents -->
    </div>
</div>
<!-- //container -->


<!-- FAQ CSS -->
<style>
    .faq-category {
        margin-bottom: 50px;
    }

    .faq-category h3 {
        font-size: 25px;
        margin-bottom: 10px;
        border-bottom: 2px solid #ddd;
        padding-bottom: 5px;
    }

    .faq-item {
        margin-bottom: 10px;
    }

    .faq-question {
        background-color: #f2f2f2;
        border: none;
        width: 100%;
        padding: 15px;
        text-align: left;
        font-size: 18px;
        cursor: pointer;
        outline: none;
    }

    .faq-answer {
        display: none;
        padding: 18px;
        background-color: #fff;
        border-left: 3px solid #87CEEB;
        font-size: 17px;
        line-height: 1.5;
    }

    .faq-item.active .faq-answer {
        display: block;
    }
</style>

<!-- FAQ JavaScript -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var faqItems = document.querySelectorAll('.faq-item');

        faqItems.forEach(function(item) {
            item.querySelector('.faq-question').addEventListener('click', function() {
                item.classList.toggle('active');
            });
        });
    });
</script>


<%@ include file="../footer/footer.jsp" %>