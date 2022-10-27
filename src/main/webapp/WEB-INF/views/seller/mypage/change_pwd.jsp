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
/* 에러메세지 */

.error_next_box {
    margin-bottom: 10px; 
    font-size: 12px;
    color: red;    
    display: none;
}
</style>
<script type="text/javascript">
$(function () {
    //Enable check and uncheck all functionality
    $('.checkbox-toggle').click(function () {
      var clicks = $(this).data('clicks')
      if (clicks) {
        //Uncheck all checkboxes
        $('.mailbox-messages input[type=\'checkbox\']').prop('checked', false)
        $('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
      } else {
        //Check all checkboxes
        $('.mailbox-messages input[type=\'checkbox\']').prop('checked', true)
        $('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
      }
      $(this).data('clicks', !clicks)
    })

    //Handle starring for font awesome
    $('.mailbox-star').click(function (e) {
      e.preventDefault()
      //detect type
      var $this = $(this).find('a > i')
      var fa    = $this.hasClass('fa')

      //Switch states
      if (fa) {
        $this.toggleClass('fa-star')
        $this.toggleClass('fa-star-o')
      }
    })
  })
  
  
  //체크박스 선택한 개수 파악
   function count_checkbox(){
   var flag = false;
   var values = document.getElementsByName("menucheck");
   var form = document.getElementById("deleteform");
   var count = 0;
   for(var i = 0 ; i <values.length;i++) {
      if(values[i].checked) {
         count++;
      }
   }
   if(count<1){
      alert("1개 이상 선택해야 합니다.");
   }else { 
        form.action = "${contextPath}/deletemenu.do";
        form.mothod = "GET";
        form.submit();
   }
}   



</script>
<!-- 메시지 띄우기  -->
<%-- <c:choose>
   <c:when test="${result=='pwdsuccess' }">
      <script>
         window.onload=function() {
            alert("본인 인증이 완료되었습니다.");
         }
      </script>
   </c:when>
   <c:when test="${result=='pwdfail' }">
      <script>
         window.onload=function() {
            alert("비밀번호를 다시 입력해주세요.");
         }
      </script>
   </c:when>

</c:choose> --%>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="login-page" style="min-height: 386.781px;">
<div class="login-box">
  <div class="login-logo">
    <a href="../../index2.html"><b>비밀번호 변경</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg small">안전한 비밀번호로 내정보를 보호하세요</p>

      <form onsubmit="return false;">
      <div class="mb-3">
        <div class="input-group">
          <input type="password" class="form-control" placeholder="Password" id="seller_pw" name="seller_pw">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="error_next_box"></div>
        </div>
        
        <div class="mb-3">
        <div class="input-group">
          <input type="password" class="form-control" placeholder="Confirm Password" id="confirm_pw">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="error_next_box"></div>
        </div>
        <div class="row">
          <div class="col-12">
            <button type="submit" class="btn btn-primary btn-block" onclick="changepwd(this.form);">변경</button>
          </div>
          <!-- /.col -->
        </div>
      </form>

      <p class="mt-3 mb-1">
        
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
<script src="${contextPath }/js/seller_changepw.js"></script>

</body>
</html>