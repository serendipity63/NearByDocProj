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

#center {
	display: flex;
	justify-content: center;
}

h1 {
	width: 500px;
	height: 100px;
	margin-left: 680px;
	color: rgb(25, 25, 112);
}

.row {
	height: 20px;
}

.title {
	font-weight: bold;
	background-color: rgb(25, 25, 112);
	width: 200px;
}

.colume {
	padding: 5px;
	width: 140px;
	float: left;
	
}

.container {
	height: 800px;
	width: 1000px;
}

table {
	width: 1000px;
	height: 500px;
	margin: 200px -1030px;
}

input {
	width: 210px;
	height: 30px;
}

#button {
	margin-top: 100px;
	margin-left: 400px;
	width: 250px;
	height: 50px;
}

#button>a {
	padding: 10px;
	text-decoration: none;
	color: white;
	background-color: rgb(25, 25, 112);
	border: 1px solid black;
}
</style>
<body>
	<% pageContext.include("hmain.jsp");%>

	<div id="center">


		<h1>병원정보</h1>




		<div id="button">
			<a href="hinfo.jsp">수정</a>
		</div>


		<br> <br>
		<form action="hinfomodify" method="post" enctype="maltipart/form-data">
		<div class="container" id="container">
		<input type="hidden" name="num" value=${hospital.num }"/>
			<table border="1" id="title">
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
					<td>E-Mail</td>
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

			</div>
		</form>
	</div>
</body>
</html>