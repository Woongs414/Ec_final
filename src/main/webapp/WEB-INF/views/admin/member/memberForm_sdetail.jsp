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
<style>
#container2 {
	height: 2000px;
	width: 100%;
}
/*파일첨부 숨기기 */
#chooseFile {
	visibility: hidden;
}
/*밑줄긋기*/
.fileInput {
	display: flex;
	align-items: center;
	border-bottom: solid 2px black;
	height: 30px;
	margin-bottom: 20px;
}

/* 손가락 커서활성화 */
label {
	cursor: pointer;
	font-size: 1em;
}

}
#fileName {
	margin-left: 5px;
}

#bir_wrap {
	display: table;
	width: 100%;
}

#bir_yy {
	display: table-cell;
	width: 150px;
}

#bir_mm {
	display: table-cell;
	width: 150px;
	vertical-align: middle;
}

#bir_dd {
	display: table-cell;
	width: 150px;
}

#bir_mm, #bir_dd {
	padding-left: 10px;
}
</style>
<meta charset="UTF-8">
<title>기업 회원가입</title>
<link rel="stylesheet" href="${contextPath }/css/memberForm_sdetail.css">

</head>
<body>
	<form method="post" enctype="multipart/form-data">
		<!-- form은 name을 값으로 받는다. -->
		<div id="container2">
			<!-- header -->
			<div id="header2">
				<a href="${contextPath }/seller/member/loginForm.do"
					title="메인화면으로 돌아가기"><img
					src="${contextPath }/image/logo_7f78.png" id="logo"></a>
			</div>


			<!-- wrapper -->
			<div id="wrapper">

				<!-- content-->
				<div id="content2">

					<!-- ID -->
					<div>
						<h3 class="join_title">
							<label for="id">아이디</label>
						</h3>
						<span class="box int_id"> <input type="text" id="id"
							name="seller_id" class="int" maxlength="20">

						</span> <span class="error_next_box"></span>
					</div>



					<!-- PW1 -->
					<div>
						<h3 class="join_title">
							<label for="pswd1">비밀번호</label>
						</h3>
						<span class="box int_pass"> <input type="password"
							id="pswd1" name="seller_pw" class="int" maxlength="20"> <span
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
							id="pswd2" class="int" maxlength="20"> <img
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
							name="seller_name" class="int" maxlength="20">
						</span> <span class="error_next_box"></span>
					</div>
					<!-- EMAIL -->
					<div>
						<h3 class="join_title">
							<label for="email">본인확인 이메일</label>
						</h3>
						<span class="box int_email"> <input type="text" id="email"
							name="seller_email" class="int" oninput="emailCheck()"
							maxlength="100" placeholder="예)id@google.com">
						</span>
						<!--  <span class="email_ok">중복되지않는 이메일입니다.</span> <span
							class="email_already">이미 사용중인 이메일입니다.</span> -->
						<span class="error_next_box"></span>

					</div>

					<!-- BIRTH -->
					<!-- 	<div>
						<h3 class="join_title">
							<label for="yy">생년월일</label>
						</h3>

						<div id="bir_wrap">
							BIRTH_YY
							<div id="bir_yy">
								<span class="box"> <input type="text" id="yy"
									name="birth_yy" class="int" maxlength="4" placeholder="년(4자)">
								</span>
							</div>

							BIRTH_MM
							<div id="bir_mm">
								<span class="box"> <select id="mm" class="sel"
									name="birth_mm">
										<option>월</option>
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

							BIRTH_DD
							<div id="bir_dd">
								<span class="box"> <input type="text" id="dd"
									name="birth_dd" class="int" maxlength="2" placeholder="일">
								</span>
							</div>

						</div>
						<span class="error_next_box"></span>
					</div>
 -->
					<!-- GENDER -->
					<div>
						<h3 class="join_title">
							<label for="gender">성별</label>
						</h3>
						<span class="box gender_code"> <select id="gender"
							class="sel" name="gender">
								<option>성별</option>
								<option value="M">남자</option>
								<option value="F">여자</option>
						</select>
						</span> <span class="error_next_box">필수 정보입니다.</span>
					</div>

					<!-- MOBILE -->
					<div>
						<h3 class="join_title">
							<label for="mobile">휴대전화</label>
						</h3>
						<span class="box int_mobile"> <input type="tel" id="mobile"
							name="seller_tel" class="int" maxlength="11"
							placeholder="하이폰(-)제외 번호만입력">
						</span> <span class="error_next_box"></span>
					</div>

					<!-- BESINESS REGISTER NUMBER -->
					<div>
						<h3 class="join_title">
							<label for="bizReg">사업자 등록번호<span class="essential">(필수)</span></label>
						</h3>
						<span class="box int_email"> <input type="text" id="bizReg"
							name="seller_bizReg" class="int" maxlength="10"
							placeholder="하이폰(-)제외 번호만입력">
						</span> <span class="error_next_box"></span> <br>

						<!-- 사업자번호확인 API -->
						<div>
							<span class="box int_bizCheck" style="background-color: #A67F78;">
								<input type="button" id="bizCheck" name="bizCheck" class="int"
								maxlength="10" onclick="businessNumber()" value="사업자번호인증"
								style="color: white; background-color: #A67F78;">
							</span>

						</div>


						<!-- 파일첨부 -->
						<div class="button">
							<label for="chooseFile"> <br> 👉 파일첨부 👈
							</label>
						</div>
						<input type="file" id="chooseFile" accept="image/*"
							onchange="loadFile(this)">

						<div class="fileContainer">
							<div class="fileInput">
								<p>FILE NAME: &nbsp;</p>
								<p id="fileName"></p>
							</div>
						</div>
					</div>

					<!-- 키워드(업종) -->
					<div>
						<h3 class="join_title">
							<label for="area">위치 및 업종</label>
						</h3>

						<div id="keyword_wrap">
							<!-- keyword 지역 -->
							<div id="key_local">
								<span class="box"> <select id="area" class="sel"
									name="area">
										<option>위치</option>
										<option value="서울특별시">서울특별시</option>
										<option value="인천광역시">인천광역시</option>
										<option value="광주광역시">광주광역시</option>
										<option value="대구광역시">대구광역시</option>
										<option value="광주광역시">광주광역시</option>
										<option value="울산광역시">울산광역시</option>
										<option value="대전광역시">대전광역시</option>
										<option value="부산광역시">부산광역시</option>
										<option value="세종특별자치시">세종특별자치시</option>
										<option value="경기도">경기도</option>
										<option value="강원도">강원도</option>
										<option value="충청남도">충청남도</option>
										<option value="충청북도">충청북도</option>
										<option value="경상북도">경상북도</option>
										<option value="경상남도">경상남도</option>
										<option value="전라북도">전라북도</option>
										<option value="전라남도">전라남도</option>
										<option value="제주도">제주도</option>
								</select>
								</span>

							</div>

							<!-- keyword_업종 -->
							<div id="key_business">
								<span class="box"> <select id="category_code" class="sel"
									name="category_code">
										<option>업종</option>
										<option value="10">먹거리</option>
										<option value="20">볼거리</option>
								</select>
								</span>

							</div>
						</div>
						<span class="error_next_box"></span>
					</div>
					<!--  우편번호 찾기 다음 API -->
					<div>
						<h3 class="join_title">
							<label for="seller_addr">주소</label>
						</h3>
						<input type="button" style="background-color: #A67F78; color:white; border:none;" onclick="sample6_execDaumPostcode()" value="우편번호 검색"><br>
						<span class="box int_seller_addr"> 
						<input type="text" id="sample6_postcode" placeholder="우편번호" class="int">
						</span> <br>
						 
						<input class="box int_seller_addr" type="text" id="seller_addr" placeholder="주소"><br> 
				<!-- 		<input type="text" id="sample2_detailAddress" placeholder="상세주소"> -->
						<input class="box int_seller_addr" type="text" id="sample6_extraAddress" placeholder="참고항목">
						
						<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

						<span class="error_next_box"></span>
					</div>



					<!-- 3가지입력 -->
					<div>
						<h3 class="join_title">
							<label for="key1">키워드 입력</label>
						</h3>

						<div id="bir_wrap">
							<!-- 키워드1 -->
							<div id="keybox1">
								<span class="box"> <input type="text" id="key1"
									name="key1" class="int" placeholder="예) 삼겹살">
								</span>
							</div>

							<!-- 키워드2 -->
							<div id="keyword2">
								<span class="box"> <input type="text" id="key2"
									name="key2" class="int" placeholder="예) 라면">
								</span>
							</div>

							<!-- 키워드3 -->
							<div id="keyword3">
								<span class="box"> <input type="text" id="key3"
									name="key3" class="int" placeholder="예) 아구찜">
								</span>
							</div>

						</div>
						<span class="error_next_box"></span>
					</div>




					<!-- JOIN BTN-->
					<div class="btn_area">
						<button type="button" id="btnJoin" onclick="checkNull(this.form)"
							style="background-color: #A67F78;">
							<span>가입하기</span>
						</button>
					</div>



				</div>
				<!-- content-->

			</div>
		</div>
	</form>

	<!-- wrapper -->

	<!--    var submit = document.getElementById('submitButton');
    submit.onclick = showImage;     //Submit 버튼 클릭시 이미지 보여주기

    function showImage() {
        var newImage = document.getElementById('image-show').lastElementChild;
        newImage.style.visibility = "visible";
        
        document.getElementById('image-upload').style.visibility = 'hidden';

        document.getElementById('fileName').textContent = null;     //기존 파일 이름 지우기
    } */ -->

	<%-- <script src="${contextPath }/js/memberForm_sdetail.js"></script> --%>

	<script>
		function loadFile(input) {
			var file = input.files[0];

			var name = document.getElementById('fileName');
			name.textContent = file.name;

			var newImage = document.createElement("img");
			newImage.setAttribute("class", 'img');

			newImage.src = URL.createObjectURL(file);

			newImage.style.width = "70%";
			newImage.style.height = "70%";
			newImage.style.visibility = "hidden"; //버튼을 누르기 전까지는 이미지 숨기기
			newImage.style.objectFit = "contain";

			var container = document.getElementById('image-show');
			container.appendChild(newImage);
		};
	</script>
	<script>
		//사업자번호 인증 API이용
		isbizreg = false;
		function businessNumber() {
			let num = document.getElementById('bizReg').value;
			const data = {
				"b_no" : [ num ]
			//폼 넘버 가져오기
			};
			console.log(data);
			$
					.ajax({
						url : "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=gYagmjpAVVE7FG62P1zCKaEe64hZ0W1T%2BhXrMUV%2Ft%2FFsq14xmZXNsJ35qus3wOxtpmOlJ12HRAELQyiSsxbzGg%3D%3D",
						type : "POST",
						data : JSON.stringify(data), //json을 string으로 변환하여 전송
						dataType : "JSON",
						contentType : "application/json",
						accept : "application/json",
						success : function(result) {
							console.log("data.b_no : " + data.b_no);
							console.log(result.data[0]['b_stt_cd']); //사업자 01번:계속사업 번호호출

							let valid = result.data[0]['b_stt_cd'];
							if (valid = '01' && num.length == 10) {
								alert("사업자 회원가입이 가능합니다.");
								isbizreg = true;

							} else {
								alert("사업자 회원가입을 할 수 없습니다.");
								isbizreg = false;
							}

						},
						error : function(result) {
							console.log(result.responseText);
						}
					});
		}
	</script>
	<!-- 		<script>
		function emailCheck() {
			var seller_email = $('#email').val();
			//id=id인값을 user_id에 넣고 아래 url에  data를 보내준다.
			$.ajax({ //비동기 방식 (페이지가 넘어가지 않고 그 페이지에서 바로 자료가 변경됨)
				type : "post",
				url : "${contextPath}/seller/emailCheck.do",
				dataType : "JSON",
				data : 'seller_email=' + seller_email,
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
	</script> -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("seller_addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                /* document.getElementById("sample6_detailAddress").focus(); */
            }
        }).open();
    }
</script>
	
	</script>
	<script>
		// 전송 버튼 클릭시
		function checkNull(f) {
			// 입력값 중에 비어있으면 안되는 것들이 있음.
			// id칸이 비어 있는가?
			if (f.id.value.length < 1) {
				alert("아이디를 입력하세요.");
				f.id.value.focus
				//커서(포커스)를 아이디 인풋요소로 이동

			} // 비밀번호 비어 있는가?
			else if (f.pswd1.value.length < 1) {
				alert("비밀번호를 입력하세요.");

			}// 비밀번호 확인 비어 있는가?
			else if (f.pswd2.value.length < 1) {
				alert("비밀번호 확인을 입력하세요.");

			}// 이름 비어 있는가?
			else if (f.name.value.length < 1) {
				alert("이름을 입력하세요.");

			} /* else if (f.yy.value.length < 1) {
						alert("년을 입력하세요.");

					} else if (f.mm.value == "월") {
						alert("월을 입력하세요.");
					}

					else if (f.dd.value.length < 1) {
						alert("일을 입력하세요.");

					}  */else if (f.gender.value == "성별") {
				alert("성별을 골라주세요.");
				document.form.mobile.focus();

			} else if (f.mobile.value.length < 1) {
				alert("전화번호를 입력하세요.");

			} else if (f.bizReg.value.length < 1) {
				alert("사업자 번호를 입력하세요.");

			} else if (f.area.value == "위치") {
				alert("위치를 선택하세요.");

			} else if (f.category_code.value == "업종") {
				alert("업종을 선택하세요.");
			} else if (f.key1.value.length < 1) {
				alert("키워드를 입력해주세요.");
			} else if (isbizreg == false) {
				alert("사업자번호를 제대로 입력해주세요.");
			} else {
				var keyword = f.key1.value + "," + f.key2.value + ","
						+ f.key3.value;
				f.action = "${contextPath}/seller/addMember.do?keyword="
						+ keyword;
				f.submit();
				alert("회원가입을 축하드립니다.");
			}
		}
	</script>
</body>
</html>