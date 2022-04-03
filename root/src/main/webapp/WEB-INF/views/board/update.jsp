<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD UPDATE</title>
<style type="text/css">
.dataRow:hover {
	cursor: pointer;
	background: #d9d9d9;
}

td, th {
	text-align: center;
}

header {
	position: relative;
	left: 0;
	top: 0;
	width: 100%;
	min-height: 120px;
	padding: 50px 0;
	color: #fff;
	background: #383838
		url(https://www.athenadesignstudio.com/plugins/switch/images/bg.jpg)
		no-repeat center center;
	margin-bottom: 30px
}

header h1 {
	font-weight: 300;
	font-size: 24px;
	color: #eee;
	letter-spacing: 2px;
	text-align: center;
	text-transform: uppercase;
	margin: 0 !important;
	padding-bottom: 25px;
}

h1, h2, h3, h4, h5, h6, div, input, p, a {
	font-family: "Open Sans";
	margin: 0px;
}

h2 {
	margin-bottom: 20px;
}

body {
	background-color: #F1F2F3;
}

color
:
 
unset


}
a:hover {
	color: unset;
	text-decoration: none
}
</style>

<script type="text/javascript">
	$(function() {
		$("#cancleBtn").click(function() {
			history.back();
		});
	});

	$(function() {
		$("#updateBt").click(function() {
			var pw = prompt("비밀번호 입력 : ");
			if (pw.length >= 4) {
				$("#updatePw").val(pw);
				$("#updateForm").submit();
				return;
			}
			alert("비밀번호를 확인해 주세요");
			return false;
		});
	});
</script>
</head>
<body>
	<div class="container">
		<h2>BOARD UPDATE</h2>
		<form action="update.do" method="post">
			<input type="hidden" name="page" value="${param.page }"> <input
				type="hidden" name="perPageNum" value="${param.perPageNum }">
					<input type="hidden" name="pw" id="updatePw">
			<div class="form-group">
				<label>번호</label> <input name="no" id="no" class="form-control"
					value="${vo.no }" readonly="readonly">
			</div>
			<div class="form-group">
				<label>제목</label> <input name="title" id="title"
					class="form-control" value="${vo.title }">
			</div>
			<div class="form-group">
				<label>내용</label>
				<textarea name="content" id="content" class="form-control" rows="7">${vo.content }</textarea>
			</div>
			<div class="form-group">
				<label>작성자</label> <input name="writer" id="writer"
					class="form-control" value="${vo.writer }">
			</div>
			<button class="btn btn-default" id="updateBt">수정</button>
			<button type="reset" class="btn btn-default">새로입력</button>
			<button type="button" id="cancleBtn" class="btn btn-default">취소</button>
		</form>
	</div>
</body>
</html>