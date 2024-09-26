<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
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

  <title>상품등록</title>
</head>
<body class="hold-transition sidebar-mini">
<%@ include file="../header/admin_top.jsp" %>

<script>
var hCate = ["오메가3","비타민","유산균","비오틴","루테인/자이잔틴","밀크씨슬/실리마린","프로폴리스","가르시니아/잔티젠","녹차추출물/카테킨","콜라겐","글루코사민/MSM","칼슘/마그네슘","아연/철분","모나콜린K","마카/쏘팔메토","아르기닌","포스파티딜","옥타코사놀/폴리코사놀","스피루라나","글루타치온","기타건강식품"];
var mCate = ["항생제","소화제","비염","진통/소염제","항바이러스제","항염증제","연고","밴드"];
function pct(){
	console.log($("#product_category").val() );
	if($("#product_category").val() == '1'){
		var str= '';
		str += '<label for="medical_category">의약품 카테고리</label>';
		str += '<select name="medical_category" id="medical_category" class="form-control custom-select" onchange="cbtn()">';
		str += '<option selected disabled>선택하세요</option>';
		for(let i = 0; i < mCate.length; i++){
			str += '<option value="'+(i+1)+'">'+mCate[i]+'</option>';
		}
		str += '</select>';
		$(".categories").html(str);
	}
	if($("#product_category").val() == '2'){
		var str= '';
		str += '<label for="health_category">건강기능식품 카테고리</label>';
		str += '<select name="health_category" id="health_category" class="form-control custom-select" onchange="cbtn()">';
		str += '<option selected disabled>선택하세요</option>';
		for(let i = 0; i < hCate.length; i++){
			str += '<option value="'+(i+1)+'">'+hCate[i]+'</option>';
		}
		str += '</select>';
		$(".categories").html(str);
	} 
} // pct
function cbtn(){
	if($("#product_category").val() == '1'){
		console.log($("#medical_category").val());
	} else {
		console.log($("#health_category").val());
	}
}
function pWbtn(){
	if(confirm("상품정보를 DB에 저장하시겠습니까?")){
		pFrm.submit();
	}
}
</script>

    <!-- Main content -->
    <h1>상품 등록</h1>
    <form action="/adminPage/product_write" name="pFrm" method="post" enctype="multipart/form-data">
    <input type="hidden" name="user_seq" value="${sessionSeq}">
    <section class="content">
      <div class="row">
        <div class="col-md-6">
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">상품정보</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="card-body">
              <div class="form-group">
                <label for="name">제품명</label>
                <input type="text" name ="name" id="name" class="form-control">
              </div>
              <div class="form-group">
                <label for="product_category">상품 카테고리</label>
                <select name="product_category" id="product_category" onchange="pct()" class="form-control custom-select">
                  <option selected disabled>선택하세요</option>
                  <option value="1">의약품</option>
                  <option value="2">건강기능식품</option>
                </select>
              </div>
              <div class="categories">
              </div>
              <br/>
              <div class="form-group">
                <label for="company">상품 제조사</label>
                <input type="text" name="company" id="company" class="form-control">
              </div>
              <div class="form-group">
                <label for="price">상품 가격</label>
                <input type="text" name="price" id="price" class="form-control">
              </div>
              <div class="form-group">
                <label for="price">상품 이미지</label>
                <input type="file" name="pimage" id="pimage" class="form-control">
              </div>
              <div class="form-group">
                <label for="row_material">원료/성분</label>
                <input type="text" name="row_material" id="row_material" class="form-control">
              </div>
               <div class="form-group">
                <label for="description">제품설명</label>
                <textarea name="description" id="description" class="form-control" rows="4"></textarea>
              </div>
               <div class="form-group">
                <label for="howuse">사용방법</label>
                <textarea name="howuse" id="howuse" class="form-control" rows="4"></textarea>
              </div>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <div class="col-md-6">
          <div class="card card-secondary">
            <div class="card-header">
              <h3 class="card-title">　</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="card-body">
               <div class="form-group">
                <label for="side_effects">부작용</label>
                <textarea name="side_effects" id="side_effects" class="form-control" rows="4"></textarea>
              </div>
              <div class="form-group">
                <label for="precautions">주의사항</label>
                <textarea id="precautions" name="precautions" class="form-control" rows="4"></textarea>
              </div>
              <div class="form-group">
                <label for="becareful">주의할 약 / 음식</label>
                <textarea id="becareful" name="becareful" class="form-control" rows="4"></textarea>
              </div>
              <div class="form-group">
                <label for="storage">보관방법</label>
                <textarea id="storage" name="storage" class="form-control" rows="4"></textarea>
              </div>
              <div class="form-group">
                <label for="stock">재고수량</label>
                <input type="number" name ="stock" id="stock" class="form-control">
              </div>
              <div class="form-group">
                <label for="weight">무게</label>
                <input type="number" name ="weight" id="weight" class="form-control">
              </div>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
      </div>
      <div class="row">
        <div class="col-12">
          <a href="javascript:history.back();" class="btn btn-secondary">취소</a>
          <input onclick="pWbtn()" value="상품정보 등록하기" class="btn btn-success float-right">
        </div>
      </div>
      </form>
    </section>
    <!-- /.content -->
<%@ include file="../footer/admin_foot.jsp" %>
</body>
</html>

