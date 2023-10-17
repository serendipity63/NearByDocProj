<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NearByDoc</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
	function toggleOtherDeptInput() {
		var otherDeptCheckbox = document.getElementById("otherDeptCheckbox");
		var otherDeptInput = document.getElementById("otherDeptInput");

		if (otherDeptCheckbox.checked) {
			otherDeptInput.removeAttribute("disabled");
		} else {
			otherDeptInput.setAttribute("disabled", "disabled");
		}
	}
</script>


<script type="text/javascript">
	function openLocationSelectionPage() {
		
		document.getElementById("latitude").value='';
		document.getElementById("longitude").value='';
		// 주소 설정 페이지 열기
		var locationSelectionPage = window.open("location.jsp",
				"LocationSelection", "width=500,height=600");

		window.addEventListener("message", function(event) {
			// event.data에 보내진 데이터가 포함
			var address = event.data;
			var addressArr = address.split(","); //주소와 위경도 분리

			var addressInput = document.getElementById("address-input");
			addressInput.value = addressArr[0];
			console.log(addressArr);
			console.log(addressArr[1]);
			if(addressArr.length==2) {
				var latilong = addressArr[1].split(":");  //위도와 경도 분리
				var latitude = document.getElementById("latitude");
				var longitude = document.getElementById("longitude");
				latitude.value= latilong[0];
				longitude.value= latilong[1];
			}
			console.log(addressInput.value);
		});
	}
</script>

<script>
	$(function() {
		$("#selectDeptBtn").click(function() {
			$("#department-input").val($("input[name='dept']:checked").val());
		})		
	})
</script>
<style>
* {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
}

.container {
	max-width: 425px;
	width: 100%;
	margin: 70px auto 20px auto;
	padding: 10px;
	border: 2px solid #16151562;
	border-radius: 10px;
	overflow: hidden;
}

.department-input, .address-input {
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

.hospital {
	display: flex;
	max-width: 395px;
	padding: 10px;
	margin: 75px auto;
	justify-content: center;
	width: 70%;
	height: 65px;
	background-color: #dad9d9;
	font-family: 'Noto Sans', sans-serif;
	cursor: pointer;
	flex-direction: column;
	padding-left: 30px;
	color: #333333;
}

/*서치박스 안에 있는거? */
.material-icons {
	font-size: 24px;
	color: black;
	text-decoration: none;
	opacity: 0.75;
}

.material-icons:hover {
	text-decoration: none;
}

.container-2, .container-3 {
	position: relative;
	white-space: nowrap;
}

.type, .address {
	border-bottom: 2px solid #ccc;
}

.footer-basic {
	padding: 40px 0;
	background-color: #ffffff;
	color: #4b4c4d;
}

.footer-basic ul {
	padding: 0;
	list-style: none;
	text-align: center;
	font-size: 18px;
	line-height: 1.6;
	margin-bottom: 0;
}

.footer-basic li {
	padding: 0 10px;
}

.footer-basic ul a {
	color: inherit;
	text-decoration: none;
	opacity: 0.8;
}

.footer-basic ul a:hover {
	opacity: 1;
}

.footer-basic .social {
	text-align: center;
	padding-bottom: 25px;
}

.footer-basic .social>a {
	font-size: 24px;
	width: 40px;
	height: 40px;
	line-height: 40px;
	display: inline-block;
	text-align: center;
	border-radius: 50%;
	border: 1px solid #ccc;
	margin: 0 8px;
	color: inherit;
	opacity: 0.75;
}

.footer-basic .social>a:hover {
	opacity: 0.9;
}

.footer-basic .copyright {
	margin-top: 15px;
	text-align: center;
	font-size: 13px;
	color: #aaa;
	margin-bottom: 0;
}
</style>

</head>

<body>
	<!-- 헤더 -->
	<%
	pageContext.include("header.jsp");
	%>

	<form action="searchhospital" method="post" id="searchhospital">
		<input type="hidden" name="latitude" id="latitude"/>
		<input type="hidden" name="longitude" id="longitude"/>
		<div class="container">
			<div class="searchbox">
				<div class="inner">
					<div class="container-2">
						<div class="type">
							<span class="icon"><i class="material-icons">search</i></span>
							&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" placeholder="진료과"
								class="department-input" name="department-input" required
								id="department-input" data-bs-toggle="modal" 
								data-bs-target="#myModal">
						</div>


					</div>
					<div class="container-3">
						<div class="address">
							<span class="icon"><i class="material-icons">location_on</i></span>
							&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" placeholder="주소설정"
								class="address-input" id="address-input" name="address-input"
								onclick="openLocationSelectionPage()" required >
						</div>
					</div>
					<div class="button">
						<button class="search-button" type="submit">병원 찾기</button>
					</div>
				</div>
			</div>
		</div>

	</form>
	<a class="hospital" href="hlogin">
		<div class="hospital">
			혹시 병원 관계자이신가요? <br>병원페이지 바로가기
		</div>
	</a>
	<h2 class="text-center"></h2>
	<div class="footer-basic">
		<footer>
			<div class="social">
				<a href="#"><i class="icon ion-social-instagram"></i></a><a href="#"><i
					class="icon ion-social-snapchat"></i></a><a href="#"><i
					class="icon ion-social-twitter"></i></a><a href="#"><i
					class="icon ion-social-facebook"></i></a>
			</div>
			<p class="copyright">NEARBYDOC © 2023</p>
		</footer>
	</div>
	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Modal Heading</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<ul>
						<li><input type="radio" name="dept" value="내과"> 내과</li>
						<li><input type="radio" name="dept" value="정형외과">
							정형외과</li>
						<li><input type="radio" name="dept" value="외과"> 외과</li>
						<li><input type="radio" name="dept" value="피부과"> 피부과
						</li>
						<li><input type="radio" name="dept" value="산부인과">
							산부인과</li>
						<li><input type="radio" name="dept" value="정신건강의학과">
							정신건강의학과</li>
						<li><input type="radio" name="dept" value="이비인후과">
							이비인후과</li>
						<li><input type="radio" name="dept" value="소아과"> 소아과
						</li>
						<li><input type="radio" name="dept" id="otherDeptCheckbox"
							value="기타" onchange="toggleOtherDeptInput()"> 
							기타 <input
							type="text" name="otherDept" id="otherDeptInput"
							placeholder="기타 진료과목 입력" disabled></li>
					</ul>

				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal" id="selectDeptBtn">선택 완료</button>
      </div>
    </div>
  </div>
</div>

</body>

</html>