<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
    @charset "UTF-8";

* {
    margin: 0;
    padding: 0;
    font-family: 'Noto Sans kr', sans-serif;

}

a {
    text-decoration: none;
}

.outerDiv {
    width: 100%;
    height: 100px;
    background-color: #191970;
    color: #D3D3D3;
    font-family: 'Noto Sans', sans-serif;
    text-align: center;
    padding-top: 10px;
    padding-bottom: 10px;
    margin-bottom:10px;

}

.innerDiv {
    margin-top: 10px;

}

.innerDiv a {
    color: #D3D3D3;
    margin-right: 10px;


}

.title {
    width: 100%;
    text-align: center;
    /* 가운데 정렬 */
    font-size: 20px;
    margin-bottom: 20px;

}

.logo img {
    width: 450px;
    height: 80px;
    vertical-align: middle;
    margin-right: 10px;
    margin-top: 5px;
}

</style>
<title> hospitalheader </title>
</head>
<body>
 <div class="outerDiv">
        <a href="hlogin" class="logo"><img src="image?file=hospitaldoc.png" alt="로고 이미지"></a>
 
    </div>


</body>
</html>