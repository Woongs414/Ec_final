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
<style type="text/css">
.zPfVt {
  display: inline-block;
  overflow: hidden;
  text-overflow: ellipsis;
  width:400px;
  white-space :nowrap;
  vertical-align: top;
}

/* 이미지 파일 선택 라벨 */

.fileRegiBtn label {
	float: right;
	display: inline-block; 
	padding: .5em .75em; 
	color: #ffffff; 
	font-size: inherit; 
	line-height: normal; 
	vertical-align: middle; 
	background-color: #FC7D01; 
	cursor: pointer; 
	border: 1px solid #ebebeb; 
	border-bottom-color: #e2e2e2; 
	border-radius: .25em;
}

/*파일선택시 선택된 파일명이 붙는것을 가려준다*/
.fileRegiBtn input[type="file"]{
	position: absolute; 
	width: 1px; 
	height: 1px; 
	padding: 0; 
	margin: -1px; 
	overflow: hidden; 
	clip:rect(0,0,0,0); 
	border: 0;
}

</style>
<script type="text/javascript">
<%
String searchword = request.getParameter("search");
if(searchword == null || searchword.equals("null")) {
	searchword = "";
}
%>

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
		var values = document.getElementsByName("menucheck");
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
			  form.action = "${contextPath}/deletemenu.do";
			  form.mothod = "GET";
			  form.submit();
		}
	}

}   

//낱개 삭제
function delonemenu(pro_num,seller_id){
	var status = confirm("정말로 삭제하실건가요?");
	//삭제 확인
	if(status == true) {
		$.ajax({
			url:"${contextPath}/delonemenu.do",
			type : 'POST',
			async: false ,
			dataType:"text",
			data : {
				pro_num : pro_num,
				seller_id : seller_id
				
			},
		    success: function (data) {
		    	console.log("성공");
		    	alert("삭제 되었습니다😀");
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

//메뉴 상세 닫기
function detailclose(){
	$(".col-md-3").remove();
}

//메뉴 상세
function menudetail(pro_num) {
	$.ajax({
		url:"${contextPath}/menudetail.do",
		type : 'POST',
		data : {
			pro_num : pro_num
			
		},
	    success: function (data) {
	    	$(".col-md-3").remove();
	    	let $detail = `<div class="col-md-3" >
	    	<div class="card bg-light d-flex flex-fill">
                <div class="card-header text-muted border-bottom-0 small">
                메뉴 상세보기
                <a href="#" id="detailclose">
                <i class="ion ion-ios-close-empty" style="float:right;font-size:25px;color:gray"></i>
              </a>
              </div>
              <div class="card-body pt-0">
                <div class="row">
                  <div class="col-7">
                    <h2 class="lead"><b id="proname" style="font-size:1.2rem"></b></h2>
                    <p class="text-muted text-sm" id="prodesc"></p>
                    <ul class="ml-4 mb-0 fa-ul text-muted">
                      <li ><span class="fa-li"><i class="fas fa-sharp fa-solid fa-coins" style="font-size:15px"></i></span><span id="proprice"></span></li>
                      <li class="small"><span class="fa-li"><i class="ion ion-android-alarm-clock" style="font-size:15px;padding-right: 8px;"></i></span><span id="regdate" class="small"></span></li>
                    </ul>
                  </div>
                  <div class="col-5 text-center">
                    <img src="" alt="user-avatar" class="img-fluid" id="proimg" style="border-radius:10px;">
                  </div>
                </div>
              </div>
              <div class="card-footer">
                <div class="text-right">
                  <a href="#" class="btn btn-sm bg-teal" id="menumod">
                    <i class="ion ion-compose" style="font-size:18px"></i> 수정하기
                  </a>
                  <a href="#" class="btn btn-sm btn-danger" id="delmenu">
                    <i class="ion ion-ios-trash" style="font-size:18px"></i> 삭제하기
                  </a>
                </div>
              </div>
            </div>
            </div>
            `;
	    	$("#leftdetail").before($detail);
	    	$("#delmenu").attr('onclick','delonemenu("' + data.pro_num + '" , "' + data.seller_id + '")');
	    	$("#menumod").attr('onclick','menu_mod("' + data.pro_num + '" , "' + data.seller_id + '")');
	    	$("#detailclose").attr('onclick','detailclose();');
	    	$("#proname").append(data.pro_name);
	    	
	    	if(data.pro_img == null && data.category_code == "10"){
	    		$("#proimg").attr('src','${contextPath}/noimg/download.do?imageFileName=no_menu_img.png');
	    	} else if (data.pro_img == null && data.category_code == "20"){
	    		$("#proimg").attr('src','${contextPath}/noimg/download.do?imageFileName=no_price_img.png');
	    	} else {
	    		$("#proimg").attr('src','${contextPath}/menu/download.do?seller_id=' + data.seller_id + '&imageFileName=' + data.pro_img);
	    	}
	    	
	    	$("#prodesc").append(data.pro_desc);
	    	$("#regdate").append('등록일 : ' + data.reg_date);
	    	if(data.mod_date != null) {
	    		$("#regdate").append('<br> 수정일 : ' + data.mod_date);
	    	}
	    	
	    	/* 정규식 사용하여 가격 , 입력 */
	    	$("#proprice").append(data.pro_price.replace(/\B(?=(\d{3})+(?!\d))/g, ',') +' 원');
	    	//$("#proprice").append(data.pro_price +' 원');
	    	
        },
        error: function(request, status, error, data) {
        	console.log("error: " + error);
        	console.log("message: " + request.responseText);
        	console.log("Data::::: " + data);
        	
        }
	});
}



//메뉴 수정창
function menu_mod(pro_num, seller_id) {
	$.ajax({
		url:"${contextPath}/menudetail.do",
		type : 'POST',
		data : {
			pro_num : pro_num,
			seller_id:seller_id
			
		},
	    success: function (data) {
	    	$(".col-md-3").remove();
	    	let $detail = `<div class="col-md-3" >
	    	<form enctype="multipart/form-data" onsubmit="return false;">
	    	<input type="hidden" name="pro_num" id="hideennum">
	    	<input type="hidden" name="seller_id" id="hiddenselid">
	    	<input type="hidden" name="pro_img" id="hiddenimg">
	    	<div class="card bg-light d-flex flex-fill">
                <div class="card-header text-muted border-bottom-0 small">
                메뉴 수정
                <a href="#" id="detailclose">
                <i class="ion ion-ios-close-empty" style="float:right;font-size:25px;color:gray"></i>
              </a>
              </div>
              <div class="card-body pt-0">
                <div class="row">
                  <div class="col-7">
                  <p class="text-muted text-sm">
                  	<label for="proname" class="form-label">메뉴명</label>
                  	<input class="form-control lead" type="text" id="proname" name="pro_name" aria-label="default input example">
                  	<p id="proname_p" class="vali"></p>
              		</p>
                    <p class="text-muted text-sm">
	                    <label for="prodesc" class="form-label">메뉴 설명</label>
	                    <textarea class="form-control" id="prodesc" rows="3" name="pro_desc"></textarea>
	                    <p id="prodesc_p" class="vali"></p>
	                </p>
                   
                    <p class="text-muted text-sm">
                    <label for="proprice" class="form-label">가격</label>
                    <input class="form-control lead" type="text" id="proprice" aria-label="default input example" name="pro_price"/>
                   	<p id="proprice_p" class="vali"></p> 
                    </p>
                  </div>
                  
                  <div class="col-5 text-center">
                    <img src="" alt="no-image" class="img-fluid" id="proimg" style="border-radius:10px; width:143px; height:143px">
                    <div class="form-group" style="margin: 8px 0 8px;">
                    <input id="fileName" class="form-control" value="파일선택" disabled="disabled" style="width:65%; display: inline; float:left">
	             		<div class="fileRegiBtn">
	            		<label for="myFileUp"><i class="fas fa-search"></i></label>
	            		<input type="file" class="btn btn-primary" id="myFileUp" name="imageFileName" onchange="readURL(this);">
	            		</div>

                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer">
                <div class="text-right">
                  <button type="submit" class="btn btn-sm bg-teal" onclick="checkmod(this.form);">
                    <i class="ion ion-compose" style="font-size:18px"></i> 수정완료
                  </button>
                </div>
              </div>
            </div>
            </form>
            </div>
            `;
	    	$("#leftdetail").before($detail);
	    	$("#delmenu").attr('onclick','delonemenu("' + data.pro_num + '" , "' + data.seller_id + '")');
	    	$("#proname").attr('value',data.pro_name);
	    	$("#hideennum").attr('value',data.pro_num);
	    	$("#hiddenselid").attr('value',data.seller_id);
	    	$("#detailclose").attr('onclick','detailclose();');
	    	$("#proimg").attr('src','${contextPath}/menu/download.do?seller_id=' + data.seller_id + '&imageFileName=' + data.pro_img);
	    	$("#prodesc").append(data.pro_desc);
	    	$("#regdate").append('등록일 : ' + data.reg_date);
	    	if(data.mod_date != null) {
	    		$("#regdate").append('<br> 수정일 : ' + data.mod_date);
	    	}
	    	
	    	/* 정규식 사용하여 가격 , 입력 */
	    	$("#proprice").attr('value',data.pro_price);
	    	
        },
        error: function(request, status, error, data) {
        	console.log("error: " + error);
        	console.log("message: " + request.responseText);
        	console.log("Data::::: " + data);
        	
        }
	});
}

//메뉴 수정 정규식
function checkmod(frm){
    var proprice = /^[0-9]+$/;
    var checkText = "";
    var check = null;
    var count = 0;

    var modproname = document.getElementById("proname").value;
    var modprodesc = document.getElementById("prodesc").value;
    var modproprice = document.getElementById("proprice").value;

    
    if(modproname.length == 0) {
    	$("#proname_p").html("메뉴명을 입력해주세요");
    	count++;
    } else if(modproname.length > 10) {
    	$("#proname_p").html("10글자 이내로 입력해주세요.");
    	count++;
    } else {
    	$("#proname_p").html("");
    }
    
    if(modprodesc.length == 0){
    	$("#prodesc_p").html("내용을 입력해주세요");
    	count++;
    }else {
    	$("#prodesc_p").html("");
    }
    if (modproprice.length == 0){
    	checkText = "가격을 입력해주세요";
    	$("#proprice_p").html(checkText);
    	count++;
    } else if (!proprice.test(modproprice) ){
        checkText = "숫자만 입력해주세요";
        $("#proprice_p").html(checkText);
        count++;
   	} else {
    	$("#proprice_p").html("");
    }
    
    if (count >=1) {
    	return false;
   	} else {
   	    frm.method="post";
   	    frm.action="${contextPath}/menumod.do";
   	    frm.submit();
   	}

    

}


//이미지 파일 보이기
function readURL(input) {
	    	console.log("버튼클릭함1");
	        if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	                $('#proimg').attr('src', e.target.result);        //cover src로 붙여지고
	                $('#fileName').attr('value',input.files[0].name);    //파일선택 form으로 파일명이 들어온다
	                $('#hiddenimg').attr('value',input.files[0].name);    
	        }
	          reader.readAsDataURL(input.files[0]);
	        }
	    }


</script>
<!-- 메시지 띄우기  -->
<c:choose>
	<c:when test="${result=='deletesuccess' }">
		<script>
			window.onload=function() {
				alert("삭제 되었습니다😀");
			}
		</script>
	</c:when>
</c:choose>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="content-wrapper">
<section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>메뉴 관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="${contextPath}/sellerMain">메인</a></li>
              <li class="breadcrumb-item active">정보 관리</li>
              <li class="breadcrumb-item active">메뉴 관리</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
	<section class="content">
      <div class="row">
      <!--<div class="col-md-3" >
       <div class="card bg-light d-flex flex-fill">
                <div class="card-header text-muted border-bottom-0">
                  Digital Strategist
                </div>
                <div class="card-body pt-0">
                  <div class="row">
                    <div class="col-7">
                      <h2 class="lead"><b>Nicole Pearson</b></h2>
                      <p class="text-muted text-sm"><b>About: </b> Web Designer / UX / Graphic Artist / Coffee Lover </p>
                      <ul class="ml-4 mb-0 fa-ul text-muted">
                        <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span> Address: Demo Street 123, Demo City 04312, NJ</li>
                        <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span> Phone #: + 800 - 12 12 23 52</li>
                      </ul>
                    </div>
                    <div class="col-5 text-center">
                      <img src="../../dist/img/user1-128x128.jpg" alt="user-avatar" class="img-circle img-fluid">
                    </div>
                  </div>
                </div>
                <div class="card-footer">
                  <div class="text-right">
                    <a href="#" class="btn btn-sm bg-teal">
                      <i class="fas fa-comments"></i>
                    </a>
                    <a href="#" class="btn btn-sm btn-primary">
                      <i class="fas fa-user"></i> View Profile
                    </a>
                  </div>
                </div>
              </div>

      
        </div> -->
        <!-- /.col -->
        <div class="col" id="leftdetail">
          <div class="card card-primary card-outline">
            <div class="card-header">
              <h3 class="card-title">메뉴 관리</h3>

			
              <div class="card-tools">
              <form action="${contextPath}/searchmenu.do">
                <div class="input-group input-group-sm">
                  <input type="text" class="form-control" placeholder="메뉴명 검색"  name="search" value="<%= searchword %>">
                  <div class="input-group-append">
                    <button type="submit" class="btn btn-primary" >
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
                <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="far fa-square"></i>
                </button>
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-sm" id="btn-modal" onclick="btnmodalOn();">
                    <!-- <i class="fas fa-reply"></i> -->
                    <i class="ion ion-android-add" style="font-size: 18px;" ></i>
                  </button>
                  <button type="button" class="btn btn-default btn-sm" onclick="count_checkbox()">
                    <i class="far fa-trash-alt"></i>
                  </button>
                </div>

              </div>
              <div class="table-responsive mailbox-messages">
                <table class="table table-hover table-striped">
                
                  <tbody>
                  <c:forEach var="menu" items="${menuList }" varStatus="menuNum">
                  <tr style="border-top: 1px solid #dee2e6;border-bottom: 1px solid #dee2e6">
                    <td style="border-top: 0">
                      <div class="icheck-primary">
                        <input type="checkbox" name="menucheck" value="${menu.pro_num }" id="check${menuNum.index }"> <!-- 아이디 증가해야함  -->
                        <label for="check${menuNum.index }"></label>
                      </div>
                    </td>
                    <!-- <td class="mailbox-star"><a href="#"><i class="fas fa-star text-warning"></i></a></td> -->
                    <td class="mailbox-name" style="border-top: 0"><a href="#" onclick="menudetail(${menu.pro_num})">${menu.pro_name }</a></td>
                    <td class="mailbox-subject zPfVt" style="border-top: 0">${menu.pro_desc }</td>
                    <td class="mailbox-attachment" style="border-top: 0"><b><fmt:formatNumber value="${menu.pro_price }" pattern="#,###"/></b></td>
                    <td class="mailbox-date" style="border-top: 0">
	                    <b>
	                    <c:if test="${menu.reg_days eq 0}">
	                    	today
	                    </c:if>
	                    <c:if test="${menu.reg_days ne 0}">
	                    	${menu.reg_days } days ago
	                    </c:if>
	          			</b>
          			</td>
                  </tr>
       			</c:forEach>
                  </tbody>
                  
                </table>
                <!-- /.table -->
              </div>
              <!-- /.mail-box-messages -->
            </div>
            </form>
            <!-- /.card-body -->
            <div class="card-footer p-0">
                <div class="mailbox-controls float-right">
                 <c:if test="${menuList.size() == 1}">
                		${paging.endlistindex }/${paging.menuCount }
                	</c:if>
                	<c:if test="${menuList.size() > 1}">
                  		${paging.startlistindex }-${paging.endlistindex }/${paging.menuCount }
                  	</c:if>
                  <div class="btn-group">
                    <c:if test="${paging.startlistindex != 1}">
                    <button type="button" class="btn btn-default btn-sm" style="margin-right: 10px;" onclick="location.href='${contextPath}/menumanage.do?page=${paging.nowPage - 1}'">
                      <i class="fas fa-chevron-left"></i>
                    </button>
                   </c:if>
                   <c:if test="${paging.endlistindex != paging.menuCount}">
                    <button type="button" class="btn btn-default btn-sm" style="margin-left: 10px;"  onclick="location.href='${contextPath}/menumanage.do?page=${paging.nowPage + 1}'" >
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
      </div>
      <!-- /.row -->
      
    </section>
<%@ include file="/WEB-INF/views/seller/infomgt/menu_add.jsp" %>

</body>

<!--modal js  -->
 <script src="${contextPath }/js/menu_modal.js"></script>
</html>