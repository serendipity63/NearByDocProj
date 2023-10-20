<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!--  uri core를 c로 설정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>니어닥병원정보</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- alert 디자인 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

</head>

<style>
body {
	margin: 0 auto;
}

h1 {
	width: 120px;
	margin: 40px auto;
	/* margin-top: 50px; */
	color: rgb(25, 25, 112);
}

table {
	width: 1020px;
	height: 500px;
	margin: 50px 0px 0px 450px;
}

td {
	width: 63px;
	background-color: white;
	color: black;
	text-align: center;
}

input[type="text"] {
	width: 241px;
	height: 42px;
	text-align: center;
	border:none;
}

#button {
	text-align: center;
}

input[type="submit"] {
	width: 200px;
	height: 40px;
}

input[type="button"] {
	width: 200px;
	height: 40px; 
	background-color: none;
}

.ear {
	background-color: #c1f3ea;
	color: black;
}

.num {
	background-color: #c1f3ea;
	color: black;
}

.add {
	background-color: #c1f3ea;
	color: black;
}

.lun {
	background-color: #c1f3ea;
	color: black;
}
</style>

<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>


<body>
	<%
	pageContext.include("hmain.jsp");
	%>
	<h1>병원정보</h1>


	<form action="hospitalmodify" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="comnum" value="${hinfo.comnum }">
		<table>
			<tr>
				<td>병원명</td>
				<td><input type="text" name="hname" id="hname"
					value="${hinfo.hname }" /></td>
			</tr>

			<tr>
				<td>진료 과목</td>
				<td><input type="text" name="department" id="department"
					value="${hinfo.department }" /></td>
			</tr>

			<tr>
				<td>전화번호</td>
				<td><input type="text" name="htel" id="htel"
					value="${hinfo.htel }" /></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" id="address"
					value="${hinfo.hroad }" /></td>
			</tr>

			<tr>
				<td>진료시간</td>
				<td><input type="text" name="clinic" id="clinic"
					value="${hinfo.clinic }" /></td>
			</tr>
			<tr>
				<td>점심시간</td>
				<td><input type="text" name="lunch" id="lunch"
					value="${hinfo.lunch }" /></td>

			</tr>
			<tr>
				<td>병원사진</td>
				<td><input type="file" name="hurl" id="hurl" accept="image/*"
					value="${hinfo.getHurl() }" /></td>

			</tr>

		</table>
		<div id="button">
			<input type="submit" value="수정"> <input type="button"
				onclick="location.href='hinfo'" value="취소">
		</div>

	</form>



</body>
</html>

