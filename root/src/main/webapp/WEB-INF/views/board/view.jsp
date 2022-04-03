<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD VIEW</title>
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
h2{
 margin-bottom: 20px;
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
	$("#deleteBt").click(function() {
		var pw = prompt("비밀번호 입력 : ");
		if(pw.length >= 4){
			$("#deletePw").val(pw);
			$("#deleteForm").submit();
			return;
		}
		alert("비밀번호를 확인해 주세요");
		return false;
	});
});
</script>
</head>
<body>
	<section class="wrapper">
		<div class="container">
			<h2 style="margin-bottom: 20px;">BOARD VIEW</h2>
			<div class="well well-sm row">
				<div class="col-sm-6">NO&nbsp;&nbsp;:&nbsp;&nbsp;${vo.no }</div>
				<div class="col-sm-2">HIT&nbsp;&nbsp;:&nbsp;&nbsp;${vo.hit}</div>
			</div>
			<div class="well well-sm row">
				<div class="col-sm-6">TITLE&nbsp;&nbsp;:&nbsp;&nbsp;${vo.title }</div>
				<div class="col-sm-2">WRITER&nbsp;&nbsp;:&nbsp;&nbsp;${vo.writer}</div>
				<div class="col-sm-4">
					WRITEDATE&nbsp;&nbsp;:&nbsp;&nbsp;
					<fmt:formatDate value="${vo.writeDate }" pattern="yyyy-MM-dd" />
				</div>
			</div>
			<div class="well well-sm row">
				<div class="col-sm-2">content</div>
				<div class="col-sm-10">${vo.content}</div>
			</div>
			<form action="replyInsert.do" method="post">
				<input type="hidden" name="no" value="${vo.no}">
				<div class="well well-sm row">
					<div class="col-sm-12">write a comment</div>
					<div class="col-sm-10">
						<input class="form-control" type="text" name="writer"
							placeholder="Enter writer">
					</div>
					<div class="col-sm-2">
					</div>
					<div class="col-sm-10">
						<input class="form-control" type="text" name="content"
							placeholder="Enter content">
					</div>
					<div class="col-sm-2" style="text-align: right">
						<input class="btn btn-default btn-sm" type="submit" value="작성">
					</div>
				</div>
			</form>
			<c:forEach var="board_rep" items="${list}">
				<div class="well well-sm row">
					<div class="col-sm-2">${board_rep.writer}</div>
					<div class="col-sm-6">${board_rep.content}</div>
					<div class="col-sm-3">
						<fmt:formatDate value="${board_rep.writeDate }"
							pattern="yyyy-MM-dd" />
					</div>
					<c:if test="${!empty login && login.gradeNo == 9}">
					<div class="col-sm-1" style="text-align: right">
						<a href="replyRemove.do?rno=${board_rep.rno }&no=${board_rep.no}"
							class="btn btn-default btn-sm" id="deleteRepBt">삭제</a>
					</div>
					</c:if>
				</div>
			</c:forEach>
			<div>
				<div style="text-align: right">
						<a href="update.do?no=${vo.no }&inc=0&page=${param.page}&perPageNum=${param.perPageNum}"
							class="btn btn-default" id="updateBt">수정</a>
						<a href="#" class="btn btn-default" id="deleteBt">삭제</a>
					<a
						href="list.do?&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}"
						class="btn btn-default">리스트</a>
				</div>
				<!-- 삭제를 위한 폼 -->
				<form action="delete.do" id="deleteForm">
					<input type="hidden" name="no" value="${vo.no }" >
					<input type="hidden" name="perPageNum" value="${param.perPageNum}" >
					<input type="hidden" name="pw" id="deletePw">
				</form>
			</div>
		</div>
	</section>
</body>
</html>