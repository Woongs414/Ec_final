<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.main-sidebar{
		position: fixed !important;
	}
	.nav-sidebar>.nav-item{
 		margin-bottom: 10px;
 	}
	.user-panel>.info{
 		margin: 0 auto;
 		padding: 5px;
 	}
 	.brand-text{
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
    <a href="${contextPath}/sellerMain" class="brand-link">
      <img src="${contextPath}/image/logo_8681_2.png" alt="" class="brand-image elevation-3" style="opacity: .8; width:180px; height: 50px; justify-content: center;">
      <span class="brand-text font-weight-light"></span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="info">
        <c:if test="${isLogOn == true && sellerMember !=null }">
        	<a href="${contextPath}/checkuserpage.do?code=info" class="d-block">${sellerMember.seller_id} 님 환영합니다.</a>
        </c:if>
        <c:if test="${sellerMember == null }">
        	<a href="${contextPath}/seller/member/loginForm.do" class="d-block">로그인을 해주세요</a>
 		</c:if>
        </div>
      </div>
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item menu-open">
            <a href="${contextPath}/sellerMain" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                메인페이지
              </p>
            </a>
          </li>
         <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-user"></i>
              <p>
                마이페이지
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="${contextPath}/checkuserpage.do?code=info" class="nav-link">
                  <i class="far fa-user nav-icon"></i>
                  <p>마이페이지</p>                
                </a>
              </li>
              
              <li class="nav-item">
                <a href="${contextPath}/checkuserpage.do?code=pwd" class="nav-link">
                  <i class="nav-icon fas fa-copy"></i>
                  <p>비밀번호 변경</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="${contextPath}/menumanage.do" class="nav-link">
                  <i class="far fa-clipboard nav-icon"></i>
                  <p>메뉴 관리</p>
                </a>
              </li>
              </ul>
             </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-calendar-alt"></i>
              <p>
                예약 관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="${contextPath}/seller/bookingSign" class="nav-link">
                  <i class="fas fa-thumbs-up nav-icon"></i>
                  <p>승인/취소</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="${contextPath}/seller/bookingStatus" class="nav-link">
                  <i class="far fa-calendar-check nav-icon"></i>
                  <p>예약 현황</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-comment"></i>
              <p>
                문의/리뷰 관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="${contextPath}/seller/reviewManage" class="nav-link">
                  <i class="far fa-comment-dots nav-icon"></i>
                  <p>리뷰 관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/layout/top-nav-sidebar.html" class="nav-link">
                  <i class="far fa-question-circle nav-icon"></i>
                  <p>문의 관리</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-address-book"></i>
              <p>
                고객 관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="#l" class="nav-link">
                  <i class="far fa-smile-wink nav-icon"></i>
                  <p>화이트 리스트</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/layout/top-nav-sidebar.html" class="nav-link">
                  <i class="fas fa-user-slash nav-icon"></i>
                  <p>블랙 리스트</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/layout/top-nav-sidebar.html" class="nav-link">
                  <i class="fas fa-user-clock nav-icon"></i>
                  <p>블랙 리스트 승인 요청</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-columns"></i>
              <p>
                커뮤니티
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="${contextPath}/seller/notice" class="nav-link">
              <i class="nav-icon fas fa-exclamation"></i>
              <p>
                공지사항
              </p>
            </a>
          </li>
          <c:if test="${isLogOn == true && sellerMember !=null }">
          <li class="nav-item">
            <a href="${contextPath}/seller/member/loginForm.do " class="nav-link">
              <i class="nav-icon fas fa-door-open"></i>
              <p>
                로그아웃
              </p>
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