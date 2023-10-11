<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!--  uri core를 c로 설정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>니어닥병원정보</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
</head>

<style>
body {
	margin: 0 auto;
}



h1 {
	width: 120px;
    
    margin: 0 auto;
    /* margin-top: 50px; */
    color: rgb(25, 25, 112);
}



table {
	width: 1020px;
	height: 500px;
	margin: 50px 0px 0px 450px;
	
}
td{
	width:63px;
	background-color:lightblue;
	color:black;
	text-align:center;
}
input[type="text"]{
	width: 241px;
    height: 42px;
    text-align: center;
}

#button {
	margin-top: 50px;
    margin-left: 904px;
}

#button>a {
	padding: 10px;
    text-decoration: none;
    color: white;
    background-color: #0a0a4d;
    border-radius:10px;
    display: inline-block;
    width: 81px;
}
#button>a:hover{
	 background-color:blue;
      transition: 0.7s;
}
.ear{
	background-color:#c1f3ea;
	color:black;
}
.num{
	background-color:#c1f3ea;
	color:black;
}
.add{
	background-color:#c1f3ea;
	color:black;
}
.lun{
	background-color:#c1f3ea;
	color:black;
}
</style>
<body>
	<% pageContext.include("hmain.jsp");%>
		<h1>병원정보</h1>
	
		
		<form action="hinfomodify" method="post" enctype="maltipart/form-data">
		
		
			<table>
				<tr>
					<td>진료 과목</td>
					<td><input type="text" name="subject" 
					id="subject"  value="${hospital.subject }" placeholder="이비인후과" /></td>
				</tr>
				<tr>
					<td>병원명</td>
					<td><input type="text" name="name" 
					id="name" readonly="readonly" value="${hospital.name }" placeholder="니어바이닥의원" /></td>
				</tr>
				<tr>
					<td>사업자등록번호</td>
					<td><input type="text" name="email"
					id="email" placeholder="ch2488@naver.com" /></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="number"
					id="number" placeholder="02-1234-5678" /></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address"
					id="address" placeholder="서울시 금천구 호서대벤처타워" /></td>
				</tr>

				<tr>
					<td>진료시간</td>
					<td><input type="text" name="clinictime"
					id="clinictime" placeholder="09:00~18:00" /></td>
				</tr>
				<tr>
					<td>점심시간</td>
					<td><input type="text" name="lunchtime"
					id="lunchtime" placeholder="13:00~14:00" /></td>
				</tr>

			</table>
			
		</form>
		<div id="button">
			<a href="hinfo.jsp">수정완료</a>
		</div>
	
</body>
</html>