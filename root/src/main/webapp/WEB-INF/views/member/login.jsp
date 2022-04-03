<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
.login-container {
	margin-top: 5%;
	margin-bottom: 5%;
}

.login-form-1 {
	padding: 5%;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0
		rgba(0, 0, 0, 0.19);
}

.login-form-1 h3 {
	text-align: center;
	color: #333;
}

.login-container form {
	padding: 10%;
}

.btnSubmit {
	width: 25%;
	border-radius: 1rem;
	padding: 1.5%;
	border: none;
	cursor: pointer;
}
.btnSubmit-2 {
	width: 25;
	border-radius: 1rem;
	padding: 1.5%;
	border: none;
	cursor: pointer;
}

.login-form-1 .btnSubmit {
	font-weight: 600;
	color: #fff;
	background-color: #0062cc;
}

.btnSubmit-2 {
	font-weight: 600;
	color: #fff;
	background-color: #999999;
}

.login-form-1 {
	color: #0062cc;
	font-weight: 600;
	text-decoration: none;
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
	<div class="container login-container">
		<div class="row">
			<div class="login-form-1">
				<h3>Login</h3>
				<form action="login.do" method="post">
					<div class="form-group">
						<label for="id">id</label> <input name="id" required="required"
							class="form-control" placeholder="Your id *">
						<div class="form-group">
							<label for="pw">password</label> <input name="pw" required="required"
								type="password" class="form-control"
								placeholder="Your Password *">
						</div>
						<button class="btn btn-default btnSubmit">Login</button>
						<button type="button" class="btn btn-default btnSubmit-2"
							onclick="history.back()">back</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
</body>
</html>
