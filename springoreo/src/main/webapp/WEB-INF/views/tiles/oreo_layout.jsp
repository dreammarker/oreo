<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">



<title>oreo_layout.jsp</title>
<style>
span.button1 {
	background-color: lawngreen;
}

div#but {
	margin-top: 20px;
}

tr, td {
	border: 1px solid gray;
}

td#movie {
	width: 200px;
}

td.twotd {
	width: 5em;
}

td.lo1 {
	width: 5em;
}

td#theather {
	width: 14em;
}

td, th {
	padding: 0;
	text-align: center;
}

input.start {
	width: 20px;
}

.center {
	margin-top: 30px;
}

.table {
	margin-top: 30px;
}

.find {
	padding-left: 40px;
}
/*-------------------
   회원가입,로그인,마이페이지,고객문의
   -----------------*/
.loginbutton {
	float: right;
	color: black;
	background: lightgray;
	margin-right: 10px;
	border-radius: 6px;
	cursor: pointer;
	padding: 5px;
	font-size: 12px;
}

/*-----------------
   "Oreo Cinema"
   예매,상영영화,지난영화,관심영화
   ---------------*/
a:link {
	text-decoration: none;
}

a:visited {
	color: black;
}

body {
	font-family: Arial;
	padding: 10px;
}

/* Header/Blog Title */
.header {
	padding: 60px;
	text-align: center;
}

h2 {
	text-align: center;

	/*    font-family: "Times New Roman", Times, serif; */
}

/* Style the top navigation bar */
.test {
	margin-top: 0px;
	overflow: hidden;
	background-color: brown;
}

.test a {
	float: left;
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

.test:hover {
	background-color: brown;
	color: black;
}

.activity {
	margin-left: 17%;
	background-color: brown;
	color: white;
	font-weight: 10px;
}

.active2 {
	margin-left: 15%;
	background-color: brown;
	color: white;
}

.test .icon {
	display: none;
}

@media screen and (max-width: 600px) {
	.test
	
	 
	
	a
	
		
	
	:not
	
	

	
	(
	:first-child
	
	

	
	)
	{
	display
	
		
	
	:
	
	 
	
	none
	
	
	;
}

.test a.icon {
	float: right;
	display: block;
}

}
@media screen and (max-width: 600px) {
	.test.responsive {
		position: relative;
	}
	.test.responsive .icon {
		position: absolute;
		right: 0;
		top: 0;
	}
	.test.responsive a {
		float: none;
		display: block;
		text-align: left;
	}
}

th#secret_1 {
	font-size: 14px;
}

th#id_1 {
	font-size: 13px;
}

.first:hover {
	color: red;
	background-color: yellow;
}

.movie_first_loc:hover {
	color: red;
	background-color: yellow;
}

.movie_second_loc:hover {
	color: red;
	background-color: yellow;
}

.movie_screen:hover {
	color: red;
	background-color: yellow;
}

.screen_time:hover {
	color: red;
	background-color: yellow;
}

input#pwdcheck {
	margin-bottom: 10px;
}
/* 로그인 폼 디자인 */
.form-2 {
	/* Size and position */
	width: 340px;
	margin: 60px auto 30px;
	padding: 15px;
	position: relative;
	/* Styles */
	background: #fffaf6;
	border-radius: 4px;
	color: #7e7975;
	box-shadow: 0 2px 2px rgba(0, 0, 0, 0.2), 0 1px 5px rgba(0, 0, 0, 0.2),
		0 0 0 12px rgba(255, 255, 255, 0.4);
}

.form-2 h1 {
	font-size: 15px;
	font-weight: bold;
	color: #bdb5aa;
	padding-bottom: 8px;
	border-bottom: 1px solid #EBE6E2;
	text-shadow: 0 2px 0 rgba(255, 255, 255, 0.8);
	box-shadow: 0 1px 0 rgba(255, 255, 255, 0.8);
}

.form-2 h1 .log-in, .form-2 h1 .sign-up {
	display: inline-block;
	text-transform: uppercase;
}

.form-2 h1 .log-in {
	color: #6c6763;
	padding-right: 2px;
}

.form-2 h1 .sign-up {
	color: #ffb347;
	padding-left: 2px;
}

.form-2 .float {
	width: 50%;
	float: left;
	padding-top: 15px;
	border-top: 1px solid rgba(255, 255, 255, 1);
}

.form-2 label {
	display: block;
	padding: 0 0 5px 2px;
	cursor: pointer;
	text-transform: uppercase;
	font-weight: 400;
	text-shadow: 0 1px 0 rgba(255, 255, 255, 0.8);
	font-size: 11px;
}

.form-2 label i {
	margin-right: 5px; /* Gap between icon and text */
	display: inline-block;
	width: 10px;
}

.form-2 .float:first-of-type {
	padding-right: 5px;
}

.form-2 .float:last-of-type {
	padding-left: 5px;
}

.form-2 input[type=text], .form-2 input[type=password] {
	font-family: 'Lato', Calibri, Arial, sans-serif;
	font-size: 13px;
	font-weight: 400;
	display: block;
	width: 100%;
	padding: 5px;
	margin-bottom: 5px;
	border: 3px solid #ebe6e2;
	border-radius: 5px;
	transition: all 0.3s ease-out;
}

.form-2 input[type=text]:hover, .form-2 input[type=password]:hover {
	border-color: #CCC;
}

.form-2 label:hover ~ input {
	border-color: #CCC;
}

.form-2 input[type=text]:focus, .form-2 input[type=password]:focus {
	border-color: #BBB;
	outline: none; /* Remove Chrome's outline */
}

.clearfix:after {
	content: "";
	display: table;
	clear: both;
}

.form-2 input[type=submit], .form-2 .log-twitter {
	/* Size and position */
	width: 49%;
	height: 38px;
	float: left;
	position: relative;
	/* Styles */
	box-shadow: inset 0 1px rgba(255, 255, 255, 0.3);
	border-radius: 3px;
	cursor: pointer;
	/* Font styles */
	font-family: 'Lato', Calibri, Arial, sans-serif;
	font-size: 14px;
	line-height: 38px; /* Same as height */
	text-align: center;
	font-weight: bold;
}

.form-2 input[type=submit] {
	margin-left: 1%;
	background: linear-gradient(#fbd568, #ffb347);
	border: 1px solid #f4ab4c;
	color: #996319;
	text-shadow: 0 1px rgba(255, 255, 255, 0.3);
}

.form-2 .log-twitter {
	margin-right: 1%;
	background: linear-gradient(#34a5cf, #2a8ac4);
	border: 1px solid #2b8bc7;
	color: #ffffff;
	text-shadow: 0 -1px rgba(0, 0, 0, 0.3);
	text-decoration: none;
}

.form-2 input[type=submit]:hover, .form-2 .log-twitter:hover {
	box-shadow: inset 0 1px rgba(255, 255, 255, 0.3), inset 0 20px 40px
		rgba(255, 255, 255, 0.15);
}

.form-2 input[type=submit]:active, .form-2 .log-twitter:active {
	top: 1px;
}

.no-boxshadow .form-2 input[type=submit]:hover {
	background: #ffb347;
}

.no-boxshadow .form-2 .log-twitter:hover {
	background: #2a8ac4;
}

.form-2 p:last-of-type {
	clear: both;
}

.form-2 .opt {
	text-align: right;
	margin-right: 3px;
}

.form-2 label[for=showPassword] {
	display: inline-block;
	margin-bottom: 10px;
	font-size: 11px;
	font-weight: 400;
	text-transform: capitalize;
}

.form-2 input[type=checkbox] {
	vertical-align: middle;
	margin: -1px 5px 0 1px;
}
</style>
<script>
	function reserve() {
		console.log("${sessionScope.custNum}");
		var cust = "${sessionScope.custNum}";
		if (cust == "" || cust == null) {
			alert("로그인이 필요합니다");
			location.href = "${pageContext.request.contextPath}/";
		} else {
			location.href = "${pageContext.request.contextPath}/Movie_reserve";
		}
	}
	
	function favorite(){
		var cust = "${sessionScope.custNum}";
		if (cust == "" || cust ==null){
			alert("로그인이 필요합니다.");
			location.history.back(-1);
		} else {
			location.href="${pageContext.request.contextPath}/getMovieFavoriteList?custNum="+cust;
		}
	}
</script>
</head>
<body>
	<!-- 우측상단 버튼 -->
	<header>
		<c:if
			test="${not empty sessionScope.custId && sessionScope.custId == 'admin'}">
			<div class="loginbutton">
				<a href="chart">매출현황 보기</a>
			</div>
		</c:if>
		<c:if
			test="${not empty sessionScope.custId && sessionScope.custId == 'admin'}">
			<div class="loginbutton">
				<a href="${pageContext.request.contextPath}/screeninsertgo">상영시간표관리</a>
			</div>
		</c:if>
		<div class="loginbutton">
			<a href="${pageContext.request.contextPath}/getInquiryList">고객문의</a>
		</div>

		<c:if test="${not empty sessionScope.custId}">
			<div class="loginbutton">
				<a href="${pageContext.request.contextPath}/getMycust?custId=${custId}">마이페이지</a>
			</div>
		</c:if>


		<!-- 로그인 -->

		<c:if test="${empty sessionScope.custId}">
			<div class="loginbutton" data-toggle="modal" data-target="#myModal">로그인</div>
		</c:if>
		<c:if test="${not empty sessionScope.custId}">
			<div class="loginbutton">
				<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
			</div>
		</c:if>

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title"></h4>
					</div>

					<form class="form-2" method=post action="${pageContext.request.contextPath}/login_check">
						<h1>
							<span class="log-in">Login</span>
						</h1>
						<p class="float">
							<label for="login"><i class="fa fa-user"></i>ID</label> <input
								type="text" name="custId" id="custId" placeholder="ID">
						</p>
						<p class="float">
							<label for="password"><i class="fa fa-unlock-alt"></i>Password</label>
							<input type="password" name="custPwd" id="custPwd"
								placeholder="Password" class="showpassword">
						</p>
						<p class="clearfix">
							<a href="#" class="log-twitter">비밀번호 찾기</a> 
							<input type="submit" name="submit" value="Login">
						</p>
					</form>

				</div>

			</div>

		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">비밀번호 찾기</h4>
					</div>

					<form class="form-2" method=post action="./login_check">

						<p class="float">
							<label for="login"><i class="fa fa-user"></i>이메일</label> <input
								type="text" name="custId" id="custId" placeholder="이메일을 입력해주세요">
						</p>
						<p class="float">
							<label for="password"><i class="fa fa-unlock-alt"></i>Password</label>
							<input type="password" name="custPwd" id="custPwd"
								placeholder="Password" class="showpassword">
						</p>
						<p class="clearfix">
							<a href="#" class="log-twitter">비밀번호 찾기</a> 
							<input type="submit" name="submit" value="Login">
						</p>
					</form>

				</div>

			</div>

		</div>
		
		<c:if test="${empty sessionScope.custId}">
			<div class="loginbutton">
				<a href="${pageContext.request.contextPath}/Customerjoin">회원가입</a>
			</div>
		</c:if>
		<div class="header">
			<h2>
				<a href="${pageContext.request.contextPath}/"><img
					src="${pageContext.request.contextPath}/resources/image/logo.jpg"></a>
			</h2>
		</div>
		<!-- bar -->
		<div class="test" id="mytest">
			<a href="#" class="activity" onclick="reserve()">예매</a>
			 <a href="${pageContext.request.contextPath}/getMovieList" class="active2">상영영화</a> 
			 <a href="${pageContext.request.contextPath}/getMovieLastList" class="active2">지난영화</a> 
			 <a href="#" class="activity" onclick="favorite()">관심영화</a>
			<%--  <a href="./getMovieFavoriteList?custNum=${custNum}" class="active2">관심영화</a> --%>
			<a href="javascript:void(0);" style="font-size: 15px;" class="icon"
				onclick="myFunction()">&#9776;</a>
		</div>
		<!-- 반응형 웹을 위한 스크립트 -->
		<script>
			function myFunction() {
				var x = document.getElementById("mytest");
				if (x.className === "test") {
					x.className += " responsive";
				} else {
					x.className = "test";
				}
			}
		</script>
	</header>
	<article>
		<tiles:insertAttribute name="content" />
	</article>
</body>
</html>
