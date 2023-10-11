<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약하기</title>
    <style>
        .main {
            width: 430px;
            margin: auto;
        }

        .top {
            text-align: center;
            margin: auto;
            border-bottom: 1px solid;
        }

        .patientselect {
            border-bottom: 1px solid;
            border-color: gainsboro;
        }
        .selectservice {
            border-bottom: 1px solid;
            border-color: gainsboro;
        }
        
        .selectdate {
            border-bottom: 1px solid;
            border-color: gainsboro;
        }
        .selecttime {
            border-bottom: 1px solid;
            border-color: gainsboro;
        }
        .tbutton {
            margin-left: 20px;
        }
        .button {
            margin:auto;
            text-align: center;
        }
        #text {
            width:410px;
            height:300px;
            margin: 5px 5px 5px 5px;
        }
        .btn-primary {
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
            font-weight:bold;
			font-size: 18px;
        }
        .btn-primary:hover {
        	background-color: #0056b3;
        }
		.sub {
            font-weight: bold;
        }
        
    </style>
</head>

<body>
    <div class="main">
        <% pageContext.include("thinheader.jsp"); %>
        <br>
        <div class="top">
            <h3>예약하기 (OOO종합병원)</h3>
        </div>
        <br>
        <div class="patientselect">
            <p class="sub">진료 대상 선택</p>
            <br>
            <table>
                <tbody>
                    <tr>
                        <td width="100">
                            <img src="image?file=lee.jpg" alt="이강인" width="60" height="60">
                        </td>
                        <td width="100">
                            <img src="image?file=kim.jpg" alt="김민재" width="60" height="60">
                        </td>
                        <td width="100">
                            <img src="image?file=son.jpg" alt="손흥민" width="60" height="60">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="name">&nbsp;이강인
                        </td>
                        <td>
                            <input type="radio" name="name">&nbsp;김민재
                        </td>
                        <td>
                            <input type="radio" name="name">&nbsp;손흥민
                        </td>
                    </tr>
                </tbody>
            </table>
            <br>
        </div>
        <br>
        <div class="selectservice">
            <p class="sub">진료과목 선택</p>
            <br>
            <input type="radio" name="department">&nbsp;정형외과&nbsp;&nbsp;
            <input type="radio" name="department">&nbsp;내과
            <br><br>
        </div>
        <br>
        <div class="selectdate">
            <p class="sub">날짜선택 : <input type="text" id="datepicker"></p>
            <br>
        </div>
        <br>
        <div class="selecttime">
            <p class="sub">시간선택 : <input type="text"></p>
            <br>
            <button class="tbutton">09:00</button><button class="tbutton">09:30</button><button class="tbutton">10:00</button><button class="tbutton">10:30</button><button class="tbutton">11:00</button><button class="tbutton">11:30</button><button class="tbutton">13:00</button><button class="tbutton">13:30</button><button class="tbutton">14:00</button><button class="tbutton">14:30</button><button class="tbutton">15:00</button><button class="tbutton">15:30</button><button class="tbutton">16:00</button><button class="tbutton">16:30</button><button class="tbutton">17:00</button><button class="tbutton">17:30</button>
            <br><br>
        </div>
        <br>
        <div class="comment">
            <p class="sub">원장님께 하고 싶은말:</p>
            <br>
            <textarea cols="58" rows="2" placeholder="증상을 입력해주세요."></textarea>
        </div>
        <br>
        <div class="button">
            <button type="button" class="btn-primary" onclick="location.href='completereservation.jsp';">예약하기</button>
        </div>
    </div>
    <br><br><br>
</body>

</html>