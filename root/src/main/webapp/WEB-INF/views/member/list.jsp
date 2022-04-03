<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
<style type="text/css">
.dataRow:hover {
	background: #eee;
	cursor: pointer;
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
	// 아래 document가 다 표시되면 처리되도록 한다.
	$(function() {
		$(".dataRow")
				.click(
						function() {
							var id = $(this).find(".id").text();
							location = "view.do?id="
									+ id
									+ "&page=${pageObject.page }&perPageNum=${pageObject.perPageNum}";
						});
	});
</script>

</head>
<body>
	<div class="container">
		<h2>회원리스트</h2>
		<!-- 검색에 대한 div -->
		<div class="col-md-8">
			<form class="form-inline">
				<input type="hidden" name="perPageNum"
					value="${pageObject.perPageNum }">
				<div class="input-group">
					<select name="key" class="form-control">
						<option value="i" ${(pageObject.key == "i")?"selected":"" }>아이디</option>
						<option value="n" ${(pageObject.key == "n")?"selected":"" }>이름</option>
						<option value="in" ${(pageObject.key == "in")?"selected":"" }>전체</option>
					</select>
				</div>
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search"
						name="word" value="${pageObject.word }">
					<div class="input-group-btn">
						<button class="btn btn-default" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
		<!-- 한페이지당 보여주는 데이터 갯수 -->
		<div class="col-md-4 text-right">
			<form action="list.do" class="form-inline" id="perPageNumForm">
				<input type="hidden" name="page" value="1"> <input
					type="hidden" name="key" value="${pageObject.key }"> <input
					type="hidden" name="word" value="${pageObject.word }">
				<div class="form-group">
					<label> 1페이지 당 개수 <select name="perPageNum"
						class="form-control" id="perPageNumSelect">
							<option ${(pageObject.perPageNum == 5)?"selected":"" }>5</option>
							<option ${(pageObject.perPageNum == 10)?"selected":"" }>10</option>
							<option ${(pageObject.perPageNum == 15)?"selected":"" }>15</option>
							<option ${(pageObject.perPageNum == 20)?"selected":"" }>20</option>
					</select>
					</label>
				</div>
			</form>
		</div>
		<table class="table">
			<tr>
				<th>사진</th>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>연락처</th>
				<th>이메일</th>
				<th>상태</th>
				<th>등급</th>
			</tr>
			<c:forEach items="${list }" var="vo">
				<tr class="dataRow">
					<td><img alt="사진" src="${vo.photo }" class="img-rounded"
						style="width: 20px; height: 24px"></td>
					<td class="id">${vo.id }</td>
					<td>${vo.name }</td>
					<td><fmt:formatDate value="${vo.birth }" pattern="yyyy-MM-dd" /></td>
					<td>${vo.gender }</td>
					<td>${vo.tel }</td>
					<td>${vo.email }</td>
					<td>${vo.status }</td>
					<td>${vo.gradeName }</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="9"><pageNav:pageNav listURI="list.do"
						pageObject="${pageObject }"></pageNav:pageNav></td>
			</tr>
		</table>
	</div>
</body>
</html>