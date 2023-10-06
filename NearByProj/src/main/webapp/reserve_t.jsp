<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!--  uri core를 c로 설정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 예약</title>
<style>
   		
	
        #center{
        	
        	margin-left:180px;
        
        }

        .header {
        	padding:10px;
            height: 120px;
            color:rgb(25,25,112);
          	text-align:center;
          	
          	
          	
        }

        .row {
            height: 30px;
            position:relative;
        }

        .title {
            font-weight: bold;
            background-color: rgb(25,25,112);
            width:100px;
        }
        .colume {
            padding:5px;
            width: 120px;
            float: left;
            color:white;
            text-align:center;
        }

        .container {
           	height:100px;
            border: 1px solid;
            width: 1300px;
            margin-left:200px;
            position:relative;
           
            
        }


      

</style>
</head>

<body>
<% pageContext.include("main.jsp");%>
	
       <div id="center">
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