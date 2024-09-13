<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="../https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="../https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
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
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!--   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 --><title>이벤트 관리페이지</title>
 <style>
 	tr{text-align:center;}
	.btn-block{width : 100px; height : 50px;}
</style>
</head>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
	<%@ include file="../header/admin_top.jsp" %>
	<h1>이벤트 관리</h1>
	 <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
<script>
$(document).ready(function() { // 기본으로 그려져있는것들
	var str = '';
	str += '<c:forEach var="e" items="${elist}">';
	str += '<input type="hidden" name="event_no" value="${e.event_no}">';
	str += '<tr class="up${e.event_no}">';
	str += '<td>${e.event_no}</td>';
	str += '<td><a href="/event/event_view?event_no=${e.event_no}">${e.event_title }</a></td>';
	str += '<td>${e.user.user_name}</td>';
	str += '<td>${e.event_hit}</td>';
	str += '<td><fmt:formatDate value="${e.event_start_date }" pattern="yyyy-MM-dd"/>';
	str += ' ~ <fmt:formatDate value="${e.event_end_date }" pattern="yyyy-MM-dd"/></td>';
	str += '<td>';
	str += '<input type="button" onclick="mBtn(${e.event_no})" class="btn btn-sm btn-primary" value="수정"> ';
	str += '<input type="button" onclick="dBtn(${e.event_no})" class="btn btn-sm btn-secondary" value="삭제">';
	str += '</td>';
	str += '</tr>';
	str += '</c:forEach>';
	$("#event").html(str);
	var page = '';
	page += '<c:if test="${epageDto.page>1 }"><li class="page-item disabled"><a class="page-link" href="/adminPage/ex_event?page=${epageDto.page-1}">이전페이지</a></li></c:if>';
	page += '<c:if test="${epageDto.page == 1 }"><li class="page-item"><a class="page-link">이전페이지</a></li></c:if>';
	page += '<c:forEach var="pN" begin="${epageDto.startPage}" end="${epageDto.endPage}" step="1">';
	page += '<c:if test="${pN != epageDto.page}"><li class="page-item"><a class="page-link" href="/adminPage/ex_event?page=${pN}">${pN}</a></li></c:if>';
	page += '<c:if test="${pN == epageDto.page}"><li class="page-item"><a class="page-link"><strong>${pN}</strong></a></li></c:if>';
	page += '</c:forEach>';
	page += '<c:if test="${epageDto.page<epageDto.maxPage }"><li class="page-item"><a class="page-link" href="/adminPage/ex_event?page=${epageDto.page+1}">다음페이지</a></li></c:if>';
	page += '<c:if test="${epageDto.page==epageDto.maxPage }"><li class="page-item"><a class="page-link">다음페이지</a></li></c:if>';
	$(".pagination").html(page);
});

function cbtn(){ // 카테고리 바뀔때 그릴것들
	if($("#eCate").val() == 1){
//		alert(1);
		var str = '';
		str += '<c:forEach var="e" items="${elist}">';
		str += '<input type="hidden" name="event_no" value="${e.event_no}">';
		str += '<tr class="up${e.event_no}">';
		str += '<td>${e.event_no}</td>';
		str += '<td><a href="/event/event_view?event_no=${e.event_no}">${e.event_title }</a></td>';
		str += '<td>${e.user.user_name}</td>';
		str += '<td>${e.event_hit}</td>';
		str += '<td><fmt:formatDate value="${e.event_start_date }" pattern="yyyy-MM-dd"/>';
		str += ' ~ <fmt:formatDate value="${e.event_end_date }" pattern="yyyy-MM-dd"/></td>';
		str += '<td>';
		str += '<input type="button" onclick="mBtn(${e.event_no})" class="btn btn-sm btn-primary" value="수정"> ';
		str += '<input type="button" onclick="dBtn(${e.event_no})" class="btn btn-sm btn-secondary" value="삭제">';
		str += '</td>';
		str += '</tr>';
		str += '</c:forEach>';
		$("#event").html(str);
		var page = '';
		page += '<c:if test="${epageDto.page>1 }"><li class="page-item disabled"><a class="page-link" href="/adminPage/ex_event?page=${epageDto.page-1}">이전페이지</a></li></c:if>';
		page += '<c:if test="${epageDto.page == 1 }"><li class="page-item"><a class="page-link">이전페이지</a></li></c:if>';
		page += '<c:forEach var="pN" begin="${epageDto.startPage}" end="${epageDto.endPage}" step="1">';
		page += '<c:if test="${pN != epageDto.page}"><li class="page-item"><a class="page-link" href="/adminPage/ex_event?page=${pN}">${pN}</a></li></c:if>';
		page += '<c:if test="${pN == epageDto.page}"><li class="page-item"><a class="page-link"><strong>${pN}</strong></a></li></c:if>';
		page += '</c:forEach>';
		page += '<c:if test="${epageDto.page<epageDto.maxPage }"><li class="page-item"><a class="page-link" href="/adminPage/ex_event?page=${epageDto.page+1}">다음페이지</a></li></c:if>';
		page += '<c:if test="${epageDto.page==epageDto.maxPage }"><li class="page-item"><a class="page-link">다음페이지</a></li></c:if>';
		$(".pagination").html(page);
	}
	if($("#eCate").val() == 2){
//		alert(2);
		var str = '';
		str += '<c:forEach var="f" items="${flist}">';
		str += '<input type="hidden" name="event_no" value="${f.event_no}">';
		str += '<tr class="up${f.event_no}">';
		str += '<td>${f.event_no}</td>';
		str += '<td>${f.event_title }</td>';
		str += '<td>${f.user.user_name}</td>';
		str += '<td>${f.event_hit}</td>';
		str += '<td><fmt:formatDate value="${f.event_start_date }" pattern="yyyy-MM-dd"/>';
		str += ' ~ <fmt:formatDate value="${f.event_end_date }" pattern="yyyy-MM-dd"/></td>';
		str += '<td>';
		str += '<input type="button" onclick="mBtn(${f.event_no})" class="btn btn-sm btn-primary" value="수정"> ';
		str += '<input type="button" onclick="dBtn(${f.event_no})" class="btn btn-sm btn-secondary" value="삭제">';
		str += '</td>';
		str += '</tr>';
		str += '</c:forEach>';
		$("#event").html(str);
		var page = '';
		page += '<c:if test="${fpageDto.page>1 }"><li class="page-item disabled"><a class="page-link" href="/adminPage/ex_event?page=${fpageDto.page-1}">이전페이지</a></li></c:if>';
		page += '<c:if test="${fpageDto.page == 1 }"><li class="page-item"><a class="page-link">이전페이지</a></li></c:if>';
		page += '<c:forEach var="pN" begin="${fpageDto.startPage}" end="${fpageDto.endPage}" step="1">';
		page += '<c:if test="${pN != fpageDto.page}"><li class="page-item"><a class="page-link" href="/adminPage/ex_event?page=${pN}">${pN}</a></li></c:if>';
		page += '<c:if test="${pN == fpageDto.page}"><li class="page-item"><a class="page-link"><strong>${pN}</strong></a></li></c:if>';
		page += '</c:forEach>';
		page += '<c:if test="${fpageDto.page<fpageDto.maxPage }"><li class="page-item"><a class="page-link" href="/adminPage/ex_event?page=${fpageDto.page+1}">다음페이지</a></li></c:if>';
		page += '<c:if test="${fpageDto.page==fpageDto.maxPage }"><li class="page-item"><a class="page-link">다음페이지</a></li></c:if>';
		$(".pagination").html(page);
	}
} // cbtn

 function dBtn(eno){
//	alert(eno);
	if(confirm("해당 이벤트를 삭제하시겠습니까?")){
		$.ajax({
			url : "/event/deleteE",
			data : {"event_no" : eno},
			method : "post",
			success : function(data){
				alert(data);
				$(".up"+eno).remove();
			},
			error : function(){
				alert("실패");
			}
		})// ajax
	}
} // dBtn 

function wBtn(){
	location.href="/event/event_write";
}

function mBtn(eno){
//	alert(eno);
	location.href="/event/event_modi?event_no="+eno;
}
</script>
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">이벤트 리스트</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <select id="eCate" onchange="cbtn()">
                	<option value="1" selected>진행중인 이벤트</option>
                	<option value="2">종료된 이벤트</option>
                </select>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                 <colgroup>
					<col width="8%"/>
					<col width="*" />
					<col width="10%"/>
					<col width="7%"/>
					<col width="10%"/>
					<col width="10%"/>
				</colgroup>
                  <thead>
                  <tr>
                     <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>조회수</th>
                  	<th>시작/종료일</th>
                  	<th>수정/삭제</th>
                  </tr>
                  </thead>
                  <tbody id="event">
                  <!-- 반복 -->
                </table>
                <br>
         <nav aria-label="...">
  			<ul class="pagination">
 		    </ul>
		  </nav>
                <br>
            	<table>
             <tr>
             	<td>
            		<button type="button" onclick="wBtn()" class="btn btn-block btn-primary">글 작성</button>
             	</td>
             </tr>
             </table>
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