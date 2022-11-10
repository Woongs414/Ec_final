<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
String viewName = (String) request.getAttribute("viewName");
%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.content-wrapper>.content {
	padding: 1em 0.5em;
}

.col-lg-3 {
	flex: 0 0 33.3%;
	max-width: 33.3%;
}

.main-header-block {
	display: block;
}

.main-header-margin {
	margin: 0 auto;
}

.toastui-calendar-template-monthDayName {
	text-align: center;
}

.toastui-calendar-day-name-item {
	font-size: 20px !important;
}

.toastui-calendar-grid-cell-date {
	font-size: 18px;
}

.bg-gradient-success {
	background: #80cebe linear-gradient(180deg, #9fdebd, #80cebe) repeat-x
		!important;
	color: #fff;
}
.line-red{
	color: red;
}
.line-blue{
	color: blue;
}
.line-green{
	color: green;
}
.line-orange{
	color: orange;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var ticksStyle = { 
			fontColor : '#495057', 
			fontStyle : 'bold'
			}
						
		var mode = 'index';
		var intersect = true;
		var $userChart = $('#user-chart')
		var $sellerChart = $('#seller-chart')
		var $commuChart = $('#community-chart')
		var userChart = new Chart($userChart,
			{
				data : {
					labels : [ '1월', '2월', '3월', '4월',
						'5월', '6월', '7월', '8월', '9월',
						'10월', '11월', '12월' ],
					datasets : [
						{
							type : 'line',
							data : [
								${visit.jan},${visit.feb},${visit.mar},
								${visit.apr},${visit.may},${visit.jun},
								${visit.jul},${visit.aug},${visit.sep},
								${visit.oct},${visit.nov},${visit.dec}
							],
							backgroundColor : 'transparent',
							borderColor : 'red',
							pointBorderColor : 'red',
							pointBackgroundColor : 'red',
							fill : false,
							label: "방문자"
						},
						{
							type : 'line',
							data : [
								${reserv.jan},${reserv.feb},${reserv.mar},
								${reserv.apr},${reserv.may},${reserv.jun},
								${reserv.jul},${reserv.aug},${reserv.sep},
								${reserv.oct},${reserv.nov},${reserv.dec}
							],
							backgroundColor : 'transparent',
							borderColor : 'blue',
							pointBorderColor : 'blue',
							pointBackgroundColor : 'blue',
							fill : false,
							label: "예약"
						},
						{
							type : 'line',
							data : [
								${review.jan},${review.feb},${review.mar},
								${review.apr},${review.may},${review.jun},
								${review.jul},${review.aug},${review.sep},
								${review.oct},${review.nov},${review.dec}
							],
							backgroundColor : 'transparent',
							borderColor : 'green',
							pointBorderColor : 'green',
							pointBackgroundColor : 'green',
							fill : false,
							label: "리뷰"
						},
						{
							type : 'line',
							data : [
								${signUp.jan},${signUp.feb},${signUp.mar},
								${signUp.apr},${signUp.may},${signUp.jun},
								${signUp.jul},${signUp.aug},${signUp.sep},
								${signUp.oct},${signUp.nov},${signUp.dec}
							],
							backgroundColor : 'transparent',
							borderColor : 'orange',
							pointBorderColor : 'orange',
							pointBackgroundColor : 'orange',
							fill : false,
							label: "회원가입"
						}
						]
				},
				options : {
				maintainAspectRatio : false,
					tooltips : {
						mode : mode,
						intersect : intersect
					},
					hover : {
						mode : mode,
						intersect : intersect
					},
					legend : {
						display : false
					},
					scales : {
						yAxes : [{
							gridLines : {
								display : true,
								lineWidth : '4px',
								color : 'rgba(0, 0, 0, .2)',
								zeroLineColor : 'transparent'
							},
							ticks : $.extend({beginAtZero : true}, ticksStyle)
						}],
						xAxes : [{
							display : true,
							gridLines : {
								display : false
							},
							ticks : ticksStyle
						}]
					}
				}
			})
		var sellerChart = new Chart($sellerChart,
				{
					data : {
						labels : [ '1월', '2월', '3월', '4월',
							'5월', '6월', '7월', '8월', '9월',
							'10월', '11월', '12월' ],
						datasets : [
							{
								type : 'line',
								data : [
									${s_visit.jan},${s_visit.feb},${s_visit.mar},
									${s_visit.apr},${s_visit.may},${s_visit.jun},
									${s_visit.jul},${s_visit.aug},${s_visit.sep},
									${s_visit.oct},${s_visit.nov},${s_visit.dec}
								],
								backgroundColor : 'transparent',
								borderColor : 'red',
								pointBorderColor : 'red',
								pointBackgroundColor : 'red',
								fill : false,
								label: "방문자"
							},
							{
								type : 'line',
								data : [
									${black.jan},${black.feb},${black.mar},
									${black.apr},${black.may},${black.jun},
									${black.jul},${black.aug},${black.sep},
									${black.oct},${black.nov},${black.dec}
								],
								backgroundColor : 'transparent',
								borderColor : 'blue',
								pointBorderColor : 'blue',
								pointBackgroundColor : 'blue',
								fill : false,
								label: "블랙리스트"
							},
							{
								type : 'line',
								data : [
									${white.jan},${white.feb},${white.mar},
									${white.apr},${white.may},${white.jun},
									${white.jul},${white.aug},${white.sep},
									${white.oct},${white.nov},${white.dec}
								],
								backgroundColor : 'transparent',
								borderColor : 'green',
								pointBorderColor : 'green',
								pointBackgroundColor : 'green',
								fill : false,
								label: "화이트리스트"
							},
							{
								type : 'line',
								data : [
									${s_signUp.jan},${s_signUp.feb},${s_signUp.mar},
									${s_signUp.apr},${s_signUp.may},${s_signUp.jun},
									${s_signUp.jul},${s_signUp.aug},${s_signUp.sep},
									${s_signUp.oct},${s_signUp.nov},${s_signUp.dec}
								],
								backgroundColor : 'transparent',
								borderColor : 'orange',
								pointBorderColor : 'orange',
								pointBackgroundColor : 'orange',
								fill : false,
								label: "회원가입"
							}
							]
					},
					options : {
					maintainAspectRatio : false,
						tooltips : {
							mode : mode,
							intersect : intersect
						},
						hover : {
							mode : mode,
							intersect : intersect
						},
						legend : {
							display : false
						},
						scales : {
							yAxes : [{
								gridLines : {
									display : true,
									lineWidth : '4px',
									color : 'rgba(0, 0, 0, .2)',
									zeroLineColor : 'transparent'
								},
								ticks : $.extend({beginAtZero : true}, ticksStyle)
							}],
							xAxes : [{
								display : true,
								gridLines : {
									display : false
								},
								ticks : ticksStyle
							}]
						}
					}
				})
		var commuChart = new Chart($commuChart,
				{
					data : {
						labels : [ '1월', '2월', '3월', '4월',
							'5월', '6월', '7월', '8월', '9월',
							'10월', '11월', '12월' ],
						datasets : [
							{
								type : 'line',
								data : [
									${u_commu.jan},${u_commu.feb},${u_commu.mar},
									${u_commu.apr},${u_commu.may},${u_commu.jun},
									${u_commu.jul},${u_commu.aug},${u_commu.sep},
									${u_commu.oct},${u_commu.nov},${u_commu.dec}
								],
								backgroundColor : 'transparent',
								borderColor : 'red',
								pointBorderColor : 'red',
								pointBackgroundColor : 'red',
								fill : false,
								label: "사용자 글수"
							},
							{
								type : 'line',
								data : [
									${s_commu.jan},${s_commu.feb},${s_commu.mar},
									${s_commu.apr},${s_commu.may},${s_commu.jun},
									${s_commu.jul},${s_commu.aug},${s_commu.sep},
									${s_commu.oct},${s_commu.nov},${s_commu.dec}
								],
								backgroundColor : 'transparent',
								borderColor : 'blue',
								pointBorderColor : 'blue',
								pointBackgroundColor : 'blue',
								fill : false,
								label: "판매자 글수"
							},
							{
								type : 'line',
								data : [
									${u_comment.jan},${u_comment.feb},${u_comment.mar},
									${u_comment.apr},${u_comment.may},${u_comment.jun},
									${u_comment.jul},${u_comment.aug},${u_comment.sep},
									${u_comment.oct},${u_comment.nov},${u_comment.dec}
								],
								backgroundColor : 'transparent',
								borderColor : 'green',
								pointBorderColor : 'green',
								pointBackgroundColor : 'green',
								fill : false,
								label: "사용자 댓글수"
							},
							{
								type : 'line',
								data : [
									${s_comment.jan},${s_comment.feb},${s_comment.mar},
									${s_comment.apr},${s_comment.may},${s_comment.jun},
									${s_comment.jul},${s_comment.aug},${s_comment.sep},
									${s_comment.oct},${s_comment.nov},${s_comment.dec}
								],
								backgroundColor : 'transparent',
								borderColor : 'orange',
								pointBorderColor : 'orange',
								pointBackgroundColor : 'orange',
								fill : false,
								label: "판매자 댓글수"
							}
							]
					},
					options : {
					maintainAspectRatio : false,
						tooltips : {
							mode : mode,
							intersect : intersect
						},
						hover : {
							mode : mode,
							intersect : intersect
						},
						legend : {
							display : false
						},
						scales : {
							yAxes : [{
								gridLines : {
									display : true,
									lineWidth : '4px',
									color : 'rgba(0, 0, 0, .2)',
									zeroLineColor : 'transparent'
								},
								ticks : $.extend({beginAtZero : true}, ticksStyle)
							}],
							xAxes : [{
								display : true,
								gridLines : {
									display : false
								},
								ticks : ticksStyle
							}]
						}
					}
				})
	});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Main content -->
		<div class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-6">
						<!-- user chart card -->
						<div class="card">
							<div class="card-header border-0">
								<div class="d-flex justify-content-between">
									<h3 class="card-title">사용자 통계</h3>
								</div>
							</div>
							<div class="card-body">
								<div class="position-relative mb-4">
									<canvas id="user-chart" height="200"></canvas>
								</div>
								<div class="d-flex flex-row justify-content-end">
									<span class="mr-2"> 
										<i class="fas fa-square line-red"></i> 
										방문자
									</span> 
									<span class="mr-2"> 
										<i class="fas fa-square line-blue"></i> 
										예약
									</span>
									<span class="mr-2"> 
										<i class="fas fa-square line-green"></i> 
										리뷰
									</span>
									<span> 
										<i class="fas fa-square line-orange"></i> 
										회원가입
									</span>
								</div>
							</div>
						</div>
						<!-- /.card -->
						<!-- community chart card -->
						<div class="card">
							<div class="card-header border-0">
								<div class="d-flex justify-content-between">
									<h3 class="card-title">게시판 통계</h3>
								</div>
							</div>
							<div class="card-body">

								<div class="position-relative mb-4">
									<canvas id="community-chart" height="200"></canvas>
								</div>

								<div class="d-flex flex-row justify-content-end">
									<span class="mr-2"> 
										<i class="fas fa-square line-red"></i> 
										사용자 글
									</span> 
									<span class="mr-2"> 
										<i class="fas fa-square line-blue"></i> 
										판매자 글
									</span>
									<span class="mr-2"> 
										<i class="fas fa-square line-green"></i> 
										사용자 댓글
									</span>
									<span> 
										<i class="fas fa-square line-orange"></i> 
										판매자 댓글
									</span>
								</div>
							</div>
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col-md-6 -->
					<div class="col-lg-6">
						<!-- seller chart card -->
						<div class="card">
							<div class="card-header border-0">
								<div class="d-flex justify-content-between">
									<h3 class="card-title">판매자 통계</h3>
								</div>
							</div>
							<div class="card-body">
								<!-- /.d-flex -->

								<div class="position-relative mb-4">
									<canvas id="seller-chart" height="200"></canvas>
								</div>

								<div class="d-flex flex-row justify-content-end">
									<span class="mr-2"> 
										<i class="fas fa-square line-red"></i> 
										방문자
									</span> 
									<span class="mr-2"> 
										<i class="fas fa-square line-blue"></i> 
										블랙리스트
									</span>
									<span class="mr-2"> 
										<i class="fas fa-square line-green"></i> 
										화이트리스트
									</span>
									<span> 
										<i class="fas fa-square line-orange"></i> 
										회원가입
									</span>
								</div>
							</div>
						</div>
						<!-- blackList recognize -->
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">블랙리스트 승인</h3>
								<div class="card-tools">
									<div class="btn-group">
										<a href="${contextPath}/seller/notice"
											class="btn btn-sm btn-tool"> <i class="fas fa-bars"></i>
										</a>
									</div>
								</div>
							</div>
							<!-- /.card-header -->
							<div class="card-body p-0">
								<table class="table">
									<thead>
										<tr align="center">
											<th style="width: 100px">번호</th>
											<th>공지 제목</th>
											<th>작성일</th>
											<th>조회수</th>
											<th style="width: 100px">더 보기</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${empty noticeList}">
												<tr align="center">
													<td colspan="5">
														<p align="center">
															<b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>
														</p>
													</td>
												</tr>
											</c:when>
											<c:when test="${!empty noticeList}">
												<c:forEach var="notice" items="${noticeList}"
													varStatus="noticeNum">
													<tr align="center">
														<c:choose>
															<c:when test="${paging.nowPage == 1 }">
																<td>${paging.boardCount-noticeNum.index}</td>
															</c:when>
															<c:otherwise>
																<td>${paging.boardCount-noticeNum.index}</td>
															</c:otherwise>
														</c:choose>
														<td>${notice.no_title}</td>
														<td><fmt:formatDate value="${notice.reg_date}"
																pattern="yyyy-MM-dd" /></td>
														<td>${notice.hits}</td>
														<td><a
															href="${contextPath}/seller/notice/view?list_num=${notice.list_num}"
															class="text-muted"><i class="fas fa-search"></i></a></td>
												</c:forEach>
											</c:when>
										</c:choose>
									</tbody>
								</table>
							</div>
							<!-- /.card-body -->
						</div>
					</div>
					<!-- /.col-md-6 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->

</body>
</html>