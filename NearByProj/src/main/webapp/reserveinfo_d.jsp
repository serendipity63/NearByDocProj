<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!--  uri core를 c로 설정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정으로 환자 조회</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
//input을 datepicker로 선언
$("#datepicker1,#datepicker2").datepicker({
dateFormat: 'yy-mm-dd' //달력 날짜 형태
,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
,changeYear: true //option값 년 선택 가능
,changeMonth: true //option값 월 선택 가능
,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
,buttonText: "선택" //버튼 호버 텍스트
,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
});

//초기값을 오늘 날짜로 설정해줘야 합니다.
$('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
});
</script>

</head>
<style>
body {
	margin: 0 auto;
}



h1 {
	width: 162px;
    height: 50px;
    margin:0 auto;
    color: rgb(25, 25, 112);
}

#center{
	margin:0 auto;
	
}

input {
	width: 224px;
	height: 38px;
}
th{
	width: 450px;
	height: 30px;
	background-color:lightgray;

}
table{
	 border: 1px solid;
    width: 1512px;
    margin:80px auto;
}

#reserveform {
    width: 1000px;
    height: 50px;
    margin:70px 391px auto;
    
}

button {
	width: 100px;
	height: 30px;
	background-color: rgb(25, 25, 112);
}
#search{
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
	margin-top: 20px;
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
<body>
	<% pageContext.include("hmain.jsp");%>

	
		
			<div id="center">
		
				<h1>일정별 조회</h1>
			
			
			<div id="reserveform">




				<input type="text" id="datepicker1" placeholder="0000-00-00">

				<input type="text" id="datepicker2" placeholder="0000-00-00">


				<button onclick="#" id="search">검색</button>


			</div>
			<table>	
			<tr class="row">
				<th style="width:150px;">예약번호</th>
				<th style="width:150px;">일자</th>
				<th style="width:150px;">시간</th>
				<th style="width:150px;">환자명</th>
				<th style="width:150px;">주민등록번호</th>
				<th style="width:150px;">연락처</th>
				<th>주소</th>
			</tr>
		
			<c:forEach items="${res.reserveList }" var="reserve">
			<tr>
				<td>${reserve.comnum }</td>
				<td>${reserve.resdate }</td>
				<td>${reserve.restime }</td>
				<td>${reserve.name }</td>
				<td>${reserve.number }</td>
				<td>${reserve.phone }</td>
				<td>${reserve.address }</td>
				<td>
					<c:if test="${hospitaluser.id == reserve.comnum }">
						<a href="patientdelete?num=${patient.pidnum }&page=${res.pageInfo.curPage}">삭제</a>
					</c:if>
				</td>
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
				<a href="boardlist?page=${res.pageInfo.curPage+1}">&gt;</a>
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