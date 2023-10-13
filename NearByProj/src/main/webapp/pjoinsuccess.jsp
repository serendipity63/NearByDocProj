<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입성공</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans kr', sans-serif;

}

		.container {
			padding: 10px;
			border: none;
			width: 400px;
			height: auto;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		
		.container a{
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

</style>
</head>
<body>
	<!-- 헤더 -->

	<%
	pageContext.include("header.jsp");
	%>
	
<center>	
		<div class="container" id='form'>

니어바이닥의 회원이 되신것을 축하합니다!	
회원가입 절차가 완료되었습니다
로그인 후 서비스를 이용해 주시기 바랍니다
<br>
<a href="login">로그인</a>
<a href="main">메인으로</a>
</div>
</center>


</body>
</html>