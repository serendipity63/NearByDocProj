<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans:400,700&display=swap">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<head>
	<title>NearByDoc for Hospital</title>
	<style>
		* {
			margin: 0;
			padding: 0;
		}

		a {
			text-decoration: none;
		}

		body {
			font-family: 'Noto Sans kr', sans-serif;
		}

		.outerDiv {
			width: 100%;
			height: 100px;
			background-color: #191970;
			color: #D3D3D3;
			text-align: center;
			padding-top: 10px;
			padding-bottom: 15px;
			/* 상단 여백 추가 */
		}

		.innerDiv {
			margin-top: 0px;
			/* 내부 요소 상단 여백 추가 */
		}

		.innerDiv a {
			color: #D3D3D3;
			/* 링크 색상 변경 */
			margin-right: 10px;

		}

		.innerDiv a:hover {
			color: #fff;
		}

		/* 로그인 폼 스타일 */
		form.login-form {
			float: right;
			margin-top: 10px;
		}

		/* 로그인 폼 요소 스타일 */
		form.login-form input[type="text"],
		form.login-form input[type="password"],
		form.login-form button {
			margin: 10px;
		}

		body {
			margin: 0 auto;
		}

		.container {
			padding: 10px;
			border: 2px solid;
			width: 500px;
			height: 470px;
			display: flex;
			justify-content: center;
			align-items: center;
			border-radius: 20px;
			margin-top: 60px;
		}

		.input-container {
			position: relative;
			margin-bottom: 30px;
		}

		.icon {
			position: absolute;
			left: 10px;
			top: 50%;
			transform: translateY(-50%);
			opacity: 0.7;
		}

		input {
			width: 300px;
			height: 40px;
			padding-left: 40px;
		}

		button[type='submit'] {
			font-weight: bold;
			font-size: 16px;
			width: 330px;
			height: 50px;
			background-color: #191970;
			color: #fff;
			border: none;
		}

		.login-button:hover {
			cursor: pointer;
		}

		.new {
			margin-top: 20px;
			margin-bottom: 20px;
		}

		.log {
			color: black;
			font-size: 14pt;
			font-weight: 400;
			text-align: left;
			padding-top: 40px;
			margin-top: 5px;
			margin-bottom: 50px;
			margin-left: 10px;
		}

		.logo img {
			width: 450px;
			height: 80px;
			vertical-align: middle;
			margin-right: 10px;
			margin-top: 5px;
		}
	</style>
</head>

<body>
	<div class="outerDiv">
		<a href="home" class="logo"><img src="image?file=hospitaldoc.png" alt="로고 이미지"></a>
		<div class="innerDiv">
			<div style="float: right; margin-right: 10px;">
				<c:choose>
					<c:when test="${empty user}">
						<a href="login">로그인</a> &nbsp;&nbsp;
					</c:when>
					<c:otherwise>
						<b>${user.id}님 환영합니다</b> &nbsp;&nbsp; <a href="logout">로그아웃</a>&nbsp;&nbsp;
					</c:otherwise>
				</c:choose>
				<a href="join">회원가입</a>&nbsp;&nbsp;
			</div>
		</div>
	</div>

	<center>

		<div class="container" id='form'>
			<form action="mainh" method="post" id='form'>
				<div class="log">
					<span class="large-text">반갑습니다</span> <br>
					<span class="small-text">더 나은 병원 정보 확인, 예약을 향한 지름길</span>
				</div>

				<div class="input-container">
					<span class="icon material-symbols-outlined">mail</span>
					<input type="email" placeholder="이메일 주소" />
				</div>

				<div class="input-container">
					<span class="icon material-symbols-outlined">lock</span>
					<input type="password" placeholder="비밀번호" required />
				</div>
				<button type="submit" class="login-button">로그인</button>

				<div class="new">니어바이닥이 처음이신가요? <a href="join">회원가입</a></div>

		</div>
	</center>



</body>

</html>