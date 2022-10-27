<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
	#pwdForm{
		width: 250px;
		height: 200px;
		border: 1px solid black;
		margin: 50px auto;
	}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$(".cencle").on("click", function() {
		location.href="/";
	})

$("#submit").on("click", function() {
	if($("#userPass").val() == "") {
		alert("비밀번호를 입력해주세요.");
		$("#userPass").focus();
		return false;
	}
})
});
</script>
</head>
<body>
	<div id="pwdForm">
		<form action="/mypage/userPwdChange.do" method="post">
			<input type="password" name="user_pwd" id="userPass" class="b-block w-100" placeholder="현재 패스워드를 입력하세요"><br><br>
			<input type="password" name="user_pwd" class="b-block w-100"  placeholder="변경할 패스워드를 입력하세요"><br><br>
			<input type="password" name="new_pwd_re" class="b-block w-100"  placeholder="변경할 패스워드를 재입력하세요"><br><br>
			<input type="submit"  class="btn btn-primary b-block w-100" value="변경하기">
		</form>
	</div>
</body>
</html>