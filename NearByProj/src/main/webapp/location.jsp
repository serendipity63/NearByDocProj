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
							class="material-symbols-outlined"> arrow_back </span></span> 주소 설정 </a>
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
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				/* if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== ''
							&& /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== ''
							&& data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("extraAddress").value = extraAddr;

				} else {
					document.getElementById("extraAddress").value = '';
				} */

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('hpostcode').value = data.zonecode;
				document.getElementById("haddress").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("hdetailAddress").focus();
			}
		}).open();
	}
</script>

</body>

</html>