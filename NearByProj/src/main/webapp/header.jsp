<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<title>NearByDocHeader</title>

<style>
* {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans kr', sans-serif;
	
}

a {
	text-decoration: none;
}

.outerDiv {
	width: 430px;
	height: 212px;
	background-color: #CFE8F7;
	margin: 0 auto;
	text-align: center;
	padding: 10px 0;
	position: relative;
	margin-top: 0;
}

.outerDiv .logo img {
	width: 150px;
	height: 115px;
	vertical-align: middle;
	display: inline-block;
	margin-right: 10px;
	margin-top: 55px;
}

.outerDiv .loginJoin {
	position: absolute;
	top: 10px;
	right: 10px;
}

.outerDiv .loginJoin a {
	margin: 0 10px;
	background-color: #fff;
	color: #2188C4;
	width: 75px;
	height: 29px;
	line-height: 29px;
	border-radius: 20px;
	text-align: center;
	display: inline-block;
	font-family: "Noto Sans kr", sans-serif;
	transition: background-color 0.3s;
}

.outerDiv .loginJoin a:hover {
	background-color: #0056b3;
	text-decoration:none;
}
</style>
</head>

<body>
	<!-- 헤더 -->
	<div class="outerDiv">
		<a href="patientmain" class="logo"><img src="image?file=logo.png"
			alt="로고 이미지"></a>
		<div class="loginJoin">
			<c:choose>
				<c:when test="${empty user}">
					<a href="login">로그인</a>
					<a href="pjoin">회원가입</a>
				</c:when>
				<c:otherwise>
					<a href="mypage">마이페이지</a>
					<a href="logout">로그아웃</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

</body>

</html>