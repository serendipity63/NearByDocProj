<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
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
    /* Noto Sans 폰트 설정 */
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

input,
button {
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
.input input[name='postcode'] {
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
    
    
}

.pemail_ok{
color:green;
display:none;
}
.pemail_taken{
color:red;
display:none
}
</style>
<!-- 아이디 중복검사  기능 -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript">
function checkpemail(){
	let pemail=$('.pemail').val(); // pemail에 입력되는 값 
	
	$.ajax({
		url:'pemailCheck', //controller에서 요청받을 주소
		type:'post',
		data:{pemail:pemail},
		dataType:'json',
		success:function(result){ //컨트롤러에서 넘어온 result값을 받는다
			if(result==0){
				$("#checkpemail").html('이미 존재하는 이메일입니다');
				$("checkpemail").attr('color','red');
				} else{ 
				$("#checkpemail").html('사용할 수 있는 이메일입니다');
				$("checkpemail").attr('color','green');
				}			
			},
			
		error:function(){
			alert("서버요청 실패");
		}
	});
};

</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
		new daum.Postcode(
				{
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
						document.getElementById("detailAddress")
								.focus();
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
                <input type="email" id="pemail" name="pemail" placeholder="nearbydoc@abc.com 형식으로 입력" required oninput="checkEmail()">
                <font id="checkpemail" size="2"></font>
                <br>
                비밀번호<br>
                <div class="input-container">
                    <input type="password" placeholder="" required />
                    <span class="icon material-symbols-outlined">
                        lock
                    </span>
                </div>
                비밀번호 재확인<br>
                <div class="input-container">
                    <input type="password" placeholder="" required />
                    <span class="icon material-symbols-outlined">
                        lock
                    </span>
                </div>
                이름<br>
                <input type="text" id="pname" placeholder="" required />
                휴대전화<br>
                <input type="number" id="ptel" placeholder="-없이 숫자만 입력" />
                주민번호<br>
                <input type="number" id="pidnum" placeholder="-없이 숫자만 입력" required />

                주소<br>
                <div class="row">
                    <div class="input">
                        <input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly>
                    </div>
                    <div class="input">
                        <button type="button" name="postcode-button" onclick="execDaumPostcode()">우편번호 찾기</button>
                    </div>
                </div>


                <input type="text" id="address" name="roadAddress" placeholder="도로명주소" readonly>
                <div class="input">
                    <input type="text" id ="detailAddress" name="detailAddress" placeholder="상세주소">

                </div>

            </div>
            <button type="submit" class="join-button">회원가입</button>
        </form>
    </div>
</body>

</html>