<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <!-- Custom styles for this template -->
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
	    left: 664.5px;
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
    
    <!-- 검색 버튼 이벤트 스크립트 -->
	<script>
		function searchMovie(){
			var inputTitle = document.getElementById("search-movie").value;

		    //영화 자동완성 검색을 클릭했는지 여부
			if(isClicked){
				if(inputTitle ==''){
	    			alert("영화 제목을 입력해주세요.");
					return;
				} else{
	    			location.href='movie_analysis_page.do?movieTitle='+inputTitle;
				}
			} else{
				alert("먼저 영화를 검색한 후 눌러주세요.");
				return;
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
	<c:if test="${searchFlag }">
	 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawSexChart);
      function drawSexChart() {
          var data = google.visualization.arrayToDataTable([
            ['남녀','성비'],
            ['남자',${M}],
            ['여자',${F}],
          ]);

          var options = {
            //title: '관람객 성비',
            pieHole: 0.4,
          };

          var chart = new google.visualization.PieChart(document.getElementById('sexchart'));
          chart.draw(data, options);
        }
      google.charts.setOnLoadCallback(drawAgeChart);
      function drawAgeChart() {
          var data = google.visualization.arrayToDataTable([
            ['연령대별 관람객','ageArr[]'],
            ['10세 미만',${ageArr[0]}],
            ['10대',${ageArr[1]}],
            ['20대',${ageArr[2]}],
            ['30대',${ageArr[3]}],
            ['40대',${ageArr[4]}],
            ['50대',${ageArr[5]}],
            ['60대 이상',${ageArr[5]}],
          ]);

          var options = {
            //title: '',
            pieHole: 0.4,
          };

          var chart = new google.visualization.PieChart(document.getElementById('agechart'));
          chart.draw(data, options);
        }
      
      
      
    </script>
	</c:if>
	
	
	
	
</head>

<body>
	<!-- =====  HEADER START  ===== -->
    <jsp:include page="menu.jsp" flush="false"/>
    <!-- =====  HEADER END  ===== -->
    
    <div class="container"> <!-- container -->
    	
    	<div class="analysis-search">
			<input id="search-movie" name="review_title" placeholder="영화 검색" class="form-control input-lg" type="text">
    		<input type="button" class="btn btn-lg btn-search" onclick="searchMovie()" value="검색" style="width:80px; background-color:#d9534f; font-size:15px"/>
        </div>
    	
    	
    	
    	<c:if test="${searchFlag }">
	    	<div class="row mb_50"> <!-- content -->
	    		<div class="col-sm-7 col-xs-7 col-lg-7" >
	    			<img alt="두 번째 겨울" src="${vo.getMOVIE_STEELCUT().split("#")[0] }">
	    		</div>
	    		<div class="col-sm-7 col-xs-5 col-lg-5" >
	    			<h1 class="mb_10">${vo.getMOVIE_TITLE() }</h1>
	    			<h3 class="card-text"><b>${vo.getMOVIE_CTITLE() }</b></h3>
	    			<br /> 
	    			<p class="card-text">${vo.getMOVIE_CONTENTS() }</p>
	    		</div>
	    	</div>
	    	
	    	<div class="row">
	    		<div class="col-sm-4 col-xs-4 col-lg-4 col-md-4">
	    			<h3>연령별</h3>
	    			<c:if test="${ageArr[0] == 0 && ageArr[1] == 0 && ageArr[2] == 0 && ageArr[3] == 0 && ageArr[4] == 0 && ageArr[5] == 0 && ageArr[6] == 0}">
	    				<p align="center" style="margin-top:100px;">no data..!</p>
	    			</c:if>
	    			<c:if test="${!(ageArr[0] == 0 && ageArr[1] == 0 && ageArr[2] == 0 && ageArr[3] == 0 && ageArr[4] == 0 && ageArr[5] == 0 && ageArr[6] == 0)}">
	    				<div id="agechart" style="width:370px;height:279.63px"></div>
	    			</c:if>
	    		</div>
	    		
	    		<div class="col-sm-4 col-xs-4 col-lg-4 col-md-4">
	    			<h3>관람객 성비</h3>
	    			<c:if test="${M == 0 && F == 0 }">
	    				<p align="center" style="margin-top:100px;">no data..!</p>
	    			</c:if>
	    			<c:if test="${!(M == 0 && F == 0 ) }">
	    				<div id="sexchart" style="width:370px;height:279.63px"></div>
	    			</c:if>
	    			
	    		</div>
	    		
	    		<div class="col-sm-4 col-xs-4 col-lg-4 col-md-4">
	    			<h3>아몰라 분석3</h3>
	    			<img alt="원형 그래프" src="http://www.hippochart.com/hippo/gallery/120501031647_hippo_Pie.png" />
	    		</div>
	    	</div>
	    	
	    	<div class="row" >
	    		<div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
	    			<div class="row">
		    			<div class="col-lg-4 col-sm-4 col-xs-4 col-md-4"></div>
		    			<div class="col-lg-4 col-sm-4 col-xs-4 col-md-4" align="center"><h2>워드 클라우드</h2></div>
		    			<div class="col-lg-4 col-sm-4 col-xs-4 col-md-4"></div>
	    			
	    			</div>
	    			
	    			<div class="col-lg-2 col-sm-2 col-xs-2 col-md-2"></div>
	    			<div class="col-lg-8 col-sm-8 col-xs-8 col-md-8">
	    				<c:if test='${vo.getMOVIE_WDCL().equals("") || vo.getMOVIE_WDCL() == null}'>
	    					<p align="center" style="margin-top:100px;">no data..!</p>
	    				</c:if>
	    				<c:if test='${!( vo.getMOVIE_WDCL().equals("") || vo.getMOVIE_WDCL() == null ) }'>
	    					<img alt="워드 클라우드" src="${vo.getMOVIE_WDCL() }" />
	    				</c:if>
	    			</div>
	    			<div class="col-lg-2 col-sm-2 col-xs-2 col-md-2"></div>
	    		</div>
	    	</div>
	    	
	    	<a class="btn btn-primary btn-lg" onclick="openMovieSearch()" style="position:fixed;right:200px;bottom:20px;">다른영화와 비교분석하기</a>
	    	
	    	<script type="text/javascript">
	    		function openMovieSearch(){
	    			open("movie_search_popup.do", "영화 검색", "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=777, height=533");
	    		}
	    	</script>
    	</c:if>
    	
    	<c:if test="${!searchFlag }">
    		<div style="height:350px;"></div>
    	</c:if>
    	
    	
    	
    	
    </div>
    
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
