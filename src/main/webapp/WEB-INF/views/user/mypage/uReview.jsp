<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 조회</title>
</head>
<style type="text/css">
.tg {
	border-collapse: collapse;
	border-color: #ccc;
	border-spacing: 0;
	width: 900px;
	align:center;
	valign:middle;
}

.tg td {
	background-color: #fff;
	border-color: #ccc;
	border-style: solid;
	border-width: 1px;
	color: #333;
	font-family: Arial, sans-serif;
	font-size: 14px;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
	height: 25px;
	align:center;
	valign:middle;
}

.tg th {
	background-color: #f0f0f0;
	border-color: #ccc;
	border-style: solid;
	border-width: 1px;
	color: #333;
	font-family: Arial, sans-serif;
	font-size: 20px;
	font-weight: normal;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
	height: 30px;
	align:center;
	valign:middle;
}

.tg .tg-jpx8 {
	font-family: "Lucida Sans Unicode", "Lucida Grande",
		sans-serif !important;
	font-size: 16px;
	text-align: center;
	vertical-align: top;
	width: 10%;
	align:center;
	valign:middle;
}

.tg .tg-i4e2 {
	font-family: "Lucida Sans Unicode", "Lucida Grande",
		sans-serif !important;
		width: 400px;
	font-size: 18px;
	text-align: center;
	vertical-align: top;
	align:center;
	valign:middle;
}

.tg .tg-qvqu {
	font-family: "Lucida Sans Unicode", "Lucida Grande",
		sans-serif !important;
	font-size: 14px;
	text-align: center;
	vertical-align: top;
}
</style>
<body>
<section>
<table class="tg">
<thead>
  <tr>
    <th class="tg-i4e2">NO.</th>
    <th class="tg-i4e2">가게명</th>
    <th class="tg-i4e2">리뷰내용</th>
    <th class="tg-i4e2">등록일</th>
    <th class="tg-i4e2">별점</th>
    <th class="tg-i4e2">좋아요수</th>
  </tr>
</thead>
<tbody>
	<c:forEach var="review" items="${reviewList}" varStatus="revNum">
	<tr>
    <td class="tg-jpx8">${revNum.count }</td>
    <td class="tg-qvqu">가게명</td>
    <td class="tg-qvqu">${review.content }</td>
    <td class="tg-qvqu">${review.reg_date}</td>
    <td class="tg-qvqu">${review.rating }</td>
    <td class="tg-qvqu">${review.liked }</td>
  </tr>
	</c:forEach>
</tbody>
</table>
</section>
</body>
</html>