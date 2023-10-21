
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="my_mouseover.css" />

<title>니어닥병원마이페이지</title>

<style>
* {
    font-family: 'Noto Sans kr', sans-serif;
}
a{
    text-decoration: none;
    color:black;

}
body {
    width: 100%;
    height: 100%;
    margin: 0;
    overflow-x: hidden;
}

#header {
    width: 100%;
    height: 75px;
    background-color: #191970;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

#logo {
    margin-left: 50px;
}

#logo:hover {
    filter: brightness(1.5);
}

#manager {
    margin-right: 50px;
    font-size: 20px;
    color: white;
}

#side {
    width: 250px;
    height: 100%;
    background-color: #eee;
    position: fixed;
    top: 75px;
    left: 0;
    overflow-y: auto;
}

#sidemenu {
    padding: 20px;
    text-align: center;
   	margin:auto;
}

#list {
    padding: 20px;
    text-align:center;
    color: #FFFFFF;
}

.list-item {
    margin: 15px 0;
    text-align: center;
}

#logout > a {
    text-decoration: none;
}

#logout > a:hover {
    color: #FF5252;
}

#user {
    text-align: center;
    padding: 20px;
    color: #FFFFFF;
}

b {
    color: #03A9F4;
}

#content {
    margin-left: 250px;
    padding: 15px;
}

#hi,
#list,
#logout {
    margin-top:100px;
}

#footer {
    background-color: #191970;
    color: white;
    text-align: center;
    padding: 10px;
    position: absolute;
    bottom: 0;
    width: 100%;
}


</style>
</head>

<body>
    <div id="header">
        <div id="logo">
            <a href="trlist"><img src="image?file=icon.png" width="60px"
                height="50px" alt="로고 이미지" /></a>
        </div>
        <div id="manager">니어매니저</div>
    </div>

    <div id="side">
        <div id="sidemenu">
            <div id="hi">
                <img src="image?file=home.png" width="50px" height="50px"> <br>
                <c:choose>
                    <c:when test="${hospitaluser eq Empty}">
                        <p style="text-decoration: none;">
                            <a href="hlogin">로그인</a>
                        </p>
                    </c:when>
                    <c:otherwise>
                        <div id="user">
                            <b>${hospitaluser.hname }</b>
                        </div>
                    </c:otherwise>
                </c:choose>
                
                
                <a href="trlist">오늘의 예약내역</a>
            </div>
            
            
            <div id="list">
                <div class="list-item">
                    <a href="mrecordlist">진료 기록 조회</a>
                </div>
                <div class="list-item">
                    <a href="patientsearch">환자 정보 조회</a>
                </div>
                <div class="list-item">
                    <a href="hinfo">병원 정보</a>
                </div>
            </div>
            <div id="logout">
                <a href="hlogout">로그아웃</a>
            </div>
        </div>
    </div>

    <div id="content">
    </div>
        <div id="footer">
        &copy; 2023 NEARBYDOC
    </div>
    
</body>
</html>
