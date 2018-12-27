<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <!-- Custom styles for this template -->
    <link href="css/small-business.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<style>
body{
	display:flex;
  	align-items:center;
}

</style>
<body>
	
    
    <div class="container" align="center" style="width:100%"> <!-- container -->
    	<div class="row">
    		<h3>비교하고 싶은 영화를 검색해주세요♥</h3>
	    	<div class="review-search">
	    		<ul>
	    			<li><input id="search-input" name="search" placeholder="영화 검색" class="form-control input-lg" autocomplete="off" type="text" style="padding-top:0px;padding-bottom:0px;"></li>
	           		<li><button class="btn btn-lg btn-search" onclick="search()">검색</button></li>
	            </ul>
       		</div>
    	</div>
    	<script type="text/javascript">
    		function search(){
    			opener.location.href="movie_analysis_page2.do";
    			self.close();
    		}
    	</script>
    	<br />
    	<br />
    	<br />
    	<br />
    	<br />
    </div>
    
    	 
    
    
    
    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
