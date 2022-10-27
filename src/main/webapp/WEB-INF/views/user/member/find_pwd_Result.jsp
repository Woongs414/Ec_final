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

        <meta charset="UTF-8">                                                                       
        <title>비밀번호찾기결과창</title>
        <link rel="stylesheet" href="${contextPath }/css/find_id.css">

    </head>
    <body>

    
    	<div id="body-wrapper">
        <div id="top">
        <ul>
        <li><a href="${contextPath }/user/find_id.do">아이디 찾기</a></li>
        <li><a href="${contextPath }/user/find_pwd.do" >비밀번호 찾기</a></li>
        </ul> 
        </div>
        
        <div class="inquiry">
        <div class="content_header">
        <h2>
        <img src="https://static.nid.naver.com/images/web/user/h_find_pw2.gif" width="70" height="22" alt="비밀번호 찾기">
        </h2>
        
        <p style="font-size:12px;">회원정보에 저장된 아이디, 성명, 이메일인증을 이용하여 비밀번호를 찾을 수 있습니다.</p>
          	 		 <c:if test="${check == 1}">
						<h1>일치하는 정보가 존재하지 않습니다.</h1>
					</c:if>
					<c:if test="${check == 0 && inputCode == code}">
						<h1>고객님의 비밀번호는 [${user_pwd }] 입니다.</h1>
					</c:if>
        </div>
        <div style="text-align:center" class="ok">
        <input type="button" id="login2" name="login2" onclick="location.href='${contextPath}/user/loginForm.do'" value="로그인">
        </div>
        </div>
        
        
		</div>
      
	
	
    </body>
</html>