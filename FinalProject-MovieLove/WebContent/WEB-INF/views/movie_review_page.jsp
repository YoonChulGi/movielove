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
	    max-height: 175px;
	    overflow-x: hidden;
	    overflow-y: scroll;
	    left: 665px;
	    top: 325px;
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
    
	<script> var session_id = '<%=sessionId%>'; </script>
	<script type="text/javascript">
		var popupX = (window.screen.width/2) - (750/2);
		var popupY = (window.screen.height/2) - (450/2);
    			
		function openReviewWrite(){
	    	if(session_id == "null") {
    			alert("로그인 후 작성하실 수 있습니다.");
    			window.location.href='login.do';
    		} else {
	    		window.open('review_write_popup.do', '40자평 작성', 'toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=850,height=500,left='+popupX+',top='+popupY);
    		}
    	}
	</script>
	
	<!-- 검색 버튼 이벤트 스크립트 -->
	<script>
		function searchMovie(){
			var inputTitle = document.getElementById("search-movie").value;

	    	if(inputTitle == "") {
    			alert("영화 제목을 입력해주세요.");
    		} else {
    			location.href='movie_review_page.do?movieTitle='+inputTitle;
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
           			<input type="button" class="btn btn-lg btn-search" onclick="searchMovie()" value="검색" style="width:80px; background-color:#d9534f; font-size:px"/>
           		</li>
            </ul>
        </div>
        
        <ul class="movie_list">
			<c:if test="${movieShowingList.size() == 1}">
				<h2 class="search-result">검색 결과</h2>
			</c:if>
			<c:if test="${movieShowingList.size() > 1}">
				<h2 style="font-size:18px; color:#333; margin: 0 0 10px 10px;">[인기 영화 TOP10]</h2>
			</c:if>
			
			<c:forEach items="${movieShowingList}" var="movie" varStatus="statusMovie">
				<c:if test="${movieShowingList.size() == 1}">
					<li class="movie_li cols-xs-12" style="width:100%; margin-left:0.75%">
				</c:if>
				<c:if test="${movieShowingList.size() > 1}">
					<li class="movie_li cols-xs-12">
				</c:if>
				<div class="review-thumb">
					<a href="movie_review_detail_page.do?movieId=${movie.getMOVIE_ID()}"><img src="${movie.getMOVIE_IMG()}" alt="" class="movie_thumb" target="_blank"></a>
					<span class="boxoffice n${statusMovie.count}">${statusMovie.count}</span>
				</div>
				<div class="review-summary">
					<span class="comment_span">[40자평]</span>
					<a href="movie_review_detail_page.do?movieId=${movie.getMOVIE_ID()}">
						<span class="movie_title">${movie.getMOVIE_TITLE()}</span>
					</a>
					<a href="movie_review_detail_page.do?movieId=${movie.getMOVIE_ID()}">
						<button class="btn btn-lg btn_review_more">더 보기</button>
					</a>
					<div style="height:20px"></div>
					<div class="review-summary-menu">
        				<span class="review_writer" style="font-weight:bold">작성자</span>
        				<span class="review_comment" style="font-weight:bold">감상평</span>
        				<span class="review_date" style="font-weight:bold">작성 날짜</span>
        				<span class="review_grade" style="font-weight:bold">평점</span>
        				<span class="review_sympathy" style="font-weight:bold">공감수</span>
	        		</div>
	        		
	        		<c:if test="${empty reviewList.get(statusMovie.index)}">
		        		<div>
			        		<span class="review_none">등록된 40자평이 없습니다.</span>
		        		</div>
	        		</c:if>
		      		<c:forEach items="${reviewList.get(statusMovie.index)}" var="review" end="4" varStatus="statusReview">
		        		<div>
        					<!-- 감상평 -->
	        				<span class="review_writer">${review.REVIEW_WRITER}</span>
        					<span class="review_comment">${review.REVIEW_CONTENTS}</span> 
        					<span class="review_date">${review.REVIEW_DATE}</span>
        					<!-- 별점 -->
        					<span class="review_grade">
								<span class="bg_star star_grade"><span class="bg_star inner_star" style="width: ${review.REVIEW_RATING}0%">평점</span></span> <!-- 116px이 100%, % 계산에서 width값에 적용-->
								<em class="emph_grade" style="font-size:15.5px;">${review.REVIEW_RATING}</em>
							</span>
        					<span class="review_sympathy" style="padding-left:10px">201</span>
	        			</div>
		      		</c:forEach>
	        	</div>
			</c:forEach>
		</ul>
		
    	<a class="btn btn-primary btn-lg" onclick="openReviewWrite()" style="position:fixed;right:120px;bottom:20px;">감상평 작성</a>
    </div>
    <!-- /.container -->
        
    <!-- =====  FOOTER START  ===== -->
    <jsp:include page="footer.jsp" flush="false"/>
    <!-- =====  FOOTER                       END  ===== -->


    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  	<script src="js/jQuery_v3.1.1.min.js"></script>
  	<script src="js/jquery-ui.js"></script>
  	<script src="js/jquery.magnific-popup.js"></script>
  	<script src="js/jquery.firstVisitPopup.js"></script>

  </body>

</html>
