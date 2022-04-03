<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500 Error Page</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<h2>500 Error Page</h2>
	<div class="container">
		<h2>에러 페이지</h2>
		<div class="alert alert-danger">${exception.message }</div>
		<ul class="list-group">
			<c:forEach items="${exception.stackTrace }" var="stack">
				<li class="list-group-item">${stack }</li>
			</c:forEach>
		</ul>
	</div>
	<ul class="list-group">
		<li class="list-group-item">500 Error</li>
		<li class="list-group-item">계속 페이지를 찾지 못하면 담당자에게 연락 주세요.</li>
		<li class="list-group-item"><a href="/main/main.do" class="btn btn-default">메인으로 이동</a></li>
</ul>
</div>
</body>
</html>