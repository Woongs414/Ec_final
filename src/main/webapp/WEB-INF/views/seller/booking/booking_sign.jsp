<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="URL" value="${pageContext.request.requestURL}" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
String viewName = (String)request.getAttribute("viewName");
%>
<!DOCTYPE html>
<html>
<head>
<style>
.content-wrapper>.content{
		padding: 0.5em;
	}
.pagination{
	float: right;
	padding-right: 30px;
}
.col-md-9{
	flex: 0 0 100%;
    max-width: 100%;
}
.search-btn{
	float: right;
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
  
  
  //단체 승인
	function groupSignOn(){
	var status = confirm("단체 승인 하실건가요?");
	if(status == true) {
		var flag = false;
		var values = document.getElementsByName("bookCheck");
		var form = document.getElementById("bookSignForm");
		var count = 0;
		for(var i = 0 ; i <values.length;i++) {
			if(values[i].checked) {
				count++;
			}
		}
		if(count<1){
			alert("1개 이상 선택해야 합니다.");
		}else { 
			  form.action = "${contextPath}/seller/groupBookSignOn";
			  form.mothod = "GET";
			  form.submit();
		}
	}

} 

//단체 거부
function groupSignOff(){
var status = confirm("단체 거부 하실건가요?");
if(status == true) {
	var flag = false;
	var values = document.getElementsByName("bookCheck");
	var form = document.getElementById("bookSignForm");
	var count = 0;
	for(var i = 0 ; i <values.length;i++) {
		if(values[i].checked) {
			count++;
		}
	}
	if(count<1){
		alert("1개 이상 선택해야 합니다.");
	}else { 
		  form.action = "${contextPath}/seller/groupBookSignOff";
		  form.mothod = "GET";
		  form.submit();
	}
}

} 

//낱개 승인
function bookSignOn(order_id){
	var status = confirm("승인 처리가 맞으신가요?");
	//승인 확인
	if(status == true) {
		$.ajax({
			url:"${contextPath}/seller/bookingSignOn",
			type : 'GET',
			async: false ,
			dataType:"text",
			data : {
				order_id : order_id
				
			},
		    success: function (data) {
		    	console.log("성공");
		    	alert("승인 되었습니다😀");
		    	location.reload();
		    	
		    	
	        },
	        error: function(request, status, error, data) {
	        	console.log("error: " + error);
	        	console.log("message: " + request.responseText);
	        	console.log("Data::::: " + data);
	        	
	   }
	});
	}
	
} 
//낱개 승인
function bookSignOff(order_id){
	var status = confirm("거부 처리가 맞으신가요?");
	//승인 확인
	if(status == true) {
		$.ajax({
			url:"${contextPath}/seller/bookingSignOff",
			type : 'GET',
			async: false ,
			dataType:"text",
			data : {
				order_id : order_id
				
			},
		    success: function (data) {
		    	console.log("성공");
		    	alert("거부 되었습니다😀");
		    	location.reload();
		    	
		    	
	        },
	        error: function(request, status, error, data) {
	        	console.log("error: " + error);
	        	console.log("message: " + request.responseText);
	        	console.log("Data::::: " + data);
	        	
	   }
	});
	}
	
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
        <div class="col-sm-6">
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">메인</a></li>
              <li class="breadcrumb-item active">예약 관리</li>
              <li class="breadcrumb-item active">예약 승인/취소</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-9">
            <div class="card card-primary">
            <form action="#" id="bookSignForm">
              <div class="card-body p-0">
             <div class="mailbox-controls">
                <!-- Check all button -->
                <button type="button" class="btn btn-secondary checkbox-toggle"><i class="far fa-square"></i>
                </button>
                <div class="btn-group">
                  <button type="button" class="btn btn-secondary" onclick="groupSignOn()">
                   단체 승인
                  </button>
                  <button type="button" class="btn btn-secondary" onclick="groupSignOff()">
                   단체 거부
                  </button>
                </div>
				<div class="btn-group search-btn">
                        <button type="button" class="btn btn-success" onClick="location.href='${contextPath}/seller/bookingSign?period=today'">오늘</button>
                        <button type="button" class="btn btn-success" onClick="location.href='${contextPath}/seller/bookingSign?period=yesterday'">어제</button>
                        <button type="button" class="btn btn-success" onClick="location.href='${contextPath}/seller/bookingSign?period=all'">전체</button>
                      </div>
              </div>
              <div class="table-responsive mailbox-messages">
                <table class="table table-hover table-striped">
                <thead height="10" align="center" id="non-hover">
                <td></td>
				<td>신청일</td>
				<td>예약자 명</td>
				<td>예약 인원</td>
				<td>예약 일자</td>
				<td>예약 시간</td>
				<td>상태</td>
				<td>승인/거부</td>
			</thead>
                  <c:choose>
				<c:when test="${empty bookList}">
					<tr height="10" class="table-primary">
						<td colspan="6">
							<p align="center">
								<b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>
							</p>
						</td>
					</tr>
				</c:when>
				<c:when test="${!empty bookList}">
					<c:forEach var="book" items="${bookList}" varStatus="bookNum">	
						<tr align="center">
							<td><input type="checkbox" name="bookCheck" value="${book.order_id}" id="check${bookNum.index}" /> </td>
							<td><fmt:formatDate value="${book.reg_date}" pattern="yyyy-MM-dd" /></td>
							<td>${book.user_name}</td>
							<td>${book.count_pp}&nbsp;명</td>
							<td><fmt:formatDate value="${book.reserv_date}" pattern="yyyy-MM-dd" /></td>
							<td>
							<fmt:parseDate var="re_time" value="${book.reserv_time}" pattern="HH:mm"></fmt:parseDate>
							<fmt:formatDate value="${re_time}" pattern="HH:mm(a)" />
							</td>
							<c:choose>
								<c:when test="${book.reserv_status == 1}">
									<td>승인 대기</td>
								</c:when>
								<c:when test="${book.reserv_status == 2}">
									<td>승인</td>
								</c:when>
								<c:when test="${book.reserv_status == 3}">
									<td>거부</td>
								</c:when>
							</c:choose>
							<td>
							<button type="button" class="btn btn-success btn-sm" onclick="bookSignOn('${book.order_id}')">승인</button>
							&nbsp;
							<button type="button" class="btn btn-success btn-sm" onclick="bookSignOff('${book.order_id}')">거부</button>
							</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>                 
                </table>
                <!-- /.table -->
                <br>
		<nav class="paging">
  			<ul class="pagination pg-darkgrey">
  			<c:if test="${paging.prev == 'false'}">
    			<li class="page-item">
      				<a class="page-link" aria-label="Previous" href="#">
        				<span aria-hidden="true">&laquo;</span>
        				<span class="sr-only">Previous</span>
      				</a>
    			</li>
    		</c:if>
    		<c:if test="${paging.prev == 'true'}">
    			<li class="page-item">
      				<a class="page-link" aria-label="Previous" href="${contextPath}<%=viewName%>?page=${paging.startPage -1}">
        				<span aria-hidden="true">&laquo;</span>
        				<span class="sr-only">Previous</span>
      				</a>
    			</li>
    		</c:if>
    		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
    			<li <c:out value="${paging.nowPage == i ? 'class= page-item active' : 'class=page-item'}"/>>
    			<a class="page-link" href="${contextPath}<%=viewName%>?page=${i}">${i}</a>
    			</li>
    		</c:forEach>
    		<c:if test="${paging.next == 'false'}">
    			<li class="page-item">
      				<a class="page-link" aria-label="Next"  href="">
        				<span aria-hidden="true">&raquo;</span>
        				<span class="sr-only">Next</span>
      				</a>
    			</li>
    		</c:if>
    		<c:if test="${paging.next == 'true'}">
    			<li class="page-item">
      				<a class="page-link" aria-label="Next"  href="${contextPath}<%=viewName%>?page=${paging.endPage + 1}">
        				<span aria-hidden="true">&raquo;</span>
        				<span class="sr-only">Next</span>
      				</a>
    			</li>
    		</c:if>
  			</ul>
		</nav>
              </div>
              <!-- /.mail-box-messages -->
              </div>
              <!-- /.card-body -->
             </form>
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
</body>
</html>