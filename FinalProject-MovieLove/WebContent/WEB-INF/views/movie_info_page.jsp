<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    
    <!-- Page Content -->
    <div class="container">
    	<div class="row" id="movie_info_menu">
    		<ul>
    			<li style="width:33.33%"><a id="show1" href="movie_info_page.do?sel=1">현재 상영중<span class="ico"></span></a></li>
    			<li style="width:33.33%"><a id="show2" href="movie_info_page.do?sel=2">개봉 예정<span class="ico"></span></a></li>
    			<li style="width:33.33%"><a id="show3" href="movie_info_page.do?sel=3">지난 영화<span class="ico"></span></a></li>
    		</ul>
    		<script>
    			var sel = ${sel};
    			if(sel=='1'){
    				document.getElementById("show1").classList.add('on');
    				document.getElementById("show2").classList.remove('on');
    				document.getElementById("show3").classList.remove('on');
    			} else if(sel=='2') {
    				document.getElementById("show2").classList.add('on');
    				document.getElementById("show1").classList.remove('on');
    				document.getElementById("show3").classList.remove('on');
    			} else if(sel=='3'){
    				document.getElementById("show3").classList.add('on');
    				document.getElementById("show1").classList.remove('on');
    				document.getElementById("show2").classList.remove('on');
    			}
    		</script>
    	</div>
    	
      	<div class="row mt_20">
      	
      	<div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
      		<c:if test="${sel == '1' }">
      		<h2>사이즈: ${list.size()}</h2>
		   	<c:forEach var="i" begin="1" end="${list.size()}" step="4" varStatus="status">
	      	<div class="row">
	      		<c:if test="${list.size() <= status.index + 3}">
		      		<c:forEach var="i" begin="${status.index}" end="${list.size()}" step="1">
		      		<div class="col-lg-3 col-sm-6 col-xs-6 col-md-6">
			      		<div class="portfolio-item" align="center">
				    		<div class="card h-100">
			      				<div class="img-body" align="center">
				    				<a href="movie_detail_page.do?id=${list.get(i-1).getMOVIE_ID() }"><img class="card-img-top" src="${list.get(i-1).getMOVIE_IMG()}" alt="" style="width:100%"></a>
			     				</div>
			     				<div class="card-body" id="card-body" align="center" style="max-height:78px">
				     				<h4 class="card-title" style="max-height:28px;overflow:hidden;">
			      						<a href="movie_detail_page.do?id=${list.get(i-1).getMOVIE_ID() }">${list.get(i-1).getMOVIE_TITLE() }</a> 
			      					</h4>
			      					<c:if test="${list.get(i-1).getMOVIE_RATE()<1 }">
			      						<p class="card-text">예매율 0${list.get(i-1).getMOVIE_RATE()}%</p>
			      					</c:if>
			      					<c:if test="${list.get(i-1).getMOVIE_RATE()>=1 }">
			      						<p class="card-text">예매율 ${list.get(i-1).getMOVIE_RATE()}%</p>
			      					</c:if>
			      					
			      					<p class="card-text">${list.get(i-1).getMOVIE_YEAR()} 개봉</p>
			      				</div>
			      			</div>
			      		</div>
			      	</div>
		      		</c:forEach>
		      	</c:if>
	      		<c:if test="${list.size() > status.index + 3}">
		      		<c:forEach var="i" begin="${status.index}" end="${status.index + 3}" step="1">
			      	<div class="col-lg-3 col-sm-6 col-xs-6 col-md-6">
			      		<div class="portfolio-item" align="center">
			      			<div class="card h-100">
			      				<div class="img-body" align="center">
			      					<a href="movie_detail_page.do?id=${list.get(i-1).getMOVIE_ID() }"><img class="card-img-top" src="${list.get(i-1).getMOVIE_IMG()}" alt="" style="width:100%"></a>
			     				</div>
			     				<div class="card-body" id="card-body" align="center" style="max-height:78px">
			     					<h4 class="card-title" style="max-height:28px;overflow:hidden;">
			      						<a href="movie_detail_page.do?id=${list.get(i-1).getMOVIE_ID() }">${list.get(i-1).getMOVIE_TITLE() }</a> 
			      					</h4>
			      					<c:if test="${list.get(i-1).getMOVIE_RATE()<1 }">
			      						<p class="card-text">예매율 0${list.get(i-1).getMOVIE_RATE()}%</p>
			      					</c:if>
			      					<c:if test="${list.get(i-1).getMOVIE_RATE()>=1 }">
			      						<p class="card-text">예매율 ${list.get(i-1).getMOVIE_RATE()}%</p>
			      					</c:if>
			      					<p class="card-text">${list.get(i-1).getMOVIE_YEAR()} 개봉</p>
			      				</div>
			      			</div>
			      		</div>
			      	</div>
		      		</c:forEach>
		      	</c:if>
	      	</div> <!-- row -->
	      	</c:forEach>
	      	</c:if>
	      	
	      	<c:if test="${sel == '2' }">
		    	<c:forEach var="i" begin="0" end="3" step="1">
		    		<div class="col-lg-3 col-sm-6 col-xs-6 col-md-6">
		    			<div class="portfolio-item" align="center">
		    				<div class="card h-100">
		    					<div class="img-body" align="center">
		    						<a href="movie_detail_page.do?${ids[i] }"><img class="card-img-top" src="${posters[i] }" alt="" style="width:100%;"></a>
		    					</div>
		    					<div class="card-body" id="card-body" align="center" style="max-height:54px">
		    						<h4 class="card-title" style="max-height:28px;overflow:hidden;">
			      						<a href="movie_detail_page.do?${ids[i] }" class="movietitle">${ titles[i]}</a> 
			      					</h4>
			      					<p class="card-text">${years[i]} 개봉예정</p> <!-- ${ids[i]} -->
		    					</div>
		    				</div>
		    			</div>
		    		</div>
		    	</c:forEach>
		    	
		    	<c:forEach var="i" begin="4" end="7" step="1">
		    		<div class="col-lg-3 col-sm-6 col-xs-6 col-md-6">
		    			<div class="portfolio-item" align="center">
		    				<div class="card h-100">
		    					<div class="img-body" align="center">
		    						<a href="movie_detail_page.do?${ids[i] }"><img class="card-img-top" src="${posters[i] }" alt="" style="width:100%;"></a>
		    					</div>
		    					<div class="card-body" id="card-body" align="center" style="max-height:54px">
		    						<h4 class="card-title" style="max-height:28px;overflow:hidden;">
			      						<a href="movie_detail_page.do?${ids[i] }" class="movietitle">${ titles[i]}</a> 
			      					</h4>
			      					<p class="card-text">${years[i]}</p> <!-- ${ids[i]} -->
		    					</div>
		    				</div>
		    			</div>
		    		</div>
		    	</c:forEach>
		    	
		    	<c:forEach var="i" begin="8" end="11" step="1">
		    		<div class="col-lg-3 col-sm-6 col-xs-6 col-md-6">
		    			<div class="portfolio-item" align="center">
		    				<div class="card h-100">
		    					<div class="img-body" align="center">
		    						<a href="movie_detail_page.do?${ids[i] }"><img class="card-img-top" src="${posters[i] }" alt="" style="width:100%;"></a>
		    					</div>
		    					<div class="card-body" id="card-body" align="center" style="max-height:54px">
		    						<h4 class="card-title" style="max-height:28px;overflow:hidden;">
			      						<a href="movie_detail_page.do?${ids[i] }" class="movietitle">${ titles[i]}</a> 
			      					</h4>
			      					<p class="card-text">${years[i]}</p> <!-- ${ids[i]} -->
		    					</div>
		    				</div>
		    			</div>
		    		</div>
		    	</c:forEach>
		    
		    </c:if>
		    
		    
		    <c:if test="${sel == '3' }">
		      	<div class="row">
			      	<c:forEach var="i" begin="1" end="3" step="1">
		    		<div class="col-lg-3 col-sm-6 col-xs-6 col-md-6">
		    			<div class="portfolio-item" align="center">
		    				<div class="card h-100">
		    					<div class="img-body" align="center">
		    						<a href="movie_detail_page.do?${list.get(i-1).getMOVIE_ID() }"><img class="card-img-top" src="${list.get(i-1).getMOVIE_IMG() }" alt="" style="width:100%;"></a>
		    					</div>
		    					<div class="card-body" id="card-body" align="center" style="max-height:54px">
		    						<h4 class="card-title" style="max-height:28px;overflow:hidden;">
			      						<a href="movie_detail_page.do?${list.get(i-1).getMOVIE_ID() }" class="movietitle">${ list.get(i-1).getMOVIE_TITLE()}</a> 
			      					</h4>
			      					<p class="card-text">${list.get(i-1).getMOVIE_YEAR()} 개봉</p> <!-- ${ids[i]} -->
		    					</div>
		    				</div>
		    			</div>
		    		</div>
		    	</c:forEach>
		      	</div>
	      	</c:if>
	      	
	      	
	      	
      	</div>
      	
       </div>
       <!-- /.row -->
       
      <!-- Pagination -->
      <div class="bottom-number mt_20" align="center">
      	<ul class="pagination justify-content-center">
	        <li class="page-item">
          	<a class="page-link" href="#" aria-label="Previous">
	            <span aria-hidden="true">&laquo;</span>
            	<span class="sr-only">Previous</span>
          	</a>
        	</li>
        	<%for(int i=1; i<=5; i++){ %>
        	<li class="page-item">
          		<a class="page-link" href="#"><%=i %></a>
        	</li>
        	<%} %>
        	<li class="page-item">
          	<a class="page-link" href="#" aria-label="Next">
	            <span aria-hidden="true">&raquo;</span>
            	<span class="sr-only">Next</span>
          	</a>
        	</li>
      	</ul>
      </div>
      <!-- /.Pagination -->
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
