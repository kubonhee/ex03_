
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- Custom fonts for this template -->
	    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	    <link
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	        rel="stylesheet">
	
	    <!-- Custom styles for this template -->
	    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
	
	    <!-- Custom styles for this page -->
	    <link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
		<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<title>번개장터</title>
	</head>
		<body class="bg-gradient">
			<div class="container w-25">
				<div class="h-25 d-inline-block"></div>
				<div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">
                    	<a href="${pageContext.request.contextPath}/index">
                   			<img alt="loginImg" src="${pageContext.request.contextPath}/resources/img/mainlogo4.svg" style="font-size: 100px;width: 200px;">
						</a>                    
                    </h1>
                </div>
			
				<form action="/register" method="post">
					<div class="form-group">
						<label for="userId">사용자 아이디</label>
						<input type="text" class="form-control" name="userid" id="userid" placeholder="아이디">
					</div>
					<div class="form-group has-feedback">
						<label for="userPw">패스워드</label>
						<input type="password" class="form-control" name="userpw" id="userpw" placeholder="비밀번호" />
					</div>
					<div class="form-group has-feedback">
						<label  for="name">이름</label>
						<input type="text" class="form-control" name="userName" id="userName" placeholder="이름" />
					</div>
					<div class="form-group has-feedback text-center mt-4">
						<button type="submit" class="submit btn btn-danger container" style="height: 50px;">회원가입</button>
						<button class="cencle btn btn-danger w-25 d-none" type="button">취소</button>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				</form>
			</div>
		</body>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "${pageContext.request.contextPath}/customLogin";
						    
			})
		
			$(".submit").on("click", function(){
		 		if($("#userid").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
		 		
				if($("#userpw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userpw").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
 					return false;
				} 
					location.href = "${pageContext.request.contextPath}/customLogin";
			});
		})
	</script>
	
</html>