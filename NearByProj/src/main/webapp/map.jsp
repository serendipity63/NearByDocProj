<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>병원 지도</title>
</head>
<body>

	<div id="map" style="width: 100%; height: 350px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d95a6f2314398f89e05ca9f4f2fc27e&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'),
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667),
			level : 3
		};
		var map = new kakao.maps.Map(mapContainer, mapOption);
		 
		var coords = new kakao.maps.LatLng(${hospital.lat}, ${hospital.lon});


		var marker = new kakao.maps.Marker({
			map : map,
			position : coords
		});

		
		var infowindow = new kakao.maps.InfoWindow(
				{
					content : '<div style="width:150px;text-align:center;padding:6px 0;">${hospital.hname}</div>'
				});
		infowindow.open(map, marker);

		map.setCenter(coords);

	</script>
</body>
</html>