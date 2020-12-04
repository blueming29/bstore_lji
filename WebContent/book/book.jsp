<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta name="viewport"
	content="width = device - width, initial - scale = 1.0" /> -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, 
  maximum-scale=1.0, minimum-scale=1.0"/>
<title>bookstore</title>
<link rel="stylesheet" href="../css/bstyle.css" />
</head>

<body>
	<div id="wrap">
		<a id="home" href="book.do">이정인리스트</a>
		<br /><br />
		<table class="twidth">
			<colgroup>
				<col width="10%" />
				<col width="40%" />
				<col width="20%" />
				<col width="20%" />
				<col width="10%" />
			</colgroup>
			<caption>책</caption>
			<tbody>
				<tr>
					<th>번호</th>
					<th>책이름</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
	
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td style="text-align: center" colspan="5">등록된 자료가 없습니다</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="b" items="${list }">
							<tr>
								<td>${b.jibno }</td>
								<td class="left"><a href="bookHitProc.do?jibno=${b.jibno }&pg=${param.pg }">${b.jibtitle }</a></td>
								<td>${b.jibwriter }</td>
								<td>${b.jibdate }</td>
								<td>${b.jibhit }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
							
			</tbody>
	
		</table>
		<div>
			<a href="bookReg.do">등록</a>
			<form id="right" action="book.do" method="get">
				<input type="hidden" name="pg" value="1" />
				<select name="f" >
					<option value="jibtitle" ${param.f == "jibtitle" ? "selected" : "" }>제목</option>
					<option value="jibcontent" ${param.f == "jibcontent" ? "selected" : "" }>내용</option>
				</select>
				<input type="text" name="q" value="${param.q }" />
				<input id="search" type="submit" value="검색" />
			</form>
		</div>
		<br />
		<div id="center">
			<span><a href="book.do?pg=${1 }&f=${param.f}&q=${param.q}">처음&nbsp;&nbsp;</a></span>
			<c:if test="${start == 1 }">
				<span style="color: lightgray">이전&nbsp;&nbsp;</span>
			</c:if>
			<c:if test="${start != 1 }">
				<span><a href="book.do?pg=${page - (page - 1) % 5 - 5 }&f=${param.f}&q=${param.q}">이전&nbsp;&nbsp;</a></span>
			</c:if>
			<c:forEach begin="${page - (page - 1) % 5 }" end="${page - (page - 1) % 5 + 4 }" var="i">
				<c:if test="${i <= end }">
					<c:if test="${i == page }">
						<strong><a id="current" href="book.do?pg=${i }&f=${param.f}&q=${param.q}">&nbsp;${i }&nbsp;</a></strong>
					</c:if>
					<c:if test="${i != page }">
						<a id="others" href="book.do?pg=${i }&f=${param.f}&q=${param.q}">&nbsp;${i }&nbsp;</a>
					</c:if>
				</c:if>
			</c:forEach>
			<c:if test="${start + 4 >= end }">
				<span style="color: lightgray">&nbsp;&nbsp;다음</span>
				
			</c:if>
			<c:if test="${start + 4 < end }">
				<span><a href="book.do?pg=${page - (page - 1) % 5 + 5 }&f=${param.f}&q=${param.q}">&nbsp;&nbsp;다음</a></span>
			</c:if>
				<span><a href="book.do?pg=${end }&f=${param.f}&q=${param.q}">&nbsp;&nbsp;마지막</a></span>
			<br />
			<span>${page }/${end }</span>page
		</div>
	</div>

</body>
</html>