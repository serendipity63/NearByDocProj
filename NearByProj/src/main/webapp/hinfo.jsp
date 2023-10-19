<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
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
					<td>
					<input type="text" name="department" 
					id="department"  value="${hinfo.getDepartment() }" disabled="disabled"/></td>
				</tr>
				<tr>
					<td>병원명</td>
					<td><input type="text" name="hname" 
					id="hname"  value="${hinfo.getHname() }" disabled="disabled"/></td>
				</tr>

				<tr>
					<td>전화번호</td>
					<td><input type="text" name="htel"
					id="htel" value="${hinfo.getHtel() }" disabled="disabled"/></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address"
					id="address" value="${hinfo.getHroad() }" disabled="disabled" /></td>
				</tr>

				<tr>
					<td>진료시간</td>
					<td><input type="text" name="clinic"
					id="clinic" value="${hinfo.getClinic() }" disabled="disabled" /></td>
				</tr>
				<tr>
					<td>점심시간</td>
					<td><input type="text" name="lunch"
					id="lunch" value="${hinfo.getLunch() }" disabled="disabled" /></td>
				</tr>
			</table>
				<input type="button" value="수정" onclick="location.href='hospitalmodify'">
			
				<div id="button">
				<c:if test="${hospitaluser.comnum eq hospital.comnum }">
				
				
				<input id="hiddenPidnum" type="text" value="${hinfo.getComnum() }" style="display:none;" > 
				
				
				</c:if>
				</div>
				
			
	
	
	
</body>
</html>