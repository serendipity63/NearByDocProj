<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
	<link href="joinh.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    
    <script>
        function openTypeSelectionPage() {
            // 진료과목 선택 페이지 열기
            var typeSelectionPage = window.open("department.jsp", "TypeSelection", "width=400,height=300");
            window.addEventListener("message", function (event) {
                document.querySelector(".type").value = event.data;
            });
        }
    </script>
    <style type="text/css">
    @charset "UTF-8";

* {
    margin: 0;
    padding: 0;
    font-family: 'Noto Sans kr', sans-serif;

}

a {
    text-decoration: none;
}

.title {
    width: 100%;
    text-align: center;
    /* 가운데 정렬 */
    font-size: 20px;
    margin-bottom: 20px;
    /* 아래 여백 추가 */

}

/* 로그인 폼 스타일 */
form.join-form {
    float: right;
    margin-top: 10px;
}

/* 로그인 폼 요소 스타일 */
form.join-form input[type="text"],
form.join-form input[type="password"],
form.join-form button {
    margin: 10px;
}

.container {
    padding: 10px;
    border: 2px solid;
    width: 500px;
    height: 700px;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 20px;
    margin-top: 60px;
}


.row {
    height: 40px;
    margin: auto;

}

.title {
    width: 70px;
    float: left;
    font-weight: bold;
    white-space: nowrap;

}

.input {
    float: left;

}

input {
    width: 300px;
    height: 30px;
    border: 1px solid gray;
    border-radius: 2px;
    text-indent: 1em;
    /* 들여쓰기!!*/

}

input[type='submit'] {
    font-size: 16px;
    width: 300px;
    height: 40px;
    background-color: #191970;
    color: #fff;
    margin-bottom: 25px;
    text-indent: 0;
    border: 0;
}

input[type='text'],
input[type='number'],
input[type='password'],
input[type='submit'] {
    margin-bottom: 25px;
}

input[type='submit']:hover {
    cursor: pointer;

}

/* 우편번호 입력 칸 스타일 */
.input input[name='postcode'] {
    width: 130px;
    margin-bottom: 10px;
}

.input input[name='roadAddress'] {
    margin-bottom: 10px;
}

/* 우편번호 찾기 버튼 스타일 */
.input button[name='postcode-button'] {
    width: 100px;
    margin-left: 20px;
    height: 31px;
    text-align: center;
    background-color: #191970;
    color: #fff;
    border: none;
    cursor: pointer;
    border-radius: 3px;
}
    </style>
    
<title>병원등록</title>
</head>
<body>
<% pageContext.include("hospitalheader.jsp"); %>

    <center>
        <div class="container" id='query'>
            <form action="joinh" method="post" id='form'>
                <div class="title">병원등록</div>
                <div class="row">
                    <div class="input"><input type="text" name="hospitalname" placeholder="병원명"></div>
                </div>
                <div class="row">
                    <div class="input"><input type="text" name="email" placeholder="이메일"></div>
                </div>
                <div class="row">
                    <div class="input"><input type="number" name="registration_number" placeholder="사업자등록번호"></div>
                </div>
                <div class="row">
                    <div class="input">
                        <input type="text" name="postcode" placeholder="우편번호" onclick="openKakaoAddressSearch()"
                            readonly>
                    </div>
                    <div class="input">
                        <button type="button" name="postcode-button" onclick="openKakaoAddressSearch()">우편번호 찾기</button>
                    </div>
                </div>
                <div class="row">
                    <div class="input">
                        <input type="text" name="roadAddress" placeholder="도로명 주소" readonly>
                    </div>
                </div>
                <div class="row">
                    <div class="input">
                        <input type="text" name="detailAddress" placeholder="상세주소">
                    </div>
                </div>

                <div class="row">
                    <div class="input"><input type="number" name="phonenumber" placeholder="전화번호"></div>
                </div>
                <div class="row">
                    <div class="input"><input type="password" name="password" placeholder="비밀번호"></div>
                </div>
                <div class="row">
                    <div class="input">
                        <input name="type" type="text" class="type" placeholder="진료과목명"
                            onclick="openTypeSelectionPage()">
                    </div>
                </div>
                <div class="button">
                    <input type="submit" value="병 원 등 록">
                </div>
                <div>
                    니어바이닥 병원회원이신가요? <a href="login">로그인</a>
                </div>
            </form>
        </div>
    </center>

</body>
</html>