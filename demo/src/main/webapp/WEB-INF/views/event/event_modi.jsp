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
function mBtn(){
	if(confirm("이벤트를 수정하시겠습니까?")){
		eFrm.submit();
		alert("이벤트가 수정되었습니다.");
	}
}
</script>

    <!-- Main content -->
    <h1 style="text-align:center;">이벤트 수정</h1>
    <form action="/event/event_modi" name="eFrm" method="post" enctype="multipart/form-data">
    <input type="hidden" name="user_seq" id="user_seq" value="${sessionSeq}">
    <input type="hidden" name="event_no" id="event_no" value="${e.event_no}">
    <section class="content">
      <div class="row">
        <div class="col-md-6" style="margin : 0 auto;" >
          <div class="card card-primary" >
            <div class="card-header">
              <h3 class="card-title">이벤트 정보</h3>
              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="card-body">
              <div class="form-group">
                <label for="event_title">이벤트 제목</label>
                <input type="text" name ="event_title" id="event_title" value="${e.event_title}" class="form-control">
              </div>
              <div class="form-group">
                <label for="event_content">이벤트 내용</label>
                <textarea name="event_content" id="event_content" class="form-control" rows="4">${e.event_content}</textarea>
              </div>
              <br/>
              <!-- 이벤트 이미지가 없으면 아무것도 보여주지 않음 -->
              <c:if test="${e.event_image == null || e.event_image == '' }">
              </c:if>
              <!-- 이벤트 이미지가 존재하면 보여줌 -->
              <c:if test="${e.event_image != null || e.event_image != '' }">
              	<label>등록된 이벤트 이미지</label>
              	<div class="viewContents">
              		${e.event_image }
					<input type="hidden" name="event_image" value="${e.event_image}">              		
					<img src="../image/${e.event_image}" alt="" style="width:100%;" />
				</div>
				<br><br>
              </c:if>
              <div class="form-group">
                <label for="file">등록할 이벤트 이미지</label>
                <input type="file" name="file" id="file" class="form-control">
              </div>
              <div class="form-group">
                <label for="price">이벤트 시작일</label>
                <input type="date" name="event_start" id="event_start" value="${start_date }" class="form-control">
              </div>
              <div class="form-group">
                <label for="event_end_date">이벤트 종료일</label>
                <input type="date" name="event_end" id="event_end" value="${end_date }" class="form-control">
              </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
      <div class="row">
        <div class="col-12">
          <a href="javascript:history.back();" class="btn btn-secondary">취소</a>
          <input onclick="mBtn()" value="이벤트 수정하기" class="btn btn-primary">
        </div>
      </div>
      </div>
      </form>
    </section>
    <!-- /.content -->
<%@ include file="../footer/admin_foot.jsp" %>
</body>
</html>

