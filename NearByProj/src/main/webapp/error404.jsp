<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<title>error404</title>
<style type="text/css">
*{
			font-family: 'Noto Sans kr', sans-serif;

}
</style>
</head>
<body>
<center>
<% pageContext.include("header.jsp"); %>
<h3><%=request.getAttribute("err") %> </h3>

<a href="home" class="logo"><img src="image?file=error.jpg"
			alt="에러404" width="430px" height="430px"></a>
</center>
</body>
</html>