<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>addOneBook</title>
<link type="text/css" rel="stylesheet"
	href="/Library/bootstrap/css/bootstrap.css">
</head>
<body>
	<div class="container">
		<div id="addBookInfo">
			<fieldset>
				<legend>
					<h4>AddOneBook</h4>
				</legend>
				<form class="form-horizontal col-sm-offset-1"
					action="/Library/addOneBook.do" method="post"
					enctype="multipart/form-data">
					<div class="form-group">
						<label for="bookName" class="col-sm-2 control-label">bookName</label>
						<div class="col-sm-8">
							<input type="text" id="bookName" name="bookName"
								class="form-control" placeholder="bookName" />
						</div>
					</div>
					<div class="form-group">
						<label for="bookAuthor" class="col-sm-2 control-label">bookAuthor</label>
						<div class="col-sm-8">
							<input type="text" id="bookAuthor" class="form-control"
								placeholder="author" name="bookAuthor" />
						</div>
					</div>
					<div class="form-group">
						<label for="count" class="col-sm-2 control-label">count</label>
						<DIV class="col-sm-8">
							<input type="number" id="count" class="form-control" name="count" />
						</DIV>
					</div>
					<div class="form-group">
						<label for="bookImg" class="col-sm-2 control-label">bookImg</label>
						<div class="col-sm-offset-1 col-sm-4">
							<input type="file" id="bookImg" name="bookImg" />
						</div>
					</div>
					<input type="submit" class="btn btn-info col-sm-offset-2"
						value="submit" /> <BR>
					<lable style="font:30px red YaHei">${message }</lable>
				</form>
			</fieldset>
		</div>
	</div>
	<script type="text/javascript" src="/Library/js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="/Library/bootstrap/js/bootstrap.js"></script>
	<!--     <script type="text/javascript" src="../js/book.js"></script> -->
</body>
</html>
