<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error404</title>
<style type="text/css">
h2{

}
</style>
</head>
<body>
<center>
<% pageContext.include("header.jsp"); %>
<h2><%=request.getAttribute("err") %> </h2>

<a href="home" class="logo"><img src="image?file=error.jpg"
			alt="에러404" width="430px" height="430px"></a>
</center>
</body>
</html>