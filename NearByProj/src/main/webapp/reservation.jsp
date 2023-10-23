<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약하기</title>
<style>
.main {
	width: 430px;
	margin: auto;
}

.top {
	text-align: center;
	margin: auto;
	border-bottom: 1px solid;
}

.patientselect {
	border-bottom: 1px solid;
	border-color: gainsboro;
}

.selectservice {
	border-bottom: 1px solid;
	border-color: gainsboro;
}

.selectdate {
	border-bottom: 1px solid;
	border-color: gainsboro;
}

.selecttime {
	border-bottom: 1px solid;
	border-color: gainsboro;
}

.tbutton {
	margin-left: 20px;
}

.button {
	margin: auto;
	text-align: center;
}

#text {
	width: 410px;
	height: 300px;
	margin: 5px 5px 5px 5px;
}

.btn-primary {
	padding: 20px 20px;
	background-color: #cfe8f7;
	color: #333333;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s ease;
	font-family: 'Noto Sans', sans-serif;
	text-decoration: none;
	border-radius: 10px;
	width: 100%;
	font-weight: bold;
	font-size: 18px;
}

.btn-primary:hover {
	background-color: #0056b3;
}

.sub {
	font-weight: bold;
}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
$(function() {
	//input을 datepicker로 선언
	$("#datepicker")
			.datepicker(
					{
						dateFormat : 'yy-mm-dd' //달력 날짜 형태
						,
						showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
						,
						showMonthAfterYear : true // 월- 년 순서가아닌 년도 - 월 순서
						,
						changeYear : true //option값 년 선택 가능
						,
						changeMonth : true //option값  월 선택 가능                
						,
						showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
						,
						buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
						,
						buttonImageOnly : true //버튼 이미지만 깔끔하게 보이게함
						,
						buttonText : "선택" //버튼 호버 텍스트              
						,
						yearSuffix : "년" //달력의 년도 부분 뒤 텍스트
						,
						monthNamesShort : [ '1월', '2월', '3월', '4월', '5월',
								'6월', '7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 텍스트
						,
						monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip
						,
						dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 텍스트
						,
						dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일',
								'금요일', '토요일' ] //달력의 요일 Tooltip
						,
						minDate : 0 //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
						,
						maxDate : "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
						,
						onSelect: function() {
							console.log("날짜선택");
							let date = $("#datepicker")
							$.ajax({
								url:'updatetime',
								type:'POST',
								data:{'date':date[0].value},
								success: function() {
									$('#timebutton').load(window.location.href+ ' #timebutton');
								},
								error: function( request, status, error ){

									    alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);

								}
							})
						}
					});
});
</script>
</head>

<body>
	<div class="main">
		<%
		pageContext.include("thinheader.jsp");
		%>
		<br>
		<div class="top">
			<h3>예약하기 (${hospital.hname})</h3>
		</div>
		<br>
		
		<script>
		function checkNull(){
			var name= $(":input:radio[name=name]:checked").val();
			console.log(name);
			var resdate=$('#datepicker').val();
			console.log(resdate);
			if(name==null || name=='') {
				alert("진료대상을 선택해주세요.");
				return false;
			}
			if(resdate==null || resdate=='') {
				alert("진료날짜를 선택해주세요.");
				return false;
			}
		  }
		</script>
		<form action="insertreservation" method="post" id='form' onsubmit="return checkNull();">
			<div class="patientselect">
				<p class="sub">진료 대상 선택</p>
				<br>
				<table>
					<tbody>
						<tr>
							<td width="100"><input type="radio" name="name"
								value="${user.pname}">&nbsp;&nbsp;${user.pname}</td>
							<c:choose>
								<c:when test="${empty patientlist}">

								</c:when>
								<c:otherwise>
									<c:forEach items="${patientlist}" var="patient">
										<td width="100"><input type="radio" name="name"
											value="${patient.pname}">&nbsp;&nbsp;${patient.pname}</td>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tr>
					</tbody>
				</table>
				<br>
			</div>
			<br>
			<div class="selectservice">
				<p class="sub">진료과목</p>
				<br> <p>${hospital.department}</p>
				<br>
			</div>
			<br>
			<div class="selectdate">
				<p class="sub">
					날짜선택 : <input type="text" id="datepicker" name="resdate" />
				</p>
				<br>
			</div>
			<br>
			<div class="selecttime" id="timebutton">
				<p class="sub">
					시간선택 : 
					<select name="restime">
						<c:forEach items="${timelist}" var="time">
								<option value="${time}">${time}</option>
						</c:forEach>
					</select>
				</p>
				<br>
			</div>
			<br>
			<div class="comment">
				<p class="sub">원장님께 하고 싶은말:</p>
				<br>
				<textarea name="comment" cols="58" rows="2" placeholder="증상을 입력해주세요."></textarea>
			</div>
			<br>
			<div>
				<button type="submit" class="btn-primary" id ="next">예약하기</button>
			</div>
		</form>
		
		<script>
		
		</script>
	</div>
	<br>
	<br>
	<br>
</body>

</html>