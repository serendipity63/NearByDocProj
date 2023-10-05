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
	position:relative;
}

.header {
	height: 100px;
	color: blue;
	left: 100px;
}

.row {
	height: 30px;
}

.title {
	font-weight: bold;
	background-color: lightblue;
	width: 200px;
}

.colume {
	padding: 5px;
	width: 140px;
	float: left;
}

.container {
	/* padding:10px; */
	border: 1px solid;
	width: 1500px;
	margin-left: 400px;
}

.input {
	float: left;
}


#reserveform{
	width:700px;
	margin-right:500px;

	
}
select{
	width:150px;
	height:30px;
	
}
input{
	width:300px;
	height:30px;
	
}
button{
	width:150px;
	height:30px;
	background-color:#0099ff;
}

</style>
<body>
<% pageContext.include("main.jsp");%>
	
	<center>
        <form>
        	
            <div class="header">
                <h1>환자별 조회</h1><br><br>
            </div>
            <div id="reserveform">

		
			<select name="patient">
				<option value="patient">환자명</option>
				<option value="number">주민등록번호</option>
			</select> <input type="text">
			<button onclick="#">검색</button>
		

			</div>
			<br><br>
            <div class="container" id="container">
                <div class="row">
                    <div class="title colume">일자</div>
                    <div class="title colume">시간</div>
                    <div class="title colume">예약자명</div>
                    <div class="title colume">주민등록번호</div>
                    <div class="title colume">연락처</div>
                    <div class="title colume">주소</div>
                    <div class="title colume">요청사항</div>
                    <div class="title colume">진료과목</div>
                    <div class="title colume">담당의사</div>
                    <div class="title colume">진료완료처리</div>
                </div>
                
           <%--  <%
               	for(int i=0; i<accs.size(); i++) {
            %>
            
               	<div class="row">
                    <div class="colume"><%=i+1 %></div>
                    <div class="colume"><%=accs.get(i).getId() %></div>
                    <div class="colume"><%=accs.get(i).getName() %></div>
                    <div class="colume"><%=accs.get(i).getBalance() %></div>
                    <div class="colume"><%=accs.get(i).getType() %></div>
                    <div class="colume"><%=accs.get(i).getGrade() %>&nbsp;</div> --%>
                    
               
            <%-- <%
            	}
            %>  --%>
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
        </form>
    </center>
</body>
</html>