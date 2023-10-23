<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!--  uri core를 c로 설정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 예약내역</title>
<style>
h1 {
	width: 220px;
	color: rgb(25, 25, 112);
	margin: 0 auto;
}

th {
	width: 450px;
	height: 30px;
	border-bottom: 6px solid #191970;
}

td {
	text-align: center;
	background-color: white;
}

#center {
	margin: 50px auto;
	position: absolute;
	left: 170px;
	padding-left: 130px;
	width: 1479px;
}

table {
	width: 1454px;
	margin: 100px auto;
}

#emptyArea {
	width: 708px;
	text-align: center;
	margin: 200px auto;
}

#emptyArea a {
	display: inline-block;
	width: 20px;
	height: 20px;
	text-decoration: none;
}

#emptyArea .btn {
	background-color: white;
}

#emptyArea .select {
	background-color: white;
}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
$(function() {
$(".btn").click(function() {
	console.log("버튼클릭적용됨?");
	let doccomment = $(this).closest('tr').find('input[type="text"]').val();
	let id = $(this).closest('tr').find('input[type="hidden"]').val();
    $.ajax({
	type: 'post',
	url: 'trlist',
	data: { 
		'doccomment': doccomment, 
		'id': id,
		'page' : ${res.pageInfo.curPage}
	},
	success: function(res) {
		console.log("성공하면오는곳")
		document.location.reload();
    },
    error : function(error) {
    	console.log("실패하면오는곳")
    	 alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
	}
  })	
	  

})

function callBtn(num) {
	var keyword=$('#keyword').val()
	if(keyword!=null && keyword.trim()!='') {
			$('#page').val(num);
			$('#searchform').submit();
	}
}

})
	


</script>
</head>

<body style="overflow-y: hidden">
	<%
	pageContext.include("hmain.jsp");
	%>
	<div id="center">
		<h1>오늘의 예약내역</h1>


		<table>
			<tr class="row">
				<th style="width: 150px;">환자명</th>
				<th style="width: 150px;">일자</th>
				<th style="width: 150px;">시간</th>
				<th style="width: 150px;">진료과목</th>
				<th style="width: 150px;">요청사항</th>
				<th style="width: 150px;">예약/진료상태</th>
				<th style="width: 150px;">진료완료처리</th>

			</tr>

			<c:forEach items="${res.todayresList }" var="reservation">
				<tr>
					<td>${reservation.pname }</td>
					<td>${reservation.resdate }</td>
					<td>${reservation.restime }</td>
					<td>${hospitaluser.department }</td>
					<td>${reservation.comment }</td>
					<td><c:choose>
							<c:when test="${reservation.status eq '1'}">
								예약
							</c:when>
							<c:when test="${reservation.status eq '2'}">
								진료완료
							</c:when>
							<c:when test="${reservation.status eq '3'}">
								예약취소
							</c:when>
							<c:when test="${reservation.status eq '4'}">
								방문안함
							</c:when>
							<c:otherwise>
								회원탈퇴
							</c:otherwise>
						</c:choose></td>
					<td><c:choose>
							<c:when test="${reservation.status eq '1'}">
								<input type="text" placeholder="의사코멘트를 작성해주세요." width="100" />
								<button type="button" class="btn">진료완료</button>
								<input type="hidden" name="id" value="${reservation.id}" />
							</c:when>
							<c:otherwise>
				${reservation.doccomment}
				</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
		</table>


		<div id="emptyArea">
			<c:choose>
				<c:when test="${res.pageInfo.curPage>1}">
					<a href="trlist?page=${res.pageInfo.curPage-1}">&lt;</a>
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
						<a href="trlist?page=${i}" class="select"
							onclick="callBtn(${i});return ${res.keyword==null};">${i}</a>&nbsp;
					</c:when>
					<c:otherwise>
						<a href="trlist?page=${i}" class="btn"
							onclick="callBtn(${i});return ${res.keyword==null};">${i}</a>&nbsp;
					</c:otherwise>

				</c:choose>

			</c:forEach>

			<c:choose>
				<c:when test="${res.pageInfo.curPage<res.pageInfo.allPage}">
					<a href="trlist?page=${res.pageInfo.curPage+1}">&gt;</a>
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