<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%--아이콘링크  --%>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<%--폰트링크  --%>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script>
	function openTypeSelectionPage() {
		// 진료과목 선택 페이지 열기
		var typeSelectionPage = window.open("department.jsp", "TypeSelection",
				"width=400,height=300");
		window.addEventListener("message", function(event) {
			document.querySelector(".type").value = event.data;
		});
	}
</script>


<style type="text/css">
@charset "UTF-8";

* {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans kr', sans-serif;
}

a {
	text-decoration: none;
}

.title {
	width: 100%;
	float: left;
	width: 70px;
	
	text-align: center;
	/* 가운데 정렬 */
	font-size: 20px;
	font-weight: bold;
	white-space: nowrap;
	margin-bottom: 20px;
	/* 아래 여백 추가 */
}

/* 로그인 폼 스타일 */
form.join-form {
	float: right;
	margin-top: 10px;
}

/* 로그인 폼 요소 스타일 */
form.join-form input[type="text"], form.join-form input[type="password"],
	form.join-form button {
	margin: 10px;
}

.container {
	padding: 10px;
	border: 2px solid;
	width: 500px;
	height: 700px;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 20px;
	margin-top: 60px;
}

.row {
	height: 40px;
	margin: auto;
}

.input {
	float: left;
}

input {
	width: 300px;
	height: 30px;
	border: 1px solid gray;
	border-radius: 2px;
	text-indent: 1em;
	/* 들여쓰기!!*/
}

input[type='submit'] {
	font-size: 16px;
	width: 300px;
	height: 40px;
	background-color: #191970;
	color: #fff;
	margin-bottom: 25px;
	text-indent: 0;
	border: 0;
}

input[type='text'], input[type='number'], input[type='password'], input[type='submit']
	{
	margin-bottom: 25px;
}

input[type='submit']:hover {
	cursor: pointer;
}

/* 우편번호 입력 칸 스타일 */
.input input[name='postcode'] {
	width: 130px;
	margin-bottom: 10px;
}

.input input[name='roadAddress'] {
	margin-bottom: 10px;
}

/* 우편번호 찾기 버튼 스타일 */
.input button[name='postcode-button'] {
	width: 100px;
	margin-left: 20px;
	height: 31px;
	text-align: center;
	background-color: #191970;
	color: #fff;
	border: none;
	cursor: pointer;
	border-radius: 3px;
}
</style>
<%--주소불러오기  --%>
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
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
			}
		}).open();
	}
</script>



<title>병원등록</title>
</head>

<%-- 사업자등록번호 유효성 검사  --%>
<body>
	<%
	pageContext.include("hospitalheader.jsp");
	%>

	<center>
		<div class="container" id='query'>
			<form action="hjoin" method="post" id='form'>
				<div class="title">병원등록</div>
				<div class="row">
					<div class="input">
						<input type="text" id="hname" name="hname" placeholder="병원명">
					</div>
				</div>
				<div class="row">
					<div class="input">
						<input type="text" id="hemail" name="hemail" placeholder="이메일">
					</div>
				</div>
				<div class="row">
					<div class="input">
						<input type="number" id="comnum" name="comnum"
							placeholder="사업자등록번호">
					</div>
				</div>

<%-- 주소시작 --%>

				<div class="row">
					<div class="input">
						<input type="text" id="postcode" name="postcode"
							placeholder="우편번호" readonly>
					</div>
					<div class="input">
						<button type="button" name="postcode-button"
							onclick="execDaumPostcode()">우편번호 찾기</button>
					</div>
				</div>


				<div class="row">
					<div class="input">
						<input type="text" id="address" name="roadAddress"
							placeholder="도로명 주소">
					</div>
				</div>
				<div class="row">
					<div class="input">
						<input type="text" id="detailAddress" name="detailAddress"
							placeholder="상세주소">
					</div>
				</div>
<%-- 주소끝 --%>

				<div class="row">
					<div class="input">
						<input type="number" name="phonenumber" placeholder="전화번호">
					</div>
				</div>
				
				<div class="row">
					<div class="input">
						<input type="password" id="hpassword" name="password" placeholder="비밀번호">
					</div>
				</div>
				
				<div class="row">
					<div class="input">
						<input name="type" type="text" class="type" placeholder="진료과목명"
							onclick="openTypeSelectionPage()">
					</div>
				</div>
				
				<div class="button">
					<input type="submit" value="병 원 등 록">
				</div>
				<div>
					니어바이닥 병원회원이신가요? <a href="hospitalmain">로그인</a>
				</div>
			</form>
		</div>
	</center>

</body>
</html>