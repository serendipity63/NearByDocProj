<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!--  uri core를 c로 설정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>니어닥환자조회</title>
<style>
body {
	margin: 0 auto;
}

h1 {
	width: 197px;
	height: 55px;
	margin:0 auto;
	color: rgb(25, 25, 112);
}

#center {
	margin:10px auto;
    width: 1479px;
   
   
   
}

table{
	border: 1px solid;
    width: 1346px;
    margin:55px 70px auto;
    position:absolute;
   
    
}

th {
	width: 300px;
	height: 30px;
	background-color:lightgray;
}
td{
	text-align:center;
 }
h5{
	text-align:center;
}

.select {
	background-color: blue;
}

select {
	width: 224px;
	height: 38px;
	cursor: pointer;
}

input {
	width: 224px;
	height: 38px;
}

#reserveform {
	
	width: 1000px;
	height: 50px;
	margin:83px -169px auto;
	
}

#search {
	color: black;
	width: 100px;
	height: 30px;
	background-color: lightgray;
	border-radius: 10px;
	cursor: pointer;
}

#emptyArea {
	width: 708px;
	text-align: center;
	margin:355px auto;
}

#emptyArea button {
	display: inline-block;
	width: 20px;
	height: 20px;
	text-decoration: none;
}

#emptyArea .btn {
	background: white;
}

#emptyArea .select {
	background: black;
	color:white;
}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
	
	function callBtn(num) {
		$('#page').val(num);
		$('#searchform').submit();
	}
</script>
</head>

<body style="overflow-y:hidden">
	<% pageContext.include("hmain.jsp");%>
	
	<div id="center">
	
	<h1>환자 정보 조회</h1>

	<form action="patientsearch" method="post" id="searchform">
		<input type="hidden" id="page" name="page" value="1"/>
		<div id="reserveform">
			<h5>
				<select name="type">
					<option value="all">전체</option>
					<option value="pname" ${res.type eq 'pname'? 'selected':'' }>환자명</option>
					<option value="pidnum" ${res.type eq 'pidnum'? 'selected':'' }>주민등록번호</option>
				</select> 
				<input type="text" name="keyword" id="keyword" value="${res.keyword }" /> 
				<input type="submit" id="search" value="검색" />
			</h5>
		</div>

	</form>
	<div class="table_layout">
	<table>
		<tr id="row">
			<th style="width:150px;">환자명</th>
			<th style="width:150px;">주민번호</th>
			<th style="width:150px;">이메일</th>
			<th style="width:150px;">휴대폰</th>
			<th style="width:150px;">우편번호</th>
			<th>주소</th>
		
			
		</tr>
		<c:forEach items="${res.patientresList }" var="patient">
			<tr>
				<td style="background-color:white;">${patient.pname }</td>
			
			
				<td style="background-color:white;">${patient.pidnum }</td>
				
				<td style="background-color:white;">${patient.pemail }</td>
				
				<td style="background-color:white;">${patient.ptel }</td>
				
				<td style="background-color:white;">${patient.ppostcode }</td>
			
				<td style="background-color:white;">${patient.proadaddress }</td>
				
				<%-- <td style="background-color:white;">
				<c:if test="${hospitaluser.comnum eq reserve.comnum }">
					<a href="patientdelete?pname=${patient.pname }&page=${res.pageInfo.curPage}" style="text-decoration:none;  color:red;">삭제</a>
					</c:if>
				</td> --%>
			</tr>
		</c:forEach>
	</table>
	</div>
	<div id="emptyArea">
		<c:choose>
			<c:when test="${res.pageInfo.curPage>1}">
				<button onclick="callBtn(${res.pageInfo.curPage-1})">&lt;</button>
			</c:when>
			<c:otherwise>
         			&lt;	
				</c:otherwise>
		</c:choose>
		&nbsp;&nbsp;

		<c:forEach begin="${res.pageInfo.startPage}"
			end="${res.pageInfo.endPage}" var="i">
			<c:choose>
				<c:when test="${res.pageInfo.curPage==i}">
					<button onclick="callBtn(${i})" class="select">${i}</button>&nbsp;
					</c:when>
				<c:otherwise>
					<button onclick="callBtn(${i})">${i}</button>&nbsp;
					</c:otherwise>

			</c:choose>

		</c:forEach>

		<c:choose>
			<c:when test="${res.pageInfo.curPage<res.pageInfo.allPage}">
				<button onclick="callBtn(${res.pageInfo.curPage+1})">&gt;</button>
			</c:when>
			<c:otherwise>
					&gt;
				</c:otherwise>
		</c:choose>
		&nbsp;&nbsp;

	</div>
	</div>
</body>
</html>