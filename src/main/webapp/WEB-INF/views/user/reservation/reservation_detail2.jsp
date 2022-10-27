<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<fmt:parseNumber var="ff" value="${reservInfo.open_time/100}" integerOnly="true" />
<fmt:parseNumber var="ff2" value="${reservInfo.open_time%100}" integerOnly="true" />
<fmt:parseDate var="startTime" value="${reservInfo.open_time}"  pattern="HHmm"/>
<fmt:parseDate var="closeTime" value="${reservInfo.close_time}"  pattern="HHmm"/>

<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<!-- 아코디언 CSS/JS 링크 -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- 아코디언 CSS/JS 링크 끝 -->
<!-- datepicker/timepicker Css/js링크 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"
	integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- 전체 CSS -->
<link rel="stylesheet" href="${contextPath}/css/reser_style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<!-- num spinner -->
<script src="${contextPath}/js/bootstrap-input-spinner.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('.datepicker').datepicker({
		format : 'yyyy.mm.dd(E)',
		inline : true,
		startDate : '0d',
		endDate : '+30d',
		language : 'ko'
	}).on("changeDate",function(e) {
		var date = e.date;
		var date2 = new Date(date);
		var years = date2.getFullYear();
		var months = date2.getMonth() + 1;
		var days = date2.getDate();
		var weeks = date2.getDay();
		$('input[name="reserv_date"]').val(years+ "" +months + "" +days);
		switch (weeks) {
			case 0:
				$('#dateinner').text(years + "." + months + "." + days+ "(일)");
				break;
			case 1:
				$('#dateinner').text(years + "." + months + "." + days+ "(월)");
				break;
			case 2:
				$('#dateinner').text(years + "." + months + "." + days+ "(화)");
				break;
			case 3:
				$('#dateinner').text(years + "." + months + "." + days+ "(수)");
				break;
			case 4:
				$('#dateinner').text(years + "." + months + "." + days+ "(목)");
				break;
			case 5:
				$('#dateinner').text(years + "." + months + "." + days+ "(금)");
				break;
			case 6:
				$('#dateinner').text(years + "." + months + "." + days+ "(토)");
				break;
		}
	});
	$('.cell').click(function() {
		$('.cell').removeClass('select');
		$(this).addClass('select');
	});
	$('.cell').click(function() {
		var text = $(this).text();
		
		var fuck = new Date(Date.prototype.setHours.apply(new Date(), text.split(':')));
		var hours = fuck.getHours();
		var minutes = ("00"+fuck.getMinutes()).slice(-2);
		$('input[name="reserv_time"]').val(text);
		if (hours > 12) {
			$('#timeinner').text(hours + ":" + minutes + "(오후)");
		} else {
			$('#timeinner').text(hours + ":" + minutes + "(오전)");
		}
	});
	$("input[type='number']").inputSpinner()

	$(document).on("click","#fff",function() {
		$('#people_value').remove();
		var countpp = $("input[name='count_pp']").val();
		$("#fff").append("<span id='people_value'>" + countpp+ "명</span>");
	});
	$(document).on("click",".btn-plus",function() {
		$('#people_value').remove();
		var countpp = $("input[name='count_pp']").val();
		$("#fff").append("<span id='people_value'>" + countpp+ "명</span>");
	});
	$(document).on("click",".btn-minus",function() {
		$('#people_value').remove();
		var countpp = $("input[name='count_pp']").val();
		$("#fff").append("<span id='people_value'>" + countpp+ "명</span>");
	});
	function randomString() {
	    const chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz'
	    const stringLength = 10
	    let randomstring = ''
	    for (let i = 0; i < stringLength; i++) {
	      const rnum = Math.floor(Math.random() * chars.length)
	      randomstring += chars.substring(rnum, rnum + 1)
	    }
	    return randomstring
	  }
	var order_id = randomString();
	$('input[name="order_id"]').val(order_id);
	
});
</script>
<style type="text/css">
.accordion {
	margin: 0;
}
.accordion .item {
	border: none;
	background: none;
}
.t-p {
	padding: 30px 30px 20px 30px;
}
.accordion .item .item-header h2 button.btn.btn-link {
	background-color: white;
	border-bottom: 1px solid;
	border-bottom-color: #ecf0f2; color : black;
	border-radius: 0px;
	font-family: 'Poppins';
	font-size: 18px;
	font-weight: 800;
	line-height: 2.5;
	text-decoration: none;
	color: black;
}
.accordion .item .item-header {
	border-bottom: none;
	background: transparent;
	padding: 0px;
	margin: 2px;
}
.accordion .item .item-header h2 button {
	color: white;
	font-size: 20px;
	padding: 15px;
	display: block;
	width: 100%;
	text-align: left;
}
.accordion .item .item-header h2 i {
	float: right;
	font-size: 30px;
	color: #eca300;
	background-color: black;
	width: 60px;
	height: 40px;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 5px;
}
button.btn.btn-link.collapsed i {
	transform: rotate(0deg);
}
button.btn.btn-link i {
	transform: rotate(180deg);
	transition: 0.5s;
}
/* 달력 전체 */
#dp1 {
	margin: 0 auto;
}
/* 달력 선택 가능 날짜 */
td.day {
	color: black;
}
td.day:hover {
	background-color: lightblue;
}
/* 달력 테이블 */
.table-condensed {
	margin: auto !important;
	width: 300px;
	height: 300px;
}
/* 달력 헤드 */
.table-condensed thead {
	color: red;
	font-size: 20px;
}
.datepicker th {
	width: 30px !important;
}
.datepicker-inline {
	width: 300px;
	height: 300px;
	margin: auto;
}
#collapseOne {
	height: 350px;
}
.cell {
	border: 1px solid #BDBDBD;
	margin: 2px;
	cursor: pointer;
}
.cell:hover {
	border: 1px solid #3D5AFE;
}
.cell.select {
	background-color: #3D5AFE;
	color: #fff;
}
.rowHeader {
	text-align: center;
	font-size: 20px;
	color: black;
}
.p-sm-5 {
	padding-top: 0px !important;
	padding-bottom: 0px !important;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="frm" method="post" action="${contextPath}/reservCheck">
	<div class="container">
		<div class="detail_header">
			<div class="reserv_title">
				<a href="#" onClick="history.back()" class="btn_back"><i class="bi bi-arrow-left"></i></a>
				<h2>
					<a href="#" class="seller_title">${reservInfo.store_nic}</a>
				</h2>
				<a href="${contextPath}/mypage/uBook.do" class="btn_my">
				<span title="내 예약 현황">MY</span>
				</a>
			</div>
		</div>
		<div class="item_name">
			<span>${reservInfo.store_nic} 예약</span>
		</div>
		<div class="seller_detail">${reservInfo.store_introduce}</div>
		<div class="accordion" id="accordionExample">
			<div class="item">
				<div class="item-header" id="headingOne">
					<h2 class="mb-0">
						<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne" id="dateform">
							<i class="bi bi-calendar-date noback"></i>
							<span id="dateinner">
							<fmt:formatDate value="${now}" pattern="yyyy.MM.dd(E)" />
							</span> 
							<input type="hidden" value="" name="reserv_date"/>
							<i class="fa fa-angle-down"></i>
						</button>
					</h2>
				</div>
				<div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="">
					<div class="t-p">
						<div id="dp1" class="datepicker"></div>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="item-header" id="headingTwo">
					<h2 class="mb-0">
						<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
							<i class="bi bi-clock noback"></i>
							<span id="timeinner">
							<fmt:formatDate value="${startTime}" pattern="hh:mm(a)" />
							</span> 
							<input type="hidden" value="" name="reserv_time" />
							<i class="fa fa-angle-down"></i>
						</button>
					</h2>
				</div>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="">
					<div class="t-p">
						<div class="card-body p-3 p-sm-5">
						<div class="row text-center mx-0">
								
						<c:forEach var="i" begin="${reservInfo.open_time}" end="${reservInfo.close_time}" step="50">
							<div class="col-md-2 col-4 my-1 px-2">
									<div class="cell py-1">
										<fmt:parseNumber var="stepHour" value="${i/100}" integerOnly="true" />
										<fmt:parseNumber var="stepminite" value="${(i%100)*6/10}" />
										<fmt:parseDate var="stepTime" value="${stepHour}${stepminite}"  pattern="HHmm"/>
										<fmt:formatDate value="${stepTime}" pattern="HH:mm" />
									</div>
								</div>
						</c:forEach>
						
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="item-header" id="headingThree">
					<h2 class="mb-0">
						<button class="btn btn-link collapsed" type="button"
							data-toggle="collapse" data-target="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree" id="fff">
							<i class="bi bi-people noback"></i><span id="people_value">인원</span>
							<i class="fa fa-angle-down"></i>
						</button>
					</h2>
				</div>
				<div id="collapseThree" class="collapse"
					aria-labelledby="headingThree" data-parent="">
					<div class="t-p">
						<div class="cust_people">
							<i class="bi bi-info-circle"></i> minpeople~maxpeople 까지 선택
							가능합니다.
						</div>
						<div class="choice_people">
							<div class="notice_people">
								<strong>예약인원을 선택해주세요</strong>
							</div>
							<div class="count_people">
								<input name="count_pp" type="number" value="1" min="${reservInfo.min_People}" max="${reservInfo.max_People}" step="1" />
								<!-- min/max 숫자 나중에 DB형으로 처리할것 -->
							</div>
						</div>
					</div>
				</div>
			</div>
<!-- 			<div class="item">
				<div class="item-header" id="headingFive">
					<h2 class="mb-0">
						<button class="btn btn-link collapsed" type="button"
							data-toggle="collapse" data-target="#collapseFive"
							aria-expanded="false" aria-controls="collapseFive">
							<i class="bi bi-list-task noback"></i></i><span id="menu_title">메뉴</span>
							<i class="fa fa-angle-down"></i>
						</button>
					</h2>
				</div>
				<div id="collapseFive" class="collapse"
					aria-labelledby="headingFive" data-parent="">
					<div class="t-p">
						<img src="">
					</div>
				</div>
			</div> -->
			<div class="item">
				<div class="item-header" id="headingFour">
					<h2 class="mb-0">
						<button class="btn btn-link collapsed" type="button"
							data-toggle="collapse" data-target="#collapseFour"
							aria-expanded="false" aria-controls="collapseFour">
							<i class="bi bi-person-fill noback"></i>판매자 정보 <i class="fa fa-angle-down"></i>
						</button>
					</h2>
				</div>
				<div id="collapseFour" class="collapse"
					aria-labelledby="headingFour" data-parent="">
					<div class="t-p">
						<table>
							<tr>
								<td class="sellerMenu">상호 :</td>
								<td class="sellerInfo">${reservInfo.seller_name}</td>
								<input type="hidden" name="seller_id" value="${reservInfo.seller_id}" >
								<input type="hidden" name="seller_name" value="${reservInfo.seller_name}">
							</tr>
							<tr>
								<td class="sellerMenu">대표자명 :</td>
								<td class="sellerInfo">임시대표자명</td>
							</tr>
							<tr>
								<td class="sellerMenu">사업자번호 :</td>
								<td class="sellerInfo">${reservInfo.seller_bizReg}</td>	
							</tr>
							<tr>
								<td class="sellerMenu">소재지 :</td>
								<td class="sellerInfo">${reservInfo.seller_addr}</td>
								<input type="hidden" name="seller_addr" value="${reservInfo.seller_addr}">
							</tr>
							<tr>
								<td class="sellerMenu">연락처 :</td>
								<td class="sellerInfo">${reservInfo.seller_tel}</td>
								<input type="hidden" name="seller_tel" value="${reservInfo.seller_tel}">
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="item-header" id="headingFive">
					<h2 class="mb-0">
						<button class="btn btn-link collapsed noncursor" type="button">
							<i class="bi bi-person noback"></i><span id="reserv_info">예약자정보</span>
						</button>
					</h2>
				</div>
					<div class="t-p">
						<div class="innerForm">
							<label for="user_name">예약자</label>
							<div class="inlineInput">
								<span>필수</span> <input type="text" id="user_name" name="user_name" value="${member.user_name}" maxlength="40">
							</div>
						</div>
						<div class="innerForm">
							<label for="user_tel">연락처</label>
							<div class="inlineInput">
								<span>필수</span> <input type="text" name="user_tel" id="user_tel" 
									value="${member.tel}" maxlength="40">
							</div>
						</div>
						<div class="innerForm">
							<label for="user_tel">이메일</label>
							<div class="inlineInput">
								<input type="email" name="user_email" id="user_eamil" value="${member.user_email}"
									maxlength="40">
							</div>
						</div>
						<div class="innerForm">
							<label for="user_hope">요청사항</label>
							<div class="inlineInput">
								<textarea name="user_hope" id="user_hope" rows="2" cols="30" maxlength="500" placeholder="업체에 요청할 내용을 적으세요" ></textarea>
								<input type="hidden" name="reserv_pay" value="${reservInfo.reserv_pay}" />
								<input type="hidden" name="order_id" value="" />
							</div>
						</div>
					</div>	
			</div>
<%-- 			<c:if test="${reservInfo.reserv_pay == 0 }">
			<div class="reserv_btn">
				<button type="submit" class="reserv_submit" id="payment-button" >
				<i class="bi bi-cart-check">
				</i><span>예약 신청</span>
				</button>
			</div>
			</c:if>
			<c:if test="${reservInfo.reserv_pay != 0 }"> --%>
			<div class="reserv_btn">
				<button type="submit" class="reserv_submit">
				<i class="bi bi-cart-check">
				</i><span>예약 신청</span>
				</button>
			</div>
<%-- 			</c:if> --%>
		</div>
	</div>
	</form>
</body>
</html>