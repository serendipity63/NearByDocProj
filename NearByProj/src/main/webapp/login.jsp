<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>

<title>로그인</title>
<script type="text/javascript">
    function validateForm() {
        var email = document.getElementById("pemail").value;
        var password = document.getElementById("ppassword").value;

        // 이메일 형식 검사
        var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        if (!emailRegex.test(email)) {
            alert("올바른 이메일 형식으로 입력하세요.");
            return false;
            
        }    else if (email===""){
            	alert("이메일을 입력하세요")
            	return false;
            }    
            	
        
        // 비밀번호 필드가 비어 있는지 확인
        if (password === "") {
            alert("비밀번호를 입력하세요.");
            return false;
        }

        // 모든 유효성 검사를 통과한 경우 true 반환하여 폼 제출을 허용
        return true;
    }
</script>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans kr', sans-serif;
}

a {
	text-decoration: none;
}

.container {
	max-width: 425px;
	width: 100%;
	margin: 20px auto 20px auto;
	overflow: hidden;
	padding: 10px;
}

input {
	height: 50px;
	width: 90%;
	margin: 30px;
	border: 1px solid #cccccc;
	border-radius: 4px;
	background: #ffffff;
	padding-left: 5px;
	font-style: normal;
	font-weight: normal;
	text-decoration: inherit;
	color: black;
	display: inline-block;
	padding-left: 40px;
}

button.loginbutton {
	padding: 20px 20px;
	background-color: #cfe8f7;
	color: #333333;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s ease;
	font-family: 'Noto Sans', sans-serif;
	text-decoration: none;
	border-radius: 10px;
	width: 100%;
	margin-top: 20px;
	margin-bottom: 10px;
	font-weight: bold;
	font-size: 18px;
}

form {
	width: 100%;
	text-align: center;
	align-items: center;
}

input, button {
	margin: 10px 0;
}

.log {
	color: black;
	font-size: 24pt;
	font-weight: 400;
	text-align: left;
	margin-bottom: 50px;
	vertical-align: middle;
	justify-content: center;
	padding: 10px;
}

.myform a {
	text-align: left;
}

::placeholder {
	color: #cccccc;
}

.small-text {
	font-size: 12pt;
}

.input-container {
	position: relative;
	margin-bottom: 7px;
	width: 100%;
}

.icon {
	position: absolute;
	left: 10px;
	top: 50%;
	transform: translateY(-50%);
	opacity: 0.7;
}

.new {
	margin-top: 10px;
}
</style>
</head>

<body>
	<%
	pageContext.include("header.jsp");
	%>

	<div class="container">
		<div class="log">
			<span class="large-text">반갑습니다</span> <br> <span
				class="small-text">더 나은 병원 정보 확인, 예약을 향한 지름길</span>
		</div>

		<form action="login" method="post" id='form'
			onsubmit="return validateForm()">
			<div class="input-container">
				<span class="icon material-symbols-outlined"> mail </span> <input
					type="email" name="pemail" placeholder="이메일 주소" required="required" />
			</div>

			<div class="input-container">
				<span class="icon material-symbols-outlined"> lock </span> <input
					type="password" name="ppassword" placeholder="비밀번호"
					required="required" />
			</div>

			<button type="submit" class="loginbutton">로그인</button>
			<div class="new">
				니어바이닥이 처음이신가요? <a href="pjoin">회원가입</a>
			</div>
		</form>
	</div>



</body>

</html>