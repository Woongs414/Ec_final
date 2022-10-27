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

#write{
	margin: 10% auto 18% auto;
	width: 60%;
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
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script type="text/javascript">

	function backToList(obj){
		obj.action="${contextPath}/user/notice";
		obj.submit();
	}	
</script>
</head>
<body>
<div class="main_title" >
<h1 align="center">게시글</h1>
</div>
	<div id="write">
	<form name="frmBoard" method="post" action="${contextpath}/admin/addNewNotice" enctype="multipart/form-data">
		<table align="center" class="table">
			<tr style="border-top: none;">
				<td width="150" align="center" style="border-top: none;" >
				작성자 아이디
				</td>
				<td style="border-top: none;">
				운영자
				</td>
			</tr>
			<tr>
				<td width="150" align="center">
				등록일자
				</td>
				<td>
					<fmt:formatDate value="${notice.reg_date}"/>
					<input type="hidden" value='<fmt:formatDate value="${notice.reg_date}"/>'/>
				</td>
			</tr>
			<tr>
				<td width="150" align="center">
				제목
				</td>
				<td>
				${notice.no_title}
				</td>
			</tr>
			<tr>
				<td width="150" align="center" style="vertical-align: middle;">
				내용
				</td>
				<td style="vertical-align: middle;">
				${notice.no_content}
				</td>
			</tr>	
		</table>		
		<input class="writebtn" type="button" value="리스트로 돌아가기" onClick="backToList(this.form)" />
	</form>
	</div>
</body>
</html>