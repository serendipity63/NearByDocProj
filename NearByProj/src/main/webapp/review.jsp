<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 작성</title>
    <style>
        .main {
            width: 430px;
            margin: auto;
        }

        .top {
            border-bottom: 1px solid;
        }

        .infosum {
            border-bottom: 1px solid;
            border-color: gainsboro;
        }
        .selectstar {
            border-bottom: 1px solid;
            border-color: gainsboro;
        }
        .starcount {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: auto;
        }
        #text {
            width:410px;
            height:300px;
            margin: 5px 5px 5px 5px;
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
        <% pageContext.include("header.jsp"); %>
        <br>
        <div class="top">
            <h3>리뷰 작성</h3>
        </div>
        <br>
        <div class="infosum">
            <table>
                <tbody>
                    <tr>
                        <td rowspan="3">
                            <img src="image?file=hospital.jpg" alt="병원" width="200">
                        </td>
                        <td>&nbsp;&nbsp;</td>
                        <td><h4>OOO종합병원</h4>
                        </td>
                    </tr>
                    <tr>
                    	<td>&nbsp;&nbsp;</td>
                        <td>서울특별시 금천구 남부순환로 호서대벤처타워</td>
                    </tr>
                    <tr>
                    	<td>&nbsp;&nbsp;</td>
                        <td>02)1234-5678</td>
                    </tr>
                    
                </tbody>
            </table>
            <br>
        </div>
        <br>
        <div class="selectstar">
            <p>별점을 선택하세요.</p>
            <div class="starcount">
                <img src="image?file=graystar.png" alt="회색별" width="40">&nbsp;
                <img src="image?file=graystar.png" alt="회색별" width="40">&nbsp;
                <img src="image?file=graystar.png" alt="회색별" width="40">&nbsp;
                <img src="image?file=graystar.png" alt="회색별" width="40">&nbsp;
                <img src="image?file=graystar.png" alt="회색별" width="40">
            </div>
            <br>
        </div>
        <br>
        <div class="textreview">
            <p>텍스트 리뷰</p>
            <br>
            <textarea cols="58" rows="10" placeholder="솔직한 사용후기를 작성해주세요!"></textarea>
        </div>
        <br>
        <div class="button">
            <button type="button" class="btn-primary">리뷰작성</button>
        </div>
        <h1>푸터</h1>
    </div>
</body>

</html>