<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="URL" value="${pageContext.request.requestURL}" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
String viewName = (String) request.getAttribute("viewName");
%>
<!DOCTYPE html>
<html>
<head>
<style>
.content-wrapper>.content {
	padding: 0.5em;
}

.pagination {
	float: right;
	padding-right: 30px;
}

.col-md-9 {
	flex: 0 0 100%;
	max-width: 100%;
}

.days {
	float: right;
}

.user-block .description, .user-block .username {
	margin-left: 0;
}
.review_card{
	border-bottom: 1px solid rgba(0,0,0,.125);
	border-top: 1px solid rgba(0,0,0,.125);
}
.deleteLink{
	color: red;
}
</style>
<script type="text/javascript">
	
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6"></div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">메인</a></li>
							<li class="breadcrumb-item active">문의/리뷰관리</li>
							<li class="breadcrumb-item active">리뷰 관리</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-9">
						<div class="card">
							<div class="card-header p-2">
								<ul class="nav nav-pills days">
									<li class="nav-item">
										<a class="nav-link active" href="#activity" data-toggle="tab">오늘</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#activity" data-toggle="tab">전체</a>
									</li>
								</ul>
							</div>
							<!-- /.card-header -->
							<c:forEach var="reAns" items="${reAnsList}" varStatus="reAnsNum">
							<div class="card-body review_card">
								<div class="tab-content">
									<div class="active tab-pane">
										<!-- Post -->
										<div class="post">
											<div class="user-block">
												<span class="username"> 
												<a href="#">${reAns.user_nick}(${reAns.user_id})</a>
												</span> 
												<span class="description">
													${reAns.reg_date}
												</span>
												<div style="CLEAR: both; PADDING-RIGHT: 0px;	PADDING-LEFT: 0px;	
													BACKGROUND: url(${contextPath}/image/icon_star2.gif) 0px 0px;
													FLOAT: left;	PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px;	
													PADDING-TOP: 0px;	HEIGHT: 18px;">
													<p style="WIDTH: ${reAns.rating_percent}%; PADDING-RIGHT:0px;
														PADDING-LEFT:0px; BACKGROUND: url(${contextPath}/image/icon_star.gif) 0px 0px;
														PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px;	HEIGHT: 18px;"></p>
												</div>
											</div>
											<!-- /.user-block -->
											<p>
												${reAns.content}
											</p>
											<c:if test="${reAns.re_ans_content != null}">
											<div>
												
												<div class="card card-body">
													${reAns.re_ans_content}
													<span class="float-right">
							                        <a href="${contextPath}/seller/review/removeAnswer?review_num=${reAns.review_num}" class="link-black text-sm deleteLink">
							                        <i class="fas fa-trash"></i> 삭제
							                        </a>
							                        </span>
												</div>
											</div>
											</c:if>
											<form class="form-horizontal" method="post" action="${contextPath}/seller/review/addAnswer">
												<div class="input-group input-group-sm mb-0">
													<input class="form-control form-control-sm" placeholder="리뷰에 답변을 적어주세요"
													type="text" name="re_ans" >
													<input type="hidden" name="review_num" value="${reAns.review_num}">
													<div class="input-group-append">
														<button type="submit" class="btn btn-danger">작성</button>
													</div>
												</div>
											</form>
										</div>
										<!-- /.post -->
									</div>
									<!-- /.tab-pane -->
								</div>
								<!-- /.tab-content -->
							</div>
							<!-- /.card-body -->
							</c:forEach>
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
						<!-- /.card -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
</body>
</html>