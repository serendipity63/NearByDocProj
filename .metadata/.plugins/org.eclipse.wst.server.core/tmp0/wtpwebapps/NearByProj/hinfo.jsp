<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>니어닥병원정보</title>

</head>

<style>
body {
	margin: 0 auto;
}



h1 {
	width: 120px;
    
    margin: 0 auto;
    /* margin-top: 50px; */
    color: rgb(25, 25, 112);
}
table {
	width: 1000px;
	height: 500px;
	margin: 50px 0px 0px 450px;
	
}
td{
	width:30px;
	background-color:#3fc7bb;
	color:black;
	text-align:center;
}

#button {
	margin-top: 50px;
    margin-left: 904px;
}

#button>a {
	padding: 10px;
    text-decoration: none;
    color: white;
    background-color: #0a0a4d;
    border-radius:10px;
    display: inline-block;
    width: 81px;
}
#button>a:hover{
	 background-color:blue;
      transition: 0.7s;
}
.ear{
	background-color:#c1f3ea;
	color:black;
}
.num{
	background-color:#c1f3ea;
	color:black;
}
.add{
	background-color:#c1f3ea;
	color:black;
}
.lun{
	background-color:#c1f3ea;
	color:black;
}


</style>
<body>
	<% pageContext.include("hmain.jsp");%>
	<h1>병원정보</h1>
	
		
		
		
			<table id="title">
				<tr>
					<td>진료 과목</td>
					<td class="ear">이비인후과</td>
				</tr>
				<tr>
					<td>병원명</td>
					<td style="background-color:white">니어바이닥의원</td>
				</tr>
				<tr>
					<td>사업자등록번호</td>
					<td class="num">123-45-67890</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td style="background-color:white">02-1234-5678</td>
				</tr>
				<tr>
					<td>주소</td>
					<td class="add">서울시 금천구 호서대벤처타워</td>
				</tr>

				<tr>
					<td>진료시간</td>
					<td style="background-color:white">09:00~18:00</td>
				</tr>
				<tr>
					<td>점심시간</td>
					<td class="lun">13:00~14:00</td>
				</tr>
				
			</table>
				<div id="button">
				<c:if test="${hospitaluser.comnum eq hospital.comnum }">
				<a href="hospitalmodify?comnum=${hospital.comnum }">수정하기</a>
				</c:if>
				</div>
				
			
	
	
	
</body>
</html>