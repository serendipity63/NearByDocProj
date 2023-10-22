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
	background-color: white;
	margin: 10px auto;
	width: 430px;
	height: 600px;
	padding-top: 5px;
	overflow: auto;
}

#sub {
	width: 430px;
	margin: 10px auto;
	font-size: 30px;
	overflow: hidden;
	text-align: left;
}

#sub>input {
	width: 30px;
	height: 30px;
	margin-left: 200px;
}

#res>span:nth-child(2) {
	margin-left: 260px;
}

table {
	border: 1px solid;
	margin: 5px auto;
	width: 400px;
	height: 150px;
	border-radius: 10px;
}

#res {
	margin: 15px auto 20px;
}

.restable {
	background: white;
}

.material-symbols-outlined {
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24
}

button {
	background: white;
	border: none;
	font-size: 16px;
}
</style>
<script>
function confirmReservation(reservationId) {
	console.log("예약 확인 버튼 클릭");
    $.ajax({
        url: 'resmanage',
        type: 'post',
        data: {'id': reservationId},
        success: function(response) {
            console.log("success");
        },
        error: function(xhr, status, error) {
            // Handle errors, if any
            console.err("에러다 에러")
        }
    })
}
</script>
</head>

<body>
	<!-- 헤더 -->
	<%
	pageContext.include("thinheader.jsp");
	%>
	<div id="sub">
		<span>예약 내역</span> <span class="material-symbols-outlined"
			onClick="location.href='mypage'" style="margin-left: 260px;">
			arrow_back </span> <br>
		<hr>
	</div>


	<div id="container">
		<c:forEach items="${reservations}" var="reservation">
			<div id="res" onclick="location.href='resmanage?id=${reservation.id}';" style="cursor:pointer;">
				<span>${reservation.date }</span>
				 <c:if test="${reservation.status eq 1}">
						<span>예약 확인</span>
					</c:if> 
				 <c:if test="${reservation.status eq 2}">
						<span>진료 완료</span>
					</c:if>
					
					 <c:if test="${reservation.status eq 3}">
						<span>예약 취소</span>
					</c:if>
					
					
					<c:if test="${reservation.status eq 4}">
						<span>방문 안함</span>
					</c:if>
					
					
					<c:if test="${reservation.status eq 5}">
						<span>예약 취소</span>
					</c:if>
			
			
			
			
				<c:if test="${reservation.status eq 1}">
					<table class="restable">
				</c:if>
				<c:if test="${reservation.status eq 2}">
					<table class="restable" style="background-color: #CFE8F7">
				</c:if>
				<c:if test="${reservation.status eq 3}">
					<table class="restable" style="background-color: #DAD9D9">
				</c:if>
				<c:if test="${reservation.status eq 4}">
					<table class="restable" style="background-color: #DAD9D9">
				</c:if>
				<c:if test="${reservation.status eq 5}">
					<table class="restable" style="background-color: #DAD9D9">
				</c:if>
				
				
								<tr>
									<th rowspan="2">
										<h4>${reservation.name }</h4>
										<h5>${reservation.address }</h5>
										<h5>${reservation.tel }</h5>
									</th>
									<th>
										<h5>예약 일자</h5>
										<h5>${reservation.date }</h5>
									</th>
								</tr>
								<tr>
									<th>
										<h5>예약 시간</h5>
										<h5>${reservation.time }</h5>
									</th>
								</tr>
							</table>
							</div>
							</c:forEach>
							</div>
</body>

</html>