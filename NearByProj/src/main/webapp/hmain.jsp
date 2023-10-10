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
   background-color: none;
   margin-left:20px;
   color:rgb(25, 25, 112);
}

h3>img{
   
   background-color:white;
   margin-left:50px;
}
h3{
   color: #D9D9D9;
   margin-left:10px;
   
}
h3>a{

   color: #D9D9D9;
   margin-left:10px;
   text-decoration:none;

}
h3>p{
   background-color: #191970;
   margin-left:10px;
}

#sidemenubox {
   
   
   float: left;
   height: 900px;
   width: 180px;
   border:1px solid gray;
   
}
#list{
   height:600px;

}

#list>span {
   
   width: 300px;
   height: 50px;
   
   
}

#list>span>a {
   text-decoration: none;
   font-size: 14px;
   color: white;
   margin-left:20px;
}
#list>p>a{
   padding: 10px;
   text-decoration:none;
   color: white;
   background-color: rgb(25, 25, 112);
   border: 1px solid black;
   margin-left:40px;
}

#list>h2>button{
   background-color:rgb(12, 66, 132);
   margin-left:100px;
}
#list>h2>button>img{
   color:rgb(12, 66, 132);
}
.check{
   background-color: rgb(25, 25, 112);
   
}

.check>span>a{
   color:white;
   text-decoration:none;
   display:inline-block;
   width: 300px;
   height: 50px;
   margin-left:20px;
   margin-top:15px;
}

</style>
</head>
<body>
   <div id="header">

      <a href="reserve_t.jsp"><img src="image?file=navylogo.png"
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
         <div class="check">
            <span>
               <a href="allreserveinfo.jsp" >전체 조회</a>
            </span>
            
         
            <span>
               <a href="reserveinfo_d.jsp" >일정별 조회</a>
            </span>
            
            <span>
               <a href="reserveinfo_p.jsp" >환자별 조회</a>
            </span>
         </div>
         <hr>
         <br> <br>
         
         <hr>
         <span>
            <a href="hinfo.jsp">병원 정보</a>
         </span>
         <hr>
         <span>
            <a href="mrecord.jsp">진료 기록</a>
         </span>
         <hr>
         <br>
         <p>
            <a href="hlogin.jsp">로그아웃</a>
         </p>
         

      </div>

   </div>

   




</body>
</html>