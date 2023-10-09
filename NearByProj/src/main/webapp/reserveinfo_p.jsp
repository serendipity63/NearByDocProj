<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!--  uri core를 c로 설정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>니어닥환자조회</title>
</head>
<style>
body {
	margin: 0 auto;
}

#center {
	display: flex;
}

h1 {
	width: 300px;
    height: 100px;
    margin-left: 680px;
    color: rgb(25, 25, 112);
}

.row {
	height: 30px;
}

.title {
	font-weight: bold;
	background-color: rgb(25, 25, 112);
	width: 100px;
}

.colume {
	padding: 5px;
	width: 210px;
	float: left;
	color: white;
	text-align: center;
	border-right:1px solid white;
}

.container {
	height: 500px;
    border: 1px solid;
    width: 1326px;
    margin-left: -1560px;
    margin-top: 200px;
}

select{
	width:200px;
	height:35px;

}
input {
	width: 200px;
	height: 30px;
}

#reserveform {
	margin-top: 120px;
    width: 1500px;
    height: 50px;
    margin-left: -790px;
}

button {
	width: 100px;
	height: 30px;
	background-color: rgb(25, 25, 112);
}
#search{
	color:white;
}
</style>
<body>
<% pageContext.include("main.jsp");%>
	
	<div id="center">
        	
           
                <h1>환자별 조회</h1><br><br>
            
            

		<div id="reserveform">
			<select name="patient">
				<option value="patient">환자명</option>
				<option value="number">주민등록번호</option>
			</select> <input type="text">
			<button onclick="#" id="search">검색</button>
		
		</div>
		
			<br><br>
            <div class="container" id="container">
                <div class="row">
                   <div class="title colume">일자</div>
					<div class="title colume">시간</div>
					<div class="title colume">환자명</div>
					<div class="title colume">주민등록번호</div>
					<div class="title colume">연락처</div>
					<div class="title colume">주소</div>
                </div>
                
        
            <c:set var="i" value="1"/>
            <c:forEach var="acc" items="${accs }">
            	<div class="row">
            		<div class="colume">${i }</div>
            		<div class="colume">${acc.id}</div>
            		<div class="colume">${acc.name }</div>
            		<div class="colume">${acc.balance }</div>
            		<div class="colume">${acc.type }</div>
            		<div class="colume">${acc.grade }&nbsp;</div>
            		<c:set var="i" value="${i+1 }"/>
            	</div>
            </c:forEach>
            </div>
           
    </div>
</body>
</html>