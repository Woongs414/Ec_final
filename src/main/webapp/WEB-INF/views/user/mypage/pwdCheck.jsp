<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<title>비밀번호 변경 창</title>

<style>
	#passwordForm{
		border : 1px solid #A67F78;
		width : 500px;
		height : 218px;
		margin: 200px auto;
	}
	*{ box-sizing: border-box;}
	
	.btn_mybu {
	display: inline;
	width: 100%;
	height: 50px;
    padding: 5px 0 5px;
    cursor: pointer;
    color: #fff;
    font-size: 18px;
    font-weight: 350;
}
#btn_mybu1 {
	display: block;
	margin: auto;
	width: 30%;
	height: 50px;
    padding: 5px 0 5px;
    cursor: pointer;
    color: #fff;
    font-size: 18px;
    font-weight: 350;
   	
}
 input::placeholder {
	color : #fff; 
	}
	#pang {
	margin-left: 20px;
	}
</style>

<script type="text/javascript">

   $(function(){
	var message = ${msg};
	if(!message.equals("") || !message.equalse(null)){
		alert(message);
	}
}); 
	
</script>

</head>
<body>
	<div id="passwordForm">
		<form action="${contextPath }/mypage/myinfo.do" method="post">
			<fieldset>
			<legend id="pang" style="text-align: center;">비밀번호 확인</legend>
			<br><br><br>
			<input type="password" class="btn_mybu" style="background-color:#A67F78; text-align: center; border: none;" name="user_pwd" placeholder="비밀번호를 입력하세요"/><br><br>
			<button type="submit" id="btn_mybu1" style="background-color:#A67F78; text-align: center; border: none;">입력 확인</button><br><br>
			</fieldset>
		</form>	<br><br>	
		<a href="${contextPath }/main.do" style="display:block; background-color:#A67F78; color: #fff; text-align:center;" class="btn_mybu">메인페이지로 이동</a>
	</div>
	<%-- 
	<c:if test ="${result == 1}">  {
            infovo = mypageService.userSelect(user_id);
            mav.addObject("infovo", infovo);
            mav.setViewName(viewName);
        } else {
              //비밀번호가 일치하지 않을 때 (When pwd don't match)
              mav.setViewName("redirect:/mypage/pwdCheckPage.do");
              mav.addObject("msg", "비밀번호가 잘못되었습니다.");
        }>
        </c:if>
        public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = memService.login(member);
		if (memberVO != null) { /* DB에 있는 값과 일치하지않으면 */
			HttpSession session = request.getSession();
			session.setAttribute("member", memberVO);
			session.setAttribute("isLogOn", true);
			String action = (String) session.getAttribute("action");
			session.removeAttribute("action");
			if (action != null) {
				mav.setViewName("redirect:" + action); /* action도메인 비어있음 */
			} else {
				mav.setViewName("redirect:/main.do"); /* 로그인 성공시 */
			}
		} else {
			rAttr.addFlashAttribute("result", "loginFailed"); /* login.jsp의 loginFailed <choose>구문 실행 */
			mav.setViewName("redirect:/user/loginForm.do"); /* login.jsp redirect한다 */
		}
		return mav; // login.do & login.jsp 참고해서 만들기
	}
 --%>
<%-- 	<% boolean pwdResult= (boolean)request.getAttribute("pwdResult"); %> --%>
	<%-- 
	<script>
	<% if(pwdResult){ %>
		window.close();	//팝업 브라우저 닫아라	
		window.opener.alert('비밀번호 변경 성공');
	<%}else{ %>
		alert('비밀번호 변경 실패\n비밀번호를 다시 확인해세요');
		location.replace('/views/user/memberPasswordChangeWindow.jsp');
	<%} %>
	</script> --%>
</body>
</html>