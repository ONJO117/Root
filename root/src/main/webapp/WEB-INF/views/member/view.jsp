<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title }</title>
<script type="text/javascript">
	// body(문서-document)가 가 로딩되면 동작이 되도록 선언한 상태
	$(function() {
		// deleteDiv id를 찾아서 숨긴다.(hide)
		// deleteDiv가 보였다가 숨겨진다. -> 원래부터 안보이기 CSS의 visiability
		$("#deleteDiv").hide();
		$("#updateDiv").hide();
		$("#changePhotoDiv").hide();
		$("#changePhotoBtn").click(function() {
			$("#changePhotoDiv").slideToggle();
		});
	});
</script>
<style type="text/css">
#changeImageDiv {
	display: none;
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
	<div class="container">
		<h2>${title }</h2>
		<div class="table">
			<div class="well well-sm row">
				<div class="col-sm-3">아이디</div>
				<div class="col-sm-9">${vo.id }</div>
			</div>
			<div class="well well-sm row">
				<div class="col-sm-3">이름</div>
				<div class="col-sm-9">${vo.name }</div>
			</div>
			<div class="well well-sm row">
				<div class="col-sm-3">성별</div>
				<div class="col-sm-9">${vo.gender }</div>
			</div>
			<div class="well well-sm row">
				<div class="col-sm-3">생년월일</div>
				<div class="col-sm-9">
					<fmt:formatDate value="${vo.birth }" pattern="yyyy-MM-dd" />
				</div>
			</div>
			<div class="well well-sm row">
				<div class="col-sm-3">연락처</div>
				<div class="col-sm-9">${vo.tel }</div>
			</div>
			<div class="well well-sm row">
				<div class="col-sm-3">이메일</div>
				<div class="col-sm-9">${vo.email }</div>
			</div>
			<div class="well well-sm row">
				<div class="col-sm-3">가입일</div>
				<div class="col-sm-9">
					<fmt:formatDate value="${vo.regDate }" pattern="yyyy-MM-dd" />
				</div>
			</div>
			<div class="well well-sm row">
				<div class="col-sm-3">
					<div>
						사진
						<button id="changePhotoBtn" class="btn btn-warning btn-sm">바꾸기</button>
					</div>
					<div id="changePhotoDiv">
						<form action="changePhoto.do" method="post"
							enctype="multipart/form-data">
							<input name="id" type="hidden" value="${vo.id }">
							<input name="deletePhoto" value="${vo.photoFile }" type="hidden">
							<input type="file" name="photoFile" class="form-control">
							<button class="btn btn-default btn-sm">바꾸기</button>
							<a type="button" onclick="$('#changePhotoDiv').hide();"
								class="btn btn-default btn-sm">취소</a>
						</form>
					</div>
				</div>
				<div class="col-sm-9">
					<img alt="${vo.photo }" src="${vo.photo }"
						style="width: 50px; height: 65px">
				</div>
			</div>
			<div class="well well-sm row">
				<div class="col-sm-3">등급</div>
				<div class="col-sm-9">${vo.gradeName }</div>
			</div>
			<c:if test="${!empty login.id }">
				<div class="well row">
					<div>
						<a onclick="$('#updateDiv').show();" class="btn btn-default">정보수정</a>
						<a onclick="$('#deleteDiv').show();" class="btn btn-default">회원탈퇴</a>
						<div id="updateDiv">
							<h3>수정에 필요한 정보입력</h3>
							<form
								action="update.do?id=${vo.id }&page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key }&word=${param.word}">
								<label for="id">아이디</label><input name="id" id="id"> <label
									for="pw">비밀번호</label><input name="pw" id="pw" type="password">
								<button class="btn btn-default">수정</button>
								<a type="button" onclick="$('#updateDiv').hide();"
									class="btn btn-default">취소</a>
							</form>
						</div>
						<div id="deleteDiv">
							<h3>삭제에 필요한 정보입력</h3>
							<form action="delete.do">
								<label for="id">아이디</label> <input name="id" id="id"> <label
									for="pw">비밀번호</label><input name="pw" id="pw"> <label
									for="tel">전화번호</label><input name="tel" id="tel">
								<button class="btn btn-default">삭제</button>
								<a type="button" onclick="$('#deleteDiv').hide();"
									class="btn btn-default">취소</a>
							</form>
						</div>
						<c:if
							test="${login.gradeNo == 9 && !empty param.id && login.id != vo.id }">
							<form action="changeStatus.do" method="post">
								<input type="hidden" name="id" value="${vo.id }"> <input
									type="hidden" name="page" value="${param.page }"> <input
									type="hidden" name="perPageNum" value="${param.perPageNum }">
								<div class="input-group">
									<div class="col-sm-3">상태 변경</div>
									<div class="col-sm-9">
										<select name="status" class="form-control">
											<option ${(vo.status == "정상")?"selected":"" }>정상</option>
											<option ${(vo.status == "탈퇴")?"selected":"" }>탈퇴</option>
											<option ${(vo.status == "강퇴")?"selected":"" }>강퇴</option>
											<option ${(vo.status == "휴면")?"selected":"" }>휴면</option>
										</select>
									</div>
									<div class="input-group-btn">
										<button class="btn btn-default">변경</button>
									</div>
								</div>
							</form>
							<!-- 등급 변경 -->
							<form action="changeGradeNo.do" method="post">
								<input type="hidden" name="id" value="${vo.id }"> <input
									type="hidden" name="page" value="${param.page }"> <input
									type="hidden" name="perPageNum" value="${param.perPageNum }">
								<div class="input-group">
									<div class="col-sm-3">등급 변경</div>
									<div class="col-sm-9">
										<select name="gradeNo" class="form-control">
											<option ${(vo.gradeNo == "1")?"selected":"" } value="1">일반회원</option>
											<option ${(vo.gradeNo == "9")?"selected":"" } value="9">관리자</option>
										</select>
									</div>
									<div class="input-group-btn">
										<button class="btn btn-default">변경</button>
									</div>
								</div>
							</form>
						</c:if>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>