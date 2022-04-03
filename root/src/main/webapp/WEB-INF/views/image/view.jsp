<%@page import="com.root.member.vo.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>이미지 보기</title>
<!-- tooltip 적용시 초기화 0> 적용 : 라이브러리(bootstrap.min.js)를 2번 적용시켜서 해결한다. -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.dataRow:hover {
	cursor: pointer;
	background: #d9d9d9;
}
#updateMsgDiv {
	display: none;
}

#changeImageDiv {
	display: none;
}

#image {
	width: 400px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	margin: 20px;
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
.card-container {
    padding: 100px 0px;
    -webkit-perspective: 1000;
    perspective: 1000;
}

.row {
    margin: 0
}

.path {
    color: grey;
    margin-bottom: 1rem
}

.path a {
    color: #ffffff
}

.info {
    padding: 6vh 0vh
}

label.radio span {
    padding: 1vh 4vh;
    background-color: rgb(54, 54, 54);
    color: grey;
    display: inline-block;
    margin-right: 2vh
}

label.radio input:checked+span {
    border: 1px solid white;
    padding: 1vh 4vh;
    background-color: rgb(54, 54, 54);
    margin-right: 2vh;
    color: #ffffff;
    display: inline-block
}
a {
    color: unset
}

a:hover {
    color: unset;
    text-decoration: none
}

label.radio input {
    position: absolute;
    top: 0;
    left: 0;
    visibility: hidden;
    pointer-events: none
}
</style>
<script type="text/javascript">
	$(function() {
		// 이미지 너비
		var imageWidth = $("#image").width();
		var imageDivWidth = $("#imageDiv").width();
		if (imageDivWidth < imageWidth)
			$("#image").width("100%");
		$("#changeImageBtn").click(function() {
			$("#changeImageDiv").slideToggle();
		});
	});
</script>
</head>
<body>
<section class="wrapper">
		<div class="container">
			<h2>이미지 보기</h2>
			<div class="col-sm-7 text-left">
				<div>
					<img src="${vo.fileName}" class="img-rounded" id="image">
					<c:if test="${login.id == vo.id || login.gradeNo == 9}">
					<button id="changeImageBtn" class="btn btn-warning btn-sm">바꾸기</button>
					</c:if>
				</div>
				<div id="changeImageDiv">
					<form action="changeImage.do" method="post"
						enctype="multipart/form-data">
						<input name="no" type="hidden" value="${vo.no }"> <input
							name="deleteImage" value="${vo.fileName }" type="hidden">
						<input name="page" value="${param.page }" type="hidden"> <input
							name="perPageNum" value="${param.perPageNum }" type="hidden">
						<input name="key" value="${param.key }" type="hidden"> <input
							name="word" value="${param.word }" type="hidden"> <input
							type="file" name="image" class="form-control">
						<button class="btn btn-default btn-sm">바꾸기</button>
						<button class="btn btn-default btn-sm">취소</button>
					</form>
				</div>
			</div>
			<div class="col-sm-5 text-left">
				<div class="well row">
					<div class="col-sm-3">번호</div>
					<div class="col-sm-9">${vo.no }</div>
				</div>
				<div class="well row">
					<div class="col-sm-3">제목</div>
					<div class="col-sm-9">${vo.title }</div>
				</div>
				<div class="well row">
					<div class="col-sm-3">작성자</div>
					<div class="col-sm-9">${vo.name}(${vo.id})</div>
				</div>
				<div class="well row">
					<div class="col-sm-3">작성일</div>
					<div class="col-sm-9">
						<fmt:formatDate value="${vo.writeDate}" pattern="yyyy-MM-dd" />
					</div>
				</div>
			</div>
		</div>
			<div class="container">
			<div class="well row">
					<div class="col-sm-5">내용</div>
					<div class="col-sm-7">${vo.content}</div>
				</div>
				<div style="text-align: right">
			<c:if test="${login.id == vo.id || login.gradeNo == 9}">
		<a href="update.do?no=${vo.no }&inc=0&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}"
			class="btn btn-default" id="updateBtn" data-toggle="tooltip" data-placement="top" title="이미지 바꾸기는 이미지 제목 오른쪽의 바꾸기 버튼을 이용해주세요">수정</a>
		<div class="alert alert-info" id="updateMsgDiv">이미지 바꾸기는 이미지 제목
			오른쪽의 바꾸기 버튼을 이용해주세요</div>
		<a href="delete.do?no=${vo.no }&&deleteImage=${vo.fileName}" id="deleteBtn" class="btn btn-default">삭제</a>
			</c:if>
		<a href="list.do?&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" class="btn btn-default">리스트</a>
				</div>
			</div>
	</section>
</body>
</html>