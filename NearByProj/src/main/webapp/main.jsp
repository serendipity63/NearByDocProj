<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
#iconbox{
	position:relative;

}
#iconbox.img{
	width:200px;
	height:100px;
}
#footerbox{
	margin:0 auto;
	height:1000px;
	position:relative;

}
#reserveform{
	margin-left:200px;
	top
	
}
h2{
	color:blue;
}
#sidemenu{
	float:left;

}


</style>
<title>니어닥병원마이페이지</title>
<div id="iconbox">

	<a href="hmainpage">
		<img src="images/icon.png">
	</a> 

</div>

<div id="sidemenu">

	<h2>병원마이페이지</h2><br>
	
	<h3>니어의원</h3>
	<h5>hospital@email.com</h5><br>
	<a href="hmainpage"><img src="images/home-select.png">홈<br>
	<a href="mrecord"><img src="images/tasks.png"></a>조회<br>
	
	
	
	<ul>
		
		<li>예약리스트 조회</li>
		<li>진료기록 조회</li>		
		
	
	</ul>
	
		<img src="images/settings.png">
	<a href="#">병원정보수정</a><br>
	
	<img src="images/logout.png">
	<a href="#">로그아웃</a><br>
	
	
	
</div>

<div id="reserveform">

	<h2>예약 목록 조회</h2> 
	<select name="patient">
	 <option value="reserve">예약자명</option>
	 <option value="doctor">담당의사</option>
	 <option value="number">연락처</option>
	</select>
	<input type="text">
	<button><img src="images/search.png">검색</button>
	
	
</div>

<div id="footerbox">
	<img src="images/footer.png">
</div>
