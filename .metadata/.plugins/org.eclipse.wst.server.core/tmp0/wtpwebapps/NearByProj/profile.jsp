<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
  margin: 10px  auto;
  width:430px;
  height:600px;
}

#container p input{
margin-left:60px;
}

#sub{
  margin: 10px auto;
   width:430px;
  font-size: 30px;
  overflow: hidden;
  text-aligin:left;
}

table{
  width: 400px;
  height: auto;
}

#subsub{
  margin: 0 auto;
  width: 430px;
  
}
.modibtn>input{
  width: 52px;
  height: 36px;
  border-radius: 10px;
  color: #2188C4;
  font-size: 17px;
  text-align: left;
  margin-left:360px; 
}

#out{
  margin-top: 10px;
}

#out>input{
  width: 80px;
  height: 36px;
  background-color: #363A3E;
  color: white;
  border-radius: 10px;
  text-align: center;
  
}

#out>button{
  width: 80px;
  height: 36px;
  background-color: #363A3E;
  color: white;
  border-radius: 10px;
  text-align: center;
  margin-left:170px;
  
}

input{

    height: 40px;
    width: 70%;
    margin: 10px 20px;
    border: 1px solid #16151562;
    border-radius: 4px;
    background: #ffffff;
    /* padding-left: 5px; */
    /* Noto Sans 폰트 설정 */
    font-size: 12pt;
    font-style: normal;
    3font-weight: normal;
    text-decoration: inherit;
    color: black;
    text-indent: 0.5em;
}

.col{
  text-align: left;
  margin-left: 65px;
}


</style>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>

<script type="text/javascript">
$(function (){
	/* $("#out").click(function() {
		if (confirm("정말 탈퇴하시겠습니까?") == true){    //확인
			$.ajax({
				url:"patientleave",
				type:"post",
				data:{"pidnum" : $('#hiddenPidnum').val()},
				success:function(res){
					location.href=res
				}
			})
		}else{   //취소
			return false;
		}
	}) */
	
	
	$("#out").click(function() {
		Swal.fire({
			  title: '탈퇴',
			  text : '탈퇴하시겠습니까?',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonText: '확인',
			  cancelButtonText: '취소',
			}).then((result) => {
			  /* Read more about isConfirmed, isDenied below */
			  if (result.isConfirmed) {
				  $.ajax({
						url:"patientleave",
						type:"post",
						data:{"pidnum" : $('#hiddenPidnum').val()},
						success:function(res){
							location.href=res
						}
					})
			  } else if (result.isDenied) {
				  return false;
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
    <span>내 정보</span> 
    <span class="material-symbols-outlined" onClick="location.href='mypage'" style="margin-left: 290px;">
      arrow_back
      </span> 
    <br>
    <hr>
  </div>
  
  <div id="subsub">
  <div class="modibtn">
    <input type="button" value="수정" onclick="location.href='modiprofile'">
  </div>
  </div>
  


   <div id="container">
    <div>
      <p class="col">이름</p>
      <p><input type="text" id="pname" value="${myinfo.getPname()}" disabled="disabled"></p>
      <p class="col">전화번호</p>
      <p><input type="text" id="tel"  value="${myinfo.getPtel() }" disabled="disabled"  ></p>
      <p class="col">이메일</p>
      <p><input type="text" id="address"value="${myinfo.getPemail() }" disabled="disabled"></p>
      <p class="col">주소</p>
      <p><input type="text" id="idnum" value="${myinfo.getProadaddress() }" disabled="disabled" ></p>
    </div>

    <div id="out">
      <button class="out"><h5>회원탈퇴</h5></button>
     </div> 
     <!-- pidNum을 탈퇴시에 전달하기 위해 값을 받아두는 장소 안보이게 처리  -->
     <input id="hiddenPidnum" type="text" value="${myinfo.getPidnum() }" style="display:none;" > 
     
   </div>

   

</body>

</html>