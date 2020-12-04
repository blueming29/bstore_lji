<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width = device - width, initial - scale = 1.0" />
<title>로그인화면</title>
<link rel="stylesheet" href="../css/login_style.css" />
</head>
<script>
	function checkValue(){
		inputForm = eval("document.loginInfo");
		if(!inputForm.id.value){
			alert("아이디를 입력하세요");
			inputForm.id.focus();
			return false;
		} else if (!inputForm.pw.value){
			alert("비밀번호를 입력하세요");
			inputForm.pw.focus();
			return false;
		} else {
			return true;
		}
	}

</script>
<body>
	<div id="wrap">
		<img src="../img/welcome.jpg" />
		<form action="loginProc.jsp" method="post" name="loginInfo" onsubmit="return checkValue()">
			<br /><br />
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" maxlength="50" /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw" maxlength="50" /></td>
				</tr>
			</table>
			<c:if test="${param.msg == -1 }"><span id="warning">아이디가 존재하지 않습니다.</span></c:if>
			<c:if test="${param.msg == 0 }"><span id="warning">비밀번호가 일치하지 않습니다.</span></c:if>
			<br />
			<input id="lg_btn" type="submit" value="로그인" />
		</form>
		<br />
		<a href="#">아이디 찾기</a>
		<span id="txt_color">|</span>
		<a href="#">비밀번호 찾기</a>
		<span id="txt_color">|</span>
		<a href="../join/join.jsp">회원가입</a> 
	
	</div>


</body>
</html>