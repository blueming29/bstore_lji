<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="book.board.db.DBcon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width = device - width, initial - scale = 1.0" />
<title>로그인처리</title>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	Connection conn = DBcon.getConnection();
	
	String sql = "select pwd from member where id = ?";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, id);
	
	ResultSet rs = ps.executeQuery();
	
	String ypw = "";
	int x = -1;
	
	if(rs.next()){
		ypw = rs.getString("pwd");
		if(ypw.equals(pw)){
			x = 1;		
		} else {
			x = 0;
		}
	}
	
	String msg = "";
	if(x == 1){
		session.setAttribute("sessionID", id);
		msg = "../mainForm.jsp";
	} else if (x == 0){
		msg = "loginForm.jsp?msg=0";
	} else {
		msg = "loginForm.jsp?msg=-1";
	}
	
	response.sendRedirect(msg);
%>
</head>
<body>
	<h3>로그인처리</h3>
</body>
</html>