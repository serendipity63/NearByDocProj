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

<%--sweetalert2  --%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script>
	function openTypeSelectionPage() {
		// 진료과목 선택 페이지 열기
		var typeSelectionPage = window.open("department.jsp", "TypeSelection",
				"width=400,height=400");
		window.addEventListener("message", function(event) {
			document.querySelector("#department").value = event.data;
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
	height: 800px;
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
	margin-bottom: 22px;
}

input[type='submit']:hover {
	cursor: pointer;
}

/* 우편번호 입력 칸 스타일 */
.input input[name='hpostcode'] {
	width: 130px;
	margin-bottom: 10px;
}

.input input[name='hroadAddress'] {
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

#info_comnum button {
	position: absolute;
	width: 90px;
	height: 29.5px;
	border-radius: 3px;
	border: none;
	background: #191970;
	display: inline;
	color: #fff;
	cursor: pointer;
	margin-left: -90px;
}
</style>
<!-- 사업자번호 중복검사  기능 -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>

<script type="text/javascript">
	$(function() {
		let isComnumCheck = false;
		let isPasswordMatch = false;

		$('#comnumcheck').click(function() {
			const comnum = $("#comnum").val().trim(); // 사업자번호 입력에서 공백 제거
			if (comnum.length !== 10) {
				Swal.fire("오류", "사업자등록번호는 10자리여야 합니다", "error");
				return; // 입력 오류가 있으므로 중복 체크를 진행하지 않음
			}

			$.ajax({
				url : "comnumcheck",
				type : "post",
				data : {
					comnum : comnum
				},
				success : function(res) {
					console.log(res);
					if (res == "notexist") {
						isComnumCheck = true;
						Swal.fire("성공", "사용 가능합니다", "success");
					} else {
						Swal.fire("오류", "사업자등록번호가 중복됩니다", "error");
					}
				},
				error : function(err) {
					console.log(err);
					Swal.fire("오류", "사업자번호 중복체크 오류", "error");
				}
			});
		});

		$('#comnum, #hpassword, #hpassword-confirm').change(function() {
			isComnumCheck = false;
			isPasswordMatch = false;
		});

		$("#form").submit(function(e) {
			const comnum = $("#comnum").val().trim(); // 사업자번호 입력에서 공백 제거
			const password = $("#hpassword").val();
			const confirmPassword = $("#hpassword-confirm").val();

			if (comnum.length !== 10) {
				Swal.fire("오류", "사업자등록번호는 10자리여야 합니다", "error");
				e.preventDefault();
			} else if (!isComnumCheck) {
				Swal.fire("오류", "사업자번호 중복체크하세요", "error");
				e.preventDefault();
			} else if (password !== confirmPassword) {
				Swal.fire("오류", "비밀번호가 일치하지 않습니다. 다시 확인해주세요", "error");
				e.preventDefault();
				/*         } else {
				 // 회원가입 성공 메세지
				 Swal.fire("성공", "회원가입이 성공적으로 완료되었습니다!", "success")
				 e.preventDefault();
				 */
				/*             
				 .then((result) => {
				 // "확인" 버튼을 누르면 hospitallogin.jsp 페이지로 리디렉션
				 if (result.isConfirmed) {
				 window.location.href = "hospitallogin.jsp";
				 }
				 });   */
			}
		});
	});
</script>


<%--주소불러오기  --%>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode1() {
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
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
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
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('hpostcode').value = data.zonecode;
				document.getElementById("haddress").value = addr;
				addressSearch(addr);
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("hdetailAddress").focus();
			}
		}).open();
	}
</script>



<title>병원등록</title>
</head>

<body>
	<%
	pageContext.include("hospitalheader.jsp");
	%>

	<center>
		<div class="container" id='query'>
<form action="hjoin" method="post" id="form" enctype="multipart/form-data">
				<div class="title">병원등록</div>

				<div class="row">
					<div class="input">
						<input type="text" id="hname" name="hname" placeholder="병원명">
					</div>
				</div>


				<div id="info_comnum">
					<div class="row">
						<div class="input">
							<input type="number" id="comnum" name="comnum"
								placeholder="사업자등록번호" required="required" />
							<button id="comnumcheck">중복 확인</button>

						</div>
					</div>
				</div>



				<div class="row">
					<div class="input">
						<input type="password" id="hpassword" name="hpassword"
							placeholder="비밀번호" required="required"/ >
					</div>
				</div>
				<div class="row">
					<div class="input">
						<input type="password" id="hpassword-confirm"
							placeholder="비밀번호 재확인" required="required" />
					</div>
				</div>

				<%-- 주소시작 --%>

				<div class="row">
					<div class="input">
						<input type="text" id="hpostcode" name="hpostcode"
							placeholder="우편번호" readonly>
					</div>
					<div class="input">
						<button type="button" name="postcode-button"
							onclick="execDaumPostcode1()">우편번호 찾기</button>
					</div>
				</div>


				<div class="row">
					<div class="input">
						<input type="text" id="haddress" name="hroad" placeholder="도로명 주소"
							onblur="addressSearch(this.value)">
					</div>
				</div>
				<div class="row">
					<div class="input">
						<input type="text" id="hdetailAddress" name="hdetail"
							placeholder="상세주소">
					</div>
				</div>
				<input type="text" id="extraAddress" name="hdong" placeholder="참고항목">

				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0f92754065fd18fb9b2450d8077e930c&libraries=services,drawing"></script>

				<script>
					var geocoder = new kakao.maps.services.Geocoder();
					function addressSearch(haddress) {
						geocoder.addressSearch(haddress, function(result,
								status) {
							if (status === kakao.maps.services.Status.OK) {
								//주소를 좌표로변환한 결과에서 위도와 경도를 얻어온다
								var latitude = result[0].y;
								var longitude = result[0].x;
								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);
								console.log(latitude);
								console.log(longitude);
								console.log(coords);
								// 위경도 넣는다 input에
								document.getElementById('latitude').value = latitude;
								document.getElementById("longitude").value = longitude;

							} else {
								console.error('오류');

							}
						});
					}
				</script>
				<input type="hidden" id="latitude" name="lat" placeholder="위도">
				<input type="hidden" id="longitude" name="lon" placeholder="경도">

				<%-- 주소끝 --%>

				<div class="row">
					<div class="input">
						<input type="number" name="htel" placeholder="전화번호">
					</div>
				</div>

				<div class="row">
					<div class="input">
						<input type="text" class="type" placeholder="진료과목명"
							onclick="openTypeSelectionPage()" name="department"
							id="department" required="required" />
					</div>
				</div>

				<div class="row">
					<div class="input">
						<input type="text" name="clinic" placeholder="진료시간">
					</div>
				</div>
				<div class="row">
					<div class="input">
						<input type="text" name="lunch" placeholder="점심시간">
					</div>
				</div>
				<div class="row">
					<div class="input">
						<%--디자인은 수정할게요  --%>
						<input type="file" name="hurl" id="file" accept="image/*" />
					</div>
				</div>
				<div class="button">
					<input type="submit" value="병 원 등 록">
				</div>
				<div>
					니어바이닥 병원회원이신가요? <a href="hlogin">로그인</a>
				</div>
			</form>
		</div>
	</center>

</body>
</html>