<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!--  uri core를 c로 설정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
   rel="stylesheet">
<title>니어닥병원마이페이지</title>




<style>
*{
      font-family: 'Noto Sans kr', sans-serif;

}
body {
   
   background-color: rgb(245, 245, 245);
   margin:0 auto;
   
}

#header {
   width: 100%;
   height: 75px;
   background-color: #191970;
}
#header>span{
   color:#191970;
   font-size:27px;
   margin-right:200px;
   margin-top:25px;
   float:right;
   }
#header>a>img{
   margin-left:40px;
   margin-top:10px;
}
h2{
   margin-left:20px;
}

h3>img{
   
   background-color:white;
   margin-left:50px;
}
h3{
   color: white;
   margin-left:10px;
   margin-top:80px;
   
}
h3>a{

   color: black;
   margin-left:10px;
   text-decoration:none;

}
h3>p{
   color: black;
   margin-left:10px;
}

#sidemenubox {
   
   
   float: left;
   height:960px;
   width: 180px;
   border:1px solid gray;
   
}
#list{
   height:600px;
	
}
#list>p{
	margin-top:20px;
}

#list>p>a{
   padding: 10px;
   text-decoration:none;
   color: black;
   margin-left:40px;
   margin-top:40px;
}






</style>
</head>
<body>
<% pageContext.include("footer.jsp");%>
   <div id="header">

      <a href="reserve_t.jsp"><img src="image?file=icon.png"
         width="50px" height="50px" alt="로고 이미지"/></a>
         <span>병원매니저</span>
      


   </div>

   <div id="sidemenubox">




      <h3>
         <img src="image?file=home.png" width="50px" height="50px"><p>니어바이닥의원</p>
      </h3>
      <br>
      <h3>
         <a href="reserve_t.jsp" >오늘의 예약내역</a>
      </h3>
      
      <br>
      
      <div id="list">
         <hr>
         <h2>
            조회
            
         </h2>
         <hr>
         
            <p>
               <a href="allreserveinfo.jsp" >전체 조회</a>
            </p>
            
         
            <p>
               <a href="reserveinfo_d.jsp" >일정별 조회</a>
            </p>
            
            <p>
               <a href="reserveinfo_p.jsp" >환자별 조회</a>
            </p>
            <br>
        
         <hr>
         <br>
         <br>
         <hr>
         <p>
            <a href="hinfo.jsp">병원 정보</a>
         </p>
         <br>
         <hr>
         
         <p>
            <a href="mrecord.jsp">진료 기록</a>
         </p>
         <br>
         <hr>
         <br>
         <p>
            <a href="login.jsp">로그아웃</a>
         </p>
         

      </div>

   </div>

   




</body>
</html>