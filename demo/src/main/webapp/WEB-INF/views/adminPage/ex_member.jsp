<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>회원정보 관리</title>
 <style>
 	tr{text-align:center;}
	.btn-block{width : 100px; height : 60px;}
	.btn-primary{width : 100px; height : 60px;}
</style>
</head>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
	<%@ include file="../header/admin_top.jsp" %>
	 <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">

<script>
function cate(){
	if($("#cate").val() == 1){
		var str = '';
		str += '<c:forEach var="u" items="${uList}">';
		str += '<tr><td>${u.user_seq}</td>';
		str += '<td>${u.user_id}</td>';
		str += '<td>${u.user_name}</td>';
		str += '<td>${u.user_email}</td>';
		str += '<td>${u.user_phone}</td>';
		str += '<td><fmt:formatDate value="${u.user_joindate}" pattern="yyyy-MM-dd"/></td>';
		str += '<td><fmt:formatDate value="${u.login_date}" pattern="yyyy-MM-dd"/></td>';
		str += '<td>${u.mkt_agree}</td>';
		if(${u.auth_id == 'store' && u.approval == 'N'}){
			str += '<td>';
			str += '<input type="button" onclick="mBtn(${e.event_no})" style="width:46px; height:31px;" class="btn btn-sm btn-primary" value="승인"> ';
			str += '<input type="button" onclick="dBtn(${e.event_no})" class="btn btn-sm btn-secondary" value="삭제">';
			str += '</td></tr>';
		} else {
			str += '<td><button type="button" onclick="dBtn()" class="btn btn-sm btn-secondary">탈퇴</button></td> </tr>';
		}
		str += '</c:forEach>';
		$("#chageUser").html(str);
		var page = '';
		page += '<c:if test="${upageDto.page>1 }"><li class="page-item disabled"><a class="page-link" href="/adminPage/ex_member?page=${upageDto.page-1}">이전페이지</a></li></c:if>';
		page += '<c:if test="${upageDto.page == 1 }"><li class="page-item"><a class="page-link">이전페이지</a></li></c:if>';
		page += '<c:forEach var="pN" begin="${upageDto.startPage}" end="${npageDto.endPage}" step="1">';
		page += '<c:if test="${pN != upageDto.page}"><li class="page-item"><a class="page-link" href="/adminPage/ex_member?page=${pN}">${pN}</a></li></c:if>';
		page += '<c:if test="${pN == upageDto.page}"><li class="page-item"><a class="page-link"><strong>${pN}</strong></a></li></c:if>';
		page += '</c:forEach>';
		page += '<c:if test="${upageDto.page<upageDto.maxPage }"><li class="page-item"><a class="page-link" href="/adminPage/ex_member?page=${upageDto.page+1}">다음페이지</a></li></c:if>';
		page += '<c:if test="${upageDto.page==upageDto.maxPage }"><li class="page-item"><a class="page-link">다음페이지</a></li></c:if>';
		$(".pagination").html(page);
        
         
	}
	if($("#cate").val() == 2){
		var str = '';
		str += '<c:forEach var="u" items="${nList}">';
		str += '<tr><td>${u.user_seq}</td>';
		str += '<td>${u.user_id}</td>';
		str += '<td>${u.user_name}</td>';
		str += '<td>${u.user_email}</td>';
		str += '<td>${u.user_phone}</td>';
		str += '<td><fmt:formatDate value="${u.user_joindate}" pattern="yyyy-MM-dd"/></td>';
		str += '<td><fmt:formatDate value="${u.login_date}" pattern="yyyy-MM-dd"/></td>';
		str += '<td>${u.mkt_agree}</td>';
		str += '<td><button type="button" onclick="dBtn()" class="btn btn-sm btn-secondary">탈퇴</button></td> </tr></c:forEach>';
		$("#chageUser").html(str);
		var page = '';
		page += '<c:if test="${npageDto.page>1 }"><li class="page-item disabled"><a class="page-link" href="/adminPage/ex_event?page=${npageDto.page-1}">이전페이지</a></li></c:if>';
		page += '<c:if test="${npageDto.page == 1 }"><li class="page-item"><a class="page-link">이전페이지</a></li></c:if>';
		page += '<c:forEach var="pN" begin="${npageDto.startPage}" end="${npageDto.endPage}" step="1">';
		page += '<c:if test="${pN != npageDto.page}"><li class="page-item"><a class="page-link" href="/adminPage/ex_event?page=${pN}">${pN}</a></li></c:if>';
		page += '<c:if test="${pN == npageDto.page}"><li class="page-item"><a class="page-link"><strong>${pN}</strong></a></li></c:if>';
		page += '</c:forEach>';
		page += '<c:if test="${npageDto.page<npageDto.maxPage }"><li class="page-item"><a class="page-link" href="/adminPage/ex_event?page=${npageDto.page+1}">다음페이지</a></li></c:if>';
		page += '<c:if test="${npageDto.page==npageDto.maxPage }"><li class="page-item"><a class="page-link">다음페이지</a></li></c:if>';
		$(".pagination").html(page);
	}
	if($("#cate").val() == 3){
		var str = '';
		str += '<c:forEach var="u" items="${sList}">';
		str += '<tr><td>${u.user_seq}</td>';
		str += '<td>${u.user_id}</td>';
		str += '<td>${u.user_name}</td>';
		str += '<td>${u.user_email}</td>';
		str += '<td>${u.user_phone}</td>';
		str += '<td><fmt:formatDate value="${u.user_joindate}" pattern="yyyy-MM-dd"/></td>';
		str += '<td><fmt:formatDate value="${u.login_date}" pattern="yyyy-MM-dd"/></td>';
		str += '<td>${u.mkt_agree}</td>';
		str += '<td>';
		if(${u.approval == 'N'}){
			str += '<input type="button" onclick="jBtn()" style="width:46px; height:31px;" class="btn btn-sm btn-primary" value="승인"> ';
		}
		str += '<input type="button" onclick="dBtn()" class="btn btn-sm btn-secondary" value="삭제">';
		str += '</td></tr></c:forEach>';
		$("#chageUser").html(str);
		var page = '';
		page += '<c:if test="${spageDto.page>1 }"><li class="page-item disabled"><a class="page-link" href="/adminPage/ex_event?page=${spageDto.page-1}">이전페이지</a></li></c:if>';
		page += '<c:if test="${spageDto.page == 1 }"><li class="page-item"><a class="page-link">이전페이지</a></li></c:if>';
		page += '<c:forEach var="pN" begin="${spageDto.startPage}" end="${spageDto.endPage}" step="1">';
		page += '<c:if test="${pN != spageDto.page}"><li class="page-item"><a class="page-link" href="/adminPage/ex_event?page=${pN}">${pN}</a></li></c:if>';
		page += '<c:if test="${pN == spageDto.page}"><li class="page-item"><a class="page-link"><strong>${pN}</strong></a></li></c:if>';
		page += '</c:forEach>';
		page += '<c:if test="${spageDto.page<spageDto.maxPage }"><li class="page-item"><a class="page-link" href="/adminPage/ex_event?page=${spageDto.page+1}">다음페이지</a></li></c:if>';
		page += '<c:if test="${spageDto.page==spageDto.maxPage }"><li class="page-item"><a class="page-link">다음페이지</a></li></c:if>';
		$(".pagination").html(page);
	}
}
function jBtn(uno){
	//alert(uno);
	location.href="/adminPage/store_approval?user_seq="+uno;
}
</script>


            <div class="card">
              <div class="card-header">
                <h3 class="card-title">회원정보 리스트</h3>
                <select style="margin :0 0 0 60px;" id="cate" onchange="cate()">
                	<option value="1" selected>전체회원보기</option>
                	<option value="2">일반회원보기</option>
                	<option value="3">사업자회원보기</option>
                </select>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                 <colgroup>
					<col width="6%"/>
					<col width="7%"/>
					<col width="7%"/>
					<col width="*"/>
					<col width="10%"/>
					<col width="7%"/>
					<col width="8%"/>
					<col width="7%"/>
					<col width="10%"/>
				</colgroup>
                  <thead>
                  <tr>
                    <th>회원번호</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>이메일</th>
                  	<th>전화번호</th>
                  	<th>가입일</th>
                  	<th>마지막 로그인</th>
                  	<th>마케팅 동의</th>
                  	<th>가입승인/탈퇴처리</th>
                  </tr>
                  </thead>
                  <tbody id="chageUser">
                  <!-- 반복 -->
                  <c:forEach var="u" items="${uList}">
                  <tr>
                    <td>${u.user_seq}</td>
                    <td>${u.user_id}</td>
                    <td>${u.user_name}</td>
                    <td>${u.user_email}</td>
                  	<td>${u.user_phone}</td>
                  	<td><fmt:formatDate value="${u.user_joindate}" pattern="yyyy-MM-dd"/></td>
                  	<td><fmt:formatDate value="${u.login_date}" pattern="yyyy-MM-dd"/></td>
                  	<td>${u.mkt_agree}</td>
                  	<c:if test="${u.auth_id == 'store' && u.approval == 'N' }">
                  	<td>
                  	<input type="button" onclick="jBtn(${u.user_seq})" style="width:46px; height:31px;" class="btn btn-sm btn-primary" value="승인">
                  	<button type="button" class="btn btn-sm btn-secondary">탈퇴</button>
                  	</td>
                  	</c:if>
                  	<c:if test="${u.auth_id == 'store' && u.approval == 'Y' }">
                  	<td>
                  	<button type="button" class="btn btn-sm btn-secondary">탈퇴</button>
                  	</td>
                  	</c:if>
                  	<c:if test="${u.auth_id == 'user'||u.auth_id == 'admin' }">
                  	<td>
                  	<button type="button" class="btn btn-sm btn-secondary">탈퇴</button>
                  	</td>
                  	</c:if>
                  </tr>
                  </c:forEach>
                  <!-- 반복 -->
                </table>
                <br>
         <nav aria-label="...">
  			<ul class="pagination">
  			<c:if test="${pageDto.page>1 }">
    			<li class="page-item">
     				<a class="page-link" href="/adminPage/ex_member?page=${pageDto.page-1}">이전페이지</a>
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
    				<a class="page-link" href="/adminPage/ex_member?page=${pN}">${pN}</a>
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
    				<a class="page-link" href="/adminPage/ex_member?page=${pageDto.page+1}">다음페이지</a>
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