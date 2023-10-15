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
	width: 163px;
	height: 55px;
	margin: 44px 944px;
	color: rgb(25, 25, 112);
}

#center {
	margin-left: 400px;
	width: 1276px;
	margin-top: 55px;
	background-color: lightgray;
}

th {
	width: 300px;
	height: 30px;
	border: 1px solid black;
}

h5 {
	text-align: center;
}

select {
	width: 200px;
	height: 38px;
	cursor: pointer;
}

input {
	width: 200px;
	height: 38px;
}

#reserveform {
	margin-top: 40px;
	width: 1000px;
	height: 50px;
	margin-left: 129px;
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
	margin-top: 401px;
	margin-left: 673px;
}

#emptyArea a {
	display: inline-block;
	width: 20px;
	height: 20px;
	text-decoration: none;
}

#emptyArea .btn {
	background: lightgray;
}

#emptyArea .select {
	background: lightblue;
}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
	
	function callBtn(pidnum) {
		var keyword=$('#keyword').val()
		if(keyword!=null && keyword.trim()!='') {
			$('#page').val(pidnum);
			$('#searchform').submit();
		}
	}
</script>
</head>

<body>
	<% pageContext.include("hmain.jsp");%>
	<h1>환자별 조회</h1>






	<form action="patientsearch" method="post" id="searchform">
		<div id="reserveform">
			<h5>
				<select name="type">
					<option value="all">선택</option>
					<option value="pname" ${res.type eq 'pname'? 'selected':'' }>환자명</option>
					<option value="pidnum">${res.type eq 'pidnum'? 'selected':'' }주민등록번호</option>
				</select> 
				<input type="text" name="keyword" id="keyword" value="${res.keyword }" /> 
				<input type="submit" id="search" value="검색" />
			</h5>
		</div>

	</form>

	<table id="center">
		<tr id="row">
			<th>이름</th>
			<th>주민번호</th>
			<th>이메일</th>
			<th>휴대폰</th>
			<th>주소</th>
			<th>우편번호</th>
		</tr>
		<c:forEach items="${res.patientList }" var="patient">
			<tr>
				<td>${patient.pname }</td>
				<td>${patient.pemail }</td>
				<td>${patient.pidnum }</td>
				<td>${patient.ptel }</td>
				<td>${patient.address }</td>
				<td>${patient.ppostcode }</td>
				<td><c:if test="${hospitaluser.id == hospital.comnum }">
						<a
							href="patientdelete?pidnum=${patient.pidnum }&page=${res.pageInfo.curPage}">삭제</a>
					</c:if></td>
			</tr>
		</c:forEach>
	</table>
	<div id="emptyArea">
		<c:choose>
			<c:when test="${res.pageInfo.curPage>1}">
				<a href="patientlist?page=${res.pageInfo.curPage-1}">&lt;</a>
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
					<a href="patientlist?page=${i}" class="select"
						onclick="callBtn(${i});return ${res.keyword==null};">${i}</a>&nbsp;
					</c:when>
				<c:otherwise>
					<a href="patientlist?page=${i}" class="btn"
						onclick="callBtn(${i});return ${res.keyword==null};">${i}</a>&nbsp;
					</c:otherwise>

			</c:choose>

		</c:forEach>

		<c:choose>
			<c:when test="${res.pageInfo.curPage<res.pageInfo.allPage}">
				<a href="patientlist?page=${res.pageInfo.curPage+1}">&gt;</a>
			</c:when>
			<c:otherwise>
					&gt;
				</c:otherwise>
		</c:choose>
		&nbsp;&nbsp;

	</div>
</body>
</html>