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
<style>
.content-wrapper>.content{
		padding: 0.5em;
	}
#non-hover {
	pointer-events: none;
	border-bottom: 1px solid;
}
.pagination{
	float: right;
	padding-right: 30px;
}
.col-md-9{
	flex: 0 0 100%;
    max-width: 100%;
}
</style>
<meta charset="UTF-8">
<title>글목록 창</title>
</head>
<body>
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
        <div class="col-sm-6">
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">메인</a></li>
              <li class="breadcrumb-item active">공지 사항</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-9">
            <div class="card card-primary">
              <div class="card-body p-0">
                <!-- THE CALENDAR -->
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
						<tr align="center" class="table-primary" onClick="location.href='${contextPath}/seller/notice/view?list_num=${notice.list_num}'">
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
		<br>
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
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
</body>
</html>