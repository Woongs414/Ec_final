<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.main-footer{
	padding: 0px;
	text-align: center;
	background: #e9ecef;
	margin-top:50px;
	border:none;
}
.last {
	list-style: none;
	display: inline-block;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Main Footer -->
	<footer style="margin-left:0px;" class="main-footer">
		<strong>Copyright &copy; 
		<img src="${contextPath }/image/logo_7f78.png"
				 width="55px" height="55px">
		</strong> All rights reserved.
	</footer>
</body>
</html>