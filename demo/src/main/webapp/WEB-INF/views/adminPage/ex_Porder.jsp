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
<title>주문 관리페이지</title>
<style>
	 tr{text-align:center;}
	 .btn-block{width : 100px; height : 50px;}
</style>
</head>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
	<%@ include file="../header/admin_top.jsp" %>
	<h1 style="text-align: center; " >주문 관리</h1>
	 <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">

            <div class="card">
              <div class="card-header">
                <h3 class="card-title">주문 리스트</h3>
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
function mBtn() {
	alert("주문이 수락 되었습니다.")
	//  location.href = "/adminPage/ex_drone_carry";
} // mBtn
</script>
                  <thead >
								<th scope="col"  style="border-bottom : 1px solid black;">주문일자 <span>/ 주문번호</span></th>
								<th scope="col"  style="border-bottom : 1px solid black;">상품명</th>
								<th scope="col" class="tnone"  style="border-bottom : 1px solid black;">가격</th>
								<th scope="col" class="tnone"  style="border-bottom : 1px solid black;">수량</th>
								<th scope="col"  style="border-bottom : 1px solid black;">주문 상태</th>
								<th scope="col"  style="border-bottom : 1px solid black;">주문 접수</th>
							</thead>
                  <tbody id="tbody">
                  <!-- 반복 -->
               
                  </tbody>
                  <!-- 반복 -->
                  
               <script type="text/javascript">
// order 리스트 출력

		function dateformat(date){
			var t = date.split(' ');
			var ymd = t[0].split('-');
			return ymd[0]+"년 "+ymd[1]+"월 "+ymd[2]+"일";
		}

		var orderlist=[];
		var order = [];
		'<c:forEach var="order" items="${list }">'
		order.push("${order.order_date}")
		order.push("${order.order_no}")
		order.push("${order.product.name}")		
		order.push("${order.product.price}")
		order.push("${order.order_count}")
		order.push("${order.order_status}")
		order.push("${order.p_num}")  // 어제 밤에 추가한 부분
		orderlist.push(order);
		order=[]
		'</c:forEach>'
		//console.log(orderlist)

		
		var str = '';
		var cnt = 0;
		var newcnt = 0;
		var id;
		for(var i = 0; i <orderlist.length; i ++){
			str += '<tr>'
			for(var j = 0; j <orderlist.length; j ++){
				if(orderlist[i][1]==orderlist[j][1]){
					cnt++;
					id = orderlist[i][1]		
				}
			}
			if( orderlist[i][1] == id )
			{
				if(cnt > 1)
				{
					if (newcnt == 0){
						str+='<td rowspan="'+cnt+'" style="border-bottom : 1px solid black; border-left : 1px solid black; border-right : 1px solid black; ">'
						str+='<br>'
						str+='<p class="day">'+dateformat(orderlist[i][0])+'</p>'
						str+='<br>'
						str+='<p class="orderNum">'+orderlist[i][1]+'</p>'
						str+='</td>'
					}
				}else if(cnt==1){
					str+='<td style="border-bottom : 1px solid black; border-left : 1px solid black; border-right : 1px solid black;" >'
					str+='<br>'
					str+='<br>'
					str+='<p class="day">'+dateformat(orderlist[i][0])+'</p>'
					str+='<br>'
					str+='<p class="orderNum">'+orderlist[i][1]+'</p>'
					str+='</td>'
				}
						
				str+='<td class="left" style= "text-align: center; border-bottom : 1px solid black;">'
				str+='<input type="hidden" class="p_number" value="'+orderlist[i][6]+'">' // 추가한 부분
				str+= '&nbsp;&nbsp;&nbsp;'
				str+=orderlist[i][2]
				str+='	</td >'
				str+='<td class="tnone" style="border-bottom : 1px solid black;">'+orderlist[i][3]+'원 </td>'
				str+='<td class="tnone" style="border-bottom : 1px solid black;">'+orderlist[i][4]+'개 </td>'
								
				if(cnt > 1)
				{
					if (newcnt == 0){
						str+='<td rowspan="'+cnt+'" style="border-bottom : 1px solid black; border-right : 1px solid black">'
						str+='<span class="heavygray">'+orderlist[i][5]+'</span></td>'
						str+='<td ><input type="button" onclick="mBtn()" class="btn btn-sm btn-primary" value="주문 수락">'
						str+='<input type="button" onclick="dBtn()" class="btn btn-sm btn-secondary" value="주문 거절"></td>'
					}
					newcnt++;
					if (cnt == newcnt) newcnt=0;
				}else if(cnt==1){
					str+='<td style="border-bottom : 1px solid black; border-right : 1px solid black">'
					str+='<span class="heavygray">'+orderlist[i][5]+'</span></td>'
					str+='<td><input type="button" onclick="mBtn()" class="btn btn-sm btn-primary" value="주문 수락"> '
					str+='<input type="button" onclick="dBtn()" class="btn btn-sm btn-secondary" value="주문 거절"></td>'
				}
			}
			cnt=0;
			str+='</tr>'
		}
		console.log(str);
		$("#tbody").html(str)

		</script>
		             
                </table>
                <br>
            <!-- 페이징이동1 -->
						<div class="allPageMoving1">

						<a href="#" class="n"><img src="../images/btn/btn_pre2.gif" alt="처음으로"/></a><a href="#" class="pre"><img src="../images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
							<c:forEach var="num" begin="${pageDto.startPage }" 
											end="${pageDto.maxPage }" step="1">
						<c:if test="${num != pageDto.page }">
							<a href="/mypage/inquiry?page=${num }">${num }</a>
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