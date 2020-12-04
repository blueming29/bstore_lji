<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width = device - width, initial - scale = 1.0" />
<title>메인페이지</title>
<link rel="stylesheet" href="css/login_style.css" />
</head>
<body>
	<h3>메인페이지</h3>
	<%
		if(session.getAttribute("sessionID") == null){
			response.sendRedirect("login/loginForm.jsp");
		} else {
	%>		
		<%=session.getAttribute("sessionID") %>님 반갑습니다. &nbsp;&nbsp;&nbsp;&nbsp;
		<a href="login/logoutProc.jsp">로그아웃</a>
	<%
		}
	%>
	<hr />
	<a href="book/book.do">게시판이동</a>
</body>
</html>