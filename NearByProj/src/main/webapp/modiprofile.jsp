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

#sub{
  width:430px;
  margin: 10px auto;
  font-size: 30px;
  overflow: hidden;
}

.modibtn{
  width: 57px;
  height: 36px;
  border-radius: 10px;
  background-color: white;
  color:#2188C4;
  margin-left: 303px;
  margin-bottom: 2px;
  font-size: 18px;
  border: 1px solid #16151562;
}




.canbtn{
  width: 57px;
  height: 36px;
  border: solid 1px;
  border-radius: 10px;
  background-color: #78818C;
  /* margin-left: 2px; */
  margin-bottom: 2px;
  color: white;
  font-size: 18px;
  
}




#container {
  background-color: white;
  margin: 10px  auto;
  width:430px;
  height:600;
  padding-top: 5px;
}

table{
  width: 400px;
  height: auto;
}

#container p input{
    height: 40px;
    width: 70%;
    margin: 10px 20px;
    margin-left:60px;
    border: 1px solid #16151562;
    border-radius: 4px;
    background: #ffffff;
    /* padding-left: 5px; */
    /* Noto Sans 폰트 설정 */
    font-size: 12pt;
    font-style: normal;
    font-weight: normal;
    text-decoration: inherit;
    color: black;
    text-indent: 0.5em;
}

.col{
margin-left :60px;
}


</style>
<script>
	$(function() {
		$
	})
</script>
</head>

<body>
   <!-- 헤더 -->
   <% pageContext.include("thinheader.jsp");%>
   <div id="sub">
   <!--  <div >
      <span>
        <input class="modibtn" type="button" value="수정" onclick="modi()">
        <input class="canbtn" type="button" onclick="history.go(-1)" value="취소">
      </span>
      <br>  
    </div>
  
    
    <hr> -->
  </div>


   <div id="container">
    <div>
    <form id="updateProfile" action="modiprofile" method="post"> 
	    <p class="col">이름</p>
	    <p><input type="text" id="name" name="pname" value="${myinfo.pname }"></p>
	    <p class="col">전화번호</p>
	    <p><input type="text" id="tel" name="ptel"  value="${myinfo.ptel } "></p>
	    <p class="col">이메일</p>
	    <p><input type="text" id="email" name="pemail" value="${myinfo.pemail }"></p>
	    <p class="col">주소</p>
	    <p><input type="text" id="address" name="proadaddress" value="${myinfo.proadaddress }"></p>
	    <span>
        <input class="modibtn" type="submit" value="수정" onclick="modi()">
        <input class="canbtn" type="button" onclick="history.go(-1)" value="취소">
      </span>
    </form>
    </div>
    </div>


   

</body>

</html>