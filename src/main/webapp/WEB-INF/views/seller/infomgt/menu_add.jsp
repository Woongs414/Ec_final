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
 <!--ajax -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<link rel="stylesheet" href="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.css" />
<script src="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.js"></script>
 <style>
        #modal.modal-overlay {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
        #modal .modal-window {
            width: 500px;
            height: 400px;
            position: relative;
            top: -200px;
            padding: 10px;  
            font-color:black;
            /* background: rgba( 69, 139, 197, 0.70 );   모달의 배경색 
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 ); */
            
        }
/*         #modal .title {
            padding-left: 10px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: white;
            
        }
        #modal .title h2 {
            display: inline;
        } */
        #modal .close-area {
            display: inline;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: white;
            font-size:18px;
            padding-bottom: 10px;
        }
        
        #modal .content {
            margin-top: 20px;
            padding: 0px 10px;
            color: #6c757d;
        }
        
        .vali {
        	color:red;
        	font-size:small;
        }
    </style>
    
<script type="text/javascript">
function checkAll(frm){
    var proprice = /^[0-9]+$/;
    var checkText = "";
    var check = null;
    var count = 0;

    var addproname = document.getElementById("inputName").value;
    var addprodesc = document.getElementById("inputDescription").value;
    var addproprice = document.getElementById("inputClientCompany").value;

    
    if(addproname.length == 0) {
    	$("#nameText").html("메뉴명을 입력해주세요");
    	count++;
    } else if(addproname.length > 10) {
    	$("#nameText").html("10글자 이내로 입력해주세요.");
    	count++;
    } else {
    	$("#nameText").html("");
    }
    
    if(addprodesc.length == 0){
    	$("#descText").html("내용을 입력해주세요");
    	count++;
    }else {
    	$("#descText").html("");
    }
    if (addproprice.length == 0){
    	checkText = "가격을 입력해주세요";
    	$("#priceText").html(checkText);
    	count++;
    } else if (!proprice.test(addproprice) ){
        checkText = "숫자만 입력해주세요";
        $("#priceText").html(checkText);
        count++;
   	} else {
    	$("#priceText").html("");
    }
    
    if (count >=1) {
         return false;
   	} else {
   	    frm.method="post";
   	    frm.action ="${contextPath}/menumadd.do";
   	    frm.submit();
   	}

    

}



</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="frm" enctype="multipart/form-data">
    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="content">
			<div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">메뉴 등록</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool close-area"  title="Collapse">
                  <i class="ion ion-android-close"></i>
                </button>
              </div>
            </div>
            <div class="card-body">
              <div class="form-group">
                <label for="inputName">메뉴명</label>
                <input type="text" id="inputName" class="form-control check" name="pro_name">
                <p id="nameText" class="vali"></p>
              </div>
              <div class="form-group">
                <label for="inputDescription">메뉴 설명</label>
                <textarea id="inputDescription" class="form-control check" rows="4" name="pro_desc"></textarea>
              	<p id="descText" class="vali"></p>
              </div>
              <div>
             <label for="meimg" style="">메뉴 이미지</label>
             </div>
               <div class="col-5 text-center" id="meimg" style="float: left;">
                    <img src="${contextPath }/image/no_img.png" alt="user-avatar" class="img-fluid" id="proimg" style="border-radius:10px; width:160px; height:160px">
                </div>
                  <div class="form-group" style="margin: 90px 0 0; float: right;">
                    <input id="fileName" class="form-control" value="파일선택" disabled="disabled" style="width:75%; display: inline;float: left;">
                    		<div class="fileRegiBtn">
                    		<label for="myFileUp"><i class="fas fa-search"></i></label>
                    		<input type="file" class="btn btn-primary" id="myFileUp" name="imageFileName" onchange="readURL(this);">
                    		</div>
                </div> 
              <div class="form-group" style="clear: both;">
                <label for="inputClientCompany">가격</label>
                <input type="text" id="inputClientCompany" class="form-control check" placeholder="숫자만 입력해주세요" name="pro_price">
              	<p id="priceText" class="vali"></p>
              </div>
              <input type="button" value="등록" class="btn btn-success float-right" onclick="checkAll(this.form);">
            </div>
            <!-- /.card-body -->
          
                
            </div>
        </div>
    </div>
    </div>
</form>
</body>
</html>