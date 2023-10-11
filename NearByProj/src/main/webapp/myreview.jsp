<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
  /* background-color: #CFE8F7; */
  background-color: white;
  margin: 10px  auto;
  width:430px;
  height:600;
  padding-top: 5px;
  overflow-y: scroll;
}

#sub{
  margin: 10px auto;
  font-size: 30px;
  overflow: hidden;
  text-align: left;
  width:430px;
}

#sub>input{
width: 30px;
height: 30px;
margin-left: 280px;
}

#reviewbox{
  width: 400;
  height: 150px;
  background-color: white;
  margin: 5px auto;
  border: solid 1px;
  border-radius: 10px;  
  text-align: left
}

#reviewbox>span{
  top: 10px;
  margin-left: 10px;
}

table{
  margin: 5px auto;
  width: 400px;
  height: 150px;
}

#res{
margin: 20px auto;
}

#res>h4,h5{
  text-align: left;
  margin-left: 20px;
}

#res>table{
  background-color: white;
}

.restable{
  background-color: white;
  border: solid 1px;
  border-radius: 10px;
}

</style>
</head>

<body>
   <!-- 헤더 -->
   <% pageContext.include("thinheader.jsp");%>
   <div id="sub">
    <span>나의 리뷰</span> 
    <span class="material-symbols-outlined" onClick="history.go(-1)" style="margin-left: 260px;">
      arrow_back
      </span> 
    <br>
    <hr>
  </div>


   <div id="container">
    <div id="res">
      <h4>ㅇㅇㅇ 종합병원</h4>
      <h5>2023.09.27</h5>
      <div id="reviewbox">
        <br>
        <span>진료 과목 </span> &nbsp; <span>내과</span>
        <br>
        <br>
        <span>⭐️⭐️⭐️⭐️⭐️</span>
        <br><br>
        <span>친절히 잘 진료해주십니다.</span>
      </div>
    </div>


    <div id="res">
      <h4>ㅇㅇㅇ 종합병원</h4>
      <h5>2023.09.20</h5>
      <div id="reviewbox">
        <br>
        <span>진료 과목 </span> &nbsp; <span>내과</span>
        <br>
        <br>
        <span>⭐️⭐️⭐️⭐️⭐️</span>
        <br><br>
        <span>친절히 잘 진료해주십니다.</span>
      </div>
    </div>

    

   
    
    <div></div>
   </div>

</body>

</html>