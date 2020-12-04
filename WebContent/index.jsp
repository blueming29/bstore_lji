<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="css/bstyle.css" />
</head>
<script>
	$(document).ready(function(){
		$(".click").click(function(){
			location.href="./book/book.do";
			
		});
	});
</script>
<body>
	<input class="click" type="button" value="게시판가기" />
</body>
</html>