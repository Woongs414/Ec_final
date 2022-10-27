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
	.today_text{
		float: right;
	}
	.today-dropbox{
		min-width: 200px;
		max-width: 200px;
	}
	.logout_text{
		padding-top: 7px;
		font-weight: bold;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="${contextPath}/sellerMain" class="nav-link">Home</a>
      </li>
    </ul>
    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
    <!-- 로그인시 -->
    	<c:if test="${isLogOn == true && sellerMember !=null }">
		<li class="logout_text"><a href="${contextPath}/seller/member/loginForm.do ">로그아웃</a></li>
		</c:if>
      <!-- 1대1문의 드롭박스 -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-comments"></i>
          <span class="badge badge-danger navbar-badge">3<!-- 답변을 하지 않은 1대1문의 갯수표현 --></span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
        <span class="dropdown-item dropdown-header">1대1 문의</span>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- 각 1대1문의 Start -->
            <div class="media">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Brad Diesel<!-- 1대1문의 사용자닉네임 -->
                  <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">Call me whenever you can...<!-- 1대1문의 내용중 일부분 노출 --></p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago<!-- 현재시간 - 작성시간 --></p>
              </div>
            </div>
            <!-- 각 1대1문의 End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">전체 1대1 문의</a>
        </div>
        <!-- 1대1 문의 end -->
      </li>
      <!-- 금일현황 Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-bell"></i>
          <span class="badge badge-warning navbar-badge">${todayBook+todayReview+todayWish}</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right today-dropbox">
        <span class="dropdown-item dropdown-header">금일 현황</span>
          <div class="dropdown-divider"></div>
	        <a href="#" class="dropdown-item">
		        <i class="fas fa-users mr-2"></i> 예약:<!-- 금일 예약신청수 --><span class="today_text">${todayBook}&nbsp;건</span>
	        </a>
	        <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-regular fa-pen mr-2"></i> 리뷰:<!-- 금일 작성된 리뷰수 --><span class="today_text">${todayReview}&nbsp;건</span>
          </a>          
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-heart mr-2"></i> 찜:<!-- 금일 찜한수 --><span class="today_text">${todayWish}&nbsp;건</span>
          </a>
        </div>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->
</body>
</html>