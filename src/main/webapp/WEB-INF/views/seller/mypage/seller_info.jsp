<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.css" />
<script src="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.js"></script>
<style type="text/css">
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

//이미지 파일 보이기
function readURL(input) {
	    	console.log("버튼클릭함1");
	        if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	                $('#storeimg').attr('src', e.target.result);        //cover src로 붙여지고
	                $('#fileName').attr('value',input.files[0].name);    //파일선택 form으로 파일명이 들어온다
	                $('#hiddenimg').attr('value',input.files[0].name);    
	        }
	          reader.readAsDataURL(input.files[0]);
	        }
	    }


//업체 소개 추가
function addinfo(frm){
   	    frm.method="post";
   	    frm.action="${contextPath}/addinfo.do";
   	    frm.submit();

}


//업체 소개 수정
function modinfo(frm){
   	    frm.method="post";
   	    frm.action="${contextPath}/modinfo.do";
   	    frm.submit();

}
</script>
<!-- 메시지 띄우기  -->
<c:choose>
	<c:when test="${result=='modinfosuccess' }">
		<script>
			window.onload=function() {
				alert("업제청보를 수정하였습니다.");
			}
		</script>
	</c:when>

</c:choose>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="content-wrapper" style="min-height: 1604.44px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>마이페이지</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">메인</a></li>
              <li class="breadcrumb-item active">마이페이지</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">

            <!-- Profile Image -->
            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                <c:if test="${empty sellerinfo.image_fileName}">
                 <img class="profile-user-img img-fluid img-circle" src="${contextPath}/store/download.do?seller_id=${sellerinfo.seller_id}&imageFileName=no_store_img.png" alt="seller profile picture">
                </c:if>
                <c:if test="${not empty sellerinfo.image_fileName}">
                	<img class="profile-user-img img-fluid img-circle" src="${contextPath}/store/download.do?seller_id=${sellerinfo.seller_id}&imageFileName=${sellerinfo.image_fileName}" alt="seller profile picture" style="width: 100px;height: 100px;">
                </c:if>
                  
                </div>

                <h3 class="profile-username text-center">${seller.seller_name}</h3>

                <p class="text-muted text-center">${sellerinfo.store_introduce }</p>

                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>누적 찜</b> <a class="float-right">${infosum.wish_sum }</a>
                  </li>
                  <li class="list-group-item">
                    <b>누적 리뷰</b> <a class="float-right">${infosum.review_sum }</a>
                  </li>
                  <li class="list-group-item">
                    <b>누적 예약</b> <a class="float-right">${infosum.book_sum }</a>
                  </li>
                </ul>

           <!--      <a href="#" class="btn btn-primary btn-block"><b>Follow</b></a> -->
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- /.card -->
          </div>
          <!-- /.col -->
          <div class="col-md-9">
            <div class="card">
              <div class="card-header p-2">
                <ul class="nav nav-pills">
                <li class="nav-item"><a class="nav-link active " href="#sellerinfo" data-toggle="tab">업체 정보</a></li>
                  <li class="nav-item"><a class="nav-link " href="#storeinfo" data-toggle="tab">업체 소개</a></li>
                  
                </ul>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">
      
                  <!-- /.tab-pane -->
                  <div class="tab-pane" id="storeinfo">
                    <!-- The timeline -->
                    <form enctype="multipart/form-data">
         <div class="card">
        <div class="card-body row">
        
          <div style=" margin: 0 auto;">
               <div class="text-center" >
               	<img src="${contextPath}/store/download.do?seller_id=${sellerinfo.seller_id}&imageFileName=${sellerinfo.image_fileName}" alt="user-avatar" class="img-fluid" style="border-radius:10px; width:299px; height:180px" id="storeimg">
                </div>
                <div class="form-group" style="margin: 40px 0 0 ;">
                    <input id="fileName" class="form-control" value="파일선택" disabled="disabled" style="width:75%; display: inline;float: left;">
                    		<div class="fileRegiBtn">
                    		<label for="myFileUp"><i class="fas fa-search"></i></label>
                    		<input type="file" class="btn btn-primary" id="myFileUp" name="imageFileName" onchange="readURL(this);">
                    		</div>
                </div>
          </div>
          <div class="col-7" style="margin: 10px  auto;">
            <div class="form-group">
              <label for="inputSubject">영업 시간 소개</label>
              <input type="text" id="inputSubject" class="form-control" placeholder="ex) 매일 9:00 ~ 9:00 / 브레이크 타임 15:30 ~ 16:30" name="openTime" value="${sellerinfo.openTime }">
            </div>
            
			<div class="row">
                    <div class="col-sm-6">
                      <!-- select -->
                      <div class="form-group">
                        <label>오픈시간</label>
                        <select class="form-control" name="open_time">
                          <option value="0500" <c:if test="${sellerinfo.open_time eq 0500}">selected</c:if>>05:00</option>
                          <option value="0600" <c:if test="${sellerinfo.open_time eq 0600}">selected</c:if>>06:00</option>
                          <option value="0700" <c:if test="${sellerinfo.open_time eq 0700}">selected</c:if>>07:00</option>
                          <option value="0800" <c:if test="${sellerinfo.open_time eq 0800}">selected</c:if>>08:00</option>
                          <option value="0900" <c:if test="${sellerinfo.open_time eq 0900}">selected</c:if>>09:00</option>
                          <option value="1000" <c:if test="${sellerinfo.open_time eq 1000}">selected</c:if>>10:00</option>
                          <option value="1100" <c:if test="${sellerinfo.open_time eq 1100}">selected</c:if>>11:00</option>
                          <option value="1200" <c:if test="${sellerinfo.open_time eq 1200}">selected</c:if>>12:00</option>
                          <option value="1300" <c:if test="${sellerinfo.open_time eq 1300}">selected</c:if>>13:00</option>
                          <option value="1400" <c:if test="${sellerinfo.open_time eq 1400}">selected</c:if>>14:00</option>
                          <option value="1500" <c:if test="${sellerinfo.open_time eq 1500}">selected</c:if>>15:00</option>
                          <option value="1600" <c:if test="${sellerinfo.open_time eq 1600}">selected</c:if>>16:00</option>
                          <option value="1700" <c:if test="${sellerinfo.open_time eq 1700}">selected</c:if>>17:00</option>
                          <option value="1800" <c:if test="${sellerinfo.open_time eq 1800}">selected</c:if>>18:00</option>
                          <option value="1900" <c:if test="${sellerinfo.open_time eq 1900}">selected</c:if>>19:00</option>
                          <option value="2000" <c:if test="${sellerinfo.open_time eq 2000}">selected</c:if>>20:00</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>마감시간</label>
                        <select class="form-control" name="close_time">
                          <option value="1300" <c:if test="${sellerinfo.close_time eq 1300}">selected</c:if>>13:00</option>
                          <option value="1400" <c:if test="${sellerinfo.close_time eq 1400}">selected</c:if>>14:00</option>
                          <option value="1500" <c:if test="${sellerinfo.close_time eq 1500}">selected</c:if>>15:00</option>
                          <option value="1600" <c:if test="${sellerinfo.close_time eq 1600}">selected</c:if>>16:00</option>
                          <option value="1700" <c:if test="${sellerinfo.close_time eq 1700}">selected</c:if>>17:00</option>
                          <option value="1800" <c:if test="${sellerinfo.close_time eq 1800}">selected</c:if>>18:00</option>
                          <option value="1900" <c:if test="${sellerinfo.close_time eq 1900}">selected</c:if>>19:00</option>
                          <option value="2000" <c:if test="${sellerinfo.close_time eq 2000}">selected</c:if>>20:00</option>
                          <option value="2100" <c:if test="${sellerinfo.close_time eq 2100}">selected</c:if>>21:00</option>
                          <option value="2200" <c:if test="${sellerinfo.close_time eq 2200}">selected</c:if>>22:00</option>
                          <option value="2300" <c:if test="${sellerinfo.close_time eq 2300}">selected</c:if>>23:00</option>
                          <option value="2400" <c:if test="${sellerinfo.close_time eq 2400}">selected</c:if>>24:00</option>
                          <option value="0100" <c:if test="${sellerinfo.close_time eq 0100}">selected</c:if>>01:00</option>
                          <option value="0200" <c:if test="${sellerinfo.close_time eq 0200}">selected</c:if>>02:00</option>
                          <option value="0300" <c:if test="${sellerinfo.close_time eq 0300}">selected</c:if>>03:00</option>
                          <option value="0400" <c:if test="${sellerinfo.close_time eq 0400}">selected</c:if>>04:00</option>
                          <option value="0500" <c:if test="${sellerinfo.close_time eq 0500}">selected</c:if>>05:00</option>
                          <option value="0600" <c:if test="${sellerinfo.close_time eq 0600}">selected</c:if>>06:00</option>
                          <option value="0700" <c:if test="${sellerinfo.close_time eq 0700}">selected</c:if>>07:00</option>
                          <option value="0800" <c:if test="${sellerinfo.close_time eq 0800}">selected</c:if>>08:00</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- select -->
                      <div class="form-group">
                        <label>예약 최소인원</label>
                        <select class="form-control" name="min_People">
                          <option value="1" <c:if test="${sellerinfo.min_People eq 1}">selected</c:if>>1</option>
                          <option value="2" <c:if test="${sellerinfo.min_People eq 2}">selected</c:if>>2</option>
                          <option value="3" <c:if test="${sellerinfo.min_People eq 3}">selected</c:if>>3</option>
                          <option value="4" <c:if test="${sellerinfo.min_People eq 4}">selected</c:if>>4</option>
                          <option value="5" <c:if test="${sellerinfo.min_People eq 5}">selected</c:if>>5</option>
                          <option value="6" <c:if test="${sellerinfo.min_People eq 6}">selected</c:if>>6</option>
                          <option value="7" <c:if test="${sellerinfo.min_People eq 7}">selected</c:if>>7</option>
                          <option value="8" <c:if test="${sellerinfo.min_People eq 8}">selected</c:if>>8</option>
                          <option value="9" <c:if test="${sellerinfo.min_People eq 9}">selected</c:if>>9</option>
                          <option value="10" <c:if test="${sellerinfo.min_People eq 10}">selected</c:if>>10</option>
                          <option value="11" <c:if test="${sellerinfo.min_People eq 11}">selected</c:if>>11</option>
                          <option value="12" <c:if test="${sellerinfo.min_People eq 12}">selected</c:if>>12</option>
                          <option value="13" <c:if test="${sellerinfo.min_People eq 13}">selected</c:if>>13</option>
                          <option value="14" <c:if test="${sellerinfo.min_People eq 14}">selected</c:if>>14</option>
                          <option value="15" <c:if test="${sellerinfo.min_People eq 15}">selected</c:if>>15</option>
                          
                        </select>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>예약 최대인원</label>
                        <select class="form-control" name="max_People">
                          <option value="1" <c:if test="${sellerinfo.max_People eq 1}">selected</c:if>>1</option>
                          <option value="2" <c:if test="${sellerinfo.max_People eq 2}">selected</c:if>>2</option>
                          <option value="3" <c:if test="${sellerinfo.max_People eq 3}">selected</c:if>>3</option>
                          <option value="4" <c:if test="${sellerinfo.max_People eq 4}">selected</c:if>>4</option>
                          <option value="5" <c:if test="${sellerinfo.max_People eq 5}">selected</c:if>>5</option>
                          <option value="6" <c:if test="${sellerinfo.max_People eq 6}">selected</c:if>>6</option>
                          <option value="7" <c:if test="${sellerinfo.max_People eq 7}">selected</c:if>>7</option>
                          <option value="8" <c:if test="${sellerinfo.max_People eq 8}">selected</c:if>>8</option>
                          <option value="9" <c:if test="${sellerinfo.max_People eq 9}">selected</c:if>>9</option>
                          <option value="10" <c:if test="${sellerinfo.max_People eq 10}">selected</c:if>>10</option>
                          <option value="11" <c:if test="${sellerinfo.max_People eq 11}">selected</c:if>>11</option>
                          <option value="12" <c:if test="${sellerinfo.max_People eq 12}">selected</c:if>>12</option>
                          <option value="13" <c:if test="${sellerinfo.max_People eq 13}">selected</c:if>>13</option>
                          <option value="14" <c:if test="${sellerinfo.max_People eq 14}">selected</c:if>>14</option>
                          <option value="15" <c:if test="${sellerinfo.max_People eq 15}">selected</c:if>>15</option>
                        </select>
                      </div>
                    </div>
                  </div>
                   <div class="col-sm-6" style="padding-left: 0">
                      <div class="form-group">
                        <label>예약금</label>
                        <select class="form-control" name="reserv_pay" >
                          <option value="0" <c:if test="${sellerinfo.reserv_pay eq 0}">selected</c:if> >없음</option>
                          <option value="10000" <c:if test="${sellerinfo.reserv_pay eq 10000}">selected</c:if>>10,000</option>
                        </select>
                      </div>
                    </div>
            <div class="form-group">
              <label for="inputcloseDay">휴무일</label>
              <input type="text" id="inputcloseDay" class="form-control" placeholder="ex) 연중무휴" name="closeDay" value="${sellerinfo.closeDay}">
            </div>
            <div class="form-group">
              <label for="inputbenefit">편의 시설</label>
              <input type="text" id="inputbenefit" class="form-control" placeholder="ex) 단체석, 포장, 주차, 남/녀 화장실 구분 " name="store_benefit"  value="${sellerinfo.store_benefit}">
            </div>
            <div class="form-group">
              <label for="inputMessage">가게 소개</label>
              <textarea id="inputMessage" class="form-control" rows="4" name="store_introduce">${sellerinfo.store_introduce }</textarea>
            </div>
            <div class="form-group" style="float: right">
                <c:if test="${infostatus eq 0 }">
                  <button type="button" class="btn btn-primary" onclick="addinfo(this.form);">등록</button>
                 </c:if>
                 <c:if test="${infostatus eq 1 }">
                  <button type="button" class="btn btn-primary" onclick="modinfo(this.form);">수정</button>
                 </c:if>
            </div>
          </div>
          
        </div>
      </div>
      </form>
                  </div>
                  <!-- /.tab-pane -->
				<!-- 업체 정보 수정  -->
                  <div class="tab-pane active" id="sellerinfo">
				<form method="post" action="${contextPath }/modseller.do">
                <div class="card-body">
				  <div class="form-group">
                        <label>가게 아이디</label>
                        <input type="text" class="form-control" placeholder="Enter ..." disabled value="${seller.seller_id }">
                  </div>
                  <div class="form-group">
                        <label>사업자번호</label>
                        <input type="text" class="form-control" placeholder="Enter ..." disabled value="${seller.seller_bizReg }">
                      </div>
                  <div class="form-group">
                    <label for="seller_tel">전화번호</label>
                    <input class="form-control" id="seller_tel" name="seller_tel" type="text" placeholder="'-' 없이 작성" value="${seller.seller_tel }">
                  </div>
                  <div class="form-group">
                    <label for="seller_tel">상호명</label>
                    <input class="form-control" id="seller_name" name="seller_name" type="text" value="${seller.seller_name }">
                  </div>
                  <label for="seller_email">이메일</label>
                  <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                  </div>
                  <input type="email" name="seller_email" class="form-control" placeholder="Email" id="seller_email" value="${seller.seller_email }">
                </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- select -->
                      <div class="form-group">
                        <label>지역</label>
                        <select class="form-control" name="area">
                          	<%-- <option hidden><%=searcharea %></option> --%>
						  	<option value="null">전체</option>
						  	<option value="서울특별시" <c:if test="${seller.area eq '서울특별시'}">selected</c:if>>서울특별시</option>
						  	<option value="인천광역시" <c:if test="${seller.area eq '인천광역시'}">selected</c:if>>인천광역시</option>
						  	<option value="광주광역시" <c:if test="${seller.area eq '광주광역시'}">selected</c:if>>광주광역시</option>
						  	<option value="대구광역시" <c:if test="${seller.area eq '대구광역시'}">selected</c:if>>대구광역시</option>
						  	<option value="광주광역시" <c:if test="${seller.area eq '광주광역시'}">selected</c:if>>광주광역시</option>
						  	<option value="울산광역시" <c:if test="${seller.area eq '울산광역시'}">selected</c:if>>울산광역시</option>
						  	<option value="대전광역시" <c:if test="${seller.area eq '대전광역시'}">selected</c:if>>대전광역시</option>
						  	<option value="부산광역시" <c:if test="${seller.area eq '부산광역시'}">selected</c:if>>부산광역시</option>
						  	<option value="세종특별자치시" <c:if test="${seller.area eq '세종특별자치시'}">selected</c:if>>세종특별자치시</option>
						  	<option value="경기도" <c:if test="${seller.area eq '경기도'}">selected</c:if>>경기도</option>
						  	<option value="강원도" <c:if test="${seller.area eq '강원도'}">selected</c:if>>강원도</option>
						  	<option value="충청남도" <c:if test="${seller.area eq '충청남도'}">selected</c:if>>충청남도</option>
						  	<option value="충청북도" <c:if test="${seller.area eq '충청북도'}">selected</c:if>>충청북도</option>
						  	<option value="경상북도" <c:if test="${seller.area eq '경상북도'}">selected</c:if>>경상북도</option>
						  	<option value="경상남도" <c:if test="${seller.area eq '경상남도'}">selected</c:if>>경상남도</option>
						  	<option value="전라북도" <c:if test="${seller.area eq '전라북도'}">selected</c:if>>전라북도</option>
						  	<option value="전라남도" <c:if test="${seller.area eq '전라남도'}">selected</c:if>>전라남도</option>
						  	<option value="제주도" <c:if test="${seller.area eq '제주도'}">selected</c:if>>제주도</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>업종</label>
                        <select class="form-control" disabled="">
                          <option <c:if test="${seller.category_code eq '10'}">selected</c:if>>먹거리</option>
                          <option <c:if test="${seller.category_code eq '20'}">selected</c:if>>볼거리</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  
             <div class="form-group">
                  <!--  우편번호 찾기 다음 API -->
                 <label>주소</label>
                <div class="row">
                <div class="col-3" style="float : left">
                    <input type="text" id="sample6_postcode" class="form-control" placeholder="" value="${seller.addr_num }" name="addr_num">
                </div>
                <button type="button" class="btn btn-block btn-light btn-sm col-1" onclick="sample6_execDaumPostcode()" id="postBtn"><span style="font-size: small">우편번호</span>&nbsp;&nbsp;<i class="ion ion-chevron-right"></i></button>
                </div>
                <input class="form-control mt-1" id="seller_addr" name="seller_addr" type="text" placeholder="주소" value="${seller.seller_addr }">
                <input class="form-control mt-1" id="seller_detailaddr" name = "seller_detailaddr"  type="text" placeholder="상세주소" value="${seller.seller_detailaddr }">
             </div>
             
             
             <div class="form-group">
             <label>키워드</label>
                <div class="row">
                  <div class="col-4">
                    <input type="text" class="form-control" placeholder="키워드1" name="key01" id="key01" value="${keyword[0]}">
                  </div>
                  <div class="col-4">
                    <input type="text" class="form-control" placeholder="키워드2" name="key02" id="key02" value="${keyword[1]}">
                  </div>
                  <div class="col-4">
                    <input type="text" class="form-control" placeholder="키워드3" name="key03" id="key03" value="${keyword[2]}">
                  </div>
                </div>
              </div>
              
                <!-- /.card-body -->
				</div>
                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">수정</button>
                </div>
                
              </form>
                  </div>
                  <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
              </div><!-- /.card-body -->
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






<%-- <div class="content-wrapper" style="min-height: 2171.31px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>내 정보 수정</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">메인</a></li>
              <li class="breadcrumb-item active">마이페이지</li>
              <li class="breadcrumb-item active">정보 수정</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Quick Example</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form>
                <div class="card-body">
				  <div class="form-group">
                        <label>가게 아이디</label>
                        <input type="text" class="form-control" placeholder="Enter ..." disabled="">
                  </div>
                  <div class="form-group">
                        <label>사업자번호</label>
                        <input type="text" class="form-control" placeholder="Enter ..." disabled="">
                      </div>
                  <div class="form-group">
                    <label for="seller_tel">전화번호</label>
                    <input class="form-control" id="seller_tel" type="text" placeholder="'-' 없이 작성">
                  </div>
                  <div class="form-group">
                    <label for="seller_tel">상호명</label>
                    <input class="form-control" id="seller_tel" type="text">
                  </div>
                  <label for="seller_email">이메일</label>
                  <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                  </div>
                  <input type="email" class="form-control" placeholder="Email" id="seller_email">
                </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- select -->
                      <div class="form-group">
                        <label>지역</label>
                        <select class="form-control">
                          	<option hidden><%=searcharea %></option>
						  	<option value="null">전체</option>
						  	<option value="서울특별시" <c:if test="${area eq '서울특별시'}">selected</c:if>>서울특별시</option>
						  	<option value="인천광역시" <c:if test="${area eq '인천광역시'}">selected</c:if>>인천광역시</option>
						  	<option value="광주광역시" <c:if test="${area eq '광주광역시'}">selected</c:if>>광주광역시</option>
						  	<option value="대구광역시" <c:if test="${area eq '대구광역시'}">selected</c:if>>대구광역시</option>
						  	<option value="광주광역시" <c:if test="${area eq '광주광역시'}">selected</c:if>>광주광역시</option>
						  	<option value="울산광역시" <c:if test="${area eq '울산광역시'}">selected</c:if>>울산광역시</option>
						  	<option value="대전광역시" <c:if test="${area eq '대전광역시'}">selected</c:if>>대전광역시</option>
						  	<option value="부산광역시" <c:if test="${area eq '부산광역시'}">selected</c:if>>부산광역시</option>
						  	<option value="세종특별자치시" <c:if test="${area eq '세종특별자치시'}">selected</c:if>>세종특별자치시</option>
						  	<option value="경기도" <c:if test="${area eq '경기도'}">selected</c:if>>경기도</option>
						  	<option value="강원도" <c:if test="${area eq '강원도'}">selected</c:if>>강원도</option>
						  	<option value="충청남도" <c:if test="${area eq '충청남도'}">selected</c:if>>충청남도</option>
						  	<option value="충청북도" <c:if test="${area eq '충청북도'}">selected</c:if>>충청북도</option>
						  	<option value="경상북도" <c:if test="${area eq '경상북도'}">selected</c:if>>경상북도</option>
						  	<option value="경상남도" <c:if test="${area eq '경상남도'}">selected</c:if>>경상남도</option>
						  	<option value="전라북도" <c:if test="${area eq '전라북도'}">selected</c:if>>전라북도</option>
						  	<option value="전라남도" <c:if test="${area eq '전라남도'}">selected</c:if>>전라남도</option>
						  	<option value="제주도" <c:if test="${area eq '제주도'}">selected</c:if>>제주도</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>업종</label>
                        <select class="form-control" disabled="">
                          <option>먹거리</option>
                          <option>볼거리</option>
                        </select>
                      </div>
                    </div>
                  </div>
             
                <div class="row">
                  <div class="col-4">
                    <input type="text" class="form-control" placeholder=".col-3">
                  </div>
                  <div class="col-4">
                    <input type="text" class="form-control" placeholder=".col-4">
                  </div>
                  <div class="col-4">
                    <input type="text" class="form-control" placeholder=".col-5">
                  </div>
                </div>
              
                <!-- /.card-body -->
				</div>
                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
                
              </form>
            
            <!-- /.card -->
			</div>
			</div>
        </div>
        </div>
    </section>
    <!-- /.content -->
  </div> --%>
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
                    document.getElementById("seller_detailaddr").value = extraAddr;
                
                } else {
                    document.getElementById("seller_detailaddr").value = '';
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

</body>
</html>