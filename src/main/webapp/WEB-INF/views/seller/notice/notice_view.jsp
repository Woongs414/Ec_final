<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글보기</title>
<style>
.content-wrapper>.content {
	padding: 0.5em;
}

#write {
	margin: 5% auto;
	width: 60%;
}

.writebtn {
	display: inline-block;
	float: right;
	margin-bottom: 30px;
}

.col-md-9 {
	flex: 0 0 100%;
	max-width: 100%;
}
.no_content{
	height: 400px;
}
</style>
<script type="text/javascript">
	function backToList(obj) {
		obj.action = "${contextPath}/seller/notice";
		obj.submit();
	}
</script>
</head>
<body>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6"></div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">메인</a></li>
							<li class="breadcrumb-item active">공지 사항</li>
							<li class="breadcrumb-item active">공지 사항 글</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-9">
						<div class="card card-primary">
							<div class="card-body p-0">
								<div id="write">
									<form name="frmBoard" method="post" action=""
										enctype="multipart/form-data">
										<table align="center" class="table">
											<tr style="border-top: none;">
												<td width="150" align="center" style="border-top: none;">
													작성자 아이디</td>
												<td style="border-top: none;">운영자</td>
											</tr>
											<tr>
												<td width="150" align="center">등록일자</td>
												<td><fmt:formatDate value="${notice.reg_date}" /> <input
													type="hidden"
													value='<fmt:formatDate value="${notice.reg_date}"/>' /></td>
											</tr>
											<tr>
												<td width="150" align="center">제목</td>
												<td>${notice.no_title}</td>
											</tr>
											<tr class="no_content">
												<td width="150" align="center"
													style="vertical-align: middle;">내용</td>
												<td style="vertical-align: middle;">
													${notice.no_content}</td>
											</tr>
										</table>
										<input class="writebtn" type="button" value="리스트로 돌아가기"
											onClick="backToList(this.form)" />
									</form>
								</div>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
</body>
</html>