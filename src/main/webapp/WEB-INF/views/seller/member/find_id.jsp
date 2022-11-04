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
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
 
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
  <!-- 메시지 띄우기  -->


</head>
<body class="login-page" style="min-height: 496.781px;">
<div class="login-box" style="width:500px;">
  <div class="login-logo">
    <b>아이디 찾기</b>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg" style="font-size:14px;">성명과 사업자번호를 이용하여 아이디를 찾을 수 있습니다.</p>

      <form action="${contextPath }/seller/member/find_id_result.do" method="post">
        <div class="input-group mb-3">
          <input type="text" class="form-control"name="s_name" placeholder="성명">
          <div class="input-group-append">
            <div class="input-group-text">
              <!-- <span class="fas fa-envelope"></span> -->
              <span class="fa-solid fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="text" class="form-control" maxlength=10 name="seller_bizReg" placeholder="사업자번호(번호만입력)">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
        <!--   <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="remember">
              <label for="remember">
                아이디 저장
              </label>
            </div>
          </div>
          /.col
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block" style="background-color:#A67F78; border:none;" >로그인</button>
          </div>
          /.col -->
        </div>
     

      <div class="social-auth-links text-center mb-3">
        <p></p>
          <button type="submit" class="btn btn-primary btn-block" style="background-color:#A67F78; border:none;" >
          확인</button>
        
      </div>
       </form>
      <!-- /.social-auth-links -->

      <p class="mb-1" style="float:left;">
        <a href="${contextPath }/seller/member/find_id.do" style="color:#424142;">아이디 찾기</a>
      </p>
      <p class="mb-0" style="float:right;">
        <a href="${contextPath }/seller/member/find_pwd.do"  class="text-center" style="color:#424142;">비밀번호 찾기</a>
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