<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
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
  border-radius: 10px;
  background-color: #CFE8F7;
  margin: 10px  auto;
  width:430px;
  height:684px;
  padding-top: 5px;
}

.whitebox{
  width: 340px;
  height: 130px;
  background-color: white;
  margin: 30px auto;
  display: flex;
  align-items: center;
  border-radius: 10px;
}

.whitebox a{
  color: black;
}


h1{
  margin: 0 auto;
  font-size: 26px;
}





</style>
</head>

<body>
    <% pageContext.include("thinheader.jsp");%>
   <div id="container">
    <div class="whitebox">
    <!-- <a href="myPageMain?page=resList">계좌개설</a>&nbsp;&nbsp; -->
      <h1><a href="Mypage/reslist">예약 내역</a></h1>
    </div>
    <div class="whitebox">
      <h1><a href="addfamally">자녀 추가</a></h1>
    </div>
    <div class="whitebox">
      <h1><a href="myreview">나의 리뷰</a></h1>
    </div>
    <div class="whitebox">
      <h1><a href="profile">개인 정보 수정</a></h1>
    </div>
   </div>

</body>

</html>