<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
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

#sub{
  width:430px;
  margin: 10px auto;
  font-size: 30px;
  overflow: hidden;
}

.modibtn{
  width: 57px;
  height: 36px;
  border-radius: 10px;
  background-color: white;
  color:#2188C4;
  margin-left: 303px;
  margin-bottom: 2px;
  font-size: 18px;
  border: 1px solid #16151562;
}




.canbtn{
  width: 57px;
  height: 36px;
  border: solid 1px;
  border-radius: 10px;
  background-color: #78818C;
  /* margin-left: 2px; */
  margin-bottom: 2px;
  color: white;
  font-size: 18px;
  
}




#container {
  background-color: white;
  margin: 10px  auto;
  width:430px;
  height:600;
  padding-top: 5px;
}

table{
  width: 400px;
  height: auto;
}

#container p input{
    height: 40px;
    width: 70%;
    margin: 10px 20px;
    margin-left:60px;
    border: 1px solid #16151562;
    border-radius: 4px;
    background: #ffffff;
    /* padding-left: 5px; */
    /* Noto Sans 폰트 설정 */
    font-size: 12pt;
    font-style: normal;
    font-weight: normal;
    text-decoration: inherit;
    color: black;
    text-indent: 0.5em;
}

.col{
margin-left :60px;
}


</style>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
<script>
	$(function() {
		$(".modibtn").click(function(){
			
			var pname = $("#pname").val();
			var ptel = $("#ptel").val();
			var pemail = $("#pemail").val();
			var ppassword = $("#ppassword").val();
			var proadaddress = $("#proadaddress").val();
			
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
								url:"modiprofile",
								type:"post",
								data:{
									"pname" : pname
								  , "ptel" : ptel
								  ,	"pemail" : pemail
								  ,	"ppassword" : ppassword
								  ,	"proadaddress" : proadaddress
									},
								success:function(res){
									location.href="profile";
								}
							})
					  } 
				})
		})
	})
</script>
</head>

<body>
   <!-- 헤더 -->
   <% pageContext.include("thinheader.jsp");%>
   <div id="sub">
  </div>


   <div id="container">
    <div>
	    <p class="col">이름</p>
	    <p><input type="text" id="pname" name="pname" value="${myinfo.pname }"></p>
	    <p class="col">전화번호</p>
	    <p><input type="text" id="ptel" name="ptel"  value="${myinfo.ptel } "></p>
	    <p class="col">이메일</p>
	    <p><input type="text" id="pemail" name="pemail" value="${myinfo.pemail }"></p>
	    <p class="col">비밀번호</p>
	    <p><input type="text" id="ppassword" name="ppassword" value="${myinfo.ppassword }"></p>
	    <p class="col">주소</p>
	    <p><input type="text" id="proadaddress" name="proadaddress" value="${myinfo.proadaddress }"></p>
	    <span>
	     
        <input class="modibtn" type="submit" value="수정">
        <input class="canbtn" type="button" onclick="location.href='profile'" value="취소">
      </span>
    </div>
    </div>


   

</body>

</html>