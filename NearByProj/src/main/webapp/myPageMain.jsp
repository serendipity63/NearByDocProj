<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">
<title>NearByDocMyPage</title>

<style type="text/css">
*{
    font-family: 'Noto Sans kr', sans-serif;
}

#container {
	border-radius: 10px;
	background-color: #CFE8F7;
	margin: 10px auto;
	width: 430px;
	height: 684px;
	padding-top: 5px;
}

.whitebox {
	width: 340px;
	height: 130px;
	background-color: white;
	margin: 30px auto;
	display: flex;
	align-items: center;
	border-radius: 10px;
}

.whitebox a {
	color: black;
}

h1 {
	margin: 0 auto;
	font-size: 26px;
}

button {
	background: white;
	width: 340px;
	height: 130px;
	align-items: center;
	border-radius: 10px;
	border: none;
	font-size: 26px;
	font-weight: bold;
	cursor: pointer; 
}
</style>
</head>

<body>
	<%
	pageContext.include("thinheader.jsp");
	%>
	<div id="container">
		<div class="whitebox">
			<button onclick="location.href='reslist'">예약 내역</button>
		</div>
		<div class="whitebox">
			<button onclick="location.href='addfamally'">가족 관리</button>
		</div>
		<div class="whitebox">
			<button onclick="location.href='myreview'">나의 리뷰</button>
		</div>
		<div class="whitebox">
			<button onclick="location.href='profile'">개인 정보 수정</button>
		</div>
	</div>

</body>

</html>