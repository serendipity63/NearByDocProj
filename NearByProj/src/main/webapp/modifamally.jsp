<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

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
  background: #DAD9D9;
  color: black;
  border: 1px solid #16151562;
}


#famlist{
  margin-top: 10px;
}

#detailfam{
  width: 320px;
  height: auto;
  margin: 20px auto;
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

tr>td{
	height: 40px;
}


.modi {
	background: white;
    color: #2188C4;
    border: 1px solid #16151562;
}
</style>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
	<!-- 우편번호 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script> 

$(function(){
    $(".delete").click(function(){
        console.log("삭제 버튼 클릭");
        var famName = $(this).closest("div#detailfam").find("input[id='hiddenPidnum']").val();
        console.log(famName);
        Swal.fire({
            title: '삭제 확인',
            text: '삭제하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: '삭제',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: 'deletafam',
                    type: 'post',
                    data: {'pname': famName},
                    success: function(response) {
                        console.log("success");
                        Swal.fire('삭제 완료', '가족이 삭제되었습니다.', 'success').then(function() {
                            location.href = "addfamally";
                        });
                    },
                });
            }
        });
    });

    $(".modi").click(function() {
        console.log("수정 버튼 클릭");
        var famName = $(this).closest("div#detailfam").find("textarea[id='fname']").val();
        var ftel = $(this).closest("div#detailfam").find("textarea[id='ftel']").val();
        var faddress = $(this).closest("div#detailfam").find("textarea[id='faddress']").val();
        var fidnum = $(this).closest("div#detailfam").find("input[id='fidnum']").val();
        Swal.fire({
            title: '수정 확인',
            text: '수정하시겠습니까?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: '수정',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                console.log(famName);
                console.log(ftel);
                console.log(faddress);
                console.log(fidnum);
                $.ajax({
                    url: 'modifamally',
                    type: 'post',
                    data: {
                        'pname': famName,
                        'ptel' : ftel,
                        'proadaddress' : faddress,
                        'pidnum' : fidnum
                    },
                    success: function(response) {
                        console.log("success");
                        Swal.fire('수정 완료', '가족 정보가 수정되었습니다.', 'success').then(function() {
                            location.href = "addfamally";
                        });
                    }
                });
            }
        });
    });
    
    
    $('#ftel').keydown(function (event) {
        var key = event.charCode || event.keyCode || 0;
        var $text = $(this);

        if (key !== 8 && key !== 9) {
            if ($text.val().length === 3 || $text.val().length === 8) {
                $text.val($text.val() + '-');
            }
        }

        if (key !== 8 && key !== 9 && key !== 46 && (key < 48 || key > 57)) {
            event.preventDefault();
        }

        return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57));
    });
    
    $("#faddress").click(function(){
		new daum.Postcode({

			oncomplete : function(data) {

				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.

				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.

				var addr = ''; // 주소 변수

				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.

				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우

					addr = data.roadAddress;

				} else { // 사용자가 지번 주소를 선택했을 경우(J)

					addr = data.jibunAddress;

				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("faddress").value = addr;


			}

		}).open();
	})
});

	  

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
      <span class="material-symbols-outlined" onClick="location.href='addfamally'" style="margin-left: 300px;">
        arrow_back
        </span> 
      <hr>
      <div id="famlist">
      <c:forEach items="${familys}" var="family">
        <div id="detailfam">
          <table>
            <tr>
              <td>
                이름
              </td>
              <td>
                <textarea name="" id="fname" rows="2" cols="22">${family.name }</textarea>
                <input id="fidnum" type="text" value="${family.id}" style="display:none;">
              </td>
              <td rowspan="4" colspan="3">
			      <input style="cursor: pointer;" class="modi" type="button" value="수정"
       data-name="${family.name}" data-tel="${family.tel}" data-address="${family.address}">
			      <input style="cursor: pointer;" class="delete" type="button" value="삭제">
			      <input id="hiddenPidnum" type="text" value="${family.name}" style="display:none;">
    		  </td>
            </tr>

            <tr>
              <td>
                <span>전화번호</span>
              </td>
              <td>
                <textarea name="" id="ftel" rows="2" cols="22">${family.tel }</textarea>
              </td>
            </tr>

            <tr>
              <td>
                <span>주소</span>
              </td>
              <td>
                <textarea name="" id="faddress" rows="2" cols="22">${family.address }</textarea>
              </td>
            </tr>
          </table>
        </div>
        </c:forEach>


      </div>
      <br>
      
    </div>

    
   </div>

</body>

</html>