<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% 
	String movie_title="보헤미안 랩소디";
	String movie_img="images/poster.jpg";
	//String movie_img="http://placehold.it/180x240";
	String sessionId = (String)session.getAttribute("memId");
	System.out.println("sessionId: "+sessionId);
%>

<script> var session_id = '<%=sessionId%>'; </script>
<script type="text/javascript">
	var popupX = (window.screen.width/2) - (750/2);
	var popupY = (window.screen.height/2) - (450/2);
    		
	function openReviewWrite(){
    	if(session_id == "null") {
    		alert("로그인 후 작성하실 수 있습니다.");
    		window.location.href='login.do';
    	} else {
    		window.open('review_write_popup.do', '감상평 작성', 'toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=750,height=450,left='+popupX+',top='+popupY);
    	}
    }
</script>
    	
<!DOCTYPE html>
<html lang="en">

  <head>
    <!-- Custom styles for this template -->
    <link href="css/small-business.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    
  </head>
  
  <body>
  
    <!-- =====  HEADER START  ===== -->
    <jsp:include page="menu.jsp" flush="false"/>
    <!-- =====  HEADER END  ===== -->
    
    <!-- Page Content -->
    <div class="container">
    	<div class="review-search">
    		<ul>
    			<li><input id="search-input" name="search" placeholder="영화 검색" class="form-control input-lg" autocomplete="off" type="text"></li>
           		<li><button class="btn btn-lg btn-search">검색</button></li>
            </ul>
        </div>
        
		<ul class="movie_list">
			<% for(int i=0;i<10;i++){ %>
			<li class="movie_li cols-xs-12">
				<div class="review-summary">
					<div style="height:20px"></div>
					<div class="review-summary-menu">
        				<span class="review_writer" style="font-weight:bold">작성자</span>
        				<span class="review_comment" style="font-weight:bold"><a href="#">감상평</a></span>
        				<span class="review_date" style="font-weight:bold">작성 날짜</span>
        				<span class="review_grade" style="font-weight:bold">평점</span>
        				<span class="review_sympathy" style="font-weight:bold">공감수</span>
	        		</div>
        			<% for(int j=1;j<=5;j++) {%>
		        		<div>
        					<!-- 감상평 -->
        					<span class="review_writer">las139</span>
        					<span class="review_comment"><a href="#">정말 재미있었네요~~~~~~~~~~ 정말 재미있었네요~~~~~~~~~~</a></span> 
        					<span class="review_date">2018.11.25 17:31</span>
        					<!-- 별점 -->
        					<span class="review_grade">
								<span class="bg_star star_grade"><span class="bg_star inner_star" style="width:71.7%">평점</span></span> <!-- 116px이 100%, % 계산에서 width값에 적용-->
								<em class="emph_grade">7.1</em>
							</span>
        				<span class="review_sympathy" style="padding-left:10px">201</span>
	        			</div>
	        		<%} %>
	        	</div>
	        </li>
			<%} %>
		</ul>
		
    	<a class="btn btn-primary btn-lg" onclick="openReviewWrite()" style="position:fixed;right:200px;bottom:20px;">감상평 작성</a>
    </div>
    <!-- /.container -->
        
    <!-- =====  FOOTER START  ===== -->
    <jsp:include page="footer.jsp" flush="false"/>
    <!-- =====  FOOTER                       END  ===== -->


    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
