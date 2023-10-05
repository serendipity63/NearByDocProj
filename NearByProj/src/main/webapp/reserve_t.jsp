<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!--  uri core를 c로 설정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 예약</title>
<style>

	body {
            margin: 0 auto;
            
        }

        .header {
            height: 100px;
            color:blue;
          	left:100px;
        }

        .row {
            height: 30px;
        }

        .title {
            font-weight: bold;
            background-color: lightblue;
            width:100px;
        }
        .colume {
            padding:5px;
            width: 120px;
            float: left;
        }

        .container {
            padding:10px; 
            border: 1px solid;
            width: 1300px;
            margin-left:200px;
            
        }


      

</style>
</head>

<body>
<% pageContext.include("main.jsp");%>
	<center>
        <form>
            <div class="header">
                <h1>오늘의 예약</h1><br><br>
            </div>
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