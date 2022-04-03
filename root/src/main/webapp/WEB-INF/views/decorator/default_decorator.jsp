<%@page import="com.root.member.vo.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
LoginVO loginVO = (LoginVO) session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ROOT:<decorator:title /></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- CDN 방식의 Google Icon 라이브러리 등록 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- jQuery UI 라이브러리 CDN 방식으로 등록 : datepicker -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<link rel="shortcut icon" href="/upload/siteImage/favicon.png" type="image/x-icon">
<link rel="icon" href="/upload/siteImage/favicon.png" type="image/x-icon">
<style>
body {
	font: 400 15px Lato, sans-serif;
	line-height: 1.8;
	color: #818181;
}

h2 {
	font-size: 24px;
	text-transform: uppercase;
	color: #303030;
	font-weight: 600;
	margin-bottom: 30px;
}

h4 {
	font-size: 19px;
	line-height: 1.375em;
	color: #303030;
	font-weight: 400;
	margin-bottom: 30px;
}

.jumbotron {
	background-color: #99ccff;
	color: #ff3399;
	padding: 100px 25px;
	font-family: Montserrat, sans-serif;
}

.container-fluid {
	padding: 60px 50px;
}

.bg-grey {
	background-color: #f6f6f6;
}
.thumbnail {
	padding: 0 0 15px 0;
	border: none;
	border-radius: 0;
}

.thumbnail img {
	width: 100%;
	height: 100%;
	margin-bottom: 10px;
}

.carousel-control.right, .carousel-control.left {
	background-image: none;
	color: #f4511e;
}

.carousel-indicators li {
	border-color: #f4511e;
}

.carousel-indicators li.active {
	background-color: #f4511e;
}

.panel {
	border: 1px solid #ff4da6;
	border-radius: 0 !important;
	transition: box-shadow 0.5s;
}

.panel:hover {
	box-shadow: 5px 0px 40px rgba(0, 0, 0, .2);
}

.panel-footer .btn:hover {
	border: 1px solid #f4511e;
	background-color: #fff !important;
	color: #f4511e;
}

.panel-heading {
	color: #fff !important;
	background-color: #99ccff !important;
	padding: 25px;
	border-bottom: 1px solid transparent;
	border-top-left-radius: 0px;
	border-top-right-radius: 0px;
	border-bottom-left-radius: 0px;
	border-bottom-right-radius: 0px;
}

.panel-footer {
	background-color: white !important;
}

.panel-footer h3 {
	font-size: 32px;
}

.panel-footer h4 {
	color: #aaa;
	font-size: 14px;
}

.panel-footer .btn {
	margin: 15px 0;
	background-color: #ff4da6;
	color: #fff;
}

.navbar {
	margin-bottom: 0;
	background-color: #ff4da6;
	z-index: 9999;
	border: 0;
	font-size: 12px !important;
	line-height: 1.42857143 !important;
	letter-spacing: 4px;
	border-radius: 0;
	font-family: Montserrat, sans-serif;
}

.navbar li a, .navbar .navbar-brand {
	color: #fff !important;
}

.navbar-nav li a:hover, .navbar-nav li.active a {
	color: #f4511e !important;
	background-color: #fff !important;
}

.navbar-default .navbar-toggle {
	border-color: transparent;
	color: #fff !important;
}

footer .glyphicon {
	font-size: 20px;
	margin-bottom: 20px;
	color: #f4511e;
}
</style>
<style type="text/css">
.imageDataRow:hover, .noticeDataRow:hover {
	background: #eee;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
		$("#deleteBtn").click(function() {

			return confirm("정말 삭제 하시겠습니까?");
		});

	});
</script>
<c:if test="${!empty msg }">
	<script type="text/javascript">
		$(function() {
			var msgShow = true;
			if (msgShow) {
				// 0.2초 (200) 동안 기다렸다가 시간이 끝나면 function을 실행한다.
				// 화면에 데이터보다 alert이 먼저 실행이 되면 경고창이 떠있는 뒤에 데이터가 보이지 않고 하얗게 되어진다.
				setTimeout(
				// 실행해야 할 함수
				function() {
					alert("${msg}");
				}, 200);
				msgShow = false;

			}

		});
	</script>
</c:if>
<decorator:head />
</head>
<body>
	<header style="margin-bottom: 40px;">
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/main/main.do">Root</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar" >
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/board/list.do">자유게시판</a></li>
						<li><a href="/image/list.do">이미지</a></li>
						<li><a href="/notice/list.do">이벤트</a></li>
						<%
						if (loginVO != null && loginVO.getGradeNo() == 9) {
						%>
						<li><a href="/member/list.do" id="font">회원관리</a></li>
						<%
						}
						%>
						<%
						if (loginVO == null) {
						%>
						<li><a href="/member/write.do" id="font">회원가입</a></li>
						<li><a href="/member/login.do" id="font">로그인</a></li>
						<%
						} else {
						%>
						<li><a href="/member/view.do" id="font">
						<img src="${login.photo }" style="width: 20px" class="img-circle">
								<%=loginVO.getName()%>(<%=loginVO.getGradeName()%>)</a></li>
						<li><a href="/member/logout.do" id="font">로그아웃</a></li>
						<%
						}
						%>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<article>
		<decorator:body />
	</article>
	<footer class="container-fluid text-center navbar-bottom">
		<p>
			2021.11.02 ~ 2022.03.30의 결과물 By <a href="#myPage">Baik jae keun</a>
		</p>
	</footer>
</body>
</html>