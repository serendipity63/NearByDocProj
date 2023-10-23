<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!--  uri core를 c로 설정 -->
<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>니어닥병원정보</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9d89924221e4663ea28198ac12a7944f&libraries=services,drawing"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var roadAddress = data.roadAddress;
				var jibunAddress = data.jibunAddress;
				var zonecode = data.zonecode;
				var bname = data.bname;
				var buildingName = data.buildingName;
				var apartment = data.apartment;

				// 도로명 주소
				document.getElementById("hroad").value = roadAddress;
				// 상세주소
				document.getElementById("hdetails").value = jibunAddress;
				// 우편번호
				document.getElementById("hpostcode").value = zonecode;

				// 참고항목 (법정동명 및 건물명)
				var extraAddress = '';
				if (data.userSelectedType === 'R' && bname
						&& /[동|로|가]$/g.test(bname)) {
					extraAddress += bname;
				}
				if (buildingName && apartment === 'Y') {
					extraAddress += (extraAddress !== '' ? ', ' + buildingName
							: buildingName);
				}
				document.getElementById("hdong").value = extraAddress;

				// 주소를 좌표로 변환
				var geocoder = new daum.maps.services.Geocoder();
				geocoder.addressSearch(roadAddress, function(result, status) {
					if (status === daum.maps.services.Status.OK) {
						var lat = result[0].y; // 위도
						var lon = result[0].x; // 경도

						// 위도와 경도를 hidden input 필드에 저장
						document.getElementById("lat").value = lat;
						console.log(lat);
						document.getElementById("lon").value = lon;
						console.log(lon);
					}
				});
			}
		}).open();
	}
</script>


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
}
</style>



<body style="overflow-y: hidden">
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
				<td>진료과목</td>
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
				<td>
					<div style="display: flex;">
						<div style="width: 50%;">
							<input type="text" name="hroad" id="hroad" value="${hinfo.hroad}"
								readonly onclick="execDaumPostcode()" />
						</div>
						<div style="width: 50%;">
							<input type="text" name="hdetail" id="hdetail"
								placeholder="상세주소를 입력해주세요">
						</div>
					</div>
				</td>
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

		<input type="hidden" name="hpostcode" id="hpostcode"> 
			<input type="hidden" name="hdong" id="hdong"> <input
			type="hidden" name="hdetails" id="hdetails">


		<%-- 받아온 위도 경도를 hidden에다가 저장함 --%>
		<input type="hidden" id="lat" name="lat" value="${hinfo.lat}" /> <input
			type="hidden" id="lon" name="lon" value="${hinfo.lon}" />

	</form>



</body>


</html>