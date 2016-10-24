<!DOCTYPE HTML>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>showBook</title>
<link type="text/css" rel="stylesheet"
	href="/Library/bootstrap/css/bootstrap.css">
</head>
<body>
	<div class="container">
		<div id="showBook table-responsive"> 
			<%-- <IMG alt="img" src="<%=request.getContextPath()%>/upload/example.png"/> --%>
			<c:choose>
				<c:when test="${!empty book}">
						<table class="table table-striped">
				<thead><h3>Book&nbsp<span class="glyphicon glyphicon-sunglasses"></span></h3></thead>
				<tr class="danger">
				<th>img</th>
				<th>item</th>
				<th>value</th>
				</tr>
				<tr>
					<td	rowspan="5"><img src="${book.imgPath}" class="img-responsive img-circle" alt="bookImg" width="200px" height="200px"></img></td>
							</tr>
	
					<tr>
						<td>Name</td>
						<td>${book.bookName }</td>
					</tr>
					<tr>
						<td>Author</td>
						<td>${book.bookAuthor }</td>
					</tr>
					<tr>
						<td>Count</td>
						<td>${book.count }</td>
					</tr>
					<tr>
						<td>saveDate</td>
						<td>${book.saveDate }</td>
					</tr>
				</table>
			</c:when>
			
			<c:otherwise>
				<h4>no such book find</h4>
			</c:otherwise>
			
		</c:choose>
		</div>
	</div>
	
<%--	<script type="text/javascript">
 		function getQueryString(name) {
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
			var r = window.location.search.substr(1).match(reg);
			if (r != null) return unescape(r[2]); return null;
		}
		document.getElementsByTagName("td")[1].innerHTML=book[getQueryString("bookID")];
 		document.getElementsByTagName("td")[3].innerHTML=book['bookName'];
		document.getElementsByTagName("td")[5].innerHTML=book['bookAuthor'];
		document.getElementsByTagName("td")[7].innerHTML=book['count'];
		document.getElementsByTagName("td")[9].innerHTML=book["saveDate"].substr(0,10); 
	</script>--%>
	
	<script type="text/javascript" src="/Library/js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="/Library/bootstrap/js/bootstrap.js"></script>
</body>
</html>