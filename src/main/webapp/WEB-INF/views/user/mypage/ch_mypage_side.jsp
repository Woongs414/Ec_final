<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>마이페이지 | Eat & See </title>
</head>
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>

<style>
.zz {
	text-decoration: none;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	float: left;
	outline: none;
	margin-left: 7px;
	border: 1px solid #E1DCD9;
	height: 630px;
	padding-top: 13px;
	font-size: 16px;
	line-height: 30px;
	width: 210px;
}
.xx {
	outline: none;
	font-weight: 600;
	text-align: center;
	vertical-align: middle;
	/* padding: 1px; */
} 
.na {
	display: inline;
	font-size: 14px;
	margin-bottom: 10px;
	word-spacing: 1px;
}
.na1 {
	margin-right: 5px;
}
#my01 {
	background-color: transparent;
	background-image: url( "${contextPath }/image/icon_m01.png" );
	background-repeat: no-repeat;
	background-size: contain;
	width: 48px;
	height: 39px;
}

#my01:hover {
	background-color: transparent;
	background-image: url( "${contextPath }/image/icon_m001.png" );
	background-repeat: no-repeat;
	background-size: contain;
	width: 48px;
	height: 39px;
}

#my02 {
	background-color: transparent;
	background-image: url( "${contextPath }/image/icon_m02.png" );
	background-repeat: no-repeat;
	background-size: contain;
	width: 48px;
	height: 39px;
}

#my02:hover {
	background-color: transparent;
	background-image: url( "${contextPath }/image/icon_m002.png" );
	background-repeat: no-repeat;
	background-size: contain;
	width: 48px;
	height: 39px;
}

#my03 {
	background-color: transparent;
	background-image: url( "${contextPath }/image/icon_m03.png" );
	background-repeat: no-repeat;
	background-size: contain;
	width: 73px;
	height: 40px;
}

#my03:hover {
	background-color: transparent;
	background-image: url( "${contextPath }/image/icon_m003.png" );
	background-repeat: no-repeat;
	background-size: contain;
	width: 73px;
	height: 40px;
}

#my04 {
	background-color: transparent;
	background-image: url( "${contextPath }/image/icon_m04.png" );
	background-repeat: no-repeat;
	background-size: contain;
	width: 80px;
	height: 40px;
}

#my04:hover {
	background-color: transparent;
	background-image: url( "${contextPath }/image/icon_m004.png" );
	background-repeat: no-repeat;
	background-size: contain;
	width: 80px;
	height: 40px;
}

#my05 {
	background-color: transparent;
	background-image: url( "${contextPath }/image/icon_m05.png" );
	background-repeat: no-repeat;
	background-size: contain;
	width: 73px;
	height: 40px;
}

#my05:hover {
	background-color: transparent;
	background-image: url( "${contextPath }/image/icon_m005.png" );
	background-repeat: no-repeat;
	background-size: contain;
	width: 73px;
	height: 40px;
}
#my06 {
	background-color: transparent;
	background-image: url( "${contextPath }/image/icon_m06.png" );
	background-repeat: no-repeat;
	background-size: contain;
	width: 80px;
	height: 40px;
}

#my06:hover {
	background-color: transparent;
	background-image: url( "${contextPath }/image/icon_m006.png" );
	background-repeat: no-repeat;
	background-size: contain;
	width: 80px;
	height: 40px;
}
</style>
<body>
<div class="zz">
		<ul style="padding-left: 20px;">
			<div class="xx">
			<a href="${contextPath }/mypage/my_pList.do">
			<span class="na1"><!--  ${totalWishCount}--> 1개</span><br>
			<p class=na>먹플리, 볼플리
			<button type="button" id="my01" style="border: none; color: #32435F; text-decoration: none;" alt="먹플리, 볼플리" title="먹플리, 볼플리"></p></button></a></div>
		<br>
			<div class="xx">
			<a href="${contextPath }/mypage/uReview.do">
			<span class="na1"><!--  ${totalWishCount}--> 1개</span><br>
			<p class=na>내가 쓴 리뷰
			<button type="button" id="my02" style="border: none; color: #32435F; text-decoration: none;" alt="내가 쓴 리뷰" title="내가 쓴 리뷰"></p></button></a></div>
		<br>
			<div class="xx">
			<a href="${contextPath }/mypage/uBook.do">
			<span class="na1"><!--  ${totalWishCount}--> 1개</span><br>
			<p class=na>예약조회
			<button type="button" id="my03" style="border: none; color: #32435F; text-decoration: none;" alt="예약조회" title="예약조회"></p></button></a></div>
		<br>
			<div class="xx">
			<a href="${contextPath }/mypage/uLike.do">
			<span class="na1"><!--  ${totalWishCount}--> 1개</span><br>
			<p class=na>찜 목록
			<button type="button" id="my04" style="border: none; color: #32435F; text-decoration: none;" alt="찜 목록" title="찜 목록"></p></button></a></div>
		<br>
			<div class="xx">
			<a href="${contextPath }/mypage/uAsk.do">
			<span class="na1"><!--  ${totalWishCount}--> 1개</span><br>
			<p class=na>1:1 문의
			<button type="button" id="my05" style="border: none; color: #32435F; text-decoration: none;" alt="1:1 문의" title="1:1 문의"></p></button></a></div>
		<br>
			<div class="xx">
			<a href="${contextPath }/mypage/pwdCheckPage.do">
			<span class="na1"><!--  ${totalWishCount}--> 1개</span><br>
			<p class=na>내 정보
			<button type="button" id="my06" style="border: none; color: #32435F; text-decoration: none;" alt="내 정보" title="내 정보"></p></button></a></div>
		<br>
		</ul>
	</div>

</body>
</html>