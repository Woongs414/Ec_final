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
<style>
input::placeholder{
color:white;
}
</style>
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
    <b>비밀번호 찾기</b>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg" style="font-size:14px;">아이디,사업자번호,이메일을 이용하여 비밀번호를 찾을 수 있습니다.</p>

      <form method="post">
        <div class="input-group mb-3">
          <input type="text" class="form-control"name="seller_id" placeholder="ID">
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
        </div> <div class="input-group mb-3">
          <input type="text" class="form-control" maxlength=20 name="seller_email" id="seller_email" placeholder="id@naver.com">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
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
             <input type="button" id="prove" class="btn btn-primary btn-block" value="인증번호 보내기" style="background-color:#8F8681; border:none; width:200px;">
					
			
          </div> 
          <div class="social-auth-links text-center mb-3">
           <input type="text" id="mail_check_input_box" name="mail_check_input_box" oninput="checkauth()" maxlength="6"  disabled="disabled" class="btn btn-primary btn-block" placeholder="인증번호 입력" style="background-color:#8F8681;  border:none;
           text-align:left;">
					</div>
					<div>
					<span id="mail-check-warn2"></span>
					</div>
      
	
      <div class="social-auth-links text-center mb-3">
        <p></p>
          <input type="button" id="ok2" class="btn btn-primary btn-block" onclick="pwd_search(this.form)" value="확인" style="background-color:#A67F78; border:none;" >
          
        
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
<script>
	idSignal = false;
	 nameSignal = false;
	 emailSignal = false;
	inputcode =""
	//인증번호 이메일 전송
 	$('#prove').click(function ()  {
  	var email = $("#seller_email").val();
  	console.log("완성된 이메일 : " + email);
  	var checkNum = $('#mail_check_input_box');
  	$.ajax({
  		type:"GET",
  		url:'<c:url value ="/seller/mailCheck.do?email="/>' + email,
  		success : function(data){
  			console.log("data : " + data);
  			checkNum.attr('disabled', false);
  			code = data;
  			console.log("code:"+code);
  			alert("인증번호가 전송되었습니다.");
  			
  		},
  		error:function(){
  			alert("에러입니다");
  		}
  	});
   
   })
	</script>
	<script>
	//인증번호 비교
		
		var $resultMsg = $('#mail-check-warn2');
		
	function checkauth(){
		 inputCode = document.getElementById('mail_check_input_box').value;
		console.log("inputCode"+inputCode);
		console.log(code);
		if(inputCode == code){
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$('#prove').attr('disabled',true);
			$('#seller_email').attr('readonly',true);
		}else{
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요');
			$resultMsg.css('color','red');
		}
	}

    </script>

	<script>
   function pwd_search(f) {
    	
    	
    	if(f.seller_id.value.length < 1) {
    	alert("아이디를 입력해주세요");
    	
    	}else if(f.seller_bizReg.value.length < 1){
    			alert("사업자번호를 입력해주세요");
    			
    }else if(f.seller_email.value.length < 1){
    			alert("이메일을 입력해주세요");
    			
    } else if(f.mail_check_input_box.value.length != 6){
    			alert("인증번호 6자리를 입력해주세요");
    			
    } else if(inputCode == code){
    	f.action="${contextPath}/seller/member/find_pwd_result.do"
    	f.submit();
    	}else{
    		alert("인증번호를 확인해주세요.");
    	}
    
  
  
    }
    </script>

</body>
</html>