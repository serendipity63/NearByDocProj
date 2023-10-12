<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button id="currentAddress">현재위치 주소 구하기</button>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0f92754065fd18fb9b2450d8077e930c&libraries=services"></script>
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
    	alert((result[0].address.address_name));
    }
};

$("#currentAddress").click(function() {
	getUserLocation();	
})


</script>
</body>
</html>