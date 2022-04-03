<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 등록 폼</title>
<style type="text/css">
.dataRow:hover {
	cursor: pointer;
	background: #d9d9d9;
}
textarea, input{
	margin-bottom: 30px;

}
.button{
	margin-top: 200px;
	margin-bottom: 50px;

}

.form-group {
	padding: 15px;
	margin: 30px;
}

label {
	font-size: 20px;
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
h2{
 margin-bottom: 20px;
 }

a, a:hover, a:focus {
	color: inherit;
}

body {
	background-color: #F1F2F3;
}
</style>
</head>
<body>
	<section class="wrapper">
		<div class="container">
			<h2>이미지 등록 폼</h2>
			<div class="container">
				<form action="write.do" method="post" enctype="multipart/form-data">
					<input name="perPageNum" value="${param.perPageNum }" type="hidden">
					<div class="form-group">
						<div class="col-sm-2">
							<label>제목</label>
						</div>
						<div class="col-sm-10">
							<input name="title" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2">
							<label>내용</label>
						</div>
						<div class="col-sm-10">
							<textarea rows="7" name="content" class="form-control"></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2">
							<label>이미지 파일</label>
						</div>
						<div class="col-sm-10">
							<input name="image" type="file" class="form-control">
						</div>
					</div>
					<div class="button" style="text-align: center">
						<button class="btn btn-default">등록</button>
						<button type="reset" class="btn btn-default">새로입력</button>
						<button type="button" onclick="history.back()"
							class="btn btn-default">취소</button>
					</div>
				</form>
			</div>
		</div>
	</section>
</body>
</html>