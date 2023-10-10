<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>병원 찾기</title>
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <style>
	
        .main {
            width: 430px;
            margin: 0 auto;
			padding: 10px 0;
			position: relative;
        }
		.container {
            max-width: 425px;
            width: 100%;
            margin: 30px auto 20px auto;
            padding: 10px;
            border: 2px solid #16151562;
            border-radius: 10px;
            overflow: hidden;
        }

        .search-input,
        .address-input {

            padding: 13px;
            border: none;
            outline: none;
            font-family: 'Noto Sans', sans-serif;
            font-size: 17px;
            margin-bottom: 0px;
            margin-top: 20px;
            width: 97%;
            margin-left: 5px;
        }

        .container-2 .icon,
        .container-3 .icon {
            position: absolute;
            top: 30px;
            margin-left: 5px;
            z-index: 1;
            vertical-align: middle;
        }

        .search-button {
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
            margin-top: 20px;
            margin-bottom: 10px;
        }

        .search-button:hover {
            background-color: #0056b3;
        }

        /*서치박스 안에 있는거? */
        .material-icons {
            font-size: 24px;

        }

        .container-2,
        .container-3 {
            position: relative;
            white-space: nowrap;

        }

        .type,
        .address {
            border-bottom: 2px solid #ccc;
        }
        .condition {
            width: 430px;
            height: 60px;
            border-bottom: 1px solid;
        }
       
        .material-symbols-outlined {
            font-size: 60px;
            font-variation-settings:
            'FILL' 0,
            'wght' 400,
            'GRAD' 0,
            'opsz' 24
        }

        .btn-text-right {
            width: 115px;
        }

        .hos {
            border-bottom: 1px solid;
            border-color: gainsboro;
        }
    </style>
</head>

<body>
    <% pageContext.include("thinheader.jsp"); %>
    <div class="container">
        <div class="searchbox">
            <div class="inner">
                <div class="container-2">
                    <div class="type">
                        <span class="icon"><i class="material-icons">search</i></span>
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" placeholder="진료과" class="search-input">
                    </div>
                </div>
                <div class="container-3">
                    <div class="address">
                        <span class="icon"><i class="material-icons">location_on</i></span>
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" placeholder="주소설정" class="address-input">
                    </div>
                </div>
                <div class="button">
                    <button class="search-button">병원 재검색</button>
                </div>
            </div>
        </div>
    </div>
    <div class="main">
    	
        <div class="condition">
                <h3>검색 조건 "독산동" / "내과" 검색결과(총 20건)</h2>
                <p>설정 조건과 가까운 병원 검색 결과입니다.</p>
        </div>
        <div class="hoslist">
            <div class="hos" onclick="location.href='hospitalinfo.jsp';" style="cursor:pointer;">
                <table class="hosinfosum" width="430">
                    <tbody>
                        <tr>
                            <td colspan="3" width="330"><h4 style="font-size: 24px;">KOSTA치과의원</h4></td>
                            <td rowspan="4">
                                <center>
                                    <br><br>
                                    <div onclick="window.open('https://map.naver.com', 'window_name','width=600, height=400, location=no, status=no, scrollbars=yes')" style="cursor:pointer;">
                                        <span class="material-symbols-outlined" >
                                            map
                                            </span>
                                            <p>지도보기</p>
                                    </div>
                                    
                            </center>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                15km
                            </td>
                            <td>
                                종합병원
                            </td>
                            <td>
                                02)1234-5678
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">서울특별시 금천구 남부순환로 1252</td>

                        </tr>
                        <tr>
                            <td colspan="2">5.0
                                <img src="image?file=star.png" alt="별" width="15">
                                <img src="image?file=star.png" alt="별" width="15">
                                <img src="image?file=star.png" alt="별" width="15">
                                <img src="image?file=star.png" alt="별" width="15">
                                <img src="image?file=star.png" alt="별" width="15">
                            </td>
                            <td>리뷰 10건</td>
                        </tr>
                    </tbody>
                </table>
                <br>
            </div>
        </div>
    </div>
    <br><br><br>
</body>

</html>