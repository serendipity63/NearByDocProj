<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<!-- alert 디자인 -->
<link rel="stylesheet"

	href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">	
	
<title>가족추가</title>

<style>
#container {
	background-color: #CFE8F7;
	margin: 10px auto;
	width: 430px;
	height: 800px;
	padding-top: 5px;
}

#famallymanage>span {
	font-size: 22px;
}

#famallymanage p {
	text-align: left;
	margin-left: 65px;
	margin-top: 10px;
}

input {
	height: 40px;
	width: 70%;
	margin: 10px 20px;
	border: 1px solid #16151562;
	border-radius: 4px;
	background: #ffffff;
	padding-left: 5px;
	/* Noto Sans 폰트 설정 */
	font-size: 12pt;
	font-style: normal;
	font-weight: normal;
	text-decoration: inherit;
	color: black;
	text-indent: 0.5em;
}

button {
	margin: 10 auto;
	width: 57;
	height: 36;
	text-align: center;
}

.idbtn {
	margin-left: 180px;
}

.idbtn>input {
	width: 57px;
	height: 36px;
	color: #2188C4;
	border-radius: 10px;
	float: left;
	text-align: left;
}

.cancel {
	background: #DAD9D9;
	border-radius: 10px;
	width: 57px;
	height: 36px;
	text-align: left;
	margin-left: -8px;
}

#famlist {
	background: white;
	height: 500px;
	overflow-y: auto;
}

#famlist>input {
	color: #2188C4;
	border-radius: 10px;
	margin-left: 300px;
	width: 57px;
	height: 36px;
	text-align: left;
}

.reg {
	border-radius: 10px;
	background: white;
	color: #2188C4;
	float: left;
}

#detailfam {
	width: 320px;
	padding: 10px;
	background-color: white;
	margin: 10 auto;
	text-align: left;
}

#detailfam>span {
	margin-left: 5px;
	font-size: 15px;
	font: bolder;
}

.material-symbols-outlined {
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24
}

table {
	border-radius: 10px;
	width: 360px;
	height: 100px;
}

table>td {
	font-size: 1px;
	margin-left: 10px;
}

table tr td:nth-child(1) {
	background-color: #CFE8F7;
	width: 90px;
	padding-left: 5px;
}

table tr td:nth-child(2) {
	padding-left: 5px;
}

input {
	margin-left: 70px;
}
</style>
<!-- alert 디자인 -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
<!-- 우편번호 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

$(function(){
	$(".reg").click(function(){
		var pname = $("#pname").val();
		var ptel = $("#tel").val();
		var proadaddress = $("#proadaddress").val();
		var pidnum = $("#idnum").val();
		
		// 데이터 작성 확인
		if (!pname || !ptel || !proadaddress || !pidnum) {
			Swal.fire({
				icon: 'error',
				title: 'Error',
				text: '모든 항목을 작성해야 합니다.'
			});
		} else {
			$.ajax({
				url: "addfamally",
				type: "post",
				data: {
					"pname": pname,
					"ptel": ptel,
					"proadaddress": proadaddress,
					"pidnum": pidnum
				},
				success: function(res) {
					console.log(res);
					if (res == "can") {
						Swal.fire({
							icon: 'success',
							title: '등록 성공',
							text: '가족 등록이 성공적으로 완료되었습니다.'
						}).then(function() {
							location.href = "addfamally";
						});
					} else {
						Swal.fire({
							icon: 'error',
							title: 'Error',
							text: '등록한 사람과 주민번호가 같을 수 없습니다.'
						});
					}
				}
			});
		}
	})
	
	
	$('#tel').keydown(function (event) {
    var key = event.charCode || event.keyCode || 0;
    var $text = $(this);

    if (key !== 8 && key !== 9) {
        if ($text.val().length === 3 || $text.val().length === 8) {
            $text.val($text.val() + '-');
        }
    }

    if (key !== 8 && key !== 9 && key !== 46 && (key < 48 || key > 57)) {
        event.preventDefault();
    }

    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57));
});

	
	
	$('#idnum').keydown(function (event) {
	    var key = event.charCode || event.keyCode || 0;
	    var $text = $(this);
	    var maxLength = 13;

	    if ($text.val().length >= maxLength && key !== 8 && key !== 9) {
	        event.preventDefault();
	    }

	    if (key !== 8 && key !== 9 && key !== 46 && (key < 48 || key > 57)) {
	        event.preventDefault();
	    }

	});


	
	
	
	$(".cancel").click(function() {
        // Reset the input fields
        $("#pname").val("");
        $("#tel").val("");
        $("#proadaddress").val("");
        $("#idnum").val("");
    });
	
	
	
	$("#proadaddress").click(function(){
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
				document.getElementById("proadaddress").value = addr;


			}

		}).open();
	})
	
	
})
</script>
</head>

<body>
	<!-- 헤더 -->
	<%
	pageContext.include("thinheader.jsp");
	%>
	<div id="container">
		<div id="famallymanage">
			<span style="text-align: left; margin: 10px 0 10px 10px">가족관리</span>
			<span class="material-symbols-outlined"
				onClick="location.href='mypage'" style="margin-left: 280px;">
				arrow_back </span> <br> <br>
			<!-- <form action="addfamally" method="post"> -->
			<p>이름</p>
			<input type="text" id="pname" name="pname" placeholder="이름"
				required="required">
			<p>전화번호</p>
			<input type="text" id="tel" name="tel" placeholder="전화번호"
				required="required">
			<p>주소</p>
			<input type="text" id="proadaddress" name="proadaddress"
				placeholder="주소" required="required">
			<p>주민등록번호</p>
			<input type="text" id="idnum" name="idnum" placeholder="주민등록번호"
				required="required"> <br>
			<div class="idbtn">
				<input class="reg" type=button value="등록" style="text-align: left;">
			</div>
			<!-- </form> -->
			<input class="cancel" type="button" value="취소"> <br>

		</div>

		<div id="famlist">
			<br>
			<c:forEach items="${familys}" var="family">
				<div id="detailfam">
					<table border="1">
						<tr>
							<td>이름</td>
							<td size="30px">${family.name }</td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td>${family.tel }</td>
						</tr>
						<tr>
							<td>주소</td>
							<td>${family.address }</td>
						</tr>
					</table>
				</div>
			</c:forEach>


			<input type="button" value="수정" onClick="location.href='modifamally'">
			<!-- <button><h4><a href="modifamally.html">수정</a></h4></button> -->
		</div>
	</div>

</body>

</html>