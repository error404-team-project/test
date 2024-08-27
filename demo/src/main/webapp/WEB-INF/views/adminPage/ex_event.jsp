<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

            <div class="card">
              <div class="card-header">
                <h3 class="card-title">이벤트 리스트</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                 <colgroup>
					<col width="8%"/>
					<col width="*" />
					<col width="10%"/>
					<col width="5%"/>
					<col width="5%"/>
					<col width="7%"/>
				</colgroup>
                  <thead>
                  <tr>
                    <th>게시글 번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>조회수</th>
                  	<th>선택</th>
                  	<th>전체 선택</th>
                  </tr>
                  </thead>
                  <tbody>
                  <!-- 반복 -->
                  <tr>
                    <td>1</td>
                    <td>제목입니다</td>
                    <td>admin</td>
                    <td>1</td>
                  	<td>
                  		<input type="checkbox">
                  	</td>
                  	<td>
                  		<input type="checkbox">
                  	</td>
                  </tr>
                  <!-- 반복 -->
                </table>
                <br>
         <nav aria-label="...">
  			<ul class="pagination">
    			<li class="page-item disabled">
     				<a class="page-link">이전페이지</a>
   	 		    </li>
    			<li class="page-item">
    				<a class="page-link" href="#">1</a>
    			</li>
   				<li class="page-item">
   					<a class="page-link" href="#">2</a>
   				</li>
    			<li class="page-item">
    				<a class="page-link" href="#">3</a>
    			</li>
    			<li class="page-item">
    				<a class="page-link" href="#">다음페이지</a>
    			</li>
 		    </ul>
		  </nav>
                <br>
            	<table>
             <tr>
             	<td>
            		<button type="button" class="btn btn-block btn-primary">글 작성</button>
             	</td>
             	<td>
             		<button type="button" class="btn btn-block btn-secondary">글 삭제</button>
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