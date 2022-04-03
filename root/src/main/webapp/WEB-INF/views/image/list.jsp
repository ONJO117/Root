<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 리스트</title>
<style type="text/css">
.dataRow:hover {
	cursor: pointer;
	background: #d9d9d9;
}
header {
	position:relative;
	left:0;
	top:0;
	width:100%;
	min-height:120px;
	padding:50px 0;
	color:#fff;
	    background: #383838 url(https://www.athenadesignstudio.com/plugins/switch/images/bg.jpg) no-repeat center center;
	margin-bottom:30px
}
/* Logo */
header .logo {
	clear:both;
    display:block;
	text-align:center;
    padding-bottom:10px;
}
/* Title */
header h1 {
    font-weight:300;
    font-size:24px;
    color:#eee;	
	letter-spacing:2px;
	text-align:center;
	text-transform:uppercase;
	margin:0 !important;
	padding-bottom:25px;
}
@charset "utf-8";
@import url('https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700,800,900|Open Sans:400,600,800');
h1,
h2,
h3,
h4,
h5,
h6,
div,
input,
p,
a {
    font-family: "Open Sans";
    margin: 0px;
}
h2{
 margin-bottom: 20px;
 }
a,
a:hover,
a:focus {
    color: inherit;
}
body {
    background-color: #F1F2F3;
}
.container-fluid,
.container {
    max-width: 1200px;
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
.profile-card-6 {
    max-width: 300px;
    background-color: #FFF;
    border-radius: 5px;
    box-shadow: 0px 0px 25px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    position: relative;
    margin: 10px auto;
    cursor: pointer;
}

.profile-card-6 img {
    transition: all 0.15s linear;
}

.profile-card-6 .profile-name {
    position: absolute;
    top: 10px;
    left: 10px;
    font-size: 25px;
    font-weight: bold;
    color: #FFF;
    padding: 15px 20px;
    background: linear-gradient(140deg, rgba(0, 0, 0, 0.4) 50%, rgba(255, 255, 0, 0) 50%);
    transition: all 0.15s linear;
}

.profile-card-6 .profile-position {
    position: absolute;
    color: rgba(255, 255, 255, 0.4);
    left: 30px;
    top: 100px;
    transition: all 0.15s linear;
}

.profile-card-6 .profile-overview {
    position: absolute;
    bottom: 0px;
    left: 0px;
    right: 0px;
    background: linear-gradient(0deg, rgba(0, 0, 0, 0.4) 50%, rgba(255, 255, 0, 0));
    color: #FFF;
    padding: 50px 0px 20px 0px;
    transition: all 0.15s linear;
}

.profile-card-6 .profile-overview h3 {
    font-weight: bold;
}

.profile-card-6 .profile-overview p {
    color: rgba(255, 255, 255, 0.7);
}

.profile-card-6:hover img {
    filter: brightness(80%);
}

.profile-card-6:hover .profile-name {
    padding-left: 25px;
    padding-top: 20px;
}

.profile-card-6:hover .profile-position {
    left: 40px;
}

.profile-card-6:hover .profile-overview {
    padding-bottom: 25px;
}
</style>

<style type="text/css">
.dataRow:hover {
	cursor: pointer;
	background: #eee;
}
</style>
<script type="text/javascript">
$(function() {
	$("#perPageNumSelect").change(function() {
		//alert("값 변경");
		$("#perPageNumForm").submit();
});
});

</script>
</head>
<body>
<section class="wrapper">
  <div class="container">
			<h2>Photo List</h2>
				<div class="row" style="margin-bottom: 5px;">
			<!-- 검색에 대한 div -->
			<div class="col-md-8">
				<form class="form-inline">
				<input type="hidden" name="perPageNum" value="${pageObject.perPageNum }">
					<div class="input-group">
						<select name="key" class="form-control">
							<option value="t" ${(pageObject.key == "t")?"selected":"" }>제목</option>
							<option value="c" ${(pageObject.key == "c")?"selected":"" }>내용</option>
							<option value="f" ${(pageObject.key == "f")?"selected":"" }>파일명</option>
							<option value="tc" ${(pageObject.key == "tc")?"selected":"" }>제목/내용</option>
							<option value="tf" ${(pageObject.key == "tf")?"selected":"" }>제목/파일명</option>
							<option value="cf" ${(pageObject.key == "cf")?"selected":"" }>내용/파일명</option>
							<option value="tcf" ${(pageObject.key == "tcf")?"selected":"" }>전체</option>
						</select>
					</div>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search"
							name="word"  value="${pageObject.word }">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-4 text-right">
				<form action="list.do" class="form-inline" id="perPageNumForm">
					<input type="hidden" name="page" value="1"> <input
						type="hidden" name="key" value="${pageObject.key }"> <input
						type="hidden" name="word" value="${pageObject.word }">
					<div class="form-group">
						<label> 1페이지 당 개수 <select name="perPageNum"
							class="form-control" id="perPageNumSelect">
								<option ${(pageObject.perPageNum == 4)?"selected":"" }>4</option>
								<option ${(pageObject.perPageNum == 8)?"selected":"" }>8</option>
								<option ${(pageObject.perPageNum == 12)?"selected":"" }>12</option>
								<option ${(pageObject.perPageNum == 16)?"selected":"" }>16</option>
						</select>
						</label>
					</div>
				</form>
			</div>
		</div>
<header>
    <div class="container text-center">

        <!-- Logo -->
        <div class="logo">
			  <h1><b>2021 BEST PHOTO TOP 3</b></h1>
        </div>
    </div>
</header>

<div class="container">
	<div class="row">
		<div class="col-md-4">
    <h4 class="text-center"><strong>Best 1</strong></h4>
    <hr>
    <div class="profile-card-2"><a href="https://www.instagram.com/p/Cbgn_52lx7A/"><img src="/upload/image/best1.jpg" class="img img-responsive"></a>
        <div class="profile-username">@root_0117</div>
        <div class="profile-icons"><a href="#"><i class="fa fa-facebook"></i></a><a href="https://www.instagram.com/root_0117/"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-linkedin"></i></a></div>
    </div>
</div>

<div class="col-md-4">
    <h4 class="text-center"><strong>Best 2</strong></h4>
    <hr>
    <div class="profile-card-6"><a href="https://www.instagram.com/p/CbgoBluFyF8/"><img src="/upload/image/best2.jpg" class="img img-responsive"></a>
        <div class="profile-position">@root_0117</div>
        <div class="profile-overview">
            <div class="profile-overview">
                <div class="row text-center">
                    <div class="col-xs-4">
                        <h3>1</h3>
                        <p>Rank</p>
                    </div>
                    <div class="col-xs-4">
                        <h3>50</h3>
                        <p>Matches</p>
                    </div>
                    <div class="col-xs-4">
                        <h3>35</h3>
                        <p>Goals</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
				<div class="col-md-4">
    <h4 class="text-center"><strong>Best 3</strong></h4>
    <hr>
    <div class="profile-card-2" ><a href="https://www.instagram.com/p/CbgoDMDFo-U/"><img src="/upload/image/best3.jpg" class="img img-responsive"></a>
        <div class="profile-username">@root_0117</div>
        <a href="https://www.instagram.com/p/CbgoDMDFo-U/"></a>
        <div class="profile-icons"></div>
    </div>
</div>
	</div>
</div>
<header>
    <div class="container text-center">
        <div class="logo">
			  <h3><b>PHOTO LIST</b></h3>
        </div>
    </div>
</header>
		<div class="row">
			<!-- col-md-3 : 한 줄에 사진 4장 표시 3 * 4 = 12 -->
			<c:forEach items="${list }" var="vo" varStatus="vs">
					<div class="col-md-3">
						<div class="profile-card-2"
							onclick="location='view.do?no=${vo.no }&page=${pageObject.page }&perPageNum=${pageObject.perPageNum}&key=${pageObject.key }&word=${pageObject.word }'">
							<img src="${vo.fileName }" alt="Photo Lists"
								style="width: 100%; height: 300px;" class="img img-responsive">
							<div class="profile-name">${vo.title }</div>
							<div class="profile-username">${vo.name }(${vo.id })<fmt:formatDate value="${vo.writeDate }" pattern="yyyy-MM-dd"/></div>
						</div>
					</div>
					<c:if test="${vs.count % 4 == 0 &&vs.count != list.size() }">
				${"</div>" }
				${"<div class='row'>" }
			</c:if>
			</c:forEach>
		</div>
		<div>
			<pageNav:pageNav listURI="list.do" pageObject="${pageObject }" query="&key=${pageObject.key }&word=${pageObject.word }" />
		</div>
		<c:if test="${!empty login }">
		<a href="write.do?perPageNum=${pageObject.perPageNum}" class="btn btn-default">등록</a>
		</c:if>
		<a href="list.do?page=${pageObject.page }&perPageNum=${pageObject.perPageNum}" class="btn btn-default">새로고침</a>
</div>
</section>
</body>
</html>