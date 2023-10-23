<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!--  uri core를 c로 설정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료 기록 조회</title>
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
$('').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
}); 

	
function callBtn(num) {
	var keyword=$('#keyword').val()
	if(keyword!=null && keyword.trim()!='') {
			$('#page').val(num);
			$('#searchform').submit();
	}
}
	
	  
function openOpinion(){  
	window.open("opinion.jsp", "담당의소견", "width=600, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
}
	window.addEventListner("message",function(event){
	var receivedData=event.data;
});
	


</script>
</head>
<style>
body {
	margin: 0 auto;
}

h1 {
	width: 270px;
	height: 50px;
	margin: 18px auto;
	color: rgb(25, 25, 112);
}

th {
	padding: 4px;
	width: 192px;
	color: black;
	text-align: center;
	font-weight: bold;
	border-bottom:6px solid #191970;
	
}
td {
	text-align: center;
}

table {
	width: 1454px;
	margin: 27px 71px auto;
	position: absolute;
}

table>td {
	background-color: white;
}

input {
	width: 224px;
	height: 38px;
	border-radius: 5px;
}

select {
	width: 224px;
	height: 38px;
	margin-top: 50px;
	margin-right: 30px;
	cursor: pointer;
	border-radius: 5px;
}

#center {
	position: absolute;
	left: 170px;
	padding-left: 130px;
	width: 1462px;
}

button {
	width: 100px;
	height: 30px;
	background-color: rgb(25, 25, 112);
}
#searchform{
	width: 1449px;
    margin-left: 73px;
    padding: 62px 30px 3px;
    background: #fff;
    margin-bottom: 30px;
    text-align: right;
    box-shadow: 0 5px 5px rgba(0,0,0,0.2);
    border: 1px solid #ddd;

}


#search {
	color: white;
	width: 100px;
	height: 42px;
	background-color: #191970;
	border-radius: 10px;
	cursor: pointer;
}

.reserveform {
	width: 1522px;
	height: 100px;
	margin: -97px -288px auto;
}

#date {
	float: right;
}

#datepicker1 {
	margin-top: 50px;
	border-radius: 5px;
}

#datepicker2 {
	margin-left: 20px;
	border-radius: 5px;
}

#emptyArea {
	width: 708px;
	text-align: center;
	margin: 700px auto;
}

#emptyArea a {
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
	color: white;
}

</style>


<body style="overflow-y: hidden">
	<%
	pageContext.include("hmain.jsp");
	%>


	<div id="center">
		<h1>예약/진료 내역 조회</h1>
		<br> <br>

		<form action="mrecordsearch" method="post" id="searchform">
			<input type="hidden" name="page" id="page" value="1">
			<div class="reserveform">

				<select name="type">
					<option value="pname" ${res.type eq 'pname'? 'selected':'' }>환자명</option>
					<option value="pidnum" ${res.type eq 'pidnum'? 'selected':'' }>주민등록번호</option>
				</select> <input type="text" name="keyword" id="keyword"
					value="${res.keyword }" />
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div id="date">
					
					&nbsp;&nbsp;&nbsp;&nbsp;<span style="width:50px;">기간</span> <input type="text" id="datepicker1" name="sdate"
						value="${res.sdate}"> <span style="font-size:30px;">-</span>
					<input type="text" id="datepicker2" name="edate"
						value="${res.edate}"> &nbsp;&nbsp; <input type="submit"
						id="search" value="검색" />
				</div>
				
			</div>
		</form>

		<table>
			<tr>
				<th>일자</th>
				<th>시간</th>
				<th>환자명</th>
				<th>요청사항</th>
				<th>진료과목</th>
				<th>예약/진료상태</th>
				<th>담당의소견</th>
			</tr>

			<c:forEach items="${res.resList }" var="reserve">
				<tr>
					<td style="background-color:white">${reserve.resdate }</td>
					<td style="background-color:white">${reserve.restime }</td>
					<td style="background-color:white">${reserve.pname }</td>
					<td style="background-color:white">${reserve.comment }</td>
					<td style="background-color:white">${hospitaluser.department }</td>
					<td style="background-color:white"><c:choose>
							<c:when test="${reserve.status eq '1'}">
								예약
							</c:when>
							<c:when test="${reserve.status eq '2'}">
								진료완료
							</c:when>
							<c:when test="${reserve.status eq '3'}">
								예약취소
							</c:when>
							<c:when test="${reserve.status eq '4'}">
								방문안함
							</c:when>
							<c:otherwise>
								회원탈퇴
							</c:otherwise>
						</c:choose></td>
					<td style="background-color:white">${reserve.doccomment }</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div id="emptyArea">
		<c:choose>
			<c:when test="${res.pageInfo.curPage>1}">
				<a href="mrecordlist?page=${res.pageInfo.curPage-1}">&lt;</a>
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
					<a href="mrecordlist?page=${i}" class="select"
						onclick="callBtn(${i});return ${res.keyword==null};">${i}</a>&nbsp;
					</c:when>
				<c:otherwise>
					<a href="mrecordlist?page=${i}" class="btn"
						onclick="callBtn(${i});return ${res.keyword==null};">${i}</a>&nbsp;
				</c:otherwise>

			</c:choose>

		</c:forEach>

		<c:choose>
			<c:when test="${res.pageInfo.curPage<res.pageInfo.allPage}">
				<a href="mrecordlist?page=${res.pageInfo.curPage+1}">&gt;</a>
			</c:when>
			<c:otherwise>
					&gt;
				</c:otherwise>
		</c:choose>
		&nbsp;&nbsp;

	</div>

</body>
</html>