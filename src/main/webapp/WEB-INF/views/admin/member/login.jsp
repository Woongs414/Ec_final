<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, java.io.*"
    isELIgnored="false"
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>

<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title></title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
  <!-- 메시지 띄우기  -->
 <c:choose>
   <c:when test="${result=='pwdchagesuccess' }">
      <script>
         window.onload=function() {
            alert("비밀번호 변경이 완료되었습니다. 재로그인 해주세요.");
         }
      </script>
   </c:when>
</c:choose>
 <c:choose>
   <c:when test="${result=='loginFailed' }">
      <script>
         window.onload=function() {
            alert("아이디와 비밀번호를 다시 확인해주세요.");
         }
      </script>
   </c:when>
</c:choose>

</head>
<body class="login-page" style="min-height: 496.781px;">
<div class="login-box" style="width:500px;">
  <div class="login-logo">
    <b>관리자 로그인</b>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Sign in to start your session</p>

      <form action="${contextPath }/admin/login" method="post">
        <div class="input-group mb-3">
          <input type="text" class="form-control"name="admin_id" placeholder="ID">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" name="admin_pw" placeholder="Password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row"  style="float: right;padding-right: 10px;padding-bottom: 10px">
          <div>
            <div class="icheck-primary">
              <input type="checkbox" id="remember">
              <label for="remember">
                아이디 저장
              </label>
            </div>
          </div>
          <!-- /.col -->
        </div>
          <div class="social-auth-links text-center mb-3">
            <button type="submit" class="btn btn-primary btn-block" style="background-color:#A67F78; border:none;" >로그인</button>
          </div>
          <!-- /.col -->
       </form>

<%--       <div class="social-auth-links text-center mb-3">
        <p></p>

        <a href="${contextPath }/admin/login" class="btn btn-block btn-primary" style="background-color:#8F8681; border:none;">
          회원가입
        </a> 
      </div> --%>
     
      <!-- /.social-auth-links -->

      <p class="mb-1" style="float:left;">
        <a href="forgot-password.html" style="color:#424142;">아이디 찾기</a>
      </p>
      <p class="mb-0" style="float:right;">
        <a href="register.html" class="text-center" style="color:#424142;">비밀번호 찾기</a>
      </p>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>


</body>
</html>