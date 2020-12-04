<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width = device - width, initial - scale = 1.0" />
<title>수정페이지</title>
<link rel="stylesheet" href="../css/bstyle.css" />
</head>

<body>
	<div id="wrap">
		<a id="home" href="book.do">BOOKSHOP</a>
		<br /><br />
		<form action="bookEditProc.do" method="post">
			<table class="twidth">
				<colgroup>
					<col width="20%" />
					<col width="30%" />
					<col width="20%" />
					<col width="30%" />
				</colgroup>
				<caption>정보수정</caption>
				<tbody>
					<tr>
						<th>번호</th>
						<td>${b.jibno }</td>
						<th>조회수</th>
						<td>${b.jibhit }</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${b.jibwriter }</td>
						<th>작성일</th>
						<td>${b.jibdate }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3"><input class="input" type="text" name="title" value="${b.jibtitle }" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3"><textarea id="content" name="content">${b.jibcontent }</textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="mg-left">
				<input type="hidden" name="jibno" value="${b.jibno }" />
				<input type="hidden" name="pg" value="${pg }" />
				<input type="submit" value="수정" />
				<a href="bookDetail.do?jibno=${b.jibno }&pg=${pg }">취소</a>
			</div>
		</form>
	</div>
</body>
</html>