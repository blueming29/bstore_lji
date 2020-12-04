<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width = device - width, initial - scale = 1.0" />
<title>join</title>
<link rel="stylesheet" href="../css/join.css" />
</head>
<script>
	function goLoginForm(){
		location.href = "../login/loginForm.jsp";
	}
</script>
<body>
	<h3>join</h3>
	<form id="join" action="joinProc.jsp">
<%-- 		<p style="color: red;">
			<%= request.getAttribute("error") == null? "안보임" : request.getAttribute("error") %>
		</p> --%>
		
		<p style="color: red;">
			<%
				if(request.getAttribute("errors") != null){
					List<String> errors = (List)request.getAttribute("errors");
					for(int i = 0 ; i < errors.size() ; i++){
			%>
						<%= errors.get(i) %> <br />
			<%
					}
				}
			
			%>
		</p>
		<label>아이디</label>
		<input class="left" type="text" name="id" />
		<input type="button" value="중복확인" /> <br />
	
		<label>비밀번호</label>
		<input class="left" type="text" name="pwd" /> <br />
	
		<label>비밀번호 확인</label>
		<input class="left" type="text" name="pwd2" /> <br />
	
		<label>이름</label>
		<input class="left" type="text" name="name" /> <br />
	
		<label>성별</label>
		<select class="left" style="height: 25px;" name="gender" >
			<option value="남성">남성</option>
			<option value="여성">여성</option>
		</select> <br />
	
		<label>생년월일</label>
		<input class="left" type="text" name="year" size="5" />년 
		<input type="text" name="month" size="5" />월 
		<input type="text" name="day" size="5" />일 
		<input type="radio" name="islunar" value="Solar" checked />양력 
		<input type="radio" name="islunar" value="islunar" />음력 <br /> 
			
		<label>휴대폰</label>
		<input class="left" type="tel" name="cphone" />ex)010-4100-0314 <br />
		
		<label>이메일</label>
		<input class="left" type="text" name="email" /> <br />
		
		<label>취미</label>
		<input class="left" type="checkbox" name="habit" value="music" />음악듣기
		<input type="checkbox" name="habit" value="movie" />영화보기
		<input type="checkbox" name="habit" value="trip" />여행 <br />
		
		<input type="submit" value="확인" />
		<input type="button" value="취소" onclick="goLoginForm()" />
	
	</form>
</body>
</html>