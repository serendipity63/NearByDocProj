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

					주소 설정
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
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9d89924221e4663ea28198ac12a7944f&libraries=services"></script>
			<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
			<script>
var geocoder = new kakao.maps.services.Geocoder();

var latitude;   // 위도
var longitude; // 경도

function success({ coords, timestamp }) {
    latitude = coords.latitude;   // 위도
    longitude = coords.longitude; // 경도
    
    console.log(`위도: \${latitude}, 경도: \${longitude}, 위치 반환 시간: \${timestamp}`);
    //위도경도
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
    	  var addressName = result[0].address.address_name; //변수에 주소를 저장
    	  addressName += ","+latitude+":"+longitude;
    	  console.log(latitude)
    	  console.log(longitude)
    	  console.log(addressName)
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
	var geocoder = new kakao.maps.services.Geocoder();
	function execDaumPostcode() {

		new daum.Postcode({
			oncomplete: function (data) {
				geocoder.addressSearch(data.address, function(result,
						status) {
					if (status === kakao.maps.services.Status.OK) {
						//주소를 좌표로변환한 결과에서 위도와 경도를 얻어온다
						var latitude = result[0].y;
						var longitude = result[0].x;
						var letlon = latitude+":"+longitude;
						window.opener.postMessage(data.address+","+letlon,"*"); //전달하기
			  	    	window.close(); //전달하고 창 닫힘
					} else {
						console.error('오류');

					}
				});
			}
		}).open();
	}

</script>


</body>

</html>