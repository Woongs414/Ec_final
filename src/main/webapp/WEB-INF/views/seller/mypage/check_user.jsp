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
<link rel="stylesheet" href="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.css" />
<script src="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">

</script>
<!-- 메시지 띄우기  -->
<c:choose>
	<c:when test="${result=='pwdfail' }">
		<script>
			window.onload=function() {
				alert("비밀번호를 다시 입력해주세요.");
			}
		</script>
	</c:when>

</c:choose>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="hold-transition lockscreen">
<!-- Automatic element centering -->
<div class="lockscreen-wrapper">
  <div class="lockscreen-logo">
    <a href="${contextPath }/sellerMain"><img src="${contextPath }/image/logo_8681_2.png" alt="Main" width="200px"></a>
  </div>
  <br>
  <!-- User name -->
  <!-- <div class="lockscreen-name">가게명 있으면 좋고..</div> -->
</div>
  <!-- START LOCK SCREEN ITEM -->
  <div class="lockscreen-item">
    <!-- lockscreen image -->
    <div class="lockscreen-image">
      <img src="${contextPath }/image/lock.png" alt="Lock Image" width="100px" height="100px">
    </div>
    <!-- /.lockscreen-image -->

    <!-- lockscreen credentials (contains the form) -->
    <form class="lockscreen-credentials" action="${contextPath }/checkuser.do" method="POST">
      <input type="hidden" name="code" value="${code}"/>
      <div class="input-group">
        <input type="password" class="form-control" placeholder="password" name="seller_pw">

        <div class="input-group-append">
          <button type="submit" class="btn">
            <i class="fas fa-arrow-right text-muted"></i>
          </button>
        </div>
      </div>
    </form>
    <!-- /.lockscreen credentials -->

  </div>
  <!-- /.lockscreen-item -->

<!-- /.center -->

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>
</html>