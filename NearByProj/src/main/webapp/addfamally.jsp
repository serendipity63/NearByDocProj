<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
#container {
	background-color: #CFE8F7;
	margin: 10px auto;
	width: 430px;
	height: 800px;
	padding-top: 5px;
}

#famallymanage>span {
	font-size: 22px;
}

#famallymanage p {
	text-align: left;
	margin-left: 65px;
	margin-top: 10px;
}

input {
	height: 40px;
	width: 70%;
	margin: 10px 20px;
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

button {
	margin: 10 auto;
	width: 57;
	height: 36;
	text-align: center;
}

.idbtn {
	margin-left:180px;
}

.idbtn>input {
	width: 57px;
	height: 36px;
	color: #2188C4;
	border-radius: 10px;
	float: left;
	text-align: left;
}

.cancel {
	background-color: grey;
	border-radius: 10px;
	width: 57px;
	height: 36px;
	text-align: left;
	margin-left: -8px;
}

#famlist {
	background: white;
	height: 500px;
	overflow-y: scroll;
}

#famlist>input {
	color: #2188C4;
	border-radius: 10px;
	margin-left: 300px;
	width: 57px;
	height: 36px;
	text-align: left;
}

.reg {
	border-radius: 10px;
	background: white;
	color: #2188C4;
	float: left;
}

#detailfam {
	width: 320px;
	padding: 10px;
	background-color: white;
	margin: 10 auto;
	text-align: left;
}

#detailfam>span {
	margin-left: 5px;
	font-size: 15px;
	font: bolder;
}

.material-symbols-outlined {
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24
}

table {
	border-radius: 10px;
	width: 360px;
	height: 100px;
}

table span {
	font-size: 1px;
}

table tr td:nth-child(1) {
	background-color: #CFE8F7;
}

input {
margin-left : 70px;
}
</style>
</head>

<body>
	<!-- 헤더 -->
	<%
	pageContext.include("thinheader.jsp");
	%>
	<div id="container">
		<div id="famallymanage">
			<span style="text-align: left; margin: 10px 0 10px 10px">가족관리</span>
			<span class="material-symbols-outlined" onClick="history.go(-1)"
				style="margin-left: 280px;"> arrow_back </span> <br> <br>
			<form action="addfamally" method="post">
				<p>이름</p>
				<input type="text" id="pname" placeholder="" required="">
				<p>전화번호</p>
				<input type="text" id="tel" placeholder="-없이 숫자만 입력" required="">
				<p>주소</p>
				<input type="text" id="address" placeholder="" required="">
				<p>주민등록번호</p>
				<input type="text" id="idnum" placeholder="-없이 숫자만 입력" required="">
				<br>
				<div class="idbtn">
					<input calss="reg" type="submit" value="등록"
						style="text-align: left;">
					<!-- <button class="reg" type="submit">
          <h4>등록</h4></button>  -->
				</div>
			</form>
			<input class="cancel" type="button" value="취소" onclick="cancel">
			<!-- <button class="cancel" onclick="cancel"><h4>취소</h4></button> -->
			<br>

		</div>

		<div id="famlist">
			<br>
			<div id="detailfam">
				<table border="1">
					<tr>
						<td><span>이름</span></td>
						<td><span>김길동</span></td>
					</tr>
					<tr>
						<td><span>전화번호</span></td>
						<td><span>010-1234-5678</span></td>
					</tr>
					<tr>
						<td><span>주소</span></td>
						<td><span>서울특별시 금천구 남부순환로 호서대벤처타워</span></td>
					</tr>
				</table>
			</div>
			<div id="detailfam">
				<table border="1">
					<tr>
						<td><span>이름</span></td>
						<td><span>박길동</span></td>
					</tr>
					<tr>
						<td><span>전화번호</span></td>
						<td><span>010-1234-5678</span></td>
					</tr>
					<tr>
						<td><span>주소</span></td>
						<td><span>서울특별시 금천구 남부순환로 호서대벤처타워</span></td>
					</tr>
				</table>
			</div>
			<div id="detailfam">
				<table border="1">
					<tr>
						<td><span>이름</span></td>
						<td><span>홍길동</span></td>
					</tr>
					<tr>
						<td><span>전화번호</span></td>
						<td><span>010-1234-5678</span></td>
					</tr>
					<tr>
						<td><span>주소</span></td>
						<td><span>서울특별시 금천구 남부순환로 호서대벤처타워</span></td>
					</tr>
				</table>
			</div>

			<div id="detailfam">
				<table border="1">
					<tr>
						<td><span>이름</span></td>
						<td><span>신길동</span></td>
					</tr>
					<tr>
						<td><span>전화번호</span></td>
						<td><span>010-1234-5678</span></td>
					</tr>
					<tr>
						<td><span>주소</span></td>
						<td><span>서울특별시 금천구 남부순환로 호서대벤처타워</span></td>
					</tr>
				</table>
			</div>

			<input type="button" value="수정" onClick="location.href='modifamally'">
			<!-- <button><h4><a href="modifamally.html">수정</a></h4></button> -->
		</div>
	</div>

</body>

</html>