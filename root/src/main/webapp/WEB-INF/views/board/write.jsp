<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD WRITE</title>
<style type="text/css">
.dataRow:hover {
	cursor: pointer;
	background: #d9d9d9;
}

 td, th {
        text-align: center;
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

<script type="text/javascript">
	$(function(){
		$("#cancleBtn").click(function(){
			history.back();
		});
	});
</script>
</head>
<body>
	<div class="container">
		<h2>BOARD WRITE</h2>
		<form action="write.do" method="post">
		<input type="hidden" value="${param.perPageNum }" name="perPageNum">
		<div class="form-group">
			<label>제목</label>
			<input name="title" id="title" class="form-control">
		</div>
		<div class="form-group">
			<label>내용</label>
			<textarea name="content" id="content" class="form-control" rows="7"></textarea>
		</div>
		<div class="form-group">
			<label>작성자</label>
			<input name="writer" id="writer" class="form-control">
		</div>
		<div class="form-group">
			<label>비밀번호</label>
			<input name="pw" id="pw" class="form-control" required="required" pattern=".{3,50}" maxlength="50">
		</div>
		<button class="btn btn-default">등록</button>
		<button type="reset" class="btn btn-default">새로입력</button>
		<button type="button" id="cancleBtn" class="btn btn-default">취소</button>
		</form>
	</div>
</body>
</html>