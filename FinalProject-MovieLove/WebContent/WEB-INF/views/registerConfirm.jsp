<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <!-- Custom styles for this template -->
    <link href="css/small-business.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>

	<!-- =====  HEADER START  ===== -->

         
    <jsp:include page="menu.jsp" flush="false"/>
    <!-- =====  HEADER END  ===== -->
    
    <div class="container" style="padding-bottom:140px;" >
    <div class="row">
    <div class="col-lg-12 col-sm-6">
    <div class="submit" style=" padding-top:50px; padding-bottom:60px; color:gray; " >
    	<h2 align="center" style="padding-top:60px;"><img alt="themini" src="images/logo.png">회원가입을 축하합니다!</h2>
    	<div class="button lg col-lg-12 text-center" style="align:center; padding-top:40px;">
    	<a class="btn btn-primary btn" href="main.do" style="width:100px;" >메인으로</a>
    	<a class="btn btn-primary btn" href="login.do" style="width:100px;">로그인</a>
    	</div>
    	</div>
    </div>
    </div>
    </div> 
    <!-- container -->
  
    <!-- =====  FOOTER START  ===== -->
    <jsp:include page="footer.jsp" flush="false"/>
    <!-- =====  FOOTER END  ===== -->	
    
    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
