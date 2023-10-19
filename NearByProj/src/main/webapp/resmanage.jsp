<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<!-- alert 디자인 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

<title>NearByDocHeader</title>

<style>
#container {
	background-color: white;
	margin: 10px auto;
	width: 430px;
	height: 600px;
	padding-top: 5px;
}

#sub {
	width: 430px;
	margin: 10px auto;
	font-size: 30px;
	overflow: hidden;
	text-align: left;
}

#sub>input {
	width: 30px;
	height: 30px;
	margin-left: 380px;
}

#res>span:nth-child(2) {
	margin-left: 260px;
}

#res {
	margin: 10px auto;
}

.hsinfo {
	text-align: center;
	padding-top: 10px;
}

.patientinfo>h4 {
	margin-top: 5px;
	margin-bottom: 10px;
	text-align: left;
	margin-top: 10px;
}

.resInfo {
	text-align: left;
}

.resInfo>.resDate {
	margin-top: 10px;
	padding-top: 5px;
}

.resInfo>.resTime {
	margin-top: 10px;
	padding-top: 5px;
}

.resInfo>.type {
	margin-top: 10px;
	padding-top: 5px;
}

.resInfo h5 {
	width: 80px;
	margin-top: 5px;
}

.comment {
	margin-top: 10px;
	text-align: left;
}

#content {
	margin-top: 5px;
}

.modi {
	margin-top: 30px;
	background: white;
	background-color: white;
	color: #2188C4;
	width: 200px;
	height: 42px;
	border-radius: 20px;
	float: left;
	font-size: 20px;
	border: 1px solid #16151562;
}

.rescancel {
	margin-top: 30px;
	background-color: #363A3E;
	color: white;
	width: 200px;
	height: 42px;
	border-radius: 20px;
}

.material-symbols-outlined {
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24
}
</style>

<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
<script> 

$(function (){
    $(".rescancel").click(function() {
        var id = $(".hiddenId").val();
        console.log(id);
        var status = "3"; 

        Swal.fire({
            title: '예약 취소',
            text: '예약을 취소하시겠습니까?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: '확인',
            cancelButtonText: '취소',
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: "resmanage",
                    type: "post",
                    data: {
                        "id": id,
                        "status": status
                    },
                    success: function (res) {
                        location.href = "reslist";
                    }
                });
            }
        });
    });

    $(".modi").click(function() {
        var id = $(".hiddenId").val();
        var comment = $("#comment").val();

        Swal.fire({
            title: '수정',
            text: '수정하시겠습니까?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: '확인',
            cancelButtonText: '취소',
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: "commentupdate",
                    type: "post",
                    data: {
                        "id": id,
                        "comment": comment
                    },
                    success: function (res) {
                        location.href="reslist"
                    }
                });
            }
        });
    });
});

 </script>
</head>

<body>
	<!-- 헤더 -->
	<%
	pageContext.include("thinheader.jsp");
	%>
	<div id="sub">
		<span class="material-symbols-outlined"
			onClick="location.href='reslist'" style="margin-left: 400px;">
			arrow_back </span> <br>
		<hr>
	</div>


	<div id="container">
		<div id="res">
			<div class="hsinfo">
				<%
				request.getParameter("res");
				%>
				<h3>${res.hname }</h3>
				<br>

				<h4>${res.address }</h4>
				<br>
				<h4>진료 시간 : ${res.time }</h4>
				<br>
				<h4>${res.tel }</h4>
				<br>
				<hr>
			</div>
			<div class="patientinfo">
				<h4>진료 대상</h4>
				<h4>${res.pname }</h4>
				<hr>
			</div>

			<div class="resInfo">
				<div class="resDate">
					<h4>예약 일자</h4>
					<h5>${res.resdate }</h5>
				</div>

				<div class="resTime">
					<h4>예약 시간</h4>
					<h5>${res.restime }</h5>
				</div>

				<div class="type">
					<h4>진료 과목</h4>
					<h5>${res.department }</h5>
				</div>
				<br>
				<hr>

			</div>

			<div class="comment">
				<h4>원장님께 하고 싶은 말 :</h4>
				<br>
				<c:choose>
					<c:when test="${res.status eq 1}">
						<textarea name="" id="comment" cols="58" rows="2">${res.comment }</textarea>
					</c:when>
					<c:when test="${res.status ne 1}">
						<textarea disabled="disabled" name="" id="comment" cols="58"
							rows="2">${res.comment }</textarea>
					</c:when>
				</c:choose>

			</div>

			<c:choose>
				<c:when test="${res.status eq 1}">
					<input type="button" class="modi" value="수정"> &nbsp;
    <button style="cursor: pointer;" class="rescancel">
						<h2>예약 취소</h2>
					</button>
					<input class="hiddenId" type="text" value="${res.id }"
						style="display: none;">
				</c:when>
				<c:when test="${res.status ne 1}">
					<button class="rescancel" style="display: none;">
						<h2>예약 취소</h2>
					</button>
				</c:when>
			</c:choose>
		</div>








	</div>

</body>

</html>