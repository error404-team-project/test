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
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>공지사항 관리페이지</title>
<style>
	 tr{text-align:center;}
	 .btn-block{width : 100px; height : 50px;}
</style>
</head>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
	<%@ include file="../header/admin_top.jsp" %>
	<h1>공지사항 관리</h1>
	 <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">

            <div class="card">
              <div class="card-header">
                <h3 class="card-title">공지 리스트</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                   <colgroup>
					<col width="8%"/>
					<col width="*" />
					<col width="10%"/>
					<col width="10%"/>
					<col width="7%"/>
					<col width="10%"/>
				</colgroup>
<script>
function wBtn(){
	location.href="/customer/notice_write"
}

function mBtn(pno){
	if(confirm("해당 공지사항을 수정하시겠습니까?"))
	location.href="/customer/notice_modi?notice_no="+pno;
} // mBtn

function dBtn(pno){
	//alert("삭제누른번호"+notice_no);
	if(confirm("해당 공지사항을 삭제하시겠습니까?")){
		 $.ajax({
			url : "/adminPage/deleteNotice",
			data : {"notice_no" : pno},
			method : "post",
			success : function(data){
				alert(data);
				$(".up"+pno).remove();
			},
			error : function(){
				alert("실패");
			}
		});//ajax 
	} // if
} // dBtn
</script>
                  <thead>
                 <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>조회수</th>
                  	<th>작성일</th>
                  	<th>수정/삭제</th>
                  </tr>
                  </thead>
                  <tbody>
                  <!-- 반복 -->
                  <c:forEach var="n" items="${nlist}">
                  <tr class="up${n.notice_no}">
                    <td class="n_no${n.notice_no}">${n.notice_no}</td>
                    <td><a href="/customer/notice_view?notice_no=${n.notice_no}">${n.notice_title}</a></td>
                    <td>${n.user.user_name}</td>
                    <td>${n.notice_hit}</td>
                  	<td><fmt:formatDate value="${n.notice_date}" pattern="yyyy-MM-dd"/></td>
                  	<td>
                  		<input type="button" onclick="mBtn(${n.notice_no})" class="btn btn-sm btn-primary" value="수정"> 
                  		<input type="button" onclick="dBtn(${n.notice_no})" class="btn btn-sm btn-secondary" value="삭제">
                  	</td>
                  </tr>
                  </c:forEach>
                  <!-- 반복 -->
                </table>
                <br>
          <nav aria-label="...">
  			<ul class="pagination">
    			<c:if test="${pageDto.page>1 }">
    			<li class="page-item">
     				<a class="page-link" href="/adminPage/ex_notice?page=${pageDto.page-1}">이전페이지</a>
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
    				<a class="page-link" href="/adminPage/ex_notice?page=${pN}">${pN}</a>
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
    				<a class="page-link" href="/adminPage/ex_notice?page=${pageDto.page+1}">다음페이지</a>
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
             <table>
             <tr>
             	<td>
            		<button type="button" onclick="wBtn()" class="btn btn-block btn-primary">글 작성</button>
             	</td>
             </tr>
             </table>
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