<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>니어닥병원정보</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>

<style>
*{
	font-family: 'Nanum Gothic', sans-serif;

}
	body {
	margin: 0 auto;
	position:absolute;
}

.header {
	height: 100px;
	color: blue;
	left: 100px;
}

.row {
	height: 20px;
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
	margin-top:50px;

	width: 1500px;
	margin-left: 400px;
}
table{
	width:1000px;
	height:500px;
}


input{
	width:200px;
	height:30px;
	

}

.reserveform1{
	margin-top:100px;
	float:left;
	margin-left:100px;
	margin-top:-40px;
	height:50px;
	
}
.reserveform2{
	margin-top:100px;
	float:right;
	margin-right:30px;
	margin-top:-40px;
	height:50px;
}

select{
	width:200px;
	height:30px;
}
#button{
	float:right;
	width:130px;
	height:30px;
	background-color:#0099ff;
	border:5px solid gray;

}
#button>a{
	padding:10px;
	text-decoration:none;
	color:white;
}

</style>
<body>
<% pageContext.include("sidemenu.jsp");%>
	
	<center>
        <form>
        	
            <div class="header">
                <h1>병원정보</h1><br><br>
            </div>
            <div id="reserveform">
			
			<div id="button">
			<a href="hcorrection_after.jsp">수정하기</a>
			</div>

			</div>
			<br><br>
            <div class="container" id="container">
               <table border="1" id="title">
               <tr>
               <td>진료 과목</td>
               <td><input type="text" placeholder="이비인후과"/></td>
               </tr>
               <tr>
               <td>병원명</td>
               <td><input type="text" placeholder="니어바이닥의원"/></td>
               </tr>
               <tr>
               <td>E-Mail</td>
               <td><input type="text" placeholder="ch2488@naver.com"/></td>
               </tr>
               <tr>
               <td>전화번호</td>
               <td><input type="text" placeholder="02-1234-5678"/></td>
               </tr>
               <tr>
               <td>주소</td>
               <td><input type="text" placeholder="서울시 금천구 호서대벤처타워 9층"/></td>
               </tr>
               
               <tr>
               <td>진료시간</td>
               <td><input type="text" placeholder="09:00~18:00"/></td>
               </tr>
               <tr>
               <td>점심시간</td>
               <td><input type="text" placeholder="12:00~14:00"/></td>
               </tr>
               
               </table>
                
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