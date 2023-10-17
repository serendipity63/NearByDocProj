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
<title>NearByDocHeader</title>

<style>


#container {
  /* background-color: #CFE8F7; */
  background-color: white;
  margin: 10px  auto;
  width:430px;
  height:684;
  padding-top: 5px;
}

#famallymanage>span{
  font-size: 22px;
}


input{
  width: 57px;
  height: 36px;
  border-radius: 10px; 
}

.delete{
  background: grey;
  color: black;
  border: 1px solid #16151562;
}


#famlist{
  margin-top: 10px;
}


#famlist>input{
  background: white;
  color: #2188C4;
  border: 1px solid #16151562;
  margin-left : 167px;
}
#detailfam{
  width: 320px;
  height: auto;
  
  margin: 20px auto;
  text-align: left;
}

#detailfam span{
  margin-left: 5px;
  font: bolder;
}

textarea{
  font-size: 10pt;
}

table{
  background-color: white;
  border-radius: 10px;
  width: 320px;
  text-align: center;
}

table tr td:nth-child(1){
  background-color: #CFE8F7;
  padding-right: 5px;
}

</style>

<script> 
  function deletefam(){
   if (confirm("정말 삭제하시겠습니까??") == true){    //확인
 
 }else{   //취소
 
 return false;
 
 }


 
}
 function modi(){
  alert("수정되었습니다.")
  history.go(-1);
 }
  </script> 
</head>

<body>
   <!-- 헤더 -->
   <%
	pageContext.include("thinheader.jsp");
	%>
   <div id="container">
    <div id="famallymanage">
      <span style="text-align: left; margin:10px 0 10px 10px">가족관리</span>
      <span class="material-symbols-outlined" onClick="history.go(-1)" style="margin-left: 300px;">
        arrow_back
        </span> 
      <hr>
      <div id="famlist">
        <div id="detailfam">
          <table>
            <tr>
              <td>
                <span>이름</span>
              </td>
              <td>
                <span><textarea name="" id="" cols="20">김길동</textarea></span>
              </td>
              <td rowspan="4" colspan="3">
                <input class="delete" type="button" value="삭제" onclick="deletefam()">
                <!-- <button class="delete" onclick="deletefam()"><h4>삭제</h4></button> -->
              </td>
            </tr>

            <tr>
              <td>
                <span>전화번호</span>
              </td>
              <td>
                <span><textarea name="" id="" cols="20">010-1234-5678</textarea></span>
              </td>
            </tr>

            <tr>
              <td>
                <span>주소</span>
              </td>
              <td>
                <span><textarea name="" id="" cols="20">서울특별시 금천구 남부순환로 호서대벤처타워</textarea></span>
              </td>
            </tr>
          </table>
        </div>

        <div id="detailfam">
          <table>
            <tr>
              <td>
                <span>이름</span>
              </td>
              <td>
                <span><textarea name="" id="" cols="20">박길동</textarea></span>
              </td>
              <td rowspan="4" colspan="3">
                <input class="delete" type="button" value="삭제" onclick="deletefam()">
                <!-- <button class="delete" onclick="deletefam()"><h4>삭제</h4></button> -->
              </td>
            </tr>

            <tr>
              <td>
                <span>전화번호</span>
              </td>
              <td>
                <span><textarea name="" id="" cols="20">010-1234-5678</textarea></span>
              </td>
            </tr>

            <tr>
              <td>
                <span>주소</span>
              </td>
              <td>
                <span><textarea name="" id="" cols="20">서울특별시 금천구 남부순환로 호서대벤처타워</textarea></span>
              </td>
            </tr>
          </table>
        </div>

        <div id="detailfam">
          <table>
            <tr>
              <td>
                <span>이름</span>
              </td>
              <td>
                <span><textarea name="" id="" cols="20">홍길동</textarea></span>
              </td>
              <td rowspan="4" colspan="3">
                <input class="delete" type="button" value="삭제" onclick="deletefam()">
                <!-- <button class="delete" onclick="deletefam()"><h4>삭제</h4></button> -->
              </td>
            </tr>

            <tr>
              <td>
                <span>전화번호</span>
              </td>
              <td>
                <span><textarea name="" id="" cols="20">010-1234-5678</textarea></span>
              </td>
            </tr>

            <tr>
              <td>
                <span>주소</span>
              </td>
              <td>
                <span><textarea name="" id="" cols="20">서울특별시 금천구 남부순환로 호서대벤처타워</textarea></span>
              </td>
            </tr>
          </table>
        </div>

        <div id="detailfam">
          <table>
            <tr>
              <td>
                <span>이름</span>
              </td>
              <td>
                <span><textarea name="" id="" cols="20">신길동</textarea></span>
              </td>
              <td rowspan="4" colspan="3">
                <input class="delete" type="button" value="삭제" onclick="deletefam()">
                <!-- <button class="delete" onclick="deletefam()"><h4>삭제</h4></button> -->
              </td>
            </tr>

            <tr>
              <td>
                <span>전화번호</span>
              </td>
              <td>
                <span><textarea name="" id="" cols="20">010-1234-5678</textarea></span>
              </td>
            </tr>

            <tr>
              <td>
                <span>주소</span>
              </td>
              <td>
                <span><textarea name="" id="" cols="20">서울특별시 금천구 남부순환로 호서대벤처타워</textarea></span>
              </td>
            </tr>
          </table>
        </div>
  
        <input type="button" value="수정" onclick="modi()">
        <!-- <button onclick="modi()"><h4>수정</h4></button> -->
      </div>
      <br>
      
    </div>

    
   </div>

</body>

</html>