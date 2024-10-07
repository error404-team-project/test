<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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

  <title>드론 등록</title>
</head>
<body class="hold-transition sidebar-mini" id="qwer" >
<%@ include file="../header/admin_top.jsp" %>

<script type="text/javascript">
function pWbtn() {
	

    var possible = $("#yesorno").val();
    var a = $("#weight").val();
    var b = $("#length").val();
    var c = $("#time").val();
    var d = $("#speed").val();

    // 값이 입력되었는지 확인
    if (possible === "" || possible == null) {
        alert("값을 입력해주세요.");
        return; // 유효하지 않은 경우 함수 종료
    } 
    
    // 입력값이 Y 또는 N인지 확인
    if (possible !== 'Y' && possible !== 'N' ) {
        alert("Y 또는 N만 입력할 수 있습니다.");
        return; // 유효하지 않은 경우 함수 종료
    }

    // 입력값이 number 타입인지 확인
    if (a === "" || !Number.isFinite(Number(a))) {
        alert("숫자만 입력할 수 있습니다.");
        return; // 유효하지 않은 경우 함수 종료
    }
    if (b === "" || !Number.isFinite(Number(b))) {
        alert("숫자만 입력할 수 있습니다.");
        return; // 유효하지 않은 경우 함수 종료
    }
    if (c === "" || !Number.isFinite(Number(c))) {
        alert("숫자만 입력할 수 있습니다.");
        return; // 유효하지 않은 경우 함수 종료
    }
    if (d === "" || !Number.isFinite(Number(d))) {
        alert("숫자만 입력할 수 있습니다.");
        return; // 유효하지 않은 경우 함수 종료
    }

   
        if (confirm("상품정보를 DB에 저장하시겠습니까?")) {
            pFrm.submit();
        }
   // pWbtn 함수를 호출할 버튼에 이벤트 추가
    $("#pbtn").on("click", pWbtn); // 버튼 ID는 실제 ID로 변경하세요. 
    }


</script>

    <!-- Main content -->
    <h1>드론 등록</h1>
    <form action="/adminPage/drone_write" name="pFrm" method="post" enctype="multipart/form-data">
    <input type="hidden" name="user_seq" value="${sessionSeq}">
    <section class="content">
      <div class="row">
        <div class="col-md-6">
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">드론 정보</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="card-body">
              <div class="form-group">
                <label for="name">드론 아이디</label>
                <input type="text" name ="name" id="name" class="form-control">
              </div>
              <br/>
              <div class="form-group">
                <label for="price">드론 이미지</label>
                <input type="file" name="image" id="image" class="form-control">
              </div>
              <br>
              <div class="form-group">
                <label for="company">적재 가능 무게(number)</label>
                <input type="text" name="weight" id="weight" class="form-control">
              </div>
              <div class="form-group">
                <label for="price">비행 거리(number)</label>
                <input type="text" name="length" id="length" class="form-control">
              </div>
              <div class="form-group">
                <label for="row_material">속도(number)</label>
                <input type="text" name="speed" id="speed" class="form-control">
              </div>
               <div class="form-group">
                <label for="description">배송 가능 여부 (Y or N)</label>
                <input type="text" name="yesorno" id="yesorno" class="form-control">
              </div>
               <div class="form-group">
                <label for="howuse">비행 가능 시간(number)</label>
                <input type="text" name="time" id="time" class="form-control">
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
          <a onclick="pWbtn()" class="btn btn-success float-right" id="pbtn">드론 정보 등록하기</a>
        </div>
      </div>
      </form>
    </section>

    <!-- /.content -->
<%@ include file="../footer/admin_foot.jsp" %>
</body>
</html>

