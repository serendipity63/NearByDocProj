<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
   href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
   rel="stylesheet">
<title>NearByDocHeader</title>

<style>
#container {
  background-color: white;
  margin: 10px  auto;
  width:430px;
  height:600px;
  padding-top: 5px;
  overflow-y: scroll;
}

#sub{
  width:430px;
  margin: 10px auto;
  font-size: 30px;
  overflow: hidden;
  text-align: left;
}

#sub>input{
width: 30px;
height: 30px;
margin-left: 200px;
}


#res>span:nth-child(2){
  margin-left: 260px;
}


table{
  border: 1px solid;
  margin: 5px auto;
  width: 400px;
  height: 150px;
  border-radius: 10px;
}

#res{
margin: 15px auto 20px;

}

#res:nth-child(1)>table{
  background-color: #CFE8F7;
}

#res:nth-child(2)>table{
  background-color: white;
}

#res:nth-child(3)>table{
  background-color: white;
}

#res:nth-child(4)>table{
  background-color: white;
}

.restable{
  background-color: white;

}


.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 400,
  'GRAD' 0,
  'opsz' 24
}

</style>
</head>

<body>
   <!-- 헤더 -->
	<% pageContext.include("thinheader.jsp");%>
   <div id="sub">
    <span>예약 내역</span> 
    <span class="material-symbols-outlined" onClick="history.go(-1)" style="margin-left: 260px;">
      arrow_back
      </span>
    <br>
    <hr>
  </div>
   <div id="container">
    <div id="res">
      <span>2023.09.27</span>
      <span><a href="resmanage">예약 관리</a></span>
      <table class="restable" border="1">
        <tr>
        <th rowspan="2">
          <h4>ㅇㅇㅇ 종합병원</h4>
          <h5>서울특별시 금천구 남부순환로 호서대벤처타워</h5>
          <h5>02-1234-5678</h5>
        </th>
        <th>
          <h5>예약 일자</h5>
          <h5>2023.09.27</h5>
        </th>
      </tr>
      <tr>
        <th>
          <h5>예약 시간</h5>
          <h5>10:00</h5>
        </th>
      </tr>
      </table>
    </div>

    <div id="res">
      <span>2023.09.01</span>
      <span><a href="resmanage.html">진료 완료</a></span>
      <table class="restable" border="1">
        <tr>
        <th rowspan="2">
          <h4>ㅇㅇㅇ 종합병원</h4>
          <h5>서울특별시 금천구 남부순환로 호서대벤처타워</h5>
          <h5>02-1234-5678</h5>
        </th>
        <th>
          <h5>예약 일자</h5>
          <h5>2023.09.27</h5>
        </th>
      </tr>
      <tr>
        <th>
          <h5>예약 시간</h5>
          <h5>10:00</h5>
        </th>
      </tr>
      </table>
    </div>

    <div id="res">
      <span>2023.08.17</span>
      <span><a href="resmanage.html">진료 완료</a></span>
      <table class="restable" border="1">
        <tr>
        <th rowspan="2">
          <h4>ㅇㅇㅇ 종합병원</h4>
          <h5>서울특별시 금천구 남부순환로 호서대벤처타워</h5>
          <h5>02-1234-5678</h5>
        </th>
        <th>
          <h5>예약 일자</h5>
          <h5>2023.08.17</h5>
        </th>
      </tr>
      <tr>
        <th>
          <h5>예약 시간</h5>
          <h5>10:00</h5>
        </th>
      </tr>
      </table>
    </div>

    <div id="res">
      <span>2023.08.01</span>
      <span><a href="resmanage.html">진료 완료</a></span>
      <table class="restable" border="1">
        <tr>
        <th rowspan="2">
          <h4>ㅇㅇㅇ 종합병원</h4>
          <h5>서울특별시 금천구 남부순환로 호서대벤처타워</h5>
          <h5>02-1234-5678</h5>
        </th>
        <th>
          <h5>예약 일자</h5>
          <h5>2023.08.01</h5>
        </th>
      </tr>
      <tr>
        <th>
          <h5>예약 시간</h5>
          <h5>10:00</h5>
        </th>
      </tr>
      </table>
    </div>
    
    <div></div>
   </div>

</body>

</html>