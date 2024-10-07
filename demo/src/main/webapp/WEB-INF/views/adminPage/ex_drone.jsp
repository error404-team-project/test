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
<title>드론 관리페이지</title>
<style>
	 .btn-block{width : 100px; height : 50px;}
</style>
</head>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
	<%@ include file="../header/admin_top.jsp" %> 
	<h1>드론 재고관리</h1>
	 <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
<script type="text/javascript">
function sbtn() {
    var possible = $("#ssi").val();

    // 입력값이 Y 또는 N인지 확인
    if (possible !== 'Y' && possible !== 'N') {
        alert("Y 또는 N만 입력할 수 있습니다.");
        return; // 유효하지 않은 경우 함수 종료
    }
   
   $.ajax({
        url: "/adminPage/updatedrone",
        data: {"is_possible": possible,"drone_id":$("#name").val()},
        method: "post",
        success: function(data) {
            alert("변경 완료");
        },
        error: function() {
            alert("실패");
        }
    }); // ajax
} // sbtn
</script>
<script type="text/javascript">
function dbtn(){
	alert("정말 삭제하시겠습까?");
	  $.ajax({
	        url: "/adminPage/deletedrone",
	        data: {"drone_id":$("#name").val()},
	        method: "post",
	        success: function(data) {
	            $(".up").remove();
	            alert("삭제 완료");
	        },
	        error: function() {
	            alert("실패");
	        }
	    }); // ajax
} // dbtn
$(".up").remove();
</script>
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">드론 리스트</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                 <tr  style="text-align: center;">
                    <th><a href="#">드론 이름</a></th>
					<th><a href="#">드론 적재 가능중량</a></th>
					<th><a href="#">드론 속도</a></th>
					<th><a href="#">드론 사진</a></th>
					<th><a href="#">배송 가능여부 (Y or N)</a></th>
					<th><a href="#">비행 가능시간</a></th>
					<th><a href="#">수정/삭제</a></th>
                  </tr>
                  </thead>
                  <tbody id="category"> 
                  <!-- 반복 -->
                 <c:forEach var="d" items="${list}">
                    	<input type="hidden" value="${d.drone_id }" id="name" >
                  <tr class="up">
                    <td>${d.drone_id }</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    ${d.drone_weight }kg</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    ${d.drone_speed }km/h</td>
                  	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  	<img src="../image/${d.drone_image}"  style="width:120px; height:50px; margin:0 auto;"></td>
                  	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  	<input type="text" value="${d.is_possible}" id="ssi" style="width: 100px; text-align: center; ">
                  	</td>
                  	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  	${d.drone_time}분</td>
                  	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  		<input type="button" onclick="sbtn()" class="btn btn-sm btn-primary" value="저장"> 
                  		<input type="button" onclick="dbtn()" class="btn btn-sm btn-secondary" value="삭제">
                  	</td>
                  </tr>
            	 </c:forEach>
                  <!-- 반복 -->
                </table>
      
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