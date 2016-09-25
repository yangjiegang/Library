<!DOCTYPE html>
<html lang="en">
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>BookList</title>
<link type="text/css" rel="stylesheet" href="/Library/bootstrap/css/bootstrap.css">
<style type="text/css">
#bookListUl>li {
	list-style: none;
}

#bookListUl>li>a.data {
	target: _self;
}

#pagerNav>ul {
	list-style: none;
}

li.pager {
	list-style: none;
	height: 30px;
	width: 30px;
	float: left;
	border: 1px solid black;
	margin: 5px;
	cursor: pointer;
	text-align: center;
	font: 0.8em black YaHei;
}
table>tr{
	display:none;
}
tr{
	display:none;
}
</style>
</head>

<body>
<div class="container">
	<%-- 	<div id="bookList">
		<table border="3">
			<thead>bookList</thead>
			<th>name</th>
			<th>author</th>
			<th>count</th>
			<th>saveDate</th>
			<th colspan="2">modify</th>
			<c:forEach items="${requestScope.bookList}" var="book">
			<tr>
				<td>${book.bookName }</td> 
				<td>${book.bookAuthor }</td>
				<td>${book.count }</td>
				<td>${book.saveDate }</td>
				<td><A href="javascript:void(0);">view</A></td>
				<td><a href="javascript:void(0);">update</a></td>
				<td><A href="javascript:void(0);">delete</A></td>
			</tr>
			</c:forEach>
		</table>
	</div> --%>
	
	<DIV class="table-responsive">
		<TABLE class="table">
			<thead><h4>bookList</h4></thead>
			<tr style="display:block;">
			<th class="info">name</th>
			<th class="info">author</th>
			<th class="info">count</th>
			<th class="info">saveDate</th>
			<th colspan="2" class="info">modify</th>
			</tr>
		</TABLE>
	</DIV>

	<nav id="pagerNav" class="pagination pagination-lg">
		<ul></ul>
	</nav>
	</div>>

	<script type="text/javascript" src="/Library/js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="/Library/bootstrap/js/bootstrap.js"></script>
	<SCRIPT type="text/javascript">
		//var bookList=JSON.parse("${requestScope.bookList}");
		//var str = '[{"bID":1,"bookName":"JavaSpringMVC","bookAuthor":"Alex","count":3}]';
		//var bookList = eval('(' + '${requestScope.bookList}' + ')');
		//var bookList=JSON.parse('[{"bID":1,"bookName":"JavaSpringMVC","bookAuthor":"Alex","count":3,"saveDate":"2016-08-29T00:00:00","imgPath":"/example.png"},{"bID":2,"bookName":"javascript","bookAuthor":"bob","count":3,"saveDate":"2016-09-02T00:00:00","imgPath":"example.png"}]');
		var bookList = JSON.parse('${requestScope.bookList}');
		var table = document.getElementsByClassName("table")[0];
		var bookCount = bookList.length;
		var pageSize = 5;
		for ( var i = 0; i <bookCount; i++) {
			var row = table.insertRow(i+1);
			var cell00 = row.insertCell(0);
			cell00.innerHTML = bookList[i]["bookName"];
			var cell01 = row.insertCell(1);
			cell01.innerHTML = bookList[i]["bookAuthor"];
			var cell02 = row.insertCell(2);
			cell02.innerHTML = bookList[i]["count"];
			var cell03 = row.insertCell(3);
			cell03.innerHTML = bookList[i]["saveDate"];
			var cell04 = row.insertCell(4);
			cell04.innerHTML = "<a href='/Library/findBookByID.do?queryInput="
					+ (1 + i) + "'>view</a>";
			var cell05 = row.insertCell(5);
			cell05.innerHTML= "<a class='delete' href='javascript:;' onclick='del(this);'>delete</a>";
			var cell06 = row.insertCell(6);
			cell06.innerText = 1+i;
			cell06.style.visibility = "hidden";
		}
		pageDiv(bookCount);

		function pageDiv(dataCount) {
			var pageCount = 1;
			var pagerUl = document.getElementById("pagerNav")
					.getElementsByTagName("ul")[0];
			if (dataCount > pageSize) {
				pageCount = parseInt(dataCount / pageSize) + 1;
				var firstPager = "<li class='pager'><a target='_self' onclick='showPage(1);'>First</a></li>";
				pagerUl.innerHTML += firstPager;
				for ( var i = 1; i < pageCount + 1; i++) {
					var pager = "<li class='pager'><a target='_self' onclick='turnTo(this);'>"
							+ i + "</a></li>";
					pagerUl.innerHTML += pager;
				}
				var lastPager = "<li class='pager'><a target='_self' onclick='showPage("
						+ pageCount + ");'>Last</a></li>";
				pagerUl.innerHTML += lastPager;
				showPage(1);//Init the first page here
			} else {
				for ( var i = 0; i < dataCount; i++) {
					$(".talbe").eq(0).find("tr").eq(i+1).css("display","block");
				}
			}
		}
		function turnTo(self) {
			var pageNum = self.innerText;
			showPage(pageNum);
		}
		function showPage(pageNum) {
			var beginIndex = (pageNum - 1) * pageSize + 1 -1;
			var endIndex = pageNum * pageSize;
			for ( var i = 0; i < bookCount; i++) {
				document.getElementsByTagName("tr")[i+1].style.display = "none";
			}
			for ( var i = beginIndex; i < endIndex; i++) {
				document.getElementsByTagName("tr")[i+1].style.display = "block";
			}
		}
		function del(self){
			var bID = self.parentNode.parentNode.lastChild.innerHTML;console.log(bID);
			//var bIDIndex = txt.indexOf("bID")+4;
			//var bID = txt.substr(bIDIndex,2); 
			$.ajax({
				url:"/Library/deleteBook.do",
				type:"POST",
				data:{"bID":bID},
				success:function(flag){
					console.log(flag);
					//i=parseInt(i);
					if (flag==="1") {
						console.log(flag);
						var bookRow = self.parentNode.parentNode;console.log(bookRow);
						table.removeChild(bookRow);
					} else if (flag==="0") {
						confirm("delete faultly!");
					} else {
						
					}
				},
				error: function(){
					console.log("delete ajax error!");
				}
			});
		};
		
	</SCRIPT>
</body>
</html>