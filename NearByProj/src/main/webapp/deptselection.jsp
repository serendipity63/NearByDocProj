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
    <title>Select Department</title>
    <style>
        body {
            font-family: 'Noto Sans kr', sans-serif;
        }

        li {
            list-style: none;
        }
    </style>
</head>

<body>
    <h2>진료과목을 선택하세요</h2>
    <form id="deptForm">
        <ul>
            <li>
                <input type="radio" name="dept" value="내과" > 내과
            </li>
            <li>
                <input type="radio" name="dept" value="정형외과"> 정형외과
            </li>
            <li>
                <input type="radio" name="dept" value="외과"> 외과
            </li>
            <li>
                <input type="radio" name="dept" value="피부과"> 피부과
            </li>
            <li>
                <input type="radio" name="dept" value="산부인과"> 산부인과
            </li>
            <li>
                <input type="radio" name="dept" value="정신건강의학과"> 정신건강의학과
            </li>
            <li>
                <input type="radio" name="dept" value="이비인후과"> 이비인후과
            </li>
            <li>
                <input type="radio" name="dept" value="소아과"> 소아과
            </li>
            <li>
                <input type="radio" name="dept" id="otherDeptCheckbox" value="기타" onchange="toggleOtherDeptInput()">
                기타
                <input type="text" name="otherDept" id="otherDeptInput" placeholder="기타 진료과목 입력" disabled>
            </li>
        </ul>
        <button type="button" onclick="selectDept()">선택 완료</button>
    </form>

    <script>
        function toggleOtherDeptInput() {
            var otherDeptInput = document.getElementById("otherDeptInput");
            var otherDeptCheckbox = document.getElementById("otherDeptCheckbox");

            if (otherDeptCheckbox.checked) {
                otherDeptInput.disabled = false;
            } else {
                otherDeptInput.disabled = true;
            }
        }

        function selectDept() {
            // 선택한 진료과목을 수집
            var selectedDepts = [];
            var checkboxes = document.querySelectorAll('input[name="dept"]');

            checkboxes.forEach(function (checkbox) {
                if (checkbox.checked) {
                    if (checkbox.value === "기타") {
                        // "기타" 옵션 선택 시 텍스트 상자의 값을 사용
                        var otherDeptInput = document.getElementById("otherDeptInput").value;
                        if (otherDeptInput.trim() !== "") {
                            selectedDepts.push(otherDeptInput);
                        }
                    } else {
                        selectedDepts.push(checkbox.value);
                    }
                }
            });

            // 선택한 진료과목을 부모 페이지로 전달
            if (selectedDepts.length > 0) {
                var selectedDeptsStr = selectedDepts.join(',');
                window.opener.postMessage(selectedDeptsStr, "*");
            } else {
                alert("진료과를 선택하세요.");
            }
            window.close();
        }

    </script>

</body>

</html>
