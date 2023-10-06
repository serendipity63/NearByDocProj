<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!--  uri core를 c로 설정 -->
<!DOCTYPE html>
<html>
<head>
<title>니어닥병원마이페이지</title>




<style>
body {
	
	background-color: rgb(245, 245, 245);

	
	
}

#header {
	width: 2000px;
	height: 100px;
	background-color: rgb(25, 25, 112);
}
#header>p{
	color:white;
	margin-top:-50px;
	margin-left:100px;
	

}

#iconbox.img {
	width: 200px;
	height: 100px;
}
#header>h2{
	color:white;
}

h2 {
	color: white;
	margin-left:10px;
}

h3>img{
	
	background-color:white;
}
h3{
	color: white;
	margin-left:10px;
}
h3>a{

	color: white;
	margin-left:10px;
	text-decoration:none;

}

#sidemenubox {
	margin-height: 100px;
	float: left;
	height: 800px;
	background-color: rgb(9, 76, 165);
	width: 200px;
	
}

#list>span {
	
	width: 300px;
	height: 50px;
	
	
}

#list>span>a {
	text-decoration: none;
	font-size: 15px;
	color: white;
	margin-left:20px;
}

#list>h2>button{
	background-color:rgb(12, 66, 132);
	margin-left:100px;
}
#list>h2>button>img{
	color:rgb(12, 66, 132);
}
</style>
</head>
<body>
	<div id="header">

		<a href="reserve_t.jsp"><img src="image?file=icon.png"
			width="100px" height="100px" alt="로고 이미지"/></a>&nbsp;&nbsp;
			<p>병원매니저</p>
		


	</div>

	<div id="sidemenubox">




		<h3>
			<img src="image?file=home.png" width="50px" height="50px">니어바이닥의원
		</h3>
		<br>
		<h3>
			<a href="reserve_t.jsp" >오늘의 예약내역</a>
		</h3>
		
		<br>
		
		<div id="list">
			<hr>
			<h2>
				조회<img src="image?file=list.png" width="15px" height="10px"></button>
			</h2>
			<hr>
			
			<span>
				<a href="allreserveinfo.jsp">전체 조회</a>
			</span>
			
			<hr>
			<span>
				<a href="reserveinfo_d.jsp">일정</a>
			</span>
			<hr>
			<span>
				<a href="reserveinfo_p.jsp">환자</a>
			</span>
			<hr>
			<br> <br>
			
			<hr>
			<span>
				<a href="hinfo.jsp">병원 정보</a>
			</span>
			<hr>

			<span>
				<a href="hlogin.jsp">로그아웃</a>
			</span>
			<hr>

		</div>



	</div>

	<footer> </footer>




</body>
</html>