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
<title>위치설정</title>


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
							class="material-symbols-outlined"> close </span></span> 주소 설정 </a>
				</button>
			</div>
		</div>
		<div class="find">
			어디에 있는 병원을 찾으세요?

			<div class="currentloc">
				<button class="current" id="currentAddress">
					<%-- 현재위치 가져오기 --%>
					<span class="icon-text-wrapper"> <span
						class="material-symbols-outlined"> location_searching </span>
					</span> 현재 위치에서 병원 찾기
				</button>
			</div>



			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0f92754065fd18fb9b2450d8077e930c&libraries=services"></script>
			<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
			<script>
var geocoder = new kakao.maps.services.Geocoder();

function success({ coords, timestamp }) {
    const latitude = coords.latitude;   // 위도
    const longitude = coords.longitude; // 경도
    
    console.log(`위도: \${latitude}, 경도: \${longitude}, 위치 반환 시간: \${timestamp}`);
    var coord = new kakao.maps.LatLng(latitude, longitude);
    geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
}

function getUserLocation() {
    if (!navigator.geolocation) {
        throw "위치 정보가 지원되지 않습니다.";
    }
    navigator.geolocation.getCurrentPosition(success);
}

var callback = function(result, status) {
    if (status === kakao.maps.services.Status.OK) {
    	  addressName = result[0].address.address_name; //변수에 주소를 저장
    	  window.opener.postMessage(addressName,"*"); //전달하기
    	  
    	  window.close(); //전달하고 창 닫힘
    }

   
};


$("#currentAddress").click(function() {
	getUserLocation();	
})

</script>

			<%-- 현재위치 가져오기 끝 --%>

			<div class="otherloc">
				<button class="other" onclick="execDaumPostcode()">
					<img src="image?file=hospital1.jpg" height="250" width="150"
						alt="병원이미지"> 다른 위치에서 병원 찾기 <br> <br>
				</button>

			</div>
		</div>
	</div>


	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>

	function execDaumPostcode() {

	new daum.Postcode({

	oncomplete: function (data) {

	var addrArray = data.jibunAddress.split(' '); // 지번 주소를 공백으로 나눠 배열로 분리

var sido = addrArray[0]; // 첫 번째 요소는 시/도 정보

var sigungu = addrArray[1]; // 두 번째 요소는 시/군/구 정보

var bname = data.bname; // 건물명 가져오기

// 시/도와 시/군/구 정보를 해당 필드에 넣는다

document.getElementById("hsido").value = sido;

document.getElementById("hsigungu").value = sigungu;

document.getElementById("bname").value = bname;



console.log("hsido 값: " + sido);

console.log("hsigungu 값: " + sigungu);

console.log("bname 값: " + bname);


// 주소 데이터를 JavaScript 변수에 저장
var addressData = sido + " " + sigungu + " " + bname;

// 이제 addressData 변수에 주소 데이터가 저장됨
console.log("주소 데이터: " + addressData);

// 주소 데이터를 부모 창에 전달
window.opener.postMessage(addressData, "*");

// 주소 검색 완료 후 자동으로 다이얼로그를 닫음
if (data.autoClose) {
    window.close();


}
    }
}).open();

}

</script>


	<!-- 여기서 hsido와 hsigungu 필드를 추가 -->
	<input type="hidden" id="hsido" name="hsido" value="">
	<input type="hidden" id="hsigungu" name="hsigungu" value="">
	<input type="hidden" id="bname" name="bname" value="">

</body>

</html>