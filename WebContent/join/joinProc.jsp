<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width = device - width, initial - scale = 1.0" />
<title>joinProc</title>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String pwd2 = request.getParameter("pwd2");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String birth = String.format("%s-%s-%s", year, month, day);

	String islunar = request.getParameter("islunar");
	String cphone = request.getParameter("cphone");
	String email = request.getParameter("email");

	String[] habits = request.getParameterValues("habit");

	String habit = "";
	if (habits != null && habits.length >= 1) {
		for (int i = 0; i < habits.length; i++) {
			habit += habits[i];
			if (habits.length > i + 1) {
				habit += ", ";
			}
		}
	}

	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "green", "123456");

	String sql = "insert into member(id, pwd, name, gender, birth, is_lunar, cphone, email, habit, regdate) "
			+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, id);
	ps.setString(2, pwd);
	ps.setString(3, name);
	ps.setString(4, gender);
	ps.setString(5, birth);
	ps.setString(6, islunar);
	ps.setString(7, cphone);
	ps.setString(8, email);
	ps.setString(9, habit);

	/* if(!pwd.equals(pwd2)){	// 비밀번호와 비밀번호 확인이 일치하지 않으면
		request.setAttribute("error", "비밀번호 불일치");
		// response.sendRedirect("join.jsp");		// 제어권만 넘겨버려서 이 페이지의 데이터를 가져갈 수 없다
		request.getRequestDispatcher("join.jsp").forward(request, response);	// 제어권과 데이터를 함께 전달 
	} */
	
	List<String> errors = new ArrayList();	// 에러 내용 담기
	// id체크
	if(id == null || id.equals("")){
		errors.add("아이디를 입력하세요");
	} 
	if(!pwd.equals(pwd2)){
		errors.add("비밀번호 불일치");
	}
	if(errors.size() > 0){	// 에러가 존재하면
		request.setAttribute("errors", errors);
		request.getRequestDispatcher("join.jsp").forward(request, response); 
	} else{
		ps.executeUpdate();	// DB에 insert
		response.sendRedirect("../index.jsp");
	}
%>
</head>
<body>
	출력
	<br />
	<%=id%>
	<br />
	<%=pwd%>
	<br />
	<%=pwd2%>
	<br />
	<%=name%>
	<br />
	<%=gender%>
	<br />
	<%=birth%>
	<br />
	<%=islunar%>
	<br />
	<%=cphone%>
	<br />
	<%=email%>
	<br />
	<%=habit%>
	<br />

</body>
</html>