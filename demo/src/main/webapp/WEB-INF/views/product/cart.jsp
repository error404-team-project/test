<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../header/header.jsp" %>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- container -->
	<div id="container">

	
			<script type="text/javascript">initSubmenu(3,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>장바구니</strong><span>장바구니에 담긴 상품을 확인해보세요.</span></h2>
					

				<!-- 장바구니에 상품이 있을경우 -->
					<!-- 장바구니 상품 -->
					<h3>장바구니에 담긴 상품 <span style="color : red">동일한 약국의 상품들만 구매할 수 있습니다</span></h3>
					<div class="orderDivNm">
						<table summary="장바구니에 담긴 상품들을 전체선택, 상품명, 가격/포인트, 수량, 합계, 주문 순으로 조회 및 주문을 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
							<caption>장바구니 상품목록</caption>
							<colgroup>
							<col width="7%"/>
							<col width="*" />
							<col width="14%" class="tnone" />
							<col width="10%" class="tw14"/>
							<col width="14%" class="tw28"/>
							<col width="14%" class="tnone" />
							</colgroup>
							<thead>
								<th scope="col"></th>
								<th scope="col">상품명</th>
								<th scope="col" class="tnone">가격/포인트</th>
								<th scope="col">수량</th>
								<th scope="col">합계</th>
								<th scope="col" class="tnone">주문</th>
							</thead>
							<tbody>
							<c:forEach var="c" items="${list}"  varStatus="status">
							
								<tr data-id="${c.p_num}">
									<td><input type="checkbox" name="order_check" /></td>
									<td class="left">
										<p class="img"><img src="../image/${c.product.image}" alt="상품" width="66" height="66" /></p>

										<ul class="goods">
											<li>
												<a href="#">${c.product.name }</a>
												<input type="hidden" class="store_seq" value="${c.product.user_seq}" />
												<br><br>
												<c:if test="${c.product.user_seq == 4}">
												<a>미래로 365 약국</a>
												</c:if>
												
												<c:if test="${c.product.user_seq == 7}">
											   <a>하나 약국</a>
												</c:if>
											</li>
										</ul>
									</td>
									<td ><sapn class="price">${c.product.price}</sapn> 원<br/></td>
									<td> 
										<input type="text" id="inputbox" class="spinner" value="${c.count }">
										<sapn class="pro_num"><input type="hidden" class="a"   value="${c.p_num }"></sapn>
									
									</td>
									
									<td ><span class="tPrice">${c.product.price * c.count }</span> 원</td>
									<td class="tnone">
										<ul class="order">	
											<li><a onclick="buy(${c.p_num })" class="obtnMini iw70" style="cursor:pointer;" >바로구매</a></li>
										</ul>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
					
<!-- 주문 스크립트 -->					
					<script type="text/javascript">
					// 주문 페이지 연결
					function buy(p_num) {
					        var count = $(".spinner").val(); 
					        // URL 생성
					        var url = "/payment/payment?p_num=" +p_num + "&p_count=" + count;
					        // 링크 리다이렉트
					       location.href = url;
					}; // 
				
					</script>

<script>
if(${user_seq == 0}){
	alert("로그인 후 이용 가능합니다.");
	location.href="/member/login";
} //if

$(function() {
	
    $(".inputbox").spinner();

    // 위로 버튼 클릭 이벤트
    $(document).on("click", ".ui-spinner-button.ui-spinner-up", function() {
        var row = $(this).closest("tr"); // 현재 행 찾기
        var pricetxt = row.find(".price").text(); // 가격 텍스트 가져오기
        var price = parseInt(pricetxt, 10); // 가격을 정수로 변환
        var count = row.find(".spinner").val(); // 스피너의 값을 가져오기
        count = parseInt(count, 10); // 수량을 정수로 변환
        var total = price * count; // 총 가격 계산
        row.find(".tPrice").text(total); // 총 가격을 표시
        
        // AJAX 요청으로 수량 업데이트
         var p_num =  row.find(".pro_num").find(".a").val() 
       
      
    
      console.log(p_num);
   
        
         $.ajax({
	        url: '/product/onchange', // 서버에서 수량을 업데이트할 URL
	        type: 'POST', // POST 요청
	        data: {
	            "p_num": p_num,
	            "p_count": count 
	        },
	        success: function(data){
	    	//	alert(data);	
	    		},
	    		error:function(){
	    			alert("실패");
	    		}
	    }); 
    });  // 위로 버튼 클릭 이벤트

    // 아래로 버튼 클릭 이벤트
    $(document).on("click", ".ui-spinner-button.ui-spinner-down", function() {
        var row = $(this).closest("tr"); // 현재 행 찾기
        var pricetxt = row.find(".price").text(); // 가격 텍스트 가져오기
        var price = parseInt(pricetxt, 10); // 가격을 정수로 변환
        var count = row.find(".spinner").val(); // 스피너의 값을 가져오기
        count = parseInt(count, 10); // 수량을 정수로 변환
        var total = price * count; // 총 가격 계산
        row.find(".tPrice").text(total); // 총 가격을 표시
        
       
        
       // AJAX 요청으로 수량 업데이트
           var p_num = row.find(".pro_num").find(".a").val()
           
              console.log(p_num);
         $.ajax({
	        url: '/product/onchange', // 서버에서 수량을 업데이트할 URL
	        type: 'POST', // POST 요청
	        data: {
	          "p_num": p_num,
	            "p_count": count 
	        },
	        success: function(data){
	    	//alert(data);	
	    		},
	    		error:function(){
	    			alert("실패");
	    		}
	   
	
	    }); //ajax
    });  // 아래로 버튼 클릭 이벤트
}); // jquery



/* $("#inputbox").on("propertychange change keyup paste input", function(){
	alert("change");
}); */

$("#wl").html('<a onclick="wBtn()" class="ty3">위시 <span>리스트 추가</span></a>');
</script>


<script type="text/javascript">
$(function() {
    // 전체선택 체크 시 전체 선택되게
    $("#agreeAll").click(function() {
        $("input[name=order_check]").prop("checked", true);
        updateButtonText();
        updateprice();
    });

    $("#disagreeAll").click(function() {
        $("input[name=order_check]").prop("checked", false);
        updateButtonText();
        updateprice();
    });

    $("input[name=order_check]").click(function() {
        updateButtonText();
        updateprice();
    });

    function updateButtonText() {
        var total = $("input[name=order_check]").length;
        var checked = $("input[name=order_check]:checked").length;

        if (checked === total) {
            $("#agreeAll").hide();
            $("#disagreeAll").show();
        } else {
            $("#agreeAll").show();
            $("#disagreeAll").hide();
        }
    } //updateButtonText 

    function updateprice () {

    	 var total=0;
    	 var realTotal = 0;
         
         $("input[name=order_check]:checked").each(function() {
        	 
             var pricetxt = $(this).closest('tr').find(".price").text();  // 행의 데이터 속성에서 ID 가져오기
	         var price = parseInt(pricetxt, 10); // 가격을 정수로 변환
	         var count = $(this).closest('tr').find(".spinner").val(); // 스피너의 값을 가져오기
	         count = parseInt(count, 10); // 수량을 정수로 변환
	         total += price * count; // 총 가격 계산
	         realTotal = total+2500;
        	
         });
         
         if("input[name=order_check]:checked"){
        	 $(".inputbox").spinner();

        	    // 위로 버튼 클릭 이벤트
        	    $(document).on("click", ".ui-spinner-button.ui-spinner-up", function() {
        	        var row = $(this).closest("tr"); // 현재 행 찾기
        	        var pricetxt = row.find(".price").text(); // 가격 텍스트 가져오기
        	        var price = parseInt(pricetxt, 10); // 가격을 정수로 변환
        	        var count = row.find(".spinner").val(); // 스피너의 값을 가져오기
        	        count = parseInt(count, 10); // 수량을 정수로 변환
        	        var total = price * count; // 총 가격 계산
        	        row.find(".tPrice").text(total); // 총 가격을 표시
        	        
        	        // AJAX 요청으로 수량 업데이트
        	         var p_num =  row.find(".pro_num").find(".a").val() 
        	       
        	      
        	    
        	      console.log(p_num);
        	   
        	        
        	         $.ajax({
        		        url: '/product/onchange', // 서버에서 수량을 업데이트할 URL
        		        type: 'POST', // POST 요청
        		        data: {
        		            "p_num": p_num,
        		            "p_count": count 
        		        },
        		        success: function(data){
        		    	//	alert(data);	
        		    	realTotal = total+2500;
        		    	 var str="";
            	str+= '<li><span class="title">상품 합계금액</span><span class="won"><strong>';
            	str+=	total;
            	str+=	'</strong> 원</span></li><li><span class="title">배송비</span><span class="won"><strong>2,500</strong> 원</span></li>	</ul>';  	
            	
            	var str2="";
            	str2+= '<li class="txt"><strong>결제 예정 금액</strong></li>';
            	str2+= '<li class="money"><span>';
            	str2+= realTotal;
            	str2+= '</span> 원</li>';
            	
            	$("#priceinfo").html(str)
            	$("#totalpriceinfo").html(str2)
        		    		},
        		    		error:function(){
        		    			alert("실패");
        		    		}
        		    }); 
        	    });  // 위로 버튼 클릭 이벤트

        	    // 아래로 버튼 클릭 이벤트
        	    $(document).on("click", ".ui-spinner-button.ui-spinner-down", function() {
        	        var row = $(this).closest("tr"); // 현재 행 찾기
        	        var pricetxt = row.find(".price").text(); // 가격 텍스트 가져오기
        	        var price = parseInt(pricetxt, 10); // 가격을 정수로 변환
        	        var count = row.find(".spinner").val(); // 스피너의 값을 가져오기
        	        count = parseInt(count, 10); // 수량을 정수로 변환
        	        var total = price * count; // 총 가격 계산
        	        row.find(".tPrice").text(total); // 총 가격을 표시
        	        
        	       
        	        
        	       // AJAX 요청으로 수량 업데이트
        	           var p_num = row.find(".pro_num").find(".a").val()
        	           
        	              console.log(p_num);
        	         $.ajax({
        		        url: '/product/onchange', // 서버에서 수량을 업데이트할 URL
        		        type: 'POST', // POST 요청
        		        data: {
        		          "p_num": p_num,
        		            "p_count": count 
        		        },
        		        success: function(data){
        		    	//alert(data);	
        		    	realTotal = total+2500;
        		    	 var str="";
            	str+= '<li><span class="title">상품 합계금액</span><span class="won"><strong>';
            	str+=	total;
            	str+=	'</strong> 원</span></li><li><span class="title">배송비</span><span class="won"><strong>2,500</strong> 원</span></li>	</ul>';  	
            	
            	var str2="";
            	str2+= '<li class="txt"><strong>결제 예정 금액</strong></li>';
            	str2+= '<li class="money"><span>';
            	str2+= realTotal;
            	str2+= '</span> 원</li>';
            	
            	$("#priceinfo").html(str)
            	$("#totalpriceinfo").html(str2)
        		    		},
        		    		error:function(){
        		    			alert("실패");
        		    		}
        		   
        		
        		    }); //ajax
        	    });  // 아래로 버튼 클릭 이벤트
         }
         
    	var str="";
    	str+= '<li><span class="title">상품 합계금액</span><span class="won"><strong>';
    	str+=	total;
    	str+=	'</strong> 원</span></li><li><span class="title">배송비</span><span class="won"><strong>2,500</strong> 원</span></li>	</ul>';  	
    	
    	var str2="";
    	str2+= '<li class="txt"><strong>결제 예정 금액</strong></li>';
    	str2+= '<li class="money"><span>';
    	str2+= realTotal;
    	str2+= '</span> 원</li>';
    	
    	$("#priceinfo").html(str)
    	$("#totalpriceinfo").html(str2)
    }
    
    window.deleteSelected = function() {
        var selectedIds = []; // 삭제할 항목의 ID를 저장할 배열

        $("input[name=order_check]:checked").each(function() {
            var id = $(this).closest('tr').data('id'); // 행의 데이터 속성에서 ID 가져오기
            selectedIds.push(id); // 배열에 ID 추가
        });

        if (selectedIds.length === 0) {
            alert("삭제할 항목을 선택하세요.");
            return;
        }

        // AJAX 요청
        $.ajax({
            url: '/product/cartdelete', // 삭제를 처리할 서버의 URL
            method:"post",
            contentType: 'application/json',
            data: JSON.stringify(selectedIds), // 선택된 ID 배열을 JSON 형태로 변환
            success: function(response) {
                // 성공적으로 삭제된 후 UI 업데이트
                $("input[name=order_check]:checked").each(function() {
                    $(this).closest('tr').remove(); // 선택된 항목의 행 삭제
                });
                updateButtonText(); // 버튼 텍스트 업데이트
                alert("선택된 항목이 삭제되었습니다.");
            },
            error: function(xhr, status, error) {
                alert("삭제 중 오류가 발생했습니다: " + error);
            }
        });
    };  // deleteSelected 
 
    // 초기 상태 업데이트
    updateButtonText();
});  // jquery
</script>


					<div class="btnArea">
						<div class="bRight">
							<ul>
							 <li id="agreeAll"><a class="selectbtn">전체선택</a></li>
                             <li id="disagreeAll" style="display:none;"><a class="selectbtn"> 전체선택 "취소"</a></li>
                             <li><a onclick="deleteSelected()" class="selectbtn2" style="cursor:pointer;">선택삭제</a></li>                             
                             
							</ul>
						</div>
					</div>
					<!-- //장바구니 상품 -->
					
<c:if test="${not empty list}">
					<!-- 총 주문금액 -->
					<div class="amount">
						<h4>총 주문금액</h4>
						<ul class="info" id="priceinfo">
							<li>
								<span class="title">상품 합계금액</span>
								<span class="won"><strong>0</strong> 원</span>
							</li>
							<li>
								<span class="title">배송비</span>
								<span class="won"><strong>2,500</strong> 원</span>
							</li>
						</ul>
						<ul class="total" id="totalpriceinfo">
							<li class="txt"><strong>결제 예정 금액</strong></li>
							<li class="money"><span>2500</span> 원</li>
						</ul>
					</div>
					<!-- //총 주문금액 -->
</c:if>

<script type="text/javascript">
function selectBuy() {   // 선택 상품 주문하기
	

	$.ajax({
		url:"/payment/defalt0",
		method:"post",
		data:{},
		success: function(data){
		//alert(data);	
		},
		error:function(){
			alert("실패");
		}
		});  //ajax
	
	
    var selectedItems = []; // 주문할 항목의 정보를 저장할 배열
    $("input[name=order_check]:checked").each(function() {
        var id = $(this).closest('tr').data('id'); // 상품 ID 가져오기
        var count = $(this).closest('tr').find('.spinner').val(); // 수량 가져오기
        var userSeq = $(this).closest('tr').find('.store_seq').val(); // user_seq 가져오기
        selectedItems.push({ p_num: id, count: count,user_seq:userSeq }); // 객체로 저장
    });

    if (selectedItems.length === 0) {
        alert("주문할 항목을 선택하세요.");
        return;
    }
    
 // 모든 선택된 상품의 user_seq를 확인
    if (selectedItems.length > 0) {
        var firstUserSeq = selectedItems[0].user_seq; // 첫 번째 user_seq 가져오기
        for (var i = 1; i < selectedItems.length; i++) {
            if (selectedItems[i].user_seq !== firstUserSeq) {
                alert("동일한 약국의 상품들로 선택해주세요.");
                return;
            }
        }
    }

 // 선택된 상품의 p_num을 배열로 준비
    var p_nums = selectedItems.map(item => item.p_num);

  $.ajax({
		url:"/payment/updatestate",
		method:"post",
		data:{ "p_nums": p_nums }, 
		success: function(data){
		location.href="/payment/payment2";
		},
		error:function(){
			alert("실패");
		}
		});  //ajax 

}
</script>
					<div class="cartarea">
						<ul>
							<li><a onclick="selectBuy()" class="ty1" id="orderSelected" style="cursor:pointer;">선택상품 <span>주문하기</span></a></li>
							<li class="last"><a href="/index" class="ty3">쇼핑 <span>계속하기</span></a></li>
						</ul>
					</div>

				<!-- //장바구니에 상품이 있을경우 -->
				</div>
			</div>
			<!-- //contents -->


<script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<style type="text/css">
.ui-corner-all{border-bottom-right-radius:0 !important; border-bottom-left-radius:0 !important; border-top-left-radius:0 !important; border-top-right-radius:0 !important;}
.ui-widget-content{border:0;}
 .ui-spinner-input{width:44px; margin:0; border:1px #ddd solid; padding:2px 0 2px 5px; font-family:'Nanum Gothic' !important; font-size:12px !important;}
</style>

<script type="text/javascript">
$(function() {
	var spinner = $( ".spinner" ).spinner({ min: 1, max: 999 });
});
</script>



		</div>
	</div>
	<!-- //container -->
	<%@ include file="../footer/footer.jsp" %>