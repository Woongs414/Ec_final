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
<link
	rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">


<style>
#container{
height:1000px;
}
#container2 {
	height: 1500px;
	width: 100%;
}

.mobile_ok {
	color: #008000;
	display: none;
}

.mobile_already {
	color: #6A82FB;
	display: none;
}

.email_ok {
	color: #008000;
	display: none;
}

.email_already {
	color: #6A82FB;
	display: none;
}

.id_ok {
	color: #008000;
	display: none;
}

.id_already {
	color: #6A82FB;
	display: none;
}

.nick_ok {
	color: #008000;
	display: none;
}

.nick_already {
	color: #6A82FB;
	display: none;
}
</style>

<meta charset="UTF-8">
<title>개인 회원가입</title>
<link rel="stylesheet" href="${contextPath }/css/memberForm_udetail.css">

</head>
<body>

	<div id="container2">
		<!-- header -->
		<div id="header2">
			<a href="${contextPath }/main.do"><img
				src="${contextPath }/image/logo.png" id="logo"></a>
		</div>


		<!-- wrapper -->
		<div id="wrapper">

			<!-- content-->
			<div id="content2">

				<form method="post" id="form">

					<!-- ID -->
					<div>

						<h3 class="join_title">
							<label for="id">아이디</label>
						</h3>
						<span class="box int_id"> <input type="text" id="id"
							name="user_id" oninput="idCheck()" class="int" maxlength="20">

						</span> <span class="id_ok">중복되지않는 아이디입니다.</span> <span
							class="id_already">이미 사용중인 아이디입니다.</span> <span
							class="error_next_box"></span>
					</div>
					<!-- Nickname -->
					<div>

						<h3 class="join_title">
							<label for="nick">닉네임</label>
						</h3>
						<span class="box int_id"> <input type="text" id="nick"
							name="user_nick" oninput="nickCheck()" class="int" maxlength="20">

						</span> <span class="nick_ok">중복되지않는 닉네임입니다.</span> <span
							class="nick_already">이미 사용중인 닉네임입니다.</span> <span
							class="error_next_box"></span>
					</div>




					<!-- PW1 -->
					<div>
						<h3 class="join_title">
							<label for="pswd1">비밀번호</label>
						</h3>
						<span class="box int_pass"> <input type="password"
							id="pswd1" name="user_pwd" class="int" maxlength="20"> <span
							id="alertTxt">사용불가</span> <img
							src="${contextPath }/image/m_icon_pass.png" id="pswd1_img1"
							class="pswdImg">
						</span> <span class="error_next_box"></span>
					</div>

					<!-- PW2 -->
					<div>
						<h3 class="join_title">
							<label for="pswd2">비밀번호 재확인</label>
						</h3>
						<span class="box int_pass_check"> <input type="password"
							id="pswd2" name="pwd_ck" class="int" maxlength="20"> <img
							src="${contextPath }/image/m_icon_check_disable.png"
							id="pswd2_img1" class="pswdImg">
						</span> <span class="error_next_box"></span>
					</div>

					<!-- NAME -->
					<div>
						<h3 class="join_title">
							<label for="name">이름</label>
						</h3>
						<span class="box int_name"> <input type="text" id="name"
							name="user_name" class="int" maxlength="20">
						</span> <span class="error_next_box"></span>
					</div>

					<!-- BIRTH -->
					<div>
						<h3 class="join_title">
							<label for="yy">생년월일</label>
						</h3>

						<div id="bir_wrap">
							<!-- BIRTH_YY -->
							<div id="bir_yy">
								<span class="box"> <input type="text" id="yy"
									name="birth_yy" class="int" maxlength="4" placeholder="년(4자)">
								</span>
							</div>

							<!-- BIRTH_MM -->
							<div id="bir_mm">
								<span class="box"> <select id="mm" name="birth_mm"
									class="sel" style="width: 100%;">
										<option>월</option>
										<!-- 자동으로 value에 텍스트 월 들어감 -->
										<option value="01">1</option>
										<option value="02">2</option>
										<option value="03">3</option>
										<option value="04">4</option>
										<option value="05">5</option>
										<option value="06">6</option>
										<option value="07">7</option>
										<option value="08">8</option>
										<option value="09">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
								</select>
								</span>
							</div>

							<!-- BIRTH_DD -->
							<div id="bir_dd">
								<span class="box"> <input type="text" id="dd"
									name="birth_dd" class="int" maxlength="2" placeholder="일">
								</span>
							</div>

						</div>
						<span class="error_next_box" id="error"></span>
					</div>

					<!-- GENDER -->
					<div>
						<h3 class="join_title">
							<label for="gender">성별</label>
						</h3>
						<span class="box gender_code"> <select id="gender"
							name="gender" class="sel" style="width: 100%;">
								<option>성별</option>
								<option value="M">남자</option>
								<option value="F">여자</option>
						</select>
						</span> <span class="error_next_box">필수 정보입니다.</span>
					</div>

					<!-- EMAIL -->
					<div>
						<h3 class="join_title">
							<label for="email">본인확인 이메일</label>
						</h3>
						<span class="box int_email"> <input type="text"
							id="email" name="user_email" class="int"
							oninput="emailCheck()" maxlength="100"
							placeholder="예)id@google.com">
						</span> <span class="email_ok">중복되지않는 이메일입니다.</span> <span
							class="email_already">이미 사용중인 이메일입니다.</span> <span
							class="error_next_box"></span>

					</div>

					<!-- MOBILE -->
					<div>
						<h3 class="join_title">
							<label for="mobile">휴대전화</label>
						</h3>
						<span class="box int_mobile"> <input type="tel" id="mobile"
							name="tel" class="int" oninput="mobileCheck()" maxlength="11"
							placeholder="하이폰(-)제외 번호만입력">
						</span> <span class="mobile_ok">중복되지않는 전화번호입니다.</span> <span
							class="mobile_already">이미 사용중인 전화번호입니다.</span> <span
							class="error_next_box"></span>
					</div>


					<!-- JOIN BTN-->
					<div class="btn_area">
						<input type="button" id="btnJoin" onclick="checkNull(this.form)"
				
							value="가입하기" />
					</div>


				</form>
			</div>
			<!-- content-->

		</div>
		<!-- wrapper -->
		<script src="${contextPath }/js/memberForm_udetail.js"></script>
	</div>
	<script>
 /*     idSignal = false;
	 nickSignal = false;
	 pswd1Signal = false;
	 pswd2Signal = false;
	 nameSignal = false;
	 birth_yySignal = false;
	 birth_mmSignal = false;
	 birth_ddSignal = false;
	 genderSignal = false;
	 emailSignal = false;
	 mobileSignal = false; */
	
	</script>
	<script>
		function idCheck() {
			var user_id = $('#id').val();
			//id=id인값을 user_id에 넣고 아래 url에  data를 보내준다.
			$.ajax({ //비동기 방식 (페이지가 넘어가지 않고 그 페이지에서 바로 자료가 변경됨)
				type : "post",
				url : "${contextPath}/user/idCheck.do",
				dataType : "JSON",
				data : 'id=' + user_id,
				success : function(responseObject) {
					if (responseObject.result == 'YES') {
						$('.id_ok').css("display", "inline-block");
						$('.id_already').css("display", "none");
						idSignal2 = true;
					} else {
						$('.id_already').css("display", "inline-block");
						$('.id_ok').css("display", "none");
						idSignal2 = false;
					}

				},
				error : function() {
					alert("에러입니다.");
				}
			});
		};
	</script>
	<script>
		function nickCheck() {
			var user_nick = $('#nick').val();
			//id=id인값을 user_id에 넣고 아래 url에  data를 보내준다.
			$.ajax({ //비동기 방식 (페이지가 넘어가지 않고 그 페이지에서 바로 자료가 변경됨)
				type : "post",
				url : "${contextPath}/user/nickCheck.do",
				dataType : "JSON",
				data : 'nick=' + user_nick,
				success : function(responseObject) {
					if (responseObject.result == 'YES') {
						$('.nick_ok').css("display", "inline-block");
						$('.nick_already').css("display", "none");
						nickSignal2 = true;
					} else {
						$('.nick_already').css("display", "inline-block");
						$('.nick_ok').css("display", "none");
						nickSignal2 = false;
					}

				},
				error : function() {
					alert("에러입니다.");
				}
			});
		};
	</script>
	<script>
		function emailCheck() {
			var user_email = $('#email').val();
			//id=id인값을 user_id에 넣고 아래 url에  data를 보내준다.
			$.ajax({ //비동기 방식 (페이지가 넘어가지 않고 그 페이지에서 바로 자료가 변경됨)
				type : "post",
				url : "${contextPath}/user/emailCheck.do",
				dataType : "JSON",
				data : 'user_email=' + user_email,
				success : function(responseObject) {
					if (responseObject.result == 'YES') {
						$('.email_ok').css("display", "inline-block");
						$('.email_already').css("display", "none");
						emailSignal2 = true;
					} else {
						$('.email_already').css("display", "inline-block");
						$('.email_ok').css("display", "none");
						emailSignal2 = false;
					}

				},
				error : function() {
					alert("에러입니다.");
				}
			});
		};
	</script>
	<script>
		function mobileCheck() {
			var mobile = $('#mobile').val();
			//id=id인값을 user_id에 넣고 아래 url에  data를 보내준다.
			$.ajax({ //비동기 방식 (페이지가 넘어가지 않고 그 페이지에서 바로 자료가 변경됨)
				type : "post",
				url : "${contextPath}/user/mobileCheck.do",
				dataType : "JSON",
				data : 'mobile=' + mobile,
				success : function(responseObject) {
					if (responseObject.result == 'YES') {
						$('.mobile_ok').css("display", "inline-block");
						$('.mobile_already').css("display", "none");
						mobileSignal2 = true;
					} else {
						$('.mobile_already').css("display", "inline-block");
						$('.mobile_ok').css("display", "none");
						mobileSignal2 = false;
					}

				},
				error : function() {
					alert("에러입니다.");
				}
			});
		};
	</script>

	<script>
		// 전송 버튼 클릭시
		function checkNull(f) {
			if(idSignal && nickSignal && pswd1Signal && pswd2Signal && nameSignal && birth_yySignal && birth_mmSignal && birth_ddSignal && genderSignal && emailSignal && mobileSignal && idSignal2 && nickSignal2 && emailSignal2 && mobileSignal2){
				f.action = "${contextPath}/user/addMember.do"
				f.submit(); 
				alert("회원가입이 완료되었습니다.");
			} else {
			// 입력값 중에 비어있으면 안되는 것들이 있음.
			// id칸이 비어 있는가?
			 if (idSignal2== false || idSignal == false) {
				 
				alert("아이디를 입력하세요.");
				f.id.value.focus
				//커서(포커스)를 아이디 인풋요소로 이동

			} // 닉네임이 비어 있는가?
			else if (nickSignal2== false || nickSignal == false) {
				alert("닉네임을 입력하세요.");

			}
			// 비밀번호 비어 있는가?
			else if (pswd1Signal  == false) {
				alert("비밀번호를 입력하세요.");

			}
			// 비밀번호 확인 비어 있는가?
			else if (pswd2Signal== false) {
				alert("비밀번호 확인을 입력하세요.");

			}
			// 이름 비어 있는가?
			else if (nameSignal  == false) {
				alert("이름을 입력하세요.");

			} else if (birth_yySignal== false) {
				alert("년을 입력하세요.");

			} else if (birth_mmSignal== false) {
				alert("월을 입력하세요.");
			}

			else if (birth_mmSignal== false) {
				alert("일을 입력하세요.");

			} else if (genderSignal== false) {
				alert("성별을 골라주세요.");
				document.form.mobile.focus();

			} else if (emailSignal2== false || emailSignal == false) {
				alert("이메일을 입력하세요.");

			} else if (mobileSignal2== false || mobileSignal == false) {
				alert("전화번호를 입력하세요.");
			} 
		}
		}
	</script>
</body>
</html>