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
	justify-content: center;
}

h1 {
	width: 400px;
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
	margin: 200px -1000px;
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
	<% pageContext.include("main.jsp");%>

	<div id="center">


	
			<h1>병원정보</h1>
			
	


		<div id="button">
			<a href="hcorrection.jsp">수정하기</a>
		</div>


		<br>
		<br>
		<div class="container">
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
					<td>E-Mail</td>
					<td>ch2488@naver.com</td>
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


			<c:set var="i" value="1" />
			<c:forEach var="acc" items="${accs }">
				<div class="row">
					<div class="colume">${i }</div>
					<div class="colume">${acc.id}</div>
					<div class="colume">${acc.name }</div>
					<div class="colume">${acc.balance }</div>
					<div class="colume">${acc.type }</div>
					<div class="colume">${acc.grade }&nbsp;</div>
					<c:set var="i" value="${i+1 }" />
				</div>
			</c:forEach>
		</div>
	</div>

</body>
</html>