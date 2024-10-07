<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
  <!-- Tempusdominus Bootstrap 4 -->
 <link rel="stylesheet" href="/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- 상단고정바 - 왼쪽 -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="/" class="nav-link">판매사이트 홈</a>
      </li>
    </ul>
    <ul class="navbar-nav ml-auto">
		<li class="nav-item d-none d-sm-inline-block">
	       <a href="/member/logout" class="nav-link">로그아웃</a>
	    </li>
    </ul>
  </nav>
  <!-- /.상단 고정바 끝 -->

  <!-- 사이드바 -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4" style="height : 900px;">
    <!-- 사이드바 맨 위 브랜드 로고 -->
    <a href="#" class="brand-link">
      <img src="../images/img/adminLogo.png"
           alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">TEAM_ERROR_404</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- 사이드바 관리자 정보 -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="../../dist/img/person-circle-outline.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">${sessionName}</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
       <c:if test="${sessionAuth == 'admin'}">
           <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                게시판
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <!-- 자유게시판 삭제함 -->
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/adminPage/ex_inquiry" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>1:1 문의게시판</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../../index3.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>후기게시판</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-copy"></i>
              <p>
                공지/이벤트
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/adminPage/ex_notice" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>공지사항</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/adminPage/ex_event" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>이벤트</p>
                </a>
              </li>
              </ul>
          </li>
          
          <li class="nav-item">
            <a href="/adminPage/ex_member" class="nav-link">
              <i class="nav-icon far fa-user"></i>
              <p>
                회원정보관리
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
             <i class="nav-icon fas fa-truck"></i>
              <p>
                드론관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/adminPage/drone_write" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>드론 정보 등록</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/adminPage/ex_drone" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>드론 관리</p>
                </a>
              </li>
            </ul>
          </li>
       </c:if>
       <c:if test="${sessionAuth == 'store'}">
        <li class="nav-item">
            <a href="#" class="nav-link">
             <i class="nav-icon fas fa-truck"></i>
              <p>
                주문/반품 관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/adminPage/ex_Porder" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>주문관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/adminPage/ex_return" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>반품관리</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-pills"></i>
              <p>
                상품정보 관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/adminPage/product_write" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>상품정보 등록</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/adminPage/ad_medical?store_seq=${sessionSeq}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>의약품 관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/adminPage/ad_health?store_seq=${sessionSeq}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>건강기능식품 관리</p>
                </a>
              </li>
              </ul>
          </li>
           <li class="nav-item">
            <a href="/adminPage/ad_prescription" class="nav-link">
            	<i class="nav-icon far fa-clipboard"></i>
              <p>
                처방전
              </p>
            </a>
          </li>
          </c:if>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0"></h1>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->