<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="spring.vo.bean.MovieVO" %>
<%@ page import="java.util.List" %>

<% 
	String movie_img="images/poster.jpg";
	//String movie_img="http://placehold.it/180x240";
	String sessionId = (String)session.getAttribute("memId");
	System.out.println("sessionId: "+sessionId);
%>
    	
<!DOCTYPE html>
<html lang="en">

  <head>
    <!-- Custom styles for this template -->
    <link href="css/small-business.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
	<script> var session_id = '<%=sessionId%>'; </script>
	<script type="text/javascript">
		var popupX = (window.screen.width/2) - (750/2);
		var popupY = (window.screen.height/2) - (450/2);
    			
		function openReviewWrite(){
	    	if(session_id == "null") {
    			alert("로그인 후 작성하실 수 있습니다.");
    			window.location.href='login.do';
    		} else {
	    		window.open('review_write_popup.do', '감상평 작성', 'toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=850,height=500,left='+popupX+',top='+popupY);
    		}
    	}
	</script>
	
	<!--  영화 검색 자동완성 스크립트 -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
	
  	var isClicked = false;
	
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
	    $('#search-movie').focus(function(){
    		$( "#search-movie" ).autocomplete( "enable" );
    	});
	 
	    $( "#search-movie" ).autocomplete({
      	minLength: 1,
      	source: jsonArray,
      	success: function (result) {
    	    	response($.map(jsonArray.slice (0,3), function(item) {
    	    	return {
    	    	value: item.label
    	    	};
    	    	}));
      	},
      	focus: function( event, ui ) {
	        $( "#search-movie" ).val( ui.item.label );
        	return false;
      	},
      	select: function( event, ui ) {
	        $( "#search-movie" ).val( ui.item.label );
        	$( "#search-movie" ).autocomplete( "disable" );
        	isClicked = true;
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
  
<%
	List<MovieVO> movieList = (List<MovieVO>)request.getAttribute("movieList");
	for(int i=0;i<movieList.size();i++){
		System.out.println("["+(i+1)+"] movie_review_page.jsp 영화제목: "+movieList.get(i).getMOVIE_TITLE());	
	}
%>
  
  <body class="moview_review">
  
    <!-- =====  HEADER START  ===== -->
    <jsp:include page="menu.jsp" flush="false"/>
    <!-- =====  HEADER END  ===== -->
    
    <!-- Page Content -->
    <div class="container">
    	<div class="review-search">
    		<ul>
    			<li>
					<input id="search-movie" name="review_title" placeholder="영화 검색" class="form-control input-lg" type="text">
    			</li>
           		<li>
           			<button class="btn btn-lg btn-search">검색</button>
           		</li>
            </ul>
        </div>
        
        <!-- 요기 붙여넣기 -->
		
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
