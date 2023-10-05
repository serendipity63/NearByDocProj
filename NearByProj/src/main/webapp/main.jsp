<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!--  uri core를 c로 설정 -->
<!DOCTYPE html>
<html>
<head>
<title>니어닥병원마이페이지</title>




<style>

body{
	height:1000px;
	background-color:rgb(245,245,245);
	}


#header {
	
	width:2000px;
	height:100px;
	background-color:rgb(25,25,112);
}

#iconbox.img {
	width: 200px;
	height: 100px;
}





h2 {
	color: blue;
}

#sidemenubox {
	margin-height:100px;
	float: left;
	height:1000px;
	background-color:white;
	width:300px;
	position:relative;
}
#list>p{
	
	width:300px;
	height:50px;
	
	background-color:white;
}
#list>p>a{
	text-decoration:none;
	font-size:15px;
	color:black;
	
}

</style>
</head>
<body>
	<div id="header">

		    <a href="reserve_t.jsp"><img src="image?file=icon.png"  width="100px" height="100px" alt="로고 이미지"/></a>
		

	</div>

	<div id="sidemenubox">
		
			
			
	
			<h2><img src="image?file=home.png" width="50px" height="50px">니어바이닥의원</h2><br>
			
			<h4>로그아웃</h4><br>
			<h5>nearbydoc@email.com</h5>
		<div id="list">
			<p><a href="reserve_t.jsp">홈</a></p>			
			<h2>조회</h2>
			<p><a href="reserveinfo_d.jsp">일정</a></p>
			<p><a href="reserveinfo_p.jsp">환자</a></p>
			<br>
			<br>
			<p><a href="reserve_t.jsp">오늘의 예약내역</a></p>
			<p><a href="hinfo.jsp">병원 정보</a></p>
			<p><a href="allreserveinfo.jsp">전체 조회</a></p>
			
	
				
	
			
	
		<p><a href="hlogin.jsp">로그아웃</a></p>
				
		</div>	



		</div>
		
		<footer>
			
		
		</footer>
	

	

</body>
</html>