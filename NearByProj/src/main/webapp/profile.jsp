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
  background-color: white;
  margin: 10px  auto;
  width:430px;
  height:600px;
}

#container p input{
margin-left:60px;
}

#sub{
  margin: 10px auto;
   width:430px;
  font-size: 30px;
  overflow: hidden;
  text-aligin:left;
}

table{
  width: 400px;
  height: auto;
}

#subsub{
  margin: 0 auto;
  width: 430px;
  
}
.modibtn>input{
  width: 52px;
  height: 36px;
  border-radius: 10px;
  background : #CFE8F7;
  color: #black;
  font-size: 17px;
  text-align: left;
  margin-left:360px; 
}

#out{
  margin-top: 10px;
}

#out>input{
  width: 80px;
  height: 36px;
  background-color: #363A3E;
  color: white;
  border-radius: 10px;
  text-align: center;
  
}

#out>button{
  width: 80px;
  height: 36px;
  background-color: #363A3E;
  color: white;
  border-radius: 10px;
  text-align: center;
  margin-left:170px;
  
}

input{

    height: 40px;
    width: 70%;
    margin: 10px 20px;
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
  text-align: left;
  margin-left: 65px;
}


</style>
<script>
  function out(){
	  window.open()
   /* if (confirm("정말 탈퇴하시겠습니까??") == true){    //확인
 
 }else{   //취소 */
 
 return false;
 
 }


 
}
</script>
</head>

<body>
   <!-- 헤더 -->
   <% pageContext.include("thinheader.jsp");%>
   <div id="sub">
    <span>내 정보</span> 
    <span class="material-symbols-outlined" onClick="history.go(-1)" style="margin-left: 290px;">
      arrow_back
      </span> 
    <br>
    <hr>
  </div>
  
  <div id="subsub">
  <div class="modibtn">
    <input type="button" value="수정" onclick="location.href='modiprofile'">
  </div>
  </div>
  


   <div id="container">
    <div>
      <p class="col">이름</p>
      <p><input type="text" id="pname" value="${myinfo.getPname()}" disabled="disabled"></p>
      <p class="col">전화번호</p>
      <p><input type="text" id="tel"  value="${myinfo.getPtel() };" disabled="disabled"  ></p>
      <p class="col">이메일</p>
      <p><input type="text" id="address"value="${myinfo.getPemail() }" disabled="disabled"></p>
      <p class="col">주소</p>
      <p><input type="text" id="idnum" value="${myinfo.getProadaddress() }" disabled="disabled" ></p>
    </div>
    
    
     <%-- <div>
      <p class="col">이름</p>
      <p><input type="text" id="pname" value="${myinfo.getPname()}" disabled="disabled"></p>
      <p class="col">전화번호</p>
      <p><input type="text" id="tel"  value="${myinfo.getPtel() };" disabled="disabled"  ></p>
      <p class="col">이메일</p>
      <p><input type="text" id="address"value="${myinfo.getPemail() }" disabled="disabled"></p>
      <p class="col">주소</p>
      <p><input type="text" id="idnum" value="${myinfo.getProadaddress() } + ${myinfo.getPdetailaddress}" disabled="disabled" ></p>
    </div> --%>

   
    <div id="out">
      <button onclick="out()"><h5>회원탈퇴</h5></button>
     </div>
   </div>

   

</body>

</html>