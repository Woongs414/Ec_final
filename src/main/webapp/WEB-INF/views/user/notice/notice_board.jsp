<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="URL" value="${pageContext.request.requestURL}" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
String viewName = (String)request.getAttribute("viewName");
%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
#board {
	margin: 5% 20% 10% 20%;
}
#non-hover {
	pointer-events: none;
	border-bottom: 1px solid;
}

.no-uline {
	text-decoration: none;
}

.sel-page {
	text-decoration: none;
	color: red;
}

.cls1 {
	text-decoration: none;
	
}

.cls2 {
	text-align: center;
	font-size: 30px;
}

#writeBoard{
	float: right;
}

#img-eatList{
	width: 100%;
	vertical-align: center;
}
#img-seeList{
	width: 100%;
	vertical-align: center;
}
.btn-group{
	width: 100%;
	height: 70px;
}
#title_img{
	margin: 0 18% 5% 18%;
}
</style>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>글목록 창</title>
</head>
<body>
	<section id="board">
	<div id="title_img">
	<img src="${contextPath}/image/notice.png">
	</div>
		<table align="center" width="80%" class="table table-hover" >
			<thead height="10" align="center" id="non-hover">
				<td>글번호</td>
				<td>작성자</td>
				<td>제목</td>
				<td>작성일</td>
				<td>조회수</td>
			</thead>
			<c:choose>
				<c:when test="${empty noticeList}">
					<tr height="10" class="table-primary">
						<td colspan="6">
							<p align="center">
								<b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>
							</p>
						</td>
					</tr>
				</c:when>
				<c:when test="${!empty noticeList}">
					<c:forEach var="notice" items="${noticeList}" varStatus="noticeNum">				
						<tr align="center" class="table-primary" onClick="location.href='${contextPath}/user/notice/view?list_num=${notice.list_num}'">
								<c:choose>
								<c:when test="${paging.nowPage == 1 }">
									<td width="10%">${paging.boardCount-noticeNum.index}</td>
								</c:when>
								<c:otherwise>
									<td width="10%">${paging.boardCount-((paging.nowPage-1)*10)-noticeNum.index}</td>
								</c:otherwise>
								</c:choose>
							<td width="10%">운영자</td>	
							<td align="center" width="35%">${notice.no_title}</td>
							<td width="15%"><fmt:formatDate value="${notice.reg_date}" pattern="yyyy-MM-dd" /></td>
							<td width="10%">${notice.hits}</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
		<nav class="paging">
  			<ul class="pagination pg-darkgrey">
  			<c:if test="${paging.prev == 'false'}">
    			<li class="page-item">
      				<a class="page-link" aria-label="Previous" href="#">
        				<span aria-hidden="true">&laquo;</span>
        				<span class="sr-only">Previous</span>
      				</a>
    			</li>
    		</c:if>
    		<c:if test="${paging.prev == 'true'}">
    			<li class="page-item">
      				<a class="page-link" aria-label="Previous" href="${contextPath}<%=viewName%>?page=${paging.startPage -1}">
        				<span aria-hidden="true">&laquo;</span>
        				<span class="sr-only">Previous</span>
      				</a>
    			</li>
    		</c:if>
    		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
    			<li <c:out value="${paging.nowPage == i ? 'class= page-item active' : 'class=page-item'}"/>>
    			<a class="page-link" href="${contextPath}<%=viewName%>?page=${i}">${i}</a>
    			</li>
    		</c:forEach>
    		<c:if test="${paging.next == 'false'}">
    			<li class="page-item">
      				<a class="page-link" aria-label="Next"  href="">
        				<span aria-hidden="true">&raquo;</span>
        				<span class="sr-only">Next</span>
      				</a>
    			</li>
    		</c:if>
    		<c:if test="${paging.next == 'true'}">
    			<li class="page-item">
      				<a class="page-link" aria-label="Next"  href="${contextPath}<%=viewName%>?page=${paging.endPage + 1}">
        				<span aria-hidden="true">&raquo;</span>
        				<span class="sr-only">Next</span>
      				</a>
    			</li>
    		</c:if>
  			</ul>
		</nav>
	</section>
</body>
</html>