<!DOCTYPE>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet"
	href="/Library/bootstrap/css/bootstrap.css">
<title>findBook</title>
</head>
<body>
	<div class="container">
		<DIV id="findBook">
			<FORM id="queryForm" class="form-inline col-sm-offset-1"
				action="/Library/findBookByID.do" method="GET">
				<SELECT class="form-control" id="findMethod">
					<OPTION value="findBookByID" selected="selected">ID</OPTION>
					<OPTION value="findBooksByName">Name</OPTION>
				</SELECT>
				<INPUT type="text" name="queryInput" class="form-control"
					required="required">
				<span class="glyphicon glyphicon-search" aria-hidden="false"></span>
				</input>
				<INPUT type="submit" class="btn btn-primary" value="submit" />
			</FORM>
		</DIV>
	</div>
	<script type="text/javascript" src="/Library/js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="/Library/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		document.getElementById("findMethod").onchange = function() {
			var method = this.value;/////???????
			document.getElementById("queryForm").setAttribute("action",
					"/Library/" + method + ".do");
		}
	</script>
</body>
</html>