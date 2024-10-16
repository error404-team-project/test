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
<title>반품 관리페이지</title>
<style>
	 tr{text-align:center;}
	 .btn-block{width : 100px; height : 50px;}
</style>
</head>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
	<%@ include file="../header/admin_top.jsp" %>
	<h1 style="text-align: center; " >반품 관리</h1>
	 <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">

            <div class="card">
              <div class="card-header">
                <h3 class="card-title">반품 리스트</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                   <colgroup>
					<col width="10%"/>
					<col width="10%"/>
					<col width="*" />
					<col width="10%"/>
					<col width="10%"/>
				</colgroup>
				<script>
function dBtn(pno){

location.href="/adminPage/return_check?return_no="+pno;
	/* 	 $.ajax({
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

			*/
} // dBtn
</script>
                  <thead>
								<th scope="col">반품 요청일자 </th>
								<th scope="col">반품 번호 </th>
								<th scope="col">상품명</th>
								<th scope="col">반품상태</th>
								<th scope="col">반품처리</th>
								
							</thead>
                  <tbody>
                  <!-- 반복 -->
                  <c:forEach var="return1" items="${list}">
                  <tr class="up${return1.return_no}">
                  	<td><fmt:formatDate value="${return1.request_date }" pattern="yyyy년 MM월 dd일"/></td>
                  	<td>${return1.return_no}</td>
                    <td>${return1.product.name}</td>
                   <td>	${return1.return_state}</td>
                  
                 	<td>
                  		<input type="button" onclick="dBtn('${return1.return_no}' )" class="btn btn-sm btn-secondary" value="반품 요청 확인">
                  	</td>
                  </tr>
                  </c:forEach>
                  <!-- 반복 -->
                </table>
                <br>
          	<!-- 페이징이동1 -->
						<div class="allPageMoving1">

						<a href="#" class="n"><img src="../images/btn/btn_pre2.gif" alt="처음으로"/></a><a href="#" class="pre"><img src="../images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
							<c:forEach var="num" begin="${pageDto.startPage }" 
											end="${pageDto.maxPage }" step="1">
						<c:if test="${num != pageDto.page }">
							<a href="/mypage/inquiry?page=${num }">${num}</a>
						</c:if>
						<c:if test="${num == pageDto.page }">
							<strong>${num }</strong>
						</c:if>
					</c:forEach>
						<a href="#" class="next"><img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/></a><a href="#" class="n"><img src="../images/btn/btn_next2.gif" alt="마지막페이지로"/></a>

						</div>
						<!-- //페이징이동1 -->
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