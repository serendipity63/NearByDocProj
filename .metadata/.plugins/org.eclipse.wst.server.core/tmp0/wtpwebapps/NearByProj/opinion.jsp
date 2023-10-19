<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>담당의소견</title>
<style>
h1{
	text-align:center;

}
#content{
 display:flex;

}

#submit{
	margin-left:160px;
	
}
#submit>a{
	display:inline-block;
	width:100px;
	text-decoration:none;
	color:white;
	text-align:center;
	padding:10px;
}
#submit>a.reset{
	background-color:lightgray;
	color:black;
}
#submit>a.submit{
	background-color: rgb(25, 25, 112);
}

</style>
<script type="text/javascript">
function reset() {  
    setTimeout(function() {  
window.close();  
    }, );  
}
function submitForm(){
	var formData=document.forms["myForm"].elements["myField"].value;
	window.opener.postMessage(formData,"*");
	window.close();
}
 
</script>



</head>
<body>
	<h1>담당의소견</h1>
	<form action="opinion" method="post" enctype="multipart/form-data" name="opinionform">
	<div id="content">
	
	<textarea rows="20" cols="100" placeholder="담당의 소견을 남겨주세요"></textarea>
	</div>
	<br>
	<div id="submit">
	<a href="mrecord.jsp" class="submit" onClick="javascript:submitForm();">제출</a>
	<a href="#" class="reset" onClick="javascript:reset();">취소</a>
	</div>
	</form>
</body>
</html>