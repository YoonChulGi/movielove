<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="api.MovieRanking2" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	function fnMove(seq){
    	var offset = $("#ranking_menu" + seq).offset();
       	$('html, body').animate({scrollTop : offset.top}, 300);
    }
</script>

<%
	
	String movie_title="보헤미안 랩소디";  //영화 제목
	String movie_num="1,230,928";  //관객수
	String movie_img="images/poster.jpg";
	//String movie_img="http://placehold.it/240x342";
	
	String sel1="", sel2="", sel3="";
	String sel = request.getParameter("sel");
	
	if(sel != null){
		if(sel.equals("1")){
	sel1 = "on";
		} else if(sel.equals("2")){
	sel2 = "on";
		} else if(sel.equals("3")){
	sel3 = "on";
		}
	} else{
		sel1 = "on";
	}
%>

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
    <!-- Page Content -->
    <div class="container">
      	<div class="row" id="movie_ranking" align="center">
	    		<div class="col-lg-4" style="padding:0">
		          	<div class="ranking">
		          		<h4 class="card-title pt_10 pb_10 mb_5" style="background-color:#E16868">일간 박스오피스 순위</h4>
	              		<div class="ranking-line" text-align="center" style="color:#E16868;">
	              			<span class="ranking-no" style="float:left;">순위</span>
	              			<span class="ranking-title">영화 제목</span>
	              			<span class="ranking-num" style="float:right;">관객수</span>
	              		</div>
    					<c:if test="${not empty dailyResult}">
    						<c:forEach items="${dailyResult}" var="boxoffice">
		              		<div class="ranking-line" text-align="center">
	              				<span class="ranking-no">${boxoffice.RANK}</span>
	              				<span class="ranking-title">${boxoffice.TITLE}</span>
	              				<span class="ranking-num">${boxoffice.AUDICNT}명</span>
	              			</div>
    						</c:forEach>
    					</c:if>
          			</div>
        		</div>
	    		<div class="col-lg-4" style="padding:0">
		          	<div class="ranking">
		          		<h4 class="card-title pt_10 pb_10 mb_5" style="background-color:#47a8ac;">주간 박스오피스 순위</h4>
	              		<div class="ranking-line" text-align="center" style="color:#47a8ac;">
	              			<span class="ranking-no" style="float:left;">순위</span>
	              			<span class="ranking-title">영화 제목</span>
	              			<span class="ranking-num" style="float:right;">관객수</span>
	              		</div>
    					<c:if test="${not empty weeklyResult}">
    						<c:forEach items="${weeklyResult}" var="boxoffice">
		              		<div class="ranking-line" text-align="center">
	              				<span class="ranking-no">${boxoffice.RANK}</span>
	              				<span class="ranking-title">${boxoffice.TITLE}</span>
	              				<span class="ranking-num">${boxoffice.AUDICNT}명</span>
	              			</div>
    						</c:forEach>
    					</c:if>
          			</div>
        		</div>
	    		<div class="col-lg-4" style="padding:0">
		          	<div class="ranking">
		          		<h4 class="card-title pt_10 pb_10 mb_5" style="background-color:#5f61ab;">주말 박스오피스 순위</h4>
	              		<div class="ranking-line" text-align="center" style="color:#5f61ab;">
	              			<span class="ranking-no" style="float:left;">순위</span>
	              			<span class="ranking-title" style="overflow:hidden">영화 제목</span>
	              			<span class="ranking-num" style="float:right;">관객수</span>
	              		</div>
    					<c:if test="${not empty weekendResult}">
    						<c:forEach items="${weekendResult}" var="boxoffice">
		              		<div class="ranking-line" text-align="center">
	              				<span class="ranking-no">${boxoffice.RANK}</span>
	              				<span class="ranking-title">${boxoffice.TITLE}</span>
	              				<span class="ranking-num">${boxoffice.AUDICNT}명</span>
	              			</div>
    						</c:forEach>
    					</c:if>
          			</div>
        		</div>
      	</div>
      	
    	<div class="row mt_30" id="movie_ranking_menu">
    		<ul> 
    			<li style="width:33.33%"><a href="movie_ranking_page.jsp?sel=1" class="<%=sel1%>" id="ranking_menu1">일간<span class="ico"></span></a></li>
    			<li style="width:33.33%"><a href="movie_ranking_page.jsp?sel=2" class="<%=sel2%>" id="ranking_menu2">주간<span class="ico"></span></a></li>
    			<li style="width:33.33%"><a href="movie_ranking_page.jsp?sel=3" class="<%=sel3%>" id="ranking_menu3">연간<span class="ico"></span></a></li>
    		</ul>
    	</div>
    	
      	<div class="row mt_20">
    		<c:forEach items="${dailyResult}" begin="0" end="3" var="boxoffice">
      		<div id="movie_info_row">
	    		<div class="col-lg-3 col-sm-6 portfolio-item">
		          	<div class="card h-100">
		          		<div class="img-body" align="center">
	            			<a href="#"><img class="card-img-top" src="<%=movie_img%>" alt=""></a>
	            		</div>
            			<div class="card-body mt_5" id="card-body" align="center">
	              			<h4 class="card-title">
			                	<a href="#">${boxoffice.TITLE}</a>
              				</h4>
              				<p class="card-text">관객수 ${boxoffice.AUDICNT}</p>
            			</div>
          			</div>
        		</div>
        	</div>
    		</c:forEach>
    		<c:forEach items="${dailyResult}" begin="4" end="7" var="boxoffice">
      		<div id="movie_info_row">
	    		<div class="col-lg-3 col-sm-6 portfolio-item">
		          	<div class="card h-100">
		          		<div class="img-body" align="center">
	            			<a href="#"><img class="card-img-top" src="<%=movie_img%>" alt=""></a>
	            		</div>
            			<div class="card-body mt_5" id="card-body" align="center">
	              			<h4 class="card-title">
			                	<a href="#">${boxoffice.TITLE}</a>
              				</h4>
              				<p class="card-text">관객수 ${boxoffice.AUDICNT}</p>
            			</div>
          			</div>
        		</div>
        	</div>
    		</c:forEach>
    		<c:forEach items="${dailyResult}" begin="8" end="9" var="boxoffice">
      		<div id="movie_info_row">
	    		<div class="col-lg-3 col-sm-6 portfolio-item">
		          	<div class="card h-100">
		          		<div class="img-body" align="center">
	            			<a href="#"><img class="card-img-top" src="<%=movie_img%>" alt=""></a>
	            		</div>
            			<div class="card-body mt_5" id="card-body" align="center">
	              			<h4 class="card-title">
			                	<a href="#">${boxoffice.TITLE}</a>
              				</h4>
              				<p class="card-text">관객수 ${boxoffice.AUDICNT}</p>
            			</div>
          			</div>
        		</div>
        	</div>
    		</c:forEach>
        </div>
    </div>
    <!-- /.container -->
        
    <!-- =====  FOOTER START  ===== -->
    <jsp:include page="footer.jsp" flush="false"/>
    <!-- =====  FOOTER END  ===== -->


    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
