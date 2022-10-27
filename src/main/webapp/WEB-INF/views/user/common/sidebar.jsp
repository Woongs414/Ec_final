<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>마이페이지 | Eat & See</title>
<style>
.sidebar {
	margin-left: 0px;
	width: 200px;
	height: 500px;
}

ul {
	list-style: none;
}

a {
list-style: none;
color: #A67F78;
}
a:hover {
list-style: none;
color: #A67F78;
}
</style>
</head>

<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>

<body>
	<div class="sidebar">
		<h2>마이페이지</h2>
		<ul>
			<li><a href="${contextPath}/mypage/info.do">활동 관리</a></li>
			<li><a href="${contextPath}/mypage/info.do">활동 관리</a></li>
			<li><a href="${contextPath}/mypage/info.do">활동 관리</a></li>
			<li><a href="${contextPath}/mypage/order_list.do">주문 내역</a></li>
			<li><a href="${contextPath}/mypage/wish.do">좋아요</a></li>
			<li><a href="${contextPath}/mypage/recent_view.do">최근 본 상품</a></li>
		</ul>
			
			
  </ul>
</div>

</body>
</html> 