<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVENT WRITE</title>
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
	$(function() {
		$("#cancleBtn").click(function() {
			history.back();
		});
	});
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
		$(".datepicker").datepicker("option", {
			"maxDate" : (new Date()+100),
			"yearRange" : yearRange
		});
		});

</script>
</head>
<body>
	<section class="wrapper">
		<div class="container">
			<h2>EVENT WRITE</h2>
			<form action="write.do" method="post">
				<input type="hidden" name="perPageNum" value="${param.perPageNum }">
				<div class="form-group">
					<label>제목</label> <input name="title" id="title"
						class="form-control">
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea name="content" id="content" class="form-control" rows="7"></textarea>
				</div>
				<div class="form-group">
					<label>시작일</label> <input name="startDate" id="startDate"
					class="form-control datepicker"	placeholder="yyyy-mm-dd" autocomplete="off">
				</div>
				<div class="form-group">
					<label>종료일</label> <input name="endDate" id="endDate"required="required"
					class="form-control datepicker"placeholder="yyyy-mm-dd" autocomplete="off">
				</div>
				<button class="btn btn-default">등록</button>
				<button type="reset" class="btn btn-default">새로입력</button>
				<button type="button" id="cancleBtn" class="btn btn-default">취소</button>
			</form>
		</div>
	</section>
</body>
</html>