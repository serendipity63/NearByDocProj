<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
	
<title>병원 정보</title>
<style>
.main {
	width: 430px;
	margin: auto;
	font-family: 'Noto Sans kr', sans-serif;
	
}

.material-symbols-outlined {
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24
}

.review {
	width: 380px;
	height: 150px;
	border: 1px solid;
	border-color: gainsboro;
	justify-content: center;
	align-items: center;
	margin: auto;
}

.left {
	width: 315px;
	margin-left: 5px;
}

.btn-text-right {
	width: 115px;
}

.info {
	border-bottom: 1px solid;
}

.reviewinfo1 {
	width: 360px;
	height: 100px;
	margin: 10px 10px 0 10px;
	background-color: gainsboro;
}

.reviewinfo2 {
	width: 370px;
	margin: 5px 0 5px 5px;
}

.reviewwrite {
	width: 430px;
	height: 115px;
	background-color: gainsboro;
	vertical-align: center;
	text-align: center;
}

button{
cursor:pointer;
width:100px;


}
.button {
	margin: auto;
	text-align: center;
	background-color: #cfe8f7;
	
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
		<div class="info">
			<table>
				<tr>
					<td><span class="material-symbols-outlined"
						onClick="history.go(-1)" style="cursor: pointer;">
							arrow_back </span></td>
					<td>
						<h3>${hospital.hname}</h3>
					</td>
				</tr>
			</table>
		</div>
		<br>
		<div class="info">

			<img src="image?file=${hospital.hurl}" alt="병원" width="420">

			<table class="hosinfo">
				<tr>
					<td colspan="2"><font size="6"> ${hospital.hname} </font></td>
				</tr>
				<tr>
					<td colspan="2">${hospital.hroad}</td>
				</tr>
				<tr>
					<td>진료과목 :</td>
					<td>${hospital.department}</td>
				</tr>
				<tr>
					<td>진료시간 :</td>
					<td>${hospital.clinic}</td>
				</tr>
				<tr>
					<td>점심시간 :</td>
					<td>${hospital.lunch}</td>
				</tr>
				<tr>
					<td>전화번호 :</td>
					<td>${hospital.htel}</td>
				</tr>
			</table>
			<br>
		</div>
		<br>

		<div>
			<c:choose>
				<c:when test="${empty lastreview}">
					<p>해당 병원의 리뷰가 없습니다</p>
				</c:when>
				<c:otherwise>
					<table>
						<td style="text-align: left" width="215">&nbsp;&nbsp;&nbsp;리뷰
							${hospital.hreviewcnt}</td>
						<td style="text-align: right" width="215"><a
							href="readreview?comnum=${hospital.comnum}">전체보기 ></a></td>
					</table>
					<br>
					<div class="review">
						<div class="reviewinfo1">
							<table>
								<tr>
									<td style="text-align: left" width="185">&nbsp;${lastreview.name}</td>
									<td style="text-align: right" width="185">${lastreview.birth}&nbsp;</td>
								</tr>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td colspan="2">&nbsp;${lastreview.content}</td>
								</tr>
							</table>
						</div>
						<div class="reviewinfo2">
							<table>
								<tr>
									<td>사용자 별점&nbsp;&nbsp;</td>
									<td><c:forEach begin="1" end="${lastreview.star}">
											<img src="image?file=star.png" alt="별" width="15">
										</c:forEach></td>
								</tr>
							</table>
						</div>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
		<br>
		<div class="reviewwrite">
			
			<c:choose>
				<c:when test="${empty user}">
				<br><br>
					<p>리뷰를 작성하시려면 로그인주세요.</p>
				</c:when>
				<c:when test="${empty resListByUser}">
				<br><br>
					<p>해당 병원의 예약 내역이 있는 사람만 리뷰작성 가능합니다.</p>
				</c:when>
				<c:otherwise>
				<br>
			<p>이 병원에서 진료 경험, 어떠셨나요?</p>
			<br>
				<button
				onclick="window.open('insertreview', 'window_name','width=800, height=1000, location=no, status=no, scrollbars=yes')">리뷰하기</button>
				</c:otherwise>
		</c:choose>
		</div>
		<br>
		<p class="sub"}>병원 위치 정보</p>
		<div id="map" style="width: 100%; height: 350px;"></div>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d95a6f2314398f89e05ca9f4f2fc27e&libraries=services"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};
		 // 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		 

		var coords = new kakao.maps.LatLng(${hospital.lat}, ${hospital.lon});


		// 결과값으로 받은 위치를 마커로 표시합니다
		var marker = new kakao.maps.Marker({
			map : map,
			position : coords
		});

		// 인포윈도우로 장소에 대한 설명을 표시합니다
		var infowindow = new kakao.maps.InfoWindow(
				{
					content : '<div style="width:150px;text-align:center;padding:6px 0;">${hospital.hname}</div>'
				});
		infowindow.open(map, marker);
		
		// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		map.setCenter(coords);

	</script>

		<br> <br>
		<div>
		<c:choose>
				<c:when test="${empty user}">
					<p>예약을 진행하시려면 로그인해주세요.</p>
				</c:when>
				<c:otherwise>
				<button type="button" class="btn-primary"
				onclick="location.href='insertreservation';">예약하기</button>
				</c:otherwise>
		</c:choose>
			
		</div>
	</div>
	<br>
	<br>
	<br>
</body>

</html>
