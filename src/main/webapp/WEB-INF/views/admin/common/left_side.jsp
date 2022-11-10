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
.nav-sidebar>.nav-item {
	margin-bottom: 10px;
}
.user-panel>.info {
	margin: 0 auto;
	padding: 5px;
}
.brand-text {
	font-size: 24px;
	font-weight: bold !important;
	margin-left: 12px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Main Sidebar Container -->
	<aside class="main-sidebar sidebar-dark-primary elevation-4">
		<!-- Brand Logo -->
		<a href="${contextPath}/adminMain" class="brand-link"> 
			<img src="${contextPath}/image/logo_8681_2.png" alt="" class="brand-image elevation-3"
				style="opacity: .8; width: 180px; height: 50px; justify-content: center;">
			<span class="brand-text font-weight-light"></span>
		</a>
		<!-- Sidebar -->
		<div class="sidebar">
			<!-- Sidebar user panel (optional) -->
			<div class="user-panel mt-3 pb-3 mb-3 d-flex">
				<div class="info">
					<c:if test="${isLogOn == true && adminMember !=null }">
						<a href="${contextPath}/checkuserpage.do?code=info" class="d-block">
						${adminMember.admin_name} 님 환영합니다.
						</a>
					</c:if>
					<c:if test="${adminMember == null }">
						<a href="${contextPath}/admin/login" class="d-block">
						로그인을 해주세요
						</a>
					</c:if>
				</div>
			</div>
			<!-- Sidebar Menu -->
			<nav class="mt-2">
				<ul class="nav nav-pills nav-sidebar flex-column"
					data-widget="treeview" role="menu" data-accordion="false">
					<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
					<li class="nav-item menu-open">
						<a href="${contextPath}/adminMain" class="nav-link active"> 
							<i class="nav-icon fas fa-tachometer-alt"></i>
							<p>메인페이지</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="${contextPath}/admin/adminManage" class="nav-link"> 
							<i class="nav-icon fas fa-user"></i>
							<p>
								관리자계정 관리
								<i class="fas fa-angle-left right"></i>
							</p>
						</a>
						<ul class="nav nav-treeview">
							<li class="nav-item">
								<a href="${contextPath}/admin/userManage" class="nav-link"> 
									<i	class="fas fa-thumbs-up nav-icon"></i>
									<p>관리자 등록</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="${contextPath}/admin/adminlist" class="nav-link"> 
									<i class="far fa-calendar-check nav-icon"></i>
									<p>관리자 리스트</p>
								</a>
							</li>
						</ul>
					</li>
					<li class="nav-item">
						<a href="#" class="nav-link"> 
							<i class="nav-icon fas fa-calendar-alt"></i>
							<p>
								고객관리 
								<i class="fas fa-angle-left right"></i>
							</p>
						</a>
						<ul class="nav nav-treeview">
							<li class="nav-item">
								<a href="${contextPath}/admin/userManage" class="nav-link"> 
									<i	class="fas fa-thumbs-up nav-icon"></i>
									<p>사용자관리</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="${contextPath}/admin/sellerManage" class="nav-link"> 
									<i class="far fa-calendar-check nav-icon"></i>
									<p>판매자관리</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="${contextPath}/admin/whiteList" class="nav-link"> 
									<i class="fas fa-thumbs-up nav-icon"></i>
									<p>화이트리스트</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="${contextPath}/admin/blackList" class="nav-link"> 
									<i class="fas fa-thumbs-up nav-icon"></i>
									<p>블랙리스트</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="${contextPath}/admin/blackList_recognize" class="nav-link">
									<i class="fas fa-thumbs-up nav-icon"></i>
									<p>블랙리스트 승인</p>
								</a>
							</li>
						</ul>
					</li>
					<li class="nav-item">
						<a href="${contextPath}/admin/productManage" class="nav-link"> 
							<i class="nav-icon fas fa-comment"></i>
							<p>상품관리</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="${contextPath}/admin/reservManage" class="nav-link"> 
							<i class="nav-icon fas fa-address-book"></i>
							<p>예약관리</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="#" class="nav-link"> 
							<i class="nav-icon fas fa-columns"></i>
							<p>
								게시판 관리 
								<i class="fas fa-angle-left right"></i>
							</p>
						</a>
						<ul class="nav nav-treeview">
							<li class="nav-item">
								<a href="${contextPath}/admin/userBoard" class="nav-link"> 
									<i class="fas fa-thumbs-up nav-icon"></i>
									<p>사용자 게시판</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="${contextPath}/admin/sellerBoard" class="nav-link"> 
									<i class="far fa-calendar-check nav-icon"></i>
									<p>판매자 게시판</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="${contextPath}/admin/reviewManage" class="nav-link"> 
									<i class="fas fa-thumbs-up nav-icon"></i>
									<p>리뷰 관리</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="${contextPath}/admin/noticeManage" class="nav-link"> 
									<i class="fas fa-thumbs-up nav-icon"></i>
									<p>공지사항</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="${contextPath}/admin/eventManage" class="nav-link"> 
									<i class="fas fa-thumbs-up nav-icon"></i>
									<p>이벤트 게시판</p>
								</a>
							</li>
						</ul>
					</li>
					<li class="nav-item">
						<a href="#" class="nav-link"> 
							<i class="nav-icon fas fa-columns"></i>
							<p>
								통계 
								<i class="fas fa-angle-left right"></i>
							</p>
						</a>
						<ul class="nav nav-treeview">
							<li class="nav-item">
								<a href="${contextPath}/admin/userBoard" class="nav-link"> 
									<i class="fas fa-thumbs-up nav-icon"></i>
									<p>사용자 통계</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="${contextPath}/admin/sellerBoard" class="nav-link"> 
									<i class="far fa-calendar-check nav-icon"></i>
									<p>판매자 통계</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="${contextPath}/admin/reviewManage" class="nav-link"> 
									<i class="fas fa-thumbs-up nav-icon"></i>
									<p>게시판 통계</p>
								</a>
							</li>
						</ul>
					</li>
					<c:if test="${isLogOn == true && adminMember !=null }">
						<li class="nav-item">
							<a href="${contextPath}/admin/logout" class="nav-link"> 
								<i class="nav-icon fas fa-door-open"></i>
								<p>로그아웃</p>
							</a>
						</li>
					</c:if>
				</ul>
			</nav>
			<!-- /.sidebar-menu -->
		</div>
		<!-- /.sidebar -->
	</aside>
</body>
</html>