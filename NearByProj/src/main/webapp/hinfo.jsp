<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>니어닥병원정보</title>

</head>

<style>
body {
	margin: 0 auto;
	font-family: 'Noto Sans kr', sans-serif;
}

h1 {
	text-align: center;
	font-size: 24px;
	color: #191970;
	margin: 20px 0;
}

table {
	width: 100%;
	max-width: 600px;
	margin: 20px auto;
	border-collapse: collapse;
}

input[type=text] {
	border: none;
	background-color: white;
}

td {
	padding: 10px;
	text-align: left;
}

input[type="text"] {
	width: 100%;
	height: 32px;
	border: 1px solid #ccc;
	padding: 5px;
}

#button {
	text-align: center;
	margin-top: 20px;
}

input[type="submit"], input[type="button"] {
	width: 100px;
	height: 40px;
	background-color: #191970;
	color: #fff;
	border: none;
	cursor: pointer;
	margin: 0 10px;
	text-align: center;
}
</style>

<body style="overflow-y: hidden">
	<%
pageContext.include("hmain.jsp");
%>

	<h1>병원정보</h1>


	<table id="title">
		<tr>
			<td>병원명</td>
			<td><input type="text" name="hname" id="hname"
				value="${hinfo.getHname() }" disabled="disabled" /></td>
		</tr>

		<tr>
			<td>진료과목</td>
			<td><input type="text" name="department" id="department"
				value="${hinfo.getDepartment() }" disabled="disabled" /></td>
		</tr>

		<tr>
			<td>전화번호</td>
			<td><input type="text" name="htel" id="htel"
				value="${hinfo.getHtel() }" disabled="disabled" /></td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<div style="display: flex;">
					<div style="width: 50%;">
						<input type="text" name="hroad" id="hroad"
							value="${hinfo.getHroad() }" disabled="disabled" />
					</div>
					<div style="width: 50%;">
						<input type="text" name="hdetail" id="hdetail"
							value="${hinfo.getHdetail() }" disabled="disabled" />
					</div>
				</div>	
			</td>	
		</tr>

		<tr>
			<td>진료시간</td>
			<td><input type="text" name="clinic" id="clinic"
				value="${hinfo.getClinic() }" disabled="disabled" /></td>
		</tr>
		<tr>
			<td>점심시간</td>
			<td><input type="text" name="lunch" id="lunch"
				value="${hinfo.getLunch() }" disabled="disabled" /></td>
		</tr>
		<tr>
			<td>병원사진</td>
			<td><img src="image?file=${hinfo.getHurl()}" alt="병원"
				width="100" height="100"></td>

			<td><input type="text" name="hdong" id="hdong"
				value="${hinfo.getHdong() }" style="display: none;" /></td>
			<td><input type="text" name="lat" id="lat"
				value="${hinfo.getLat() }" style="display: none;" /></td>
			<td><input type="text" name="lon" id="lon"
				value="${hinfo.getLon() }" style="display: none;" /></td>

		</tr>

	</table>

	<center>
		<input type="button" id="modify" value="수정"
			onclick="location.href='hospitalmodify'">

		<div id="button">
			<c:if test="${hospitaluser.comnum eq hospital.comnum }">


				<input id="hiddenComnum" type="text" value="${hinfo.getComnum() }"
					style="display: none;">

			</c:if>
		</div>
	</center>



</body>
</html>