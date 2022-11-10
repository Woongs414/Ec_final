<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="imgfilePath" value="C:/EATSEE/menu_image/menu" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
 <!--ajax -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>



<link rel="stylesheet" href="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.css" />
<script src="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.js"></script>



<meta charset="UTF-8">
<title>Insert title here</title>


<script>
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

  })
  
  
  //체크박스 선택한 개수 파악
	function count_checkbox(){
	var status = confirm("정말로 삭제하실건가요?");
	if(status == true) {
		var flag = false;
		var values = document.getElementsByName("admincheck");
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
			  form.action = "${contextPath}/admin/deletadmin";
			  form.mothod = "POST";
			  form.submit();
		}
	}

}   

</script>

<!-- 메시지 띄우기  -->
<c:choose>
	<c:when test="${result=='delete' }">
		<script>
			window.onload=function() {
				alert("관리자를 삭제하였습니다.😀");
			}
		</script>
	</c:when>
	<c:when test="${result=='deleteFailed' }">
		<script>
			window.onload=function() {
				alert("오류가 발생하였습니다.");
			}
		</script>
	</c:when>
	<c:when test="${result=='nodelete' }">
		<script>
			window.onload=function() {
				alert("권한이 필요합니다.");
			}
		</script>
	</c:when>
</c:choose>
</head>
<body>


<div class="content-wrapper" style="min-height: 856px;">
<section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>관리자 리스트</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">메인</a></li>
              <li class="breadcrumb-item active">관리자계정 관리</li>
              <li class="breadcrumb-item active">관리자 리스트</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    
	<section class="content">
      <div class="row">

        <!-- /.col -->
        <div class="col" id="leftdetail">
          <div class="card card-primary card-outline">
            <div class="card-header">
              <h3 class="card-title">관리자 리스트</h3>

			
              <div class="card-tools">
              <form action="/ec/searchmenu.do">
                <div class="input-group input-group-sm">
                  <input type="text" class="form-control" placeholder="이름 검색" name="search" value="">
                  <div class="input-group-append">
                    <button type="submit" class="btn btn-primary">
                      <i class="fas fa-search"></i> 
                    </button>
                  </div>
                </div>
                  </form>
              </div>
           
              <!-- /.card-tools -->
            </div>
            <!-- /.card-header -->
            
            <form action="#" id="deleteform">
            <div class="card-body p-0" id="searchload">
              <div class="mailbox-controls">
                <!-- Check all button -->
                <button type="button" class="btn btn-default btn-sm checkbox-toggle">
                <i class="far fa-square"></i>
                </button>
                <div class="btn-group">
                <%-- <c:if test=> --%>
                  <button type="button" class="btn btn-default btn-sm" id="btn-modal" onclick="btnmodalOn();">
                    <!-- <i class="fas fa-reply"></i> -->
                    <i class="ion ion-android-add" style="font-size: 13px;" onclick="btnmodalOn();"> 관리자 등록</i>
                  </button>
                 <%--  </c:if> --%>
                  <button type="button" class="btn btn-default btn-sm " onclick="count_checkbox()">
                    <i class="far fa-trash-alt" style="font-size: 13px;"> 관리자 삭제</i> 
                  </button>
                </div>

              </div>
            <div class="card-body table-responsive p-0 table-responsive mailbox-messages" style="height: 300px;">
                <table class="table table-head-fixed table-hover text-nowrap">
                    <tr style="background-color: white">
                      <th></th>
                      <th>아이디</th>
                      <th>이름</th>
                      <th>전화번호</th>
                      <th>이메일</th>
                      <th>권한</th>
                      <th>등록일</th>
                    </tr>
                  <tbody>
                  <c:forEach var="admin" items="${adminList }" varStatus="adminNum">
                  
                   <tr style="border-top: 1px solid #dee2e6;border-bottom: 1px solid #dee2e6;">
                    <td style="border-top: 0">
                      <div class="icheck-primary">
                        <input type="checkbox" name="admincheck" value="${admin.admin_id}" > 
                        <label ></label>
                      </div>
                    </td>
                    <!-- <td class="mailbox-star"><a href="#"><i class="fas fa-star text-warning"></i></a></td> -->
                    <td class="mailbox-name" style="border-top: 0"><a href="#" >${admin.admin_id }</a></td>
                    <td class="mailbox-subject zPfVt" style="border-top: 0">${admin.admin_name }</td>
                    <td class="mailbox-attachment" style="border-top: 0"><b>${admin.admin_tel }</b></td>
                    <td class="mailbox-date" style="border-top: 0">${admin.admin_email }</td>
                    <td style="padding-left: 25px;">
                    ${admin.level }</td>
                    <td>${admin.reg_date }</td>
                  </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
            </form>
            
            
            <!-- /.card-body -->
            <div class="card-footer p-0">
                <div class="mailbox-controls float-right">
                
                  <div class="btn-group">
                  <c:if test="${paging.startlistindex != 1}">
                    <button type="button" class="btn btn-default btn-sm" style="margin-right: 10px;" onclick="location.href='${contextPath}/admin/adminlist?page=${paging.nowPage - 1}'">
                      <i class="fas fa-chevron-left"></i>
                    </button>
                   </c:if>
                    <c:if test="${adminList.size() == 1}">
                		${paging.endlistindex }/${paging.adminCount }
                	</c:if>
                	<c:if test="${adminList.size() > 1}">
                  		${paging.startlistindex }-${paging.endlistindex }/${paging.adminCount }
                  	</c:if>
                    <c:if test="${paging.endlistindex != paging.adminCount}">
                    <button type="button" class="btn btn-default btn-sm" style="margin-left: 10px;"  onclick="location.href='${contextPath}/admin/adminlist?page=${paging.nowPage + 1}'" >
                      <i class="fas fa-chevron-right"></i>
                    </button>
                    </c:if>
                  </div>
                  <!-- /.btn-group -->
                </div>
                <!-- /.float-right -->
              </div>
            </div>
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
      </section>
      </div>



<%@ include file="/WEB-INF/views/admin/adminmag/admin_add.jsp" %>

</body>

<!--modal js  -->
 <script src="${contextPath }/js/admin_modal.js"></script>
</html>