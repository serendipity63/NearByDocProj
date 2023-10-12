<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<!-- Noto Sans 폰트 불러오기 -->

<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<title>회원가입</title>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans kr', sans-serif;
}

a {
	text-decoration: none;
}

.outerDiv {
	width: 430px;
	height: 180px;
	background-color: #CFE8F7;
	margin: 0 auto;
	text-align: center;
	padding: 10px 0;
	position: relative;
	margin-top: 0;
}

.outerDiv .logo img {
	width: 150px;
	height: 115px;
	vertical-align: middle;
	display: inline-block;
	margin-right: 10px;
	margin-top: 50px;
}

input {
	height: 45px;
	width: 98%;
	margin: 20px;
	border: 1px solid #16151562;
	border-radius: 4px;
	background: #ffffff;
	padding-left: 5px;
	font-size: 12pt;
	font-style: normal;
	font-weight: normal;
	text-decoration: inherit;
	color: black;
	text-indent: 0.5em;
}

button.join-button {
	height: 60px;
	width: 100%;
	border-radius: 4px;
	margin-top: 30px;
	margin-bottom: 20px;
	border: none;
	background: #CFE8F7;
	color: #333333;
	font-weight: bold;
	font-size: 14pt;
	display: inline-block;
	box-sizing: border-box;
}

form {
	width: 100%;
	margin: 20px auto;
	text-align: center;
}

input, button {
	margin: 10px 0;
}

input:focus {
	outline: none;
}

.myform {
	background: #fff;
	padding: 20px;
	text-align: center;
	width: 400px;
	margin: auto;
	height: 932px;
	margin-top: 10px;
	font-size: 13px;
}

.join {
	text-align: left;
}

::placeholder {
	color: #16151562;
}

.small-text {
	font-size: 12pt;
}

.join-button:hover {
	cursor: pointer;
}

.input-container {
	position: relative;
	margin-bottom: 7px;
}

.icon {
	position: absolute;
	right: 10px;
	top: 50%;
	/* 아이콘을 수직 중앙 정렬 */
	transform: translateY(-50%);
	opacity: 0.7;
}

.row {
	display: flex;
	align-items: center;
	margin-top: 1px;
}

/* 우편번호 입력 칸 스타일 */
.input input[name='ppostcode'] {
	width: 130px;
	height: 40px;
	margin-right: 30px;
	margin-bottom: 10px;
}

/* 우편번호 찾기 버튼 */
.input button[name='postcode-button'] {
	width: 100px;
	height: 40px;
	vertical-align: bottom;
	background: #CFE8F7;
	color: #333333;
	border: none;
	cursor: pointer;
	border-radius: 4px;
	font-weight: bold;
	.
}

#info_pemail {
	position: relative;
}

#info_pemail button {
	position: absolute;
	width: 90px;
	height: 42px;
	border-radius: 4px;
	right: 5px;
	border: none;
	top: 3px;
	background: #CFE8F7;
	color: #333333;
	cursor: pointer;
	font-weight: bold;
}

.error-message {
	color: red;
	font-size: 12px;
}

#check {
	color: red;
	display: none; /* 초기에는 숨김 처리 */
	right: 5px;
}
</style>

<!-- 아이디 중복검사 기능 -->

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<script type="text/javascript">
	$(function() {

		let isPemailCheck = false;

		$('#pemailcheck').click(function() {

			$.ajax({

				url : "pemailcheck",

				type : "post",

				data : {

					pemail : $("#pemail").val()

				},

				success : function(res) {

					console.log(res);

					if (res == "notexist") {

						isPemailCheck = true;

						$("#pemailMessage").text("사용 가능합니다").show();

					} else {

						$("#pemailMessage").text("이메일이 중복됩니다").show();

					}

				},

				error : function(err) {

					console.log(err);

					$("#pemailMessage").text("이메일 중복체크 오류").show();

				}

			});

		});

		$("#pemail").change(function() {

			isPemailCheck = false;

			$("#pemailMessage").hide();

		});

		$("#form").submit(function(e) {

			if (isPemailCheck == false) {

				$("#pemailMessage").text("이메일 중복체크하세요").show();

				e.preventDefault();

			}

		});

	});
</script>

<script>
	function check() {

		let ppassword = $("#ppassword").val();

		let ppasswordcheck = $("#ppasswordcheck").val();

		if (ppassword !== ppasswordcheck) {

			$("#check").show();

			$("#join-button").prop('disabled', true); // 비밀번호 불일치 시 회원가입 버튼 비활성화

		} else {

			$("#check").hide();

			$("#join-button").prop('disabled', false); // 비밀번호 일치 시 회원가입 버튼 활성화

		}

	}

	$(document).ready(function() {

		$("#check").hide();

	});
</script>

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
				document.getElementById('ppostcode').value = data.zonecode;

				document.getElementById("proadaddress").value = addr;

				// 커서를 상세주소 필드로 이동한다.

				document.getElementById("pdetailaddress").focus();

			}

		}).open();

	}
</script>

</head>

<body>

	<div class="outerDiv">

		<a href="home" class="logo"><img src="image?file=logo.png"
			alt="로고 이미지"></a>

	</div>

	<div class="myform">

		<form action="pjoin" method="post" id='form'>

			<div class="join">

				이메일<br>

				<div id="pemailMessage" class="error-message"></div>

				<div id="info_pemail">

					<input type="text" id="pemail" name="pemail"
						placeholder="nearbydoc@abc.com 형식으로 입력" required="required">

					<button id="pemailcheck">중복 확인</button>

				</div>

				<br> 비밀번호<br>

				<div class="input-container">

					<input type="password" id="ppassword" name="ppassword"
						class="form-control" placeholder="" required /> <span
						class="icon material-symbols-outlined"> lock </span>

				</div>

				<div>

					비밀번호 확인 <span id="check" class="invalid-feedback"
						style="margin-left: 10px;">비밀번호가 동일하지 않습니다.</span>

				</div>

				<div class="input-container">

					<input type="password" id="ppasswordcheck" class="form-control"
						onchange="check()" placeholder="" required /> <span
						class="icon material-symbols-outlined"> lock </span>

				</div>

				이름<br> <input type="text" id="pname" name="pname"
					placeholder="" required /> 휴대전화<br> <input type="number"
					id="ptel" name="ptel" placeholder="-없이 숫자만 입력" /> 주민번호<br> <input
					type="number" id="pidnum" name="pidnum" placeholder="-없이 숫자만 입력"
					required /> 주소<br>

				<div class="row">

					<div class="input">

						<input type="text" id="ppostcode" name="ppostcode"
							placeholder="우편번호" readonly>

					</div>

					<div class="input">

						<button type="button" name="postcode-button"
							onclick="execDaumPostcode()">우편번호 찾기</button>

					</div>

				</div>

				<input type="text" id="proadaddress" name="proadaddress"
					placeholder="도로명주소" readonly>

				<div class="input">

					<input type="text" id="pdetailaddress" name="pdetailaddress"
						placeholder="상세주소">

				</div>

			</div>

			<button type="submit" id="join-button" class="join-button" disabled>회원가입</button>

			니어바이닥 회원이신가요? <a href="main">로그인</a>

		</form>

	</div>

</body>

</html>


