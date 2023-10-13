<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">
    <title>로그인</title>
<style type="text/css">
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
    height: 180px;
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
    margin-top: 50px;
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
    height: 40px;
    width: 100%;
    border-radius: 4px;
    margin-top: 30px;
    margin-bottom: 20px;
    border: none;
    background: #CFE8F7;
    color: #333333;
    font-weight: bold;
    font-size: 14pt;
    display: inline-block;
}

form {
    width: 100%;
    margin: 20px auto;
    text-align: center;
}

input,
button {
    margin: 10px 0;
}

.myform {
    background: #fff;
    padding: 0px;
    text-align: center;
    max-width: 400px;
    margin: auto;
    height: auto;
    margin-top: 15px;
    align-items: center;
    justify-content: center;
}

.log {
    color: black;
    font-size: 24pt;
    font-weight: 400;
    text-align: left;
    padding-top: 40px;
    margin-top: 25px;
    margin-bottom: 50px;
    margin-left: 10px;
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

.loginbutton:hover {
    cursor: pointer;
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
</style>    
</head>

<body>
    <div class="outerDiv">
        <a href="home" class="logo"><img src="image?file=logo.png"
			alt="로고 이미지"></a>
    </div>

    <div class="myform">
        <div class="log">
            <span class="large-text">반갑습니다</span> <br>
            <span class="small-text">더 나은 병원 정보 확인, 예약을 향한 지름길</span>
        </div>

        <center>
            <form action="login" method="post" id='form'>
                <div class="input-container">
                    <span class="icon material-symbols-outlined">
                        mail
                    </span>
                    <input type="email" name= "pemail" placeholder="이메일 주소" required="required" />
                </div>

                <div class="input-container">
                    <span class="icon material-symbols-outlined">
                        lock
                    </span>
                    <input type="password" name= "ppassword" placeholder="비밀번호" required="required" />
                </div>

                <button type="submit" class="loginbutton">로그인</button>
                <div>니어바이닥이 처음이신가요? <a href="pjoin">회원가입</a></div>
            </form>
        </center>
    </div>
</body>

</html>