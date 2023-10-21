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
	height: 45px;
	border-radius: 4px;
	right: 2px;
	border: none;
	top: 1px;
	background: #CFE8F7;
	color: #333333;
	cursor: pointer;
	font-weight: bold;
}

#info_pidnum {
	position: relative;
}

#info_pidnum button {
	position: absolute;
	width: 90px;
	height: 45px;
	border-radius: 4px;
	right: 2px;
	border: none;
	top: 1px;
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

<!-- 유효성검사 시작 -->

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						let isPidnumCheck = false;
						let isPemailCheck = false;

						// 주민번호 입력 필드에서 입력 변화 감지
						$("#pidnum").on(
								"input",
								function() {
									let pidnum = $("#pidnum").val();
									let formattedPidnum = formatPidnum(pidnum);
									$("#pidnum").val(formattedPidnum); // 입력 필드에 포맷팅된 값 설정
									pidnum = formattedPidnum.replace(/-/g, ""); // 하이픈 제외한 값
									const pidnumPattern = /^\d{13}$/; // 하이픈이 없는 13자리 숫자
									const isOK = pidnumPattern.test(pidnum);

									if (!isOK) {
										$("#pidnumMessage").text(
												"올바른 주민번호 형식으로 입력하세요").show();
										isPidnumCheck = false;
									} else {
										$("#pidnumMessage").hide();
										isPidnumCheck = true;
									}
								});

						// 주민번호 중복검사 버튼 클릭시
						$('#pidnumcheck').click(
								function() {
									if (!isPidnumCheck) {
										$("#pidnumMessage").text(
												"올바른 주민번호 형식으로 입력하세요").show();
										return;
									}

									const pidnum = $("#pidnum").val();
									$.ajax({
										url : "pidnumcheck",
										type : "post",
										data : {
											pidnum : $("#pidnum").val()

										},
										success : function(res) {
											console.log(res);
											if (res === "notexist") {
												$("#pidnumMessage").text(
														"사용 가능한 주민번호입니다")
														.show();
											} else {
												$("#pidnumMessage").text(
														"이미 가입된 주민번호입니다")
														.show();
											}
										},
										error : function(err) {
											console.log(err);
											$("#pidnumMessage").text(
													"주민번호 중복체크 오류").show();
										}
									});
								});

						function formatPidnum(pidnum) {
						    // 모든 하이픈 제거
						    pidnum = pidnum.replace(/-/g, "");
						    // 숫자와 하이픈만 남기고 나머지 문자 제거
						    pidnum = pidnum.replace(/[^\d]/g, "");
						    // 6자리 이상일 때 하이픈 추가
						    if (pidnum.length > 6) {
						        pidnum = pidnum.slice(0, 6) + '-' + pidnum.slice(6, 13);
						    }

						    return pidnum;
						}
						
						
						
						

						// 이메일 입력 필드에서 입력 변화 감지
						$("#pemail")
								.on(
										"input",
										function() {
											const pemail = $("#pemail").val();
											const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
											const isValid = emailRegex
													.test(pemail);

											if (!isValid) {
												$("#pemailMessage").text(
														"올바른 이메일 형식으로 입력하세요")
														.show();
												isPemailCheck = false;
											} else {
												$("#pemailMessage").hide();
												isPemailCheck = true;
											}
										});

						// 이메일 중복 검사 버튼 클릭 시
						$('#pemailcheck')
								.click(
										function() {
											if (!isPemailCheck) {
												$("#pemailMessage").text(
														"올바른 이메일 형식으로 입력하세요")
														.show();
												return;
											}

											const pemail = $("#pemail").val();
											$
													.ajax({
														url : "pemailcheck",
														type : "post",
														data : {
															pemail : pemail
														},
														success : function(res) {
															console.log(res);
															if (res === "notexist") {
																$(
																		"#pemailMessage")
																		.text(
																				"사용 가능한 이메일입니다")
																		.show();
															} else {
																$(
																		"#pemailMessage")
																		.text(
																				"이미 사용중인 이메일입니다")
																		.show();
															}
														},
														error : function(err) {
															console.log(err);
															$("#pemailMessage")
																	.text(
																			"이메일 중복체크 오류")
																	.show();
														}
													});
										});

						// 비밀번호 확인과 비밀번호 필드의 입력이 변경될 때 확인 함수 실행
						$("#ppasswordcheck, #ppassword").on(
								"input",
								function() {
									const ppassword = $("#ppassword").val();
									const ppasswordcheck = $("#ppasswordcheck")
											.val();

									if (ppassword !== ppasswordcheck) {
										$("#check").show();
										$("#join-button")
												.prop('disabled', true);
									} else {
										$("#check").hide();
										$("#join-button").prop('disabled',
												false);
									}
								});

						// 전화번호 자동하이픈
						$('.ptel')
								.keydown(
										function(event) {
											var key = event.charCode
													|| event.keyCode || 0;
											$text = $(this);
											if (key !== 8 && key !== 9) {
												if ($text.val().length == 3) {
													$text
															.val($text.val()
																	+ '-');
												}
												if ($text.val().length == 8) {
													$text
															.val($text.val()
																	+ '-');
												}
											}
											return (key == 8 || key == 9
													|| key == 46
													|| (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
										});

						$("#form").submit(function(e) {
						});
						
						
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
	<%
	pageContext.include("thinheader.jsp");
	%>



	<div class="myform">

		<form action="pjoin" method="post" id='form'>

			<div class="join">

				이메일 <span id="pemailMessage" class="error-message"></span>

				<div id="info_pemail">

					<input type="text" id="pemail" name="pemail"
						placeholder="nearbydoc@abc.com 형식으로 입력" required="required">

					<%-- 이메일중복검사및 이메일 유효성검사 버튼--%>
					<button id="pemailcheck">중복 확인</button>

				</div>


				비밀번호<br>

				<div class="input-container">

					<input type="password" id="ppassword" name="ppassword"
						class="form-control" placeholder="" required="required" /> <span
						class="icon material-symbols-outlined"> lock </span>

				</div>

				<div>

					비밀번호 확인 <span id="check" class="invalid-feedback"
						style="margin-left: 3px;">비밀번호가 동일하지 않습니다.</span>
				</div>

				<div class="input-container">

					<input type="password" id="ppasswordcheck" class="form-control"
						placeholder="" required /> <span
						class="icon material-symbols-outlined"> lock </span>

				</div>
				주민번호 <span id="pidnumMessage" class="error-message"></span><br>
				<div id="info_pidnum">
					<input type="text" id="pidnum" name="pidnum"
						placeholder="-없이 숫자만 입력" maxlength="14" required />
					<%-- 주민번호 중복검사 및 유효성검사 버튼 --%>
					<button id="pidnumcheck">중복 확인</button>
				</div>

				이름<br> <input type="text" id="pname" name="pname"
					placeholder="" required /> 휴대전화<br> <input type="text"
					id="ptel" class="ptel" name="ptel" maxlength="13"
					placeholder="-없이 숫자만 입력" /> 주소<br>

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

