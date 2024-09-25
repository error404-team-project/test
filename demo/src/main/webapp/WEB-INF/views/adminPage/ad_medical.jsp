<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="../plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="../plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="../plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/adminlte.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="../plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="../plugins/summernote/summernote-bs4.min.css">
<title>상품 주문,관리 관리페이지</title>
<style>
	 .btn-block{width : 100px; height : 50px;}
</style>
</head>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
	<%@ include file="../header/admin_top.jsp" %> 
	<h1>의약품 재고관리</h1>
	 <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
<script>
var hCate = ["오메가3","비타민","유산균","비오틴","루테인/자이잔틴","밀크씨슬/실리마린","프로폴리스","가르시니아/잔티젠","녹차추출물/카테킨","콜라겐","글루코사민/MSM","칼슘/마그네슘","아연/철분","모나콜린K","마카/쏘팔메토","아르기닌","포스파티딜","옥타코사놀/폴리코사놀","스피루라나","글루타치온","기타건강식품"];
var mCate = ["항생제","소화제","비염","진통/소염제","항바이러스제","항염증제","연고","밴드"];
$(document).ready(function() {
	var str = '';
	str += '<option selected value="0">선택하세요</option>';
	for(let i = 0; i < mCate.length; i++){
		if(${medical_category} == i+1){
			str += '<option value="'+(i+1)+'" selected >'+mCate[i]+'</option>';
		} else {
			str += '<option value="'+(i+1)+'">'+mCate[i]+'</option>';
		}
	}
	$("#pCateDt").html(str);
});
function cbtn(){
	var medical_category = $("#pCateDt").val();
	var store_seq = $("#store_seq").val();
	location.href="/adminPage/ad_medical?medical_category="+medical_category+"&store_seq="+store_seq+"";
}

function sbtn(pno){
	var p_num = $(".p_num"+pno).val();
	var price = $(".price"+pno).val();
	var stock = $(".stock"+pno).val();
//	alert($(".p_num"+pno).val()+"  "+$(".price"+pno).val()+"   "+$(".stock"+pno).val());
	$.ajax({
		url : "/adminPage/modi_medi",
		method : "post",
		data : {"p_num" : p_num,
				"price" : price,
				"stock" : stock},
		success : function(data){
			console.log(data);
			var str = '';
			str += '<td>'+data.p_num+'</td>';
			str += '<td>'+data.medical_category+'</td>';
			str += '<td>'+data.name+'</td>';
			str += '<td>'+data.company+'</td>';
			str += '<td><input type="number" name="price" class="price'+pno+'" value="'+data.price+'" /></td>';
			str += '<td><input type="number" name="stock" class="stock'+pno+'" value="'+data.stock+'" /></td>';
			str += '<td>'+data.p_count+'</td>';
			str += '<td>';
			str += '<input type="button" onclick="sbtn('+pno+')" class="btn btn-sm btn-primary" value="저장"> ';
			str += '<input type="button" onclick="dbtn('+pno+')" class="btn btn-sm btn-secondary" value="삭제">';
			str += '</td>';
			$(".up"+pno).html(str) 
			alert("변경 저장되었습니다.");
		},
		error : function(){
			alert("실패");
		}
	})// ajax
}

function dbtn(pno){
	var p_num = $(".p_num"+pno).val();
	$.ajax({
		url : "/adminPage/deleteP",
		data : {"p_num" : p_num},
		method : "post",
		success : function(data){
			alert(data);
			$(".up"+pno).remove();
		},
		error : function(){
			alert("실패");
		}
	})// ajax
} // dbtn

function schBtn(){
//	alert($("#sWord").val());
	sFrm.submit();
}
</script>
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">의약품 리스트</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <form action="/adminPage/ad_medical" name="sFrm" method="get">
            <input type="hidden" name="store_seq" id="store_seq" value="${sessionSeq}">
                <select id="pCateDt" name="medical_category" onchange="cbtn()">
                </select>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="text" name="sWord" id="sWord" >
    		<a onclick="schBtn()"><img src="../images/btn/btn_search.gif" alt="검색" /></a>
            </form>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                   <colgroup>
					<col width="5%"/>
					<col width="10%" />
					<col width="20%"/>
					<col width="20%"/>
					<col width="5%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
				</colgroup>
                  <thead>
                 <tr>
                    <th><a href="#">번호</a></th>
					<th><a href="#">상품 카테고리</a></th>
					<th><a href="#">상품 이름</a></th>
					<th><a href="#">상품 제조사</a></th>
					<th><a href="#">상품 가격</a></th>
					<th><a href="#">상품 재고</a></th>
					<th><a href="#">판매량</a></th>
					<th><a href="#">수정/삭제</a></th>
                  </tr>
                  </thead>
                  <tbody id="category">
                  <!-- 반복 -->
                 <c:forEach var="l" items="${mCList}">
                 <input type="hidden" name="p_num" class="p_num${l.p_num}" value="${l.p_num}">
                  <tr class="up${l.p_num}">
                    <td>${l.p_num }</td>
                    <td>${l.medical_category}</td>
                    <td>${l.name }</td>
                    <td>${l.company }</td>
                  	<td><input type="number" name="price" class="price${l.p_num}" value="${l.price }" /></td>
                  	<td><input type="number" name="stock" class="stock${l.p_num}" value="${l.stock }" /></td>
                  	<td>${l.p_count}</td>
                  	<td>
                  		<input type="button" onclick="sbtn(${l.p_num })" class="btn btn-sm btn-primary" value="저장"> 
                  		<input type="button" onclick="dbtn(${l.p_num })" class="btn btn-sm btn-secondary" value="삭제">
                  	</td>
                  </tr>
            	 </c:forEach>
                  <!-- 반복 -->
                </table>
          <nav aria-label="...">
  			<ul class="pagination">
  			<c:if test="${pageDto.page>1 }">
    			<li class="page-item">
     				<a class="page-link" href="/adminPage/ad_medical?page=${pageDto.page-1}&medical_category=${medical_category}&sWord=${sWord}&store_seq=${sessionSeq}">이전페이지</a>
   	 		    </li>
  			</c:if>
  			<c:if test="${pageDto.page == 1 }">
    			<li class="page-item">
     				<a class="page-link">이전페이지</a>
   	 		    </li>
  			</c:if>
  			
   	 		<!-- 페이지 넘버링 -->
   	 		<c:forEach var="pN" begin="${pageDto.startPage}" end="${pageDto.endPage}" step="1">
    		<c:if test="${pN != pageDto.page}">
    			<li class="page-item">
    				<a class="page-link" href="/adminPage/ad_medical?page=${pN}&medical_category=${medical_category}&sWord=${sWord}&store_seq=${sessionSeq}">${pN}</a>
    			</li>
    		</c:if>
    		<c:if test="${pN == pageDto.page}">
    			<li class="page-item">
    				<a class="page-link"><strong>${pN}</strong></a>
    			</li>
    		</c:if>
   	 		</c:forEach>
   	 		<!-- 페이지 넘버링 -->
   	 		
    		<c:if test="${pageDto.page<pageDto.maxPage }">
    			<li class="page-item">
    				<a class="page-link" href="/adminPage/ad_medical?page=${pageDto.page+1}&medical_category=${medical_category}&sWord=${sWord}&store_seq=${sessionSeq}">다음페이지</a>
    			</li>
    		</c:if>	
    		<c:if test="${pageDto.page==pageDto.maxPage }">
    			<li class="page-item">
    				<a class="page-link">다음페이지</a>
    			</li>
    		</c:if>
 		    </ul>
		  </nav>
                <br>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<%@ include file="../footer/admin_foot.jsp" %>
</body>
</html>