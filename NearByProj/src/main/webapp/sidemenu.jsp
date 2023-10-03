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
	background-color:rgb(213,238,255);
	}


#iconbox {
	position: relative;
	width:200px;
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
	background-color:lightblue;
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
	font-size:30px;
	color:black;
	
}

</style>
</head>
<body>
	<div id="iconbox">

		<a href="hmypage.jsp"> <img src="/webapp/image/logo.jpg" width:100px; height:100px;>
		</a>

	</div>

	<div id="sidemenubox">
		
			<h2>병원마이페이지</h2>
			<br>
	
			<h2><img src="webapp/home.png">니어바이닥의원</h2>
			<h5>hospital@email.com</h5>
		<div id="list">
			<p><a href="#">홈</a></p>			
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