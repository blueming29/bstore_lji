<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width = device - width, initial - scale = 1.0" />
<title>등록</title>
<link rel="stylesheet" href="../css/bstyle.css" />
</head>
<body>
	<div id="wrap">
		<a id="home" href="book.do">BOOKSHOP</a>
		<br /><br />	
		<form action="bookRegProc.do" method="post">
			<table class="twidth">
				<colgroup>
					<col width="20%" />
					<col width="80%" />
				</colgroup>
				<caption>등록</caption>
				<tbody>
					<tr>
						<th>책이름</th>
						<td><input class="input" type="text" name="title" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea id="content" name="content" ></textarea></td>
					</tr>
				
				</tbody>
			
			</table>
			<input type="submit" value="등록" />
			<a href="book.do">취소</a>
		</form>
	</div>
</body>
</html>