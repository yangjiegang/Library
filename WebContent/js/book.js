var addBtn = document.getElementsByTagName("input")[3];
var newBook={"bookName":document.getElementsByTagName("input")[0].value, 
"bookAuthor":document.getElementsByTagName("input")[1].value, 
"count":document.getElementsByTagName("input")[2].value};
//var newBook = [document.getElementsByTagName("input")[0].value, document.getElementsByTagName("input")[1].value, document.getElementsByTagName("input")[2].value];
addBtn.onclick=function(){
//	console.log(document.getElementsByTagName("input")[0].value);
	console.log(newBook);
	$.ajax({
		url:"/Library/addOneBook.do",
		type:"post",
        data:{"newBook":newBook},
		//dataType:"json",
		success:function(bookID){
			console.log(bookID);
			confirm(bookID);
		}
	});
}