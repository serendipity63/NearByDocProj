<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
   rel="stylesheet">
<link rel="stylesheet" href="my_mouseover.css" />
   
<title>니어닥병원마이페이지</title>




<style>
*{
      font-family: 'Noto Sans kr', sans-serif;

}

body {
   
   	background-color: #eee;
  	width:100%;
  	height:100%;
   
}


#header {
   	width: 100%;
    height: 75px;
    background-color: #191970;
   	margin:0 auto;
   
}
#header>span{
   color:white;
   font-size:27px;
   margin-right: 100px;
   margin-top:25px;
   float:right;
   }
#header>a>img{
   margin-left: 33px;
   margin-top: 13px;
   width: 60px;
   filter:brightness(0.8);
}
#header>a>img:hover{
  
   filter:brightness(1.5);

}
h2{
   margin-left:50px;
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
   margin-left:15px;
   text-decoration:none;

}
h3>a:hover{color:blue;}
h3>p{
   color: black;
   margin-left:48px;
   margin-top:20px;
}
h3>p>a{
	text-decoration:none;
}

#sidemenubox {
  
  	float: left;
    height: 850px;
    width: 180px;
    border-right: 1px solid gray;
    margin-left: 4px;
    text-decoration:none;
}

#list{
   height:600px;
	
}
#list>p{
	
	margin:15px auto;
}

#list>p>a{
   padding: 10px;
   text-decoration:none;
   color: black;
   margin-left:40px;
   margin-top:40px;
}
#list>p>a:hover{
   color:blue;

}
#logout>a{text-decoration:none;margin-left:50px;}
#logout>a:hover{
	color:red;
	
}
#user{
	text-align:center;
	
}
b{
	
	color:blue;
}

</style>
</head>

<body style="overflow-x: hidden">


   <div id="header">

      <a href="reserve_t.jsp"><img src="image?file=icon.png"
         width="50px" height="50px" alt="로고 이미지"/></a>
         <span>병원매니저</span>
      


   </div>

   <div id="sidemenubox">




      <h3>
         <img src="image?file=home.png" width="50px" height="50px">
         <br>
         <c:choose>
			<c:when test="${hospitaluser eq Empty}">
				<p style="text-decoration:none;"><a href="hlogin" >로그인</a></p>&nbsp;&nbsp;
			</c:when>
		<c:otherwise>
			<div id="user">
			<b>${hospitaluser.hname }</b>
			</div>
		</c:otherwise>
		</c:choose>
      </h3>
    
      <h3>
         <a href="reserve_t.jsp">오늘의 예약내역</a>
      </h3>
      
      <br>
      
      <div id="list">
         <hr>
         <h2>
            조회
            
         </h2>
         <hr>
            <p>
            <a href="mrecordlist">진료 기록 조회</a>
         	</p> 
            
            <p>
               <a href="reserveinfo_p.jsp" >환자 정보 조회</a>
            </p>
            <br>
        
         <hr>
         <br>
         <p>
            <a href="hinfo.jsp">병원 정보</a>
         </p>
         <br>
         
         
        
         <br>
         <hr>
         <br>
         
         <div id="logout">
            <a href="hospitallogin.jsp">로그아웃</a>
         </div>
         

      </div>

   </div>

   
	<% pageContext.include("hfooter.jsp");%>



</body>
</html>