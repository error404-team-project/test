<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <a href="/adminPage/admin_index" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="/ex_member" class="nav-link">Contact</a>
      </li>
    </ul>

    <!-- 상단고정바 _ 오른쪽 _ 검색 -->
    <ul class="navbar-nav ml-auto">

      <!-- 상단고정바 _ 오른쪽 _ 메세지 -->
     
    </ul>
  </nav>
  <!-- /.상단 고정바 끝 -->

  <!-- 사이드바 -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- 사이드바 맨 위 브랜드 로고 -->
    <a href="../../index3.html" class="brand-link">
      <img src="../../dist/img/logo.png"
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
          <a href="#" class="d-block">관리자</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
           <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                게시판
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/adminPage/ex_f_board" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>자유게시판</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../../index2.html" class="nav-link">
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
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-chart-pie"></i>
              <p>
                주문/배송관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="chartjs.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>주문관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="flot.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>배송관리</p>
                </a>
              </li>
            </ul>
          </li>
           <li class="nav-item">
            <a href="/adminPage/ex_member" class="nav-link">
              <i class="nav-icon far fa-image"></i>
              <p>
                회원정보관리
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-tree"></i>
              <p>
                상품정보 관리
              </p>
            </a>
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
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/admin_index">메인화면으로</a></li>
              <li class="breadcrumb-item active">admin</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->