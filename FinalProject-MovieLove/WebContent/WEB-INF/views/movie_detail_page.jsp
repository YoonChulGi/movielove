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
.movie_detail_top_area {
    background-repeat: no-repeat !important;
    background-size: cover !important;
    background-position: 50% 50% !important;
    height: 430px;
    /*opacity: 0.5;*/
}

.top_area_cover {
    height: 430px;
    background: url(http://image.cine21.com/www1/common/bg_gradient.png) repeat-x left bottom;
}

.mov_top {
    position: relative;
    width: 970px;
    margin: 0 auto;
    height: 430px;
}

.mov_poster {
    position: absolute;
    left: 0;
    top: 200px;
}

.mov_poster img {
    width: 230px;
    height: 330px;
    border: 4px solid #fff;
}
.mov_info {
    position: absolute;
    left: 280px;
    bottom: 20px;
}

.tit {
    font-weight: bold;
    color: #fff;
    font-size: 30px;
}

.sub_info {
    font-size: 14px;
    color: #f4f4f4;
    margin-bottom: 5px;
}

</style>
<body>
	<!-- =====  HEADER START  ===== -->
    <jsp:include page="menu.jsp" flush="false"/>
    <!-- =====  HEADER END  ===== -->
    
    <div class="container"> <!-- container -->
    
    	<div class="row">
    		<div class="col-lg-12 col-xs-12 col-md-12 col-sm-12 movie_detail_top_area" style="background:url('http://image.cine21.com/cine21/still/2018/1217/51955_5c174480e492c.jpg');">
    			<div class="top_area_cover">
    				<div class="mov_top">
    					<div class="mov_poster">
    						<img src="http://image.cine21.com/resize/cine21/poster/2018/1206/51955_5c08765455234[X230,330].jpg"/>
    					</div>
    					<div class="mov_info">
    						<p class="tit">내안의 그놈</p>
    						<p class="tit_eng"><span>Inside me</span></p>
    						<p class="sub_info">
	    						<span>2017</span>
	    						<span>한국</span>
	    						<span>15세 관람가</span>
    						</p>
							<p class="sub_info">
								<span>코미디</span>
								<span>상영시간 : 122분</span>
							</p>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    
    </div>
    
    <!-- =====  FOOTER START  ===== -->
    <jsp:include page="footer.jsp" flush="false"/>
    <!-- =====  FOOTER END  ===== -->
    
    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
