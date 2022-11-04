<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, java.io.*"
	isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>


<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#mail_check_input_box_false {
	background-color: #ebebe4;
}

#mail_check_input_box_true {
	background-color: white;
}
</style>

<meta charset="UTF-8">
<title>아이디찾기</title>
<link rel="stylesheet" href="${contextPath }/css/find_pwd.css">

</head>
<body>
	<form method="post">
		<div id="body-wrapper">
			<div id="top">
				<ul>
					<li><a href="${contextPath }/user/find_id.do">아이디 찾기</a></li>
					<li><a href="${contextPath }/user/find_pwd.do">비밀번호 찾기</a></li>
				</ul>
			</div>

			<div class="inquiry">
				<div class="content_header">
					<h2>
						<img
							src="https://static.nid.naver.com/images/web/user/h_find_pw2.gif"
							width="70" height="22" alt="비밀번호 찾기">
					</h2>

					<p style="font-size: 12px;">회원정보에 저장된 아이디, 성명, 이메일인증을 이용하여
						비밀번호를 찾을 수 있습니다.
					<table style="margin: auto">
						<tr>
							<td>아이디</td>
							<td><input type="text" id="user_id" name="user_id"></td>
						</tr>
						<tr>
							<td>성명</td>
							<td><input type="text" id="user_name" name="user_name"></td>
						</tr>
						<tr>
							<td>본인확인 이메일</td>
							<td><input type="text" id="user_email" name="user_email"
								placeholder="abc@naver.com"></td>
						</tr>
						<tr>
							<td>
							<td><input type="button" class="prove"  value="인증번호 보내기">
						</tr>
						<tr>
							<td>인증번호 입력</td>
							<td><input type="text" id="mail_check_input_box" name="mail_check_input_box" oninput="checkauth()" maxlength="6" disabled="disabled" class="prove_ck" ></td>
							 
						</tr>
					</table>
				 	<div>
					<span id="mail-check-warn2"></span>
					</div>
					 
				</div>
				<div style="text-align: center" class="ok">
					<br><input type="button" id="ok2" name="ok"
						onclick="pwd_search(this.form)" value="확인">
				</div>


			</div>

		</div>
	</form>

	<script>
	idSignal = false;
	 nameSignal = false;
	 emailSignal = false;
	inputcode =""
	//인증번호 이메일 전송
 	$('.prove').click(function ()  {
  	var email = $("#user_email").val();
  	console.log("완성된 이메일 : " + email);
  	var checkNum = $('#mail_check_input_box');
  	$.ajax({
  		type:"GET",
  		url:'<c:url value ="/user/mailCheck.do?email="/>' + email,
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
			$('.prove').attr('disabled',true);
			$('#user_email').attr('readonly',true);
			$('.prove_ck').attr('readonly',true);
		}else{
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요');
			$resultMsg.css('color','red');
		}
	}

    </script>

	<script>
   function pwd_search(f) {
    	
    	
    	if(f.user_id.value.length < 1) {
    	alert("아이디를 입력해주세요");
    	
    	}else if(f.user_name.value.length < 1){
    			alert("이름을 입력해주세요");
    			
    }else if(f.user_email.value.length < 1){
    			alert("이메일을 입력해주세요");
    			
    } else if(f.mail_check_input_box.value.length != 6){
    			alert("인증번호 6자리를 입력해주세요");
    			
    } else if(inputCode == code){
    	f.action="${contextPath}/user/find_pwd_Result.do"
    	f.submit();
    	}else{
    		alert("인증번호를 확인해주세요.");
    	}
    
  
  
    }
    </script>
</body>
</html>