<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="kr">

  <head>
    <!-- Custom styles for this template -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/small-business.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  
  <style>
	#ui-id-1 {
	    z-index: 99999;
	    position: absolute;
	    max-width: 220px;
	    max-height: 175px;
	    overflow-x: hidden;
	    overflow-y: hidden;
	    left: 1212px;
	    top: 232px;
	    border-top: 0px;
	    border-left: 1px solid #565656;
	    border-right: 1px solid #565656;
	    border-bottom: 1px solid #565656;
	    background-color: #fff;
	    -webkit-box-shadow: 0px 1px 2px rgba(0,0,0,.07);
	    box-shadow: 0px 1px 2px rgba(0,0,0,.07);
	}	
	#ui-id-1 li {
	    display: block;
    	height: 58px;
    	line-height: 38px;
    	font-size: 13px;
    	color: #333;
    	border-top: 1px solid #e8e8e8;
    	text-align: center;
	}
	#ui-id-1 li .link_item {
	    display: block;
	    overflow: hidden;
	    padding: 7px 11px;
	}
	#ui-id-1 li .thumb_g {
	    float: left;
	    width: 30px;
	    height: 40px;
	    background-color: #f4f4f4;
	}
	#ui-id-1 li .cont_item {
	    overflow: hidden;
	    padding-left: 10px;
	    line-height: 21px;
	    vertical-align: middle;
	    -webkit-box-sizing: border-box;
	    -moz-box-sizing: border-box;
	    box-sizing: border-box;
	}
	#ui-id-1 li .tit_item {
	    display: block;
	    text-align: left;
	    overflow: hidden;
	    max-height: 23px;
	    margin-top: -1px;
	    font-weight: normal;
	    font-size: 13px;
	    color: #333;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	}
	#ui-id-1 li .emph_sgt {
	    color: #4889ff;
	}
	#ui-id-1 li .txt_year {
	    display: block;
	    text-align: left;
	    overflow: hidden;
	    width: 100%;
	    height: 19px;
	    margin-top: -4px;
	    font-size: 13px;
	    color: #9f9f9f;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	}
	</style>
	
	<!--  영화 검색 자동완성 스크립트 -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
	
  	$( function() {
		// 리스트 생성
		var movieList = new Array();
	
		<c:forEach items="${movieList}" var="movie">
			// 객체 생성
			var data = new Object();
        	data.label = '${movie.MOVIE_TITLE}';
			data.year = '${movie.MOVIE_YEAR}';
        	data.img_src = '${movie.MOVIE_IMG}';
        	data.id = '${movie.MOVIE_ID}';
        	console.log("data.label: "+data.label);
          	
        	// 리스트에 생성된 객체 삽입
	    	movieList.push(data);
		</c:forEach>
	    
	    // String 형태로 변환
	    var jsonData = JSON.stringify(movieList);
	    var jsonArray = JSON.parse(jsonData);
	    $('#search-menu').focus(function(){
    		$( "#search-menu" ).autocomplete( "enable" );
    	});
	 
	    $( "#search-menu" ).autocomplete({
      	minLength: 1,
      	max: 3,
      	source: jsonArray,
      	success: function (result) {
    	    	response($.map(jsonArray.slice (0,3), function(item) {
    	    	return {
    	    	value: item.label
    	    	};
    	    	}));
      	},
      	focus: function( event, ui ) {
        	return false;
      	},
      	select: function( event, ui ) {
			location.href='movie_detail_page.do?id='+ui.item.id;
        	return false;
      	}
    	})
    	.autocomplete( "instance" )._renderItem = function( ul, item ) {
      	return $( "<li id='movie_list_li'>" )
	        .append("<div class='link_item'> <span class='thumb_g'> <img src='"+item.img_src+"' width='30' height='40' class='thumb_img'></span> <div class='cont_item'> <strong class='tit_item'> <span class='emph_sgt'>"+item.label+"</span></strong> <span class='txt_year'>"+item.year+"</span></div></div>")
      		.append("</li>")
        	.appendTo( ul );
    	};
  	} );
	</script>
	
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
		   	<c:forEach var="i" begin="1" end="${list.size()}" step="4" varStatus="status">
	      	<div class="row">
	      		<c:if test="${list.size() <= status.index + 3}">
		      		<c:forEach var="i" begin="${status.index}" end="${list.size()}" step="1">
		      		<div class="col-lg-3 col-sm-6 col-xs-6 col-md-6">
			      		<div class="portfolio-item" align="center">
				    		<div class="card h-100">
								<div class="review-thumb" >
									<a href="movie_detail_page.do?id=${list.get(i-1).getMOVIE_ID() }">
									<img class="card-img-top" src="${list.get(i-1).getMOVIE_IMG()}" alt="" style="width:100%">
									</a>
									<c:if test="${i <= 10}">
										<span class="boxoffice n${i}">${statusMovie.count}</span>
									</c:if>
								</div>
			     				<div class="card-body" id="card-body" align="center" style="max-height:78px">
				     				<h4 class="card-title" style="max-height:28px;overflow:hidden;">
			      						<a href="movie_detail_page.do?id=${list.get(i-1).getMOVIE_ID() }">${list.get(i-1).getMOVIE_TITLE() }</a> 
			      					</h4>
			      					<p class="card-text">예매율 ${list.get(i-1).getMOVIE_RATE()}%</p>
			      					
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
								<div class="review-thumb" >
									<a href="movie_detail_page.do?id=${list.get(i-1).getMOVIE_ID() }">
									<img class="card-img-top" src="${list.get(i-1).getMOVIE_IMG()}" alt="" style="width:100%">
									</a>
									<c:if test="${i <= 10}">
										<span class="boxoffice n${i}">${statusMovie.count}</span>
									</c:if>
								</div>
			     				<div class="card-body" id="card-body" align="center" style="max-height:78px">
			     					<h4 class="card-title" style="max-height:28px;overflow:hidden;">
			      						<a href="movie_detail_page.do?id=${list.get(i-1).getMOVIE_ID() }">${list.get(i-1).getMOVIE_TITLE() }</a> 
			      					</h4>
			      					<p class="card-text">예매율 ${list.get(i-1).getMOVIE_RATE()}%</p>
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
			      					<p class="card-text">${years[i]} 개봉예정</p> <!-- ${ids[i]} -->
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
			      					<p class="card-text">${years[i]} 개봉예정</p> <!-- ${ids[i]} -->
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
  	<script src="js/jQuery_v3.1.1.min.js"></script>
  	<script src="js/jquery-ui.js"></script>
  	<script src="js/jquery.magnific-popup.js"></script>
  	<script src="js/jquery.firstVisitPopup.js"></script>

  </body>

</html>
