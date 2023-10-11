<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>니어닥병원정보</title>

</head>

<style>
body {
	margin: 0 auto;
}

#center {
	display: flex;
    margin-left: 2000px;
    margin-top: -150px;
}


h1 {
	width: 500px;
	height: 100px;
	margin-left: 1000px;
	margin-top:50px;
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


table {
	width: 1000px;
	height: 500px;
	margin: 200px -1400px;
}
td{
	width:30px;
}

#button {
	margin-top: 750px;
	margin-left: 810px;
	width: 250px;
	height: 50px;
}

#button>a {
	padding: 10px;
	text-decoration: none;
	color: white;
	background-color: rgb(25, 25, 112);
	border: 1px solid black;
	display: inline-block;
    width: 90px;
}
</style>
<body>
	<% pageContext.include("hmain.jsp");%>
	<h1>병원정보</h1>
	<div id="center">
		
		
		
			<table border="1" id="title">
				<tr>
					<td>진료 과목</td>
					<td>이비인후과</td>
				</tr>
				<tr>
					<td>병원명</td>
					<td>니어바이닥의원</td>
				</tr>
				<tr>
					<td>사업자등록번호</td>
					<td>123-45-67890</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>02-1234-5678</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>서울시 금천구 호서대벤처타워</td>
				</tr>

				<tr>
					<td>진료시간</td>
					<td>09:00~18:00</td>
				</tr>
				<tr>
					<td>점심시간</td>
					<td>13:00~14:00</td>
				</tr>
				
			</table>
				<div id="button">
				<a href="hcorrection.jsp">수정하기</a>
				</div>
			
			
		</div>
	
	
</body>
</html>