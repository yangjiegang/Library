<!DOCTYPE html>
<html lang="en">
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base target="content">
<title>options</title>
<link type="text/css" rel="stylesheet" href="/Library/bootstrap/css/bootstrap.css">
</head>
<body>
	<div class="col-sm-8 col-sm-offset-1">
		<H3>options&nbsp<span class="label label-default">go</span></H3>
		<ul id="options" class="nav nav-stacked">
			<li><a href="welcome.jsp">welcome</a></li>
			<li><a href="register.jsp">register</a></li>
			<li><a href="login.jsp">login</a></li>
			<li><a href="findBook.jsp">findbook</a></li>
<!-- 			<li><a href="findBookByID.html">findbookbyid</a></li>
			<li><a href="findBooksByName.html">findBooksByName</a></li> -->
     		<li><a href="addOneBook.jsp">addOneBook</a></li>
    		<li><a href="#">chat</a></li>
    		<li><a href="#">manage<span class="badge">2</span></a></li>
		</ul>
	</div>
	<script type="text/javascript" src="/Library/js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="/Library/bootstrap/js/bootstrap.js"></script>
</body>
</html>