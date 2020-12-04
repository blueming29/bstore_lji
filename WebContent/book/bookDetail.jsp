<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width = device - width, initial - scale = 1.0" />
<title>상세정보</title>
<link rel="stylesheet" href="../css/bstyle.css" />
</head>

<body>
	<div id="wrap">
		<a id="home" href="book.do">BOOKSHOP</a>
		<br /><br />
		<table class="twidth">
			<colgroup>
				<col width="20%" />
				<col width="30%" />
				<col width="20%" />
				<col width="30%" />
			</colgroup>
			<caption>상세정보</caption>
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
					<td class="left" colspan="3">${b.jibtitle }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td id="content" colspan="3">${b.jibcontent }</td>
				</tr>
			</tbody>
		</table>
		<div class="mg-left">
			<a href="book.do?pg=${pg }">목록</a>
			<a href="bookEdit.do?jibno=${b.jibno }&pg=${pg}">수정</a>
			<a href="bookDelProc.do?jibno=${b.jibno }&pg=${pg}">삭제</a>
		</div>
	</div>
</body>
</html>