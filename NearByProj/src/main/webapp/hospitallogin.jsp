<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<script type="text/javascript">
function validateForm(){
    var comnum = document.getElementById("comnum").value;
    var password = document.getElementById("hpassword").value;
	
    if(comnum===""){
    	alert("사업자등록번호를 입력하세요");
    	return false;
    	}
    
    
    // 비밀번호 필드가 비어 있는지 확인
    if (password === "") {
        alert("비밀번호를 입력하세요.");
        return false;
    }
    return true;
}
</script>

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
			margin-bottom: 5px;
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

	</style>
</head>

<body>

<% pageContext.include("hospitalheader.jsp"); %>

	<center>

		<div class="container" id='form'>
			<form action="hlogin" method="post" id='form' onsubmit="return validateForm()">
				<div class="log">
					<span class="large-text">반갑습니다</span> <br>
					<span class="small-text">더 나은 병원 정보 확인, 예약을 향한 지름길</span>
				</div>

				<div class="input-container">
					<span class="icon material-symbols-outlined">local_hospital</span>
					<input type="number" placeholder="사업자등록번호" id="comnum" name="comnum" required="required" />
				</div>

				<div class="input-container">
					<span class="icon material-symbols-outlined">lock</span>
					<input type="password" placeholder="비밀번호" id="hpassword" name="hpassword" required="required" />
				</div>
				<button type="submit" class="login-button">로그인</button>

				<div class="new">니어바이닥이 처음이신가요? <a href="hjoin">회원가입</a></div>
				<div class="wrong">병원을 예약하러 오셨나요? <a href="main">니어바이닥 바로가기</a></div>
				
			</form>
		</div>
	</center>



</body>

</html>