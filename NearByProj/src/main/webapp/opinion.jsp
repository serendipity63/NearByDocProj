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
	margin-left:240px;
	
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
<script language="javascript"></script>
<script>
function reset() {  
    setTimeout(function() {  
window.close();  
    }, );  
}
function submit(){
	
}
 
</script>



</head>
<body>
	<h1>담당의소견</h1>
	<div id="content">

	<textarea rows="20" cols="100" placeholder="담당의 소견을 남겨주세요"></textarea>
	</div>
	<br>
	<div id="submit">
	<a href="#" class="submit" onClick="javascript:submit();">제출</a>
	<a href="#" class="reset" onClick="javascript:reset();">취소</a>
	</div>
</body>
</html>