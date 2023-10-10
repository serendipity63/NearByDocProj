<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 확인</title>
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

        .hosinfo {
            border-bottom: 1px solid;
        }

        .patient {
            border-bottom: 1px solid;
            border-color: gainsboro;
        }
        .resdate {
            border-bottom: 1px solid;
            border-color: gainsboro;
        }
        .restime {
            border-bottom: 1px solid;
            border-color: gainsboro;
        }
        .service {
            border-bottom: 1px solid;
            border-color: gainsboro;
        }
        
        .button {
            margin:auto;
            text-align: center;
        }
        .btn-primary {
            width: 410px;
            background-color: #cfe8f7;
            border-radius: 10px;
            border-color: white;

            padding: 15px 30px;
            text-align: center;
            font-size: 16px;
            margin: auto;
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
            <h3>예약이 완료되었습니다.</h3>
        </div>
        <br>
        <div class="hosinfo">
            <table>
                <tr>
                    <td>
                        <h4>OOO종합병원</h4>
                    </td>
                    <td rowspan="2">
                        <img src="image?file=hospital.jpg" alt="병원" width="150">
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>종합병원</p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <p>서울특별시 금천구 남부순환로 호서대벤처타워</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        진료 시간:
                    </td>
                    <td>
                        오전 9시 ~ 오후 6시
                    </td>
                </tr>
                <tr>
                    <td>
                        전화 번호:
                    </td>
                    <td>
                        02)1234-5678
                    </td>
                </tr>
            </table>
            <br>
        </div>
        <div class="patient">
       		<br>
            <p class="sub">진료 대상</p>
            <br>
            <table>
                <tbody>
                    <tr>
                        <td width="100">
                            <img src="image?file=lee.jpg" alt="이강인" width="60">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            이강인
                        </td>
                    </tr>
                </tbody>
            </table>
            <br>
        </div>
        <div class="resdate">
        	<br>
            <p class="sub">예약일자</p>
            <br>
            <p>2023.09.20 (수)</p>
            <br>
        </div>
        <div class="restime">
        	<br>
            <p class="sub">예약시간</p>
            <br>
            <p>10:00 AM</p>
            <br>
        </div>

        <div class="service">
        	<br>
            <p class="sub">진료과목</p>
            <br>
            <p>정형외과</p>
            <br>
        </div>
   
        <div class="comment">
        	<br>
            <p class="sub">원장님께 하고 싶은 말:</p>
            <br>
            <p>목감기가 심해요.</p>
            <br>
        </div>
    
        <div class="button">
            <button type="button" class="btn-primary" onclick="location.href='main.jsp';">메인화면으로</button>
        </div>
    </div>
    <br><br><br>
</body>

</html>