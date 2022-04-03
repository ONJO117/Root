<%@page import="com.root.member.vo.LoginVO"%>
<%@page import="java.util.List"%>
<%@page import="com.webjjang.util.PageObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
LoginVO loginVO = (LoginVO) session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>main</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="shortcut icon" href="/upload/siteImage/favicon.png" type="image/x-icon">
  <link rel="icon" href="/upload/siteImage/favicon.png" type="image/x-icon">
<script>
$(document).ready(function(){
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
    if (this.hash !== "") {
      event.preventDefault();

      var hash = this.hash;
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
   
        window.location.hash = hash;
      });
    } // End if
  });
  
  $(window).scroll(function() {
    $(".slideanim").each(function(){
      var pos = $(this).offset().top;

      var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
          $(this).addClass("slide");
        }
    });
  });
})
</script>
<script type="text/javascript">
	$(function() {
		$(".imageDataRow, .noticeDataRow").click(function() {
			// alert("click");
			var no = $(this).data("no");
			var url = "/"
			if ($(this).hasClass("imageDataRow"))
				url = url + "image";
			if ($(this).hasClass("noticeDataRow"))
				url = url + "notice";
			url += "/view.do?no=" + no + "&inc=1&page=1&perPageNum=10";
			location = url;
		});
	});
</script>
  <style>
     table, th, td {
        border: 1px solid #bcbcbc;
      }
      table {
        width: 1000px;
        height: 200px;
      }
  td, th {
        text-align: center;
      }


  .profile-card-2 {
    max-width: 300px;
    background-color: #FFF;
    box-shadow: 0px 0px 25px rgba(0, 0, 0, 0.1);
    background-position: center;
    overflow: hidden;
    position: relative;
    margin: 10px auto;
    cursor: pointer;
    border-radius: 10px;
}

.profile-card-2 img {
    transition: all linear 0.25s;
}

.profile-card-2 .profile-name {
    position: absolute;
    left: 30px;
    bottom: 70px;
    font-size: 30px;
    color: #FFF;
    text-shadow: 0px 0px 20px rgba(0, 0, 0, 0.5);
    font-weight: bold;
    transition: all linear 0.25s;
}

.profile-card-2 .profile-icons {
    position: absolute;
    bottom: 30px;
    right: 30px;
    color: #FFF;
    transition: all linear 0.25s;
}

.profile-card-2 .profile-username {
    position: absolute;
    bottom: 50px;
    left: 30px;
    color: #FFF;
    font-size: 13px;
    transition: all linear 0.25s;
}

.profile-card-2 .profile-icons .fa {
    margin: 5px;
}

.profile-card-2:hover img {
    filter: grayscale(100%);
}

.profile-card-2:hover .profile-name {
    bottom: 80px;
}

.profile-card-2:hover .profile-username {
    bottom: 60px;
}

.profile-card-2:hover .profile-icons {
    right: 40px;
}
  
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
    padding: 60px 25px;
    font-family: Montserrat, sans-serif;
  }
  .container-fluid {
    padding: 60px 50px;
  }
  .bg-grey {
    background-color: #f6f6f6;
  }
  .logo-small {
    color: #f4511e;
    font-size: 50px;
  }
  .logo {
    color: #f4511e;
    font-size: 200px;
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
  .item h4 {
    font-size: 19px;
    line-height: 1.375em;
    font-weight: 400;
    font-style: italic;
    margin: 70px 0;
  }
  .item span {
    font-style: normal;
  }
  .panel {
    border: 1px solid #ff4da6; 
    border-radius:0 !important;
    transition: box-shadow 0.5s;
  }
  .panel:hover {
    box-shadow: 5px 0px 40px rgba(0,0,0, .2);
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
  .slideanim {visibility:hidden;}
  .slide {
    animation-name: slide;
    -webkit-animation-name: slide;
    animation-duration: 1s;
    -webkit-animation-duration: 1s;
    visibility: visible;
  }
  @keyframes slide {
    0% {
      opacity: 0;
      transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      transform: translateY(0%);
    }
  }
  @-webkit-keyframes slide {
    0% {
      opacity: 0;
      -webkit-transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      -webkit-transform: translateY(0%);
    }
  }
  @media screen and (max-width: 768px) {
    .col-sm-4 {
      text-align: center;
      margin: 25px 0;
    }
    .btn-lg {
      width: 100%;
      margin-bottom: 35px;
    }
  }
  @media screen and (max-width: 480px) {
    .logo {
      font-size: 150px;
    }
  }
  </style>
  <style type="text/css">
.imageDataRow:hover, .noticeDataRow:hover {
	background: #eee;
	cursor: pointer;
}
</style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#myPage">Root</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#note">note</a></li>
        <li><a href="#toYou">toYou</a></li>
        <li><a href="#pricing">PRICING</a></li>
        <li><a href="/board/list.do">자유게시판</a></li>
        <li><a href="/image/list.do">이미지</a></li>
        <li><a href="/notice/list.do">이벤트</a></li>
        <% if(loginVO != null && loginVO.getGradeNo() == 9){ %>
		<li><a href="/member/list.do" id="font">회원관리</a></li>
		<% } %>
		<% if(loginVO == null){ %>
		<li><a href="/member/write.do" id="font">회원가입</a></li>
		<li><a href="/member/login.do" id="font">로그인</a></li>
		<% } else { %>
		<li><a href="/member/view.do" id="font"><img src="${login.photo }" style="width: 20px" class="img-circle">
		<%= loginVO.getName() %>(<%= loginVO.getGradeName() %>)</a></li>
		<li><a href="/member/logout.do" id="font">로그아웃</a></li>
		<% } %>
      </ul>
    </div>
  </div>
</nav>

<div class="jumbotron text-center">
  <h1><img alt="logo" src="/upload/siteImage/logo_transparent.png" style="width: 5%">ROOT</h1> 
  <p>The endeavor to understand is the first and only basis of virtue.</p> 
  <p>이해하려는 노력은 미덕의 첫 번째이자 유일한 기본이다.</p> 
</div>
	<div class="container"  id="note">
		<div class="row">
			<div class="col-md-12">
				<jsp:include page="/WEB-INF/views/include/imageList.jsp" />
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<jsp:include page="/WEB-INF/views/include/noticeList.jsp" />
			</div>
		</div>
	</div>
<div id="toYou" class="container-fluid text-center bg-grey">
  <h2>to you</h2>
  <div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <h4>"오래 살기를 바라기 보다 잘 살기를 바라라."<br><span>Wish not so much to live long as to live well.</span></h4>
      </div>
      <div class="item">
        <h4>"인간의 감정은 누군가를 만날 때와 헤어질 때 가장 순수하며 가장 빛난다."<br><span>Man's feelings are always purest and most glowing in the hour of meeting and of farewell.</span></h4>
      </div>
      <div class="item">
        <h4>"한 문장이라도 매일 조금씩 읽기로 결심하라. 하루 15분씩 시간을 내면 연말에는 변화가 느껴질 것이다"<br><span>Resolve to edge in a little reading every day, if it is but a single sentence. If you gain fifteen minutes a day, it will make itself felt at the end of the year.</span></h4>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

<!-- Container (Pricing Section) -->
<div id="pricing" class="container-fluid">
  <div class="text-center">
    <h2>PhotoShop Pricing</h2>
    <h4>ROOT 만의 특별한 폅집기를 이용해 보세요</h4>
  </div>
  <div class="row slideanim">
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>Basic</h1>
        </div>
        <div class="panel-body">
          <p><strong>Basic</strong> </p>
          <p>기본기능들을 무료로 이용해볼수 있습니다.</p>
        </div>
        <div class="panel-footer">
          <h3>FREE</h3>
          <button class="btn btn-lg">구매하기</button>
        </div>
      </div>      
    </div>     
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>Pro</h1>
        </div>
        <div class="panel-body">
          <p><strong>Pro version</strong> </p>
          <p>프로버전은 더 다양한 기능들을 빠르게 업데이트 받아볼수 있습니다.</p>
        </div>
        <div class="panel-footer">
          <h3>$29</h3>
          <button class="btn btn-lg">구매하기</button>
        </div>
      </div>      
    </div>       
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>학생/교사</h1>
        </div>
        <div class="panel-body">
          <p><strong>60% 할일 혜택</strong> </p>
          <p>학생 및 교사라면 60% 더 저렴하게 이용 할수 있습니다</p>
        </div>
        <div class="panel-footer">
          <h3>$12</h3>
          <button class="btn btn-lg">구매하기</button>
        </div>
      </div>      
    </div>    
  </div>
</div>

<footer class="container-fluid text-center">
  <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
  <p>2021.11.02 ~ 2022.03.30의 결과물 By <a href="#myPage">Baik jae keun</a></p>
</footer>


</body>
</html>
