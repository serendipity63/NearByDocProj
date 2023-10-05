<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="join.css">
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans:400,700&display=swap">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- Noto Sans 폰트 불러오기 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">
    <title>회원가입</title>

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
    width: 143px;
    height: 85px;
    vertical-align: middle;
    display: inline-block;
    margin-right: 10px;
    margin-top: 50px;
}


input {
    height: 45px;
    width: 98%;
    margin: 20px;
    border: 1px solid #16151562;
    border-radius: 4px;
    background: #ffffff;
    padding-left: 5px;
    /* Noto Sans 폰트 설정 */
    font-size: 12pt;
    font-style: normal;
    font-weight: normal;
    text-decoration: inherit;
    color: black;
    text-indent: 0.5em;

}

button.join-button {
    height: 60px;
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
    box-sizing: border-box;
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

input:focus {
    outline: none;
}

.myform {
    background: #fff;
    padding: 20px;
    text-align: center;
    width: 400px;
    margin: auto;
    height: 932px;
    margin-top: 10px;
    font-size: 13px;
}

.join {
    text-align: left;
}

::placeholder {
    color: #16151562;
}

.small-text {
    font-size: 12pt;
}

.join-button:hover {
    cursor: pointer;
}

.input-container {
    position: relative;
    margin-bottom: 7px;
}

.icon {
    position: absolute;
    right: 10px;
    top: 50%;
    /* 아이콘을 수직 중앙 정렬 */
    transform: translateY(-50%);
    opacity: 0.7;
}

.row {
    display: flex;
    align-items: center;
    margin-top: 1px;
}

/* 우편번호 입력 칸 스타일 */
.input input[name='postcode'] {
    width: 130px;
    height: 40px;
    margin-right: 30px;
    margin-bottom: 10px;
}

/* 우편번호 찾기 버튼 */
.input button[name='postcode-button'] {
    width: 100px;
    height: 40px;
    vertical-align: bottom;
    background: #CFE8F7;
    color: #333333;
    border: none;
    cursor: pointer;
    border-radius: 4px;
    font-weight: bold;
}
</style>
</head>

<body>
    <div class="outerDiv">
        <a href="home" class="logo"><img src="logo.svg" alt="로고 이미지"></a>
    </div>
    <div class="myform">
        <form action="join" method="post" id='form'>
            <div class="join">
                이메일<br>
                <input type="email" id="email" name="email" placeholder="nearbydoc@abc.com 형식으로 입력" required>
                비밀번호<br>
                <div class="input-container">
                    <input type="password" placeholder="" required />
                    <span class="icon material-symbols-outlined">
                        lock
                    </span>
                </div>
                비밀번호 재확인<br>
                <div class="input-container">
                    <input type="password" placeholder="" required />
                    <span class="icon material-symbols-outlined">
                        lock
                    </span>
                </div>
                이름<br>
                <input type="text" placeholder="" required />
                휴대전화<br>
                <input type="number" placeholder="-없이 숫자만 입력" />
                주민번호<br>
                <input type="number" placeholder="-없이 숫자만 입력" required />

                주소<br>
                <div class="row">
                    <div class="input">
                        <input type="text" name="postcode" placeholder="우편번호" onclick="openKakaoAddressSearch()"
                            readonly>
                    </div>
                    <div class="input">
                        <button type="button" name="postcode-button" onclick="openKakaoAddressSearch()">우편번호 찾기</button>
                    </div>
                </div>


                <input type="text" name="roadAddress" placeholder="도로명 주소" readonly>
                <div class="input">
                    <input type="text" name="detailAddress" placeholder="상세주소">

                </div>

            </div>
            <button type="submit" class="join-button">회원가입</button>
        </form>
    </div>
</body>

</html>