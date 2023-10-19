<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">
    <title>Select Type</title>
    <style>
        body {
            font-family: 'Noto Sans kr', sans-serif;
        }
       	button{
	background-color: #191970;
	color: #fff;
	border: 0;
	width:100px;
	height:25px;
	cursor:pointer;
       	}

        li {
            list-style: none;
        }
    </style>
</head>

<body>
    <h2>진료과목을 선택하세요</h2>
    <ul>
        <li><input type="checkbox" name="type" value="내과" id="type" > 내과</li>
        <li><input type="checkbox" name="type" value="정형외과" id="type"> 정형외과</li>
        <li><input type="checkbox" name="type" value="외과" id="type"> 외과</li>
        <li><input type="checkbox" name="type" value="피부과" id="type"> 피부과</li>
        <li><input type="checkbox" name="type" value="산부인과" id="type"> 산부인과</li>
        <li><input type="checkbox" name="type" value="정신건강의학과" id="type"> 정신건강의학과</li>
        <li><input type="checkbox" name="type" value="이비인후과" id="type"> 이비인후과</li>
        <li><input type="checkbox" name="type" value="소아과" id="type"> 소아과</li>
        <li>
            <input type="checkbox" name="type" id="otherTypeCheckbox" value="기타" onchange="toggleOtherTypeInput()">
            기타
            <input type="text" id="otherTypeInput" placeholder="기타 진료과목 입력" disabled>
        </li>
    </ul>
    <button onclick="selectTypes()">선택 완료</button>
    
    <script>
        function toggleOtherTypeInput() {
            var otherTypeInput = document.getElementById("otherTypeInput");
            var otherTypeCheckbox = document.getElementById("otherTypeCheckbox");

            if (otherTypeCheckbox.checked) {
                otherTypeInput.disabled = false;
            } else {
                otherTypeInput.disabled = true;
            }
        }

        function selectTypes() {
            // 선택한 진료과목을 수집
            var selectedTypes = [];
            var checkboxes = document.querySelectorAll('input[name="type"]:checked');

            checkboxes.forEach(function (checkbox) {
                if (checkbox.value === "기타") {
                    // "기타" 옵션 선택 시 텍스트 상자의 값을 사용
                    var otherTypeInput = document.getElementById("otherTypeInput").value;
                    if (otherTypeInput.trim() !== "") {
                        selectedTypes.push(otherTypeInput);
                    }
                } else {
                    selectedTypes.push(checkbox.value);
                }
            });

            // 선택한 진료과목을 부모 페이지로 전달
            var selectedTypesStr = selectedTypes.join(',');
            window.opener.postMessage(selectedTypesStr, "*"); // '*'는 모든 도메인에서 메시지를 수신할 수 있도록 함
            window.close();
        }
    </script>

</body>

</html>