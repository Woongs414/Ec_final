<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<style type="text/css">
#container110 { /* all */
	width: 100%;
	height: auto;
	margin: 0 auto;
}
#myheader { /* header */
	height: 170px;
	width: 100%;
	margin: auto;
	margin-left: 140px;
}
#myside { /* side */
	width: 300px;
	height: auto;
	margin-left: 150px;
}
#mybody { /* body */
	width: 700px;
	height: auto;
	margin-top: 20px;
	margin-right: 10%;
	margin-left: 480px;
}
#myfooter { /* footer */
	clear: both;
	position: absolute;
	bottom: 0;
	width: 100%;
	min-width:1000px;
	font-size:13px;
	font-weight:normal;
	color: #A67F78;
	margin-top: 20px;
}
a {
	text-decoration: none;
	color: #A67F78;
}
</style>
<title><tiles:insertAttribute name="title" /></title>
</head>
<body>
	<div id="container110">
		<div id="myheader">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="myside">
			<tiles:insertAttribute name="side" />
			</div>
		<div id="mybody">
			<tiles:insertAttribute name="body" />
		</div>
		<div id="myfooter" >
			<tiles:insertAttribute name="footer" />
		</div>
	</div>

</body>
</html>