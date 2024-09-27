<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<title> JARDIN SHOP </title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="JARDIN" />
<meta name="keywords" content="JARDIN" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/content.css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
</head>
<body>
<div id="layerWrap">

<div class="inputWrap">

<script>
function changebtn() {
	
alert("");
/* 	    
	 // 첫번째로 현재 비밀번호가 session 비밀번호랑 일치해야겠지?
	if($("#Pw").val() != "${chpw}" || $("#Pw").val() == null) {
		alert("현재 비밀번호가 일치하지 않습니다.\n다시입력해주세요");
		$("#Pw").val("");
		$("#Pw").focus();
	};
	// 두번째로 현재 비밀번호가 새로운 비밀번호랑 달라야 겠지?
	if($("#Pw").val() == $("#newPw").val() || $("#newPw").val() == null) {
		alert("새 비밀번호가 기존의 비밀번호랑 같습니다.\n다시입력해주세요");
		$("#newPw").val("");
		$("#newPw").focus();
	};
	// 세번째로  새로운 비밀번호가 새비밀번호 재입력 부분이랑 일치해야겠지?
	if($("#newPw").val() != $("#newPw2").val() || $("#newPw2").val() == null) {
		alert("새 비밀번호가 새 비밀번호 재입력 과 일치하지 않습니다.\n다시입력해주세요");
		$("#newPw2").val("");
		$("#newPw2").focus();
	}; */
			
				m_frm.submit();
			//	parent.$.fancybox.close();
		
	} 
</script>
	
		
		
		
	<div class="inputBody">
<form action="/mypage/change" name="m_frm" method="get">
		<div class="title">비밀번호 변경</div>
		<p class="close"><a onclick="parent.$.fancybox.close();" href="javascript:;"><img src="../images/btn/btn_input_close.gif" alt="닫기" /></a></p>


		<div class="checkDiv">
			<table summary="새로운 비밀번호로 변경 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
				<caption>비밀번호 변경</caption>
				<colgroup>
				<col width="48%" />
				<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><span>현재 비밀번호</span></th>
						<td><input type="password" id="Pw" name="Pw" class="w215" /></td>
					</tr>
					<tr>
						<th scope="row"><span>새로운 비밀번호</span></th>
						<td><input type="password" id="newPw" name="newPw" class="w215" /></td>
					</tr>
					<tr>
						<th scope="row"><span>새로운 비밀번호 <u>재입력</u></span></th>
						<td><input type="password" id="newPw2" name="nwePw2" class="w215" /></td>
					</tr>
				</tbody>
			</table>
		</div>


		<div class="centerbrn pd10">
			<a onclick="changebtn()"  style="cursor:pointer;"> 확인 </a>
		</div>

</form>
	</div>

</div>


</div>
</body>
</html>