<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVENT VIEW</title>
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
body {
    background-color: #F1F2F3;
}
    color: unset
}

a:hover {
    color: unset;
    text-decoration: none
}
</style>

</head>
<body>
	<section class="wrapper">
		<div class="container">
			<h2>EVENT VIEW</h2>
				<div class="well well-sm row">
					<div class="col-sm-3">번호</div>
					<div class="col-sm-9">${vo.no }</div>
				</div>
				<div class="well well-sm row">
					<div class="col-sm-3">제목</div>
					<div class="col-sm-9">${vo.title}</div>
				</div>
				<div class="well well-sm row">
					<div class="col-sm-3">시작일 ~ 종료일</div>
					<div class="col-sm-9"><fmt:formatDate value="${vo.startDate }"
							pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${vo.endDate }"
							pattern="yyyy-MM-dd" /></div>
				</div>
				<div class="well well-sm row">
					<div class="col-sm-3">등록일</div>
					<div class="col-sm-9"><fmt:formatDate value="${vo.writeDate }"
							pattern="yyyy-MM-dd" /></div>
				</div>
				<div class="well well-sm row">
					<div class="col-sm-3">내용</div>
					<div class="col-sm-9">${vo.content}</div>
				</div>
				<div>
					<div style="text-align: right">
					<c:if test="${!empty login && login.gradeNo == 9}">
					<a href="update.do?no=${vo.no }&inc=0&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}"
						class="btn btn-default">수정</a>
					<a href="delete.do?no=${vo.no }&perPageNum=${param.perPageNum}" class="btn btn-default" id="deleteBtn">삭제</a>
					</c:if>
					<a href="list.do?&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}"
						class="btn btn-default">리스트</a></div>
				</div>
		</div>
	</section>
</body>
</html>