<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<title>오류</title>
</head>
<body>
<center>
	<%
	pageContext.include("hospitalheader.jsp");
	%>
<h3><%=request.getAttribute("err") %></h3>
<img src="image?file=herror.jpg"
			alt="에러404" width=40% height=40% />
			
</center>


</body>
</html>