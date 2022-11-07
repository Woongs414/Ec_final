<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>글보기</title>
<style>

#left-imageslide{
	margin-top: 10%;
	margin-bottom: 10%;
	margin-right: 5%;
	margin-left: 8%;
	width:550px;
	float: left;
}

#write{
	display: inline-block;
	margin-top: 5%;
	margin-bottom: 10%;
	width: 40%;
	height: 60%; 
}
#comments-div{
	display:inline-block;
	padding: 0;
	width: 100%;

}
#tr_btn_modify {
	display: none;
}
#tr_file_upload{
	display: none;
}
#preview{
	width: 200px;
	height: 200px;
}

.writebtn{
	display:inline-block;
	float: right;
	margin-bottom: 30px;
}
#reply-btn{
	float: right;

}
.comment-count{
	border-bottom: 1px solid gray;
}
#non-topborder{
	border-bottom: 1px;
}
#not-comment{
	margin: 0;
}
#table-comment{
	border: none;
}

#comment-td{
	padding-left: 15px;
}
.main_title{
	width: 300px;
	display: block;
	margin: 0 auto;
}
.lNb{
	display: inline-block;
}
.likebtn{
	float: left;
	border: none;
	background-color: white;
}
.badbtn{
	float: right;
	border: none;
	background-color: white;
}
.likeNbad{
	width: 330px;
	margin: 20px auto;
}
.modBoard_btn{
	float: left;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script type="text/javascript">

	function backToList(obj){
		obj.action="${contextPath}/user/u_board/eatpl";
		obj.submit();
	}	
	function fn_modify_article(obj){
		obj.action="${contextPath}/user/u_board/mod_board";
		obj.submit();
	}
	
	function fn_remove_article(url,list_num){
		var form = document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("action", url);
		var list_numInput = document.createElement("input");
		list_numInput.setAttribute("type", "hidden");
		list_numInput.setAttribute("name", "list_num");
		list_numInput.setAttribute("value", list_num);
		
		form.appendChild(list_numInput);
		document.body.appendChild(form);
		form.submit();
	}
	
	function fn_mod_article(url,list_num){
		var form = document.createElement("form");
		form.setAttribute("method", "GET");
		form.setAttribute("action", url);
		var list_numInput = document.createElement("input");
		list_numInput.setAttribute("type", "hidden");
		list_numInput.setAttribute("name", "list_num");
		list_numInput.setAttribute("value", list_num);
		
		form.appendChild(list_numInput);
		document.body.appendChild(form);
		form.submit();
	}
/* 	function likeValidation(list_num,user_id){
		var list_num = list_num;
		var user_id = user_id;
		console.log(user_id);
		var liked = ${liked};
			if(liked == 1){
			likeDown(list_num,user_id);
			}else{
			likeUp(list_num,user_id);
			}
		}

	function likeUp(list_num,user_id) {
		var user_id = user_id;
		$.ajax({
			url:"${contextPath}/user/u_board/likeUp",
			type : 'POST',
			dataType:"text",
			data : {
				list_num : list_num,
				user_id : user_id
			},
		    success: function (data) {
		    	console.log("성공");
	        },
	        error: function(request, status, error, data) {
	        	console.log("error: " + error);
	        	console.log("message: " + request.responseText);
	        	console.log("Data::::: " + data);
	        	
	        }
		});
	}
	function likeDown(list_num,user_id) {
		var user_id = user_id;
		$.ajax({
			url:"${contextPath}/user/u_board/likeDown",
			type : 'POST',
			dataType:"text",
			data : {
				list_num : list_num,
				user_id : user_id
			},
		    success: function (data) {
		    	console.log("성공");
	        },
	        error: function(request, status, error, data) {
	        	console.log("error: " + error);
	        	console.log("message: " + request.responseText);
	        	console.log("Data::::: " + data);
	        	
	        }
		});
	}
	
	function badValidation(list_num,user_id){
		var list_num = list_num;
		var user_id = user_id;
		var bad = ${bad};
			if(bad == 1){
			badDown(list_num,user_id);
			}else{
			badUp(list_num,user_id);
			}
		}

	function badUp(list_num,user_id) {
		var user_id = user_id;
		$.ajax({
			url:"${contextPath}/user/u_board/badUp",
			type : 'POST',
			dataType:"text",
			data : {
				list_num : list_num,
				user_id : user_id
			},
		    success: function (data) {
		    	console.log("성공");
	        },
	        error: function(request, status, error, data) {
	        	console.log("error: " + error);
	        	console.log("message: " + request.responseText);
	        	console.log("Data::::: " + data);
	        	
	        }
		});
	}
	function badDown(list_num,user_id) {
		var user_id = user_id;
		$.ajax({
			url:"${contextPath}/user/u_board/badDown",
			type : 'POST',
			dataType:"text",
			data : {
				list_num : list_num,
				user_id : user_id
			},
		    success: function (data) {
		    	console.log("성공");
	        },
	        error: function(request, status, error, data) {
	        	console.log("error: " + error);
	        	console.log("message: " + request.responseText);
	        	console.log("Data::::: " + data);
	        	
	        }
		});
	} */
</script>
</head>
<body>
<div class="main_title" >
<h1 align="center">게시글</h1>
</div>
<div id="left-imageslide">
	<c:if test="${not empty board.image_fileName && board.image_fileName !='null'}">
		<img src="${contextPath}/u_board/download?list_num=${board.list_num}&image_fileName=${board.image_fileName}" width="550px">
	</c:if>
</div>
	<div id="write">
	<form name="frmBoard" method="post" action="${contextpath}/board/addNewboard.do" enctype="multipart/form-data">
		<table align="center" class="table">
			<tr style="border-top: none;">
				<td width="150" align="center" style="border-top: none;" >
				작성자 아이디
				</td>
				<td style="border-top: none;">
				${board.user_id}
				<input type="hidden" value="${board.user_id}" name="user_id" />
				</td>
			</tr>
			<tr>
				<td width="150" align="center">
				등록일자
				</td>
				<td>
					<fmt:formatDate value="${board.mod_date}"/>
					<input type="hidden" value='<fmt:formatDate value="${board.mod_date}"/>' disabled />
				</td>
			</tr>
			<tr>
				<td width="150" align="center">
				제목
				</td>
				<td>
				${board.u_title}
				</td>
			</tr>
			<tr>
				<td width="150" height="300" align="center" style="vertical-align: middle;">
				내용
				</td>
				<td style="vertical-align: middle;">
				${board.u_content}
				</td>
			</tr>	
		</table>
		<%-- <div class="likeNbad">
			<div class = "lNb">
				<button type="button" class="likebtn" onclick="likeValidation(${board.list_num},'${member.user_id}')" >
					<img src="${contextPath}/image/liked.png">
					좋아요 : ${board.liked}
				</button>
			</div>
			<div class = "lNb">
				<button type="button" class="badbtn" onclick="badValidation(${board.list_num},'${member.user_id}')" >
					<img src="${contextPath}/image/bad.png">
					싫어요 : ${board.bad}
				</button>
			</div>
		</div> --%>
		<div>
		<c:if test="${member.user_id==board.user_id}">
			<div class="modBoard_btn">
			<input class="writebtn btn btn-primary btn-sm" type="button" value="수정하기" onClick="fn_mod_article('${contextPath}/user/modBoard', ${board.list_num})" />			
			<input class="writebtn btn btn-primary btn-sm" type="button" value="삭제하기" onClick="fn_remove_article('${contextPath}/user/removeBoard', ${board.list_num})" />
			</div>
		</c:if>
		<input class="writebtn btn btn-primary btn-sm" type="button" value="리스트로 돌아가기" onClick="backToList(this.form)" />
		</div>
	</form>
	<form action="${contextPath}/u_board/addcomment" method="post">
		<div class="col-lg-12" id="comments-div">
    <div class="card" id="comments-card">
        <div class="card-header with-border">
            <h3 class="card-title">Comments</h3>
        </div>
        <div class="card-body">
        	<c:if test="${isLogOn == true or isLogOn != null }">
	            <div class="row">
	            <div class="form-group col-sm-2">
	           	<span style="font-size: 20px;"> ${member.user_id}</span>           
	            <input type="hidden" name="comment_id" value="${member.user_id}">
	            <input type="hidden" name="list_num" value="${board.list_num}">
				</div>
	            <div class="form-group col-sm-8">
	            <input class="form-control input-sm" id="newReplyText" name="comments" type="text" placeholder="댓글 입력..."  >
	            </div>
				<div class="form-group col-sm-2">
				<button type="submit" class="btn btn-primary btn-sm btn-block replyAddBtn" >
				<i class="fa fa-save"></i> 댓글쓰기
				</button>
				</div>
				</div>
			</c:if>
			 	<c:if test="${kakaLogin == true or kakaoLogin != null }">
	            <div class="row">
	            <div class="form-group col-sm-2">
	           	<span style="font-size: 20px;"> ${member.user_id}</span>           
	            <input type="hidden" name="comment_id" value="${member.user_id}">
	            <input type="hidden" name="list_num" value="${board.list_num}">
				</div>
	            <div class="form-group col-sm-8">
	            <input class="form-control input-sm" id="newReplyText" name="comments" type="text" placeholder="댓글 입력..."  >
	            </div>
				<div class="form-group col-sm-2">
				<button type="submit" class="btn btn-primary btn-sm btn-block replyAddBtn" >
				<i class="fa fa-save"></i> 댓글쓰기
				</button>
				</div>
				</div>
			</c:if>
			<c:if test="${isLogOn == false or kakaoLogin == false }">
	            <div class="row">
	            <div class="form-group col-sm-2">
	           	<span style="font-size: 20px;"> ${member.user_id}</span>           
	            <input type="hidden" name="comment_id" value="">
	            <input type="hidden" name="list_num" value="${board.list_num}">
				</div>
	            <div class="form-group col-sm-8">
	            <input class="form-control input-sm" id="newReplyText" name="comments" type="text" placeholder="댓글 입력..." disabled>
	            </div>
				<div class="form-group col-sm-2">
				<button type="submit" class="btn btn-primary btn-sm btn-block replyAddBtn" disabled>
				<i class="fa fa-save"></i> 댓글쓰기
				</button>
				</div>
				</div>
			</c:if>
			</div>
	      <div class="card-footer">
            <table align="center" width="80%" id="table-comment" >
			<c:choose>
				<c:when test="${empty comments}">
					<tr>
						<td colspan="4">
							<p align="center" id="not-comment">
								<b><span style="font-size: 12pt;">등록된 댓글이 없습니다.</span></b>
							</p>
						</td>
					</tr>
				</c:when>
				<c:when test="${!empty comments}">
					<c:forEach var="comment" items="${comments}" varStatus="commentNum">
						<tr align="center">
						<td align="left" id="comment-td">
						<c:choose>
							<c:when test="${comment.level>1}">
							<c:forEach begin="1" end="${comment.level}" step="1">
								<span style="padding-left: 10px"></span>
							</c:forEach>
								<span style="font-size: 20px;">${comment.comment_id}</span>
								&nbsp;&nbsp;${comment.comments}
							</c:when>
							<c:otherwise>
								<span style="font-size: 20px;">${comment.comment_id}</span>
								&nbsp;&nbsp;${comment.comments}
							</c:otherwise>
								</c:choose>
								</td>
							<td width="20%"><fmt:formatDate value="${comment.mod_date}"/></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
        </div>
    </div>
  </div>
  </form>						
	</div>
</body>
</html>