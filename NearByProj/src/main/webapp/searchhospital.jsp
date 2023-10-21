<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>병원 찾기</title>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
.main {
	width: 430px;
	margin: 0 auto;
	padding: 10px 0;
	position: relative;
}

/* .container {
	max-width: 425px;
	width: 100%;
	margin: 30px auto 20px auto;
	padding: 10px;
	border: 2px solid #16151562;
	border-radius: 10px;
	overflow: hidden;
}

.search-input, .address-input {
	padding: 13px;
	border: none;
	outline: none;
	font-family: 'Noto Sans', sans-serif;
	font-size: 17px;
	margin-bottom: 0px;
	margin-top: 20px;
	width: 97%;
	margin-left: 5px;
}

.container-2 .icon, .container-3 .icon {
	position: absolute;
	top: 30px;
	margin-left: 5px;
	z-index: 1;
	vertical-align: middle;
}

.search-button {
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
	margin-top: 20px;
	margin-bottom: 10px;
	font-weight: bold;
	font-size: 18px;
}

.search-button:hover {
	background-color: #0056b3;
}

.material-icons {
	font-size: 24px;
}

.container-2, .container-3 {
	position: relative;
	white-space: nowrap;
}

.type, .address {
	border-bottom: 2px solid #ccc;
} */

.condition {
	width: 430px;
	border-bottom: 1px solid;
}
#con {
	margin-top: 5px;
}

.material-symbols-outlined {
	font-size: 60px;
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24
}

.btn-text-right {
	width: 115px;
}

.hoslist {
	border-bottom: 1px solid;
}

.hos {
	border-bottom: 1px solid;
	margin-top: 15px;
	border-color: gainsboro;
	display: flex;
}

.hosinfo {
	width: 330px;
	height: 115px;
}

.hosmap {
	width: 100px;
	height: 115px;
}
</style>
</head>

<body>
	<%
	pageContext.include("thinheader.jsp");
	%>
	<!-- <div class="container">
		<div class="searchbox">
			<div class="inner">
				<div class="container-2">
					<div class="type">
						<span class="icon"><i class="material-icons">search</i></span>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" placeholder="진료과"
							class="search-input">
					</div>
				</div>
				<div class="container-3">
					<div class="address">
						<span class="icon"><i class="material-icons">location_on</i></span>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" placeholder="주소설정"
							class="address-input">
					</div>
				</div>
				<div>
					<button class="search-button">병원 재검색</button>
				</div>
			</div>
		</div>
	</div> -->
	<%
	pageContext.include("searchBox.jsp");
	%>
	<div class="main">

		<div class="condition">
			<h4>검색 조건 : "${department}" / "${address} "</h4>
			<h4>검색결과(총 ${hoslist.size()}건)</h4>
			
		</div>
		<div class="hoslist">
			<c:choose>
				<c:when test="${empty hoslist}">
					<br>
					<p>5km 내에 해당 조건에 맞는 병원이 없습니다.</p>
					<br>
				</c:when>
				<c:otherwise>
				<div id="con">
					<p>근처 5km 내 설정 조건의 병원 검색 결과입니다.</p></div>
					
					<c:forEach items="${hoslist}" var="hospital">
						<div class="hos">
							<div class="hosinfo"
								onclick="location.href='hospitalinfo?comnum=${hospital.comnum}';"
								style="cursor: pointer;">
								<table>
									<tbody>
										<tr>
											<td colspan="3" width="330"><h4 style="font-size: 24px;">${hospital.hname}</h4></td>
										</tr>
										<tr>
											<td colspan="3" width="330">${hospital.hroad}
												${hospital.hdetail}</td>

										</tr>
										<tr>
											<td width="70">진료시간:</td>
											<td width="110">${hospital.clinic}</td>
											<td width="110">${hospital.htel}</td>
										</tr>

										<tr>
											<td colspan="2">${hospital.hgrade}<c:forEach begin="1"
													end="${hospital.hgrade}">
													<img src="image?file=star.png" alt="별" width="15">
												</c:forEach>
											</td>
											<td>리뷰 ${hospital.hreviewcnt}건</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="hosmap"
								onclick="window.open('map?comnum=${hospital.comnum}', 'window_name','width=600, height=400, location=no, status=no, scrollbars=yes')"
								style="cursor: pointer;">
								<center>
									<br> <span class="material-symbols-outlined"> map </span>
									<p>지도보기</p>
								</center>
							</div>
							<br>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>

		</div>
	</div>
	<br>
	<br>
	<br>
</body>

</html>