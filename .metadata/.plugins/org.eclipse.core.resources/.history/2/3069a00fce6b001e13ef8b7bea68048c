<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약하기</title>
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

.patientselect {
	border-bottom: 1px solid;
	border-color: gainsboro;
}

.selectservice {
	border-bottom: 1px solid;
	border-color: gainsboro;
}

.selectdate {
	border-bottom: 1px solid;
	border-color: gainsboro;
}

.selecttime {
	border-bottom: 1px solid;
	border-color: gainsboro;
}

.tbutton {
	margin-left: 20px;
}

.button {
	margin: auto;
	text-align: center;
}

#text {
	width: 410px;
	height: 300px;
	margin: 5px 5px 5px 5px;
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
	width: 100%;
	font-weight: bold;
	font-size: 18px;
}

.btn-primary:hover {
	background-color: #0056b3;
}

.sub {
	font-weight: bold;
}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript">
	
</script>
</head>

<body>
	<div class="main">
		<%
		pageContext.include("thinheader.jsp");
		%>
		<br>
		<div class="top">
			<h3>예약하기 (OOO종합병원)</h3>
		</div>
		<br>
		<form action="insertreservation" method="post" id='form'>
			<div class="patientselect">
				<p class="sub">진료 대상 선택</p>
				<br>
				<table>
					<tbody>
						<tr>
							<td width="100"><input type="radio" name="name"
								value="${user.pname}">&nbsp;${user.pname}</td>
							<c:choose>
								<c:when test="${empty familylist}">

								</c:when>
								<c:otherwise>
									<c:forEach items="${familylist}" var="family">
										<td width="100"><input type="radio" name="name"
											value="${family.fname}">&nbsp;${family.fname}</td>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tr>
					</tbody>
				</table>
				<br>
			</div>
			<br>
			<div class="selectservice">
				<p class="sub">진료과목 선택</p>
				<br> <input type="radio" name="department"
					value="${hospital.department}">&nbsp;${hospital.department}
				<br>
				<br>
			</div>
			<br>
			<div class="selectdate">
				<p class="sub">
					날짜선택 : <input type="text" id="datepicker" name="resdate" />
				</p>
				<br>
			</div>
			<br>
			<div class="selecttime">
				<p class="sub">
					시간선택 : 
					<select name="restime">
						<c:forEach items="${timelist}" var="time">
								<option value="${time}">${time}</option>
						</c:forEach>
					</select>
				</p>
				<br>
			</div>
			<br>
			<div class="comment">
				<p class="sub">원장님께 하고 싶은말:</p>
				<br>
				<textarea name="comment" cols="58" rows="2" placeholder="증상을 입력해주세요."></textarea>
			</div>
			<br>
			<div>
				<button type="submit" class="btn-primary">예약하기</button>
			</div>
		</form>
	</div>
	<br>
	<br>
	<br>
</body>

</html>