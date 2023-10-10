<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <title>병원 정보</title>
    <style>
        .main {
            width: 430px;
            margin: auto;
        }
        
        .material-symbols-outlined {
            font-variation-settings:
            'FILL' 0,
            'wght' 400,
            'GRAD' 0,
            'opsz' 24
        }

        .review {
            width: 380px;
            height: 150px;
            border: 1px solid;
            border-color: gainsboro;
            justify-content: center;
            align-items: center;
            margin: auto;
        }

        .left {
            width: 315px;
            margin-left: 5px;
        }

        .btn-text-right {
            width: 115px;
        }

        .info {
            border-bottom: 1px solid;
        }

        .reviewinfo1 {
            width: 360px;
            height: 100px;
            margin: 10px 10px 0 10px;
            background-color: gainsboro;
        }

        .reviewinfo2 {
            width: 370px;
            margin: 5px 0 5px 5px;
        }

        .reviewwrite {
            width: 430px;
            height: 110px;
            background-color: gainsboro;
            vertical-align: center;
            text-align: center;
        }
        .button {
            margin:auto;
            text-align: center;
        }
        .btn-primary {
            width: 410px;
            background-color: #1376F8;
            border-radius: 10px;
            border-color: white;
            color: white;
            padding: 15px 30px;
            text-align: center;
            font-size: 16px;
            margin: auto;
        }
    </style>
</head>

<body>
    <div class="main">
    <% pageContext.include("thinheader.jsp"); %>
    <br>
        <div class="info">
            <table>
                <tr>
                    <td>
                        <span class="material-symbols-outlined"
                        onclick="location.href='searchhospital.jsp'" style="cursor:pointer;">
                            arrow_back
                            </span>
                    </td>
                    <td>
                        <h3>KOSTA병원</h3>
                    </td>
                </tr>
            </table>
        </div>
        <br>
        <div class="info">
            <img src="image?file=hospital.jpg" alt="병원" width="420">

            <table class="hosinfo">
                <tr>
                    <td colspan="2">
                        종합병원
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <font size="6">
                            KOSTA병원
                        </font>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        서울특별시 금천구 남부순환로 호서대벤처타워
                    </td>
                </tr>
                <tr>
                    <td>
                        진료시간 :
                    </td>
                    <td>
                        오전 9시 ~ 오후 6시
                    </td>
                </tr>
                <tr>
                    <td>
                        전화번호 : 
                    </td>
                    <td>
                        02)1234-5678
                    </td>
                </tr>
            </table>
            <br>
        </div>
        <br>
        <table>
            <td style="text-align:left" width="215">&nbsp;&nbsp;&nbsp;리뷰 1</td>
            <td style="text-align:right" width="215"><a href="readreview.jsp">전체보기 ></a></td>
        </table>
        <br>
        <div class="review">
            <div class="reviewinfo1">
                <table>
                    <tr>
                        <td style="text-align:left" width="185">&nbsp;홍O동</td>
                        <td style="text-align:right" width="185">2023.10.03&nbsp;</td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;친절하게 진료 잘 해주십니다.
                        </td>
                    </tr>
                </table>
            </div>
            <div class="reviewinfo2">
                <table>
                    <tr>
                        <td>
                            사용자 별점&nbsp;&nbsp;
                        </td>
                        <td>
                            <img src="image?file=star.png" alt="별" width="15">
                            <img src="image?file=star.png" alt="별" width="15">
                            <img src="image?file=star.png" alt="별" width="15">
                            <img src="image?file=star.png" alt="별" width="15">
                            <img src="image?file=star.png" alt="별" width="15">
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <br>
        <div class="reviewwrite">
            <br>
            <p>이 병원에서 진료 경험, 어떠셨나요?</p>
            <br>
            <button onclick="window.open('review.jsp', 'window_name','width=800, height=1000, location=no, status=no, scrollbars=yes')">리뷰하기</button>
        </div>
        <br>
        병원 위치 정보
        <img src="image?file=map.png" alt="지도" width="430">
        <br><br>
        <div class="button">
            <button type="button" class="btn-primary" onclick="location.href='reservation.jsp';">예약하기</button>
        </div>
    </div>
    <br><br><br>
</body>

</html>