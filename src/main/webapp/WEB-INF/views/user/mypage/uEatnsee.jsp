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
}

.tg .tg-jpx8 {
	font-family: "Lucida Sans Unicode", "Lucida Grande",
		sans-serif !important;
	font-size: 16px;
	text-align: center;
	vertical-align: top;
	width: 10%;
}

.tg .tg-i4e2 {
	font-family: "Lucida Sans Unicode", "Lucida Grande",
		sans-serif !important;
	font-size: 18px;
	text-align: center;
	vertical-align: top;
	width: 400px;
}

.tg .tg-qvqu {
	font-family: "Lucida Sans Unicode", "Lucida Grande",
		sans-serif !important;
	font-size: 14px;
	text-align: center;
	vertical-align: top
}
</style>
<body>
<section>
<table class="tg">
<thead>
 <tr>
    <th class="tg-i4e2">NO.</th>
    <th class="tg-i4e2">분류</th>
    <th class="tg-i4e2">가게명</th>
    <th class="tg-i4e2">내용</th>
    <th class="tg-i4e2">조회수</th>
    <th class="tg-i4e2">좋아요</th>
    <th class="tg-i4e2">싫어요</th>
    <th class="tg-i4e2">등록일</th>
  </tr>
</thead>
<tbody>
	<c:forEach var="board" items="${boardList}" varStatus="boardNum">
	<tr>
    <td class="tg-jpx8">${boardNum.count }</td>
    <td class="tg-jpx8">분류</td>
    <td class="tg-qvqu">가게명</td>
    <td class="tg-qvqu">${board.u_content }</td>
    <td class="tg-qvqu">${board.hits }</td>
    <td class="tg-qvqu">${board.liked }</td>
    <td class="tg-qvqu">${board.bad }</td>
    <td class="tg-qvqu">${board.reg_date}</td>
  </tr>
	</c:forEach>
</tbody>
</table>
</section>
</body>
</html>