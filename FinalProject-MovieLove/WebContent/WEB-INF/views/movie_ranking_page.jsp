<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%	
	String movie_img="http://placehold.it/222x320";  //영화 기본 이미지 (이미지가 DB에 없을 경우)
	
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

	<!-- 스크롤 업 이벤트 스크립트 -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
		function fnMove(seq){
    		var offset = $("#ranking_menu" + seq).offset();
       		$('html, body').animate({scrollTop : offset.top}, 300);
    	}
	</script>
	
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
      	<div class="row" id="movie_ranking" align="center">
	    		<div class="col-lg-4" style="padding:0">
		          	<div class="ranking">
		          		<h4 class="card-title pt_10 pb_10 mb_5" style="background-color:#E16868">일간 박스오피스 순위</h4>
	              		<div class="ranking-line" text-align="center" style="color:#E16868">
	              			<span class="ranking-no" style="float:left">순위</span>
	              			<span class="ranking-title">영화 제목</span>
	              			<span class="ranking-num" style="float:right; padding-left:20px">관객수</span>
	              		</div>
    					<c:if test="${not empty dailyResult}">
    						<c:forEach items="${dailyResult}" var="boxoffice">
		              		<div class="ranking-line" text-align="center">
	              				<span class="ranking-no">${boxoffice.RANK}</span>
	              				<span class="ranking-title">${boxoffice.TITLE}</span>
	              				<span class="ranking-num" align="right">${boxoffice.AUDICNT}명</span>
	              			</div>
    						</c:forEach>
    					</c:if>
        				<span class="ranking-line ranking-date" align="right">기준: ${dailyResult.get(0).getDATE()}</span>
          			</div>
        		</div>
	    		<div class="col-lg-4" style="padding:0">
		          	<div class="ranking">
		          		<h4 class="card-title pt_10 pb_10 mb_5" style="background-color:#47a8ac;">주간 박스오피스 순위</h4>
	              		<div class="ranking-line" text-align="center" style="color:#47a8ac">
	              			<span class="ranking-no" style="float:left">순위</span>
	              			<span class="ranking-title">영화 제목</span>
	              			<span class="ranking-num" style="float:right; padding-left:20px">관객수</span>
	              		</div>
    					<c:if test="${not empty weeklyResult}">
    						<c:forEach items="${weeklyResult}" var="boxoffice">
		              		<div class="ranking-line" text-align="center">
	              				<span class="ranking-no">${boxoffice.RANK}</span>
	              				<span class="ranking-title">${boxoffice.TITLE}</span>
	              				<span class="ranking-num" align="right">${boxoffice.AUDICNT}명</span>
	              			</div>
    						</c:forEach>
    					</c:if>
        				<span class="ranking-line ranking-date" align="right">기준: ${weeklyResult.get(0).getDATE()}</span>
          			</div>
        		</div>
	    		<div class="col-lg-4" style="padding:0">
		          	<div class="ranking">
		          		<h4 class="card-title pt_10 pb_10 mb_5" style="background-color:#5f61ab;">주말 박스오피스 순위</h4>
	              		<div class="ranking-line" text-align="center" style="color:#5f61ab">
	              			<span class="ranking-no" style="float:left">순위</span>
	              			<span class="ranking-title">영화 제목</span>
	              			<span class="ranking-num" style="float:right; padding-left:20px">관객수</span>
	              		</div>
    					<c:if test="${not empty weekendResult}">
    						<c:forEach items="${weekendResult}" var="boxoffice">
		              		<div class="ranking-line" text-align="center">
	              				<span class="ranking-no">${boxoffice.RANK}</span>
	              				<span class="ranking-title">${boxoffice.TITLE}</span>
	              				<span class="ranking-num" align="right">${boxoffice.AUDICNT}명</span>
	              			</div>
    						</c:forEach>
    					</c:if>
        				<span class="ranking-line ranking-date" align="right">기준: ${weekendResult.get(0).getDATE()}</span>
          			</div>
        		</div>
      	</div>
      	
    	<div class="row mt_30" id="movie_ranking_menu">
    		<ul> 
    			<li style="width:33.33%"><a href="movie_ranking_page.do?sel=1" class="<%=sel1%>" id="ranking_menu1">일간<span class="ico"></span></a></li>
    			<li style="width:33.33%"><a href="movie_ranking_page.do?sel=2" class="<%=sel2%>" id="ranking_menu2">주간<span class="ico"></span></a></li>
    			<li style="width:33.33%"><a href="movie_ranking_page.do?sel=3" class="<%=sel3%>" id="ranking_menu3">주말<span class="ico"></span></a></li>
    		</ul>
    	</div>
    	
      	<div class="row mt_20">
		   	<c:forEach items="${selResult}" var="boxoffice" begin="0" end="${selResult.size()}" step="4" varStatus="status">
      		<div id="movie_info_row">
		      	<c:forEach items="${selResult}" var="boxoffice" begin="${status.index}" end="${status.index+3}" step="1" varStatus="i">
		      	<c:if test="${selResult.get(i.index) != null}">
	    		<div class="col-lg-3 col-sm-6 portfolio-item" align="center">
		          	<div class="card h-100">
		          		<div class="img-body" align="center">
		          			<!-- 해당 영화 정보가 DB에 있는 경우 -->
		          			<c:if test="${img_selResult.get(i.index) != null}">
	            				<a href="movie_detail_page.do?id=${id_selResult.get(i.index)}">
	            					<img class="card-img-top" src="${img_selResult.get(i.index)}" alt="" style="width:100%">
								</a>
	            			</c:if>
		          			<!-- 해당 영화 정보가 DB에 없는 경우 -->
		          			<c:if test="${img_selResult.get(i.index) == null}">
								<img class="card-img-top" src="images/non_image.png" alt="" style="width:100%">
	            			</c:if>
	            			
	            			<span class="boxoffice n${i.index+1}">${i.index+1}</span>
	            		</div>
            			<div class="card-body mt_5" id="card-body" align="center">
		          			<!-- 해당 영화 정보가 DB에 있는 경우 -->
		          			<c:if test="${img_selResult.get(i.index) != null}">
	              				<h4 class="card-title">
				                	<a href="movie_detail_page.do?id=${id_selResult.get(i.index)}">${boxoffice.TITLE}</a>
              					</h4>
	            			</c:if>
		          			<!-- 해당 영화 정보가 DB에 없는 경우 -->
		          			<c:if test="${img_selResult.get(i.index) == null}">
	              				<h4 class="card-title">${boxoffice.TITLE}</h4>
	            			</c:if>
	            			
              				<% if(sel.equals("1")){ %>
              				<span class="card-text">일간 관객수 ${boxoffice.AUDICNT}</span>
              				<%} %>
              				<% if(sel.equals("2")){ %>
              				<span class="card-text">주간 관객수 ${boxoffice.AUDICNT}</span>
              				<%} %>
              				<% if(sel.equals("3")){ %>
              				<span class="card-text">주말 관객수 ${boxoffice.AUDICNT}</span>
              				<%} %>
              				<span class="card-text">누적 관객수 ${boxoffice.AUDIACC}</span>
              				<span class="card-text">예매율 ${boxoffice.RATE}%</span>
            			</div>
          			</div>
        		</div>
        		</c:if>
        		</c:forEach>
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
  	<script src="js/jQuery_v3.1.1.min.js"></script>
  	<script src="js/jquery-ui.js"></script>
  	<script src="js/jquery.magnific-popup.js"></script>
  	<script src="js/jquery.firstVisitPopup.js"></script>

  </body>

</html>
