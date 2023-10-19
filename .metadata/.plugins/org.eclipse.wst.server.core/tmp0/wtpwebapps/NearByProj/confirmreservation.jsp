<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <h3>예약이 완료되었습니다.</h3>
        </div>
        <br>
        <div class="hosinfo">
            <table>
                <tr>
                    <td width="250px"  colspan="2">
                        <h4>${hospital.hname }</h4>
                    </td>
                    <td rowspan="2">
                        <img src="image?file=${hospital.hurl}" alt="병원" width="150">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <p>${hospital.department }</p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <p>${hospital.hroad }</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        진료 시간:
                    </td>
                    <td>
                        ${hospital.clinic }
                    </td>
                </tr>
                <tr>
                    <td>
                        전화 번호:
                    </td>
                    <td>
                        ${hospital.htel }
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
                        <c:choose>
							<c:when test="${reservation.pidnum eq user.pidnum}">
								<td>${user.pname}</td>
							</c:when>
							<c:otherwise>
								<td>${name}</td>
							</c:otherwise>
						</c:choose>
                    </tr>
                </tbody>
            </table>
            <br>
        </div>
        <div class="resdate">
        	<br>
            <p class="sub">예약일자</p>
            <br>
            <p>${reservation.resdate }</p>
            <br>
        </div>
        <div class="restime">
        	<br>
            <p class="sub">예약시간</p>
            <br>
            <p>${reservation.restime }</p>
            <br>
        </div>

        <div class="service">
        	<br>
            <p class="sub">진료과목</p>
            <br>
            <p>${hospital.department }</p>
            <br>
        </div>
   
        <div class="comment">
        	<br>
            <p class="sub">원장님께 하고 싶은 말:</p>
            <br>
            <p>${reservation.comment }</p>
            <br>
        </div>
    
        <div>
            <button type="button" class="btn-primary" onclick="location.href='patientmain.jsp';">메인화면으로</button>
        </div>
    </div>
    <br><br><br>
</body>

</html>