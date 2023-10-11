<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<title>location setting</title>
<style>
* {
	margin: 0;
	padding: 0;
	font-family: "Noto Sans", sans-serif;
	color: #333333;
}

a {
	text-decoration: none;
}

.outerDiv {
	width: 430px;
	height: 100%;
	background-color: white;
	margin: 0 auto;
	text-align: left;
	padding: 10px 0;
	position: relative;
}

.outerDiv .locationset {
	height: 50px;
	background-color: white;
}

.outerDiv .locationset .juso button {
	position: absolute;
	top: 15px;
	background-color: #fff;
	color: #333333;
	width: 100px;
	height: 29px;
	line-height: 29px;
	border-radius: 20px;
	text-align: center;
	display: inline-block;
	font-family: "Noto Sans", sans-serif;
	font-size: 15px;
	transition: background-color 0.3s;
	border: none;
	cursor: pointer;
}

.find {
	margin-top: 50px;
	text-align: center;
	font-size: large;
	font-weight: bold;
}

.currentloc, .otherloc, .current, .other {
	background-color: white;
	border-radius: 10px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	font-family: 'Noto Sans', sans-serif;
	font-size: 16px;
	text-decoration: none;
	width: 100%;
}

.currentloc button, .otherloc button {
	border: 2px solid gainsboro;
}

.currentloc {
	margin-top: 20px;
	height: 100px;
}

.otherloc {
	margin-top: 50px;
	display: flex;
	justify-content: space-around;
	align-items: center;
}

.current {
	margin-top: 30px;
	height: 70px;
}

.other {
	height: 240px;
	padding-bottom: 20px;
}

.currentloc button {
	text-align: center;
}

.otherloc button {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: left;
}

.icon-text-wrapper {
	position: relative;
	top: 5px;
}
</style>
</head>
<body>
	<div class="outerDiv">
		<div class="locationset">
			<div class="juso">
				<button class="back">

					<span class="icon-text-wrapper"> <a href="main"> <span
							class="material-symbols-outlined"> arrow_back </span>
					</span> 주소 설정
					</a>
				</button>
			</div>
		</div>
		<div class="find">
			어디에 있는 병원을 찾으세요?

			<div class="currentloc">
				<button class="current" onclick="getCurrentLocation()"> <%-- 현재위치 가져오기 --%>
					<span class="icon-text-wrapper"> <span
						class="material-symbols-outlined"> location_searching </span>
					</span> 현재 위치에서 병원 찾기
				</button>
			</div>

			<div class="otherloc">
				<button class="other" onclick="location.href='execDaumPostcode()'">
					<img src="image?file=hospital1.jpg" height="250" width="150"
						alt="병원이미지"> 다른 위치에서 병원 찾기 <br> <br>
				</button>
			</div>
		</div>
	</div>
</body>

</html>