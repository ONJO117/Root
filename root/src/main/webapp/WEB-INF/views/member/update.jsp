<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정</title>
<style type="text/css">
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
	$(function() {
		// datepicker 클래스 이벤트 - 적정한 옵션을 넣어서 초기화 시켜 준다. 기본 datepicker()로 사용 가능
		$(".datepicker").datepicker(
				{
					changeMonth : true,
					changeYear : true,
					dateFormat : "yy-mm-dd",
					dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
					monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월",
							"7월", "8월", "9월", "10월", "11월", "12월" ]
				});

		var now = new Date();
		var startYear = now.getFullYear();
		var yearRange = (startYear - 100) + ":" + startYear;
		// datepicker - 초기값으로 셋팅하는 방법을 사용하면 2번째는 무시 당한다.
		//원래 있던 datepicker에 option을 추가하는 방법이다.
		$(".datepicker").datepicker("option", {
			"maxDate" : new Date(),
			"yearRange" : yearRange
		});

	});// $(function(){}) 의 끝
</script>
</head>
<body>
	<div class="container">
		<h2>정보 수정</h2>
		<form action="update.do" method="post" id="updateForm">
			<div class="form-group">
				<label for="id">아이디</label>
				<input id="id" name="id" class="form-control" pattern="[A-Za-z0-9]{4,20}" value="${vo.id }" readonly="readonly" autocomplete="off">
			</div>
			
			<div class="form-group">
				<label for="name">이름</label> <input id="name" name="name"
					class="form-control" required="required" pattern="[가-힣]{2,10}"
					value="${vo.name }">
			</div>
			<div class="form-group">
				<label>성별</label>
				<div>
					<label class="radio-inline">
					<input name="gender" type="radio" value="남자" ${(vo.gender == '남자')?'checked':'' }>남자</label>
					<label class="radio-inline">
					<input name="gender" type="radio" value="여자" ${(vo.gender == '여자')?'checked':'' }>여자</label>
				</div>
			</div>
			<div class="form-group">
				<label for="birth">생년월일</label> <input id="birth" name="birth"
					class="form-control datepicker" required="required"
					value='<fmt:formatDate value="${vo.birth }"/>' autocomplete="off">
			</div>
			<div class="form-group">
				<label for="tel">연락처</label> <input id="tel" name="tel"
					class="form-control" required="required" value="${vo.tel }">
			</div>
			<div class="form-group">
				<label for="email">이메일</label> <input id="email" name="email"
					class="form-control" required="required" value="${vo.email }">
			</div>
			<button class="btn btn-default">수정</button>
			<button type="button" onclick="history.back()"
						class="btn btn-default">취소</button>
		</form>
	</div>
</body>
</html>