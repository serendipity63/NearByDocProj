<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약완료하기</title>
<style>
.main {
	width: 430px;
	margin: auto;
}

.top {
	text-align: center;
	margin: auto;
	border-bottom: 1px solid;
}

.patient {
	border-bottom: 1px solid;
	border-color: gainsboro;
}

.resdate {
	border-bottom: 1px solid;
	border-color: gainsboro;
}

.restime {
	border-bottom: 1px solid;
	border-color: gainsboro;
}

.service {
	border-bottom: 1px solid;
	border-color: gainsboro;
}

button {
	margin-left: 30px;
}

.button {
	margin: auto;
	text-align: center;
}

.btn-primary {
	padding: 20px 20px;
	background-color: #cfe8f7;
	color: #333333;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s ease;
	font-family: 'Noto Sans', sans-serif;
	text-decoration: none;
	border-radius: 10px;
	width: 180px;
	font-weight: bold;
	font-size: 18px;
}

.btn-primary:hover {
	background-color: #0056b3;
}

.btn-return {
	width: 180px;
	padding: 20px 20px;
	background-color: gray;
	color: white;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s ease;
	font-family: 'Noto Sans', sans-serif;
	text-decoration: none;
	border-radius: 10px;
	width: 180px;
	font-weight: bold;
	font-size: 18px;
}

.btn-return:hover {
	background-color: #dad9d9;
}

.sub {
	font-weight: bold;
}
</style>
</head>

<body>
	<div class="main">
		<%
		pageContext.include("thinheader.jsp");
		%>
		<br>
		<div class="top">
			<h3>예약하기 (${hospital.hname})</h3>
		</div>
		<br>
		<div class="patient">
			<p class="sub">진료 대상</p>
			<br>
			<table>
				<tbody>
					<tr>
						<c:choose>
							<c:when test="${reservation.pidnum eq user.pidnum}">
								<td>${user.pname}</td>
							</c:when>
							<c:otherwise>
								<td>${name}</td>
							</c:otherwise>
						</c:choose>
						
					</tr>
				</tbody>
			</table>
			<br>
		</div>
		<br>
		<div class="resdate">
			<p class="sub">예약일자</p>
			<br>
			<p>${reservation.resdate}</p>
			<br>
		</div>
		<br>
		<div class="restime">
			<p class="sub">예약시간</p>
			<br>
			<p>${reservation.restime }</p>
			<br>
		</div>
		<br>
		<div class="service">
			<p class="sub">진료과목</p>
			<br>
			<p>${hospital.department}</p>
			<br>
		</div>
		<br>
		<div class="comment">
			<p class="sub">원장님께 하고 싶은 말:</p>
			<br>
			<p>${reservation.comment}</p>
		</div>
		<br>
		<div>
			<form action="completereservation" method="post" id='form'>
				<button type="button" class="btn-return"
					onclick="location.href='insertreservation';">돌아가기</button>

				<button type="submit" class="btn-primary">예약완료하기</button>
			</form>
		</div>
	</div>
	<br>
	<br>
	<br>
</body>

</html>