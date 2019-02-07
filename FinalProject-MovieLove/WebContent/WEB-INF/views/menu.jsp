<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="kr">
<!--<![endif]-->

<head>
  <!-- =====  BASIC PAGE NEEDS  ===== -->
  <meta charset="utf-8">
  <title>무비愛</title>
  <!-- =====  SEO MATE  ===== -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="distribution" content="global">
  <meta name="revisit-after" content="2 Days">
  <meta name="robots" content="ALL">
  <meta name="rating" content="8 YEARS">
  <meta name="Language" content="en-us">
  <meta name="GOOGLEBOT" content="NOARCHIVE">
  <!-- =====  MOBILE SPECIFICATION  ===== -->
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="viewport" content="width=device-width">
  <!-- =====  CSS  ===== -->
  <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <link rel="stylesheet" type="text/css" href="css/magnific-popup.css">
  <link rel="stylesheet" type="text/css" href="css/owl.carousel.css">
  <link rel="shortcut icon" href="images/favicon.png">
  <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
  <link rel="apple-touch-icon" sizes="72x72" href="images/apple-touch-icon-72x72.png">
  <link rel="apple-touch-icon" sizes="114x114" href="images/apple-touch-icon-114x114.png">
  
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

	<!-- 검색 버튼 이벤트 스크립트 -->
	<script>
		function searchMovie(){
			var inputTitle = document.getElementById("search-menu").value;

		    //영화 자동완성 검색을 클릭했는지 여부
			if(isClicked){
				if(inputTitle ==''){
	    			alert("영화 제목을 입력해주세요.");
					return;
				} else{
	    			location.href='movie_review_page.do?movieTitle='+inputTitle;
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
	    $('#search-menu').focus(function(){
    		$( "#search-menu" ).autocomplete( "enable" );
    	});
	 
	    $( "#search-menu" ).autocomplete({
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
	        $( "#search-menu" ).val( ui.item.label );
        	return false;
      	},
      	select: function( event, ui ) {
	        $( "#search-menu" ).val( ui.item.label );
        	$( "#search-menu" ).autocomplete( "disable" );
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

<body>
	
      <div class="header-top">
        <div class="container">
          <div class="row">
            <div class="col-xs-12 col-sm-4">
              <div style="margin-top:auto; margin-bottom:auto;">
                <span class="header-top-right text-left" style="height:auto; text-size:18px; color:#555;">
                	무비愛에 오신 것을 환영합니다.
                </span>
              </div>
            </div>
            <div class="col-xs-12 col-sm-8">
              <ul class="header-top-right text-right" style="text-size:18px; margin-top:auto; margin-bottom:auto;">
   				<% if(session.getAttribute("memId")==null){%>
                	<li class="account"><a href="login.do" style="color:#555555">로그인</a></li> | 
                	<li class="account"><a href="register.do" style="color:#555555">회원가입</a></li> |
                <%} else {%>
                	<li class="account"><a style="color:#555555"><%=session.getAttribute("memId")%> 님 환영합니다!</a></li> | 
                	<li class="account"><a href="logout.do" style="color:#555555">로그아웃</a></li> |
                <%} %>
                <li class="account" style="padding-left:10px"><a href="login.do" style="color:#555555">고객센터</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>

    <!-- =====  HEADER START  ===== -->
      <div class="main-header">
        <div class="container">
          <div class="row">
          	<div class="col-xs-12 col-sm-4"></div>
            <div class="navbar-header col-xs-6 col-sm-4 center-block"> <a class="navbar-brand" href="main.do"> <img alt="themini" src="images/logo.png"> </a> </div>
          </div>
                    
          <nav class="navbar">
            <p>menu</p>
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse"> <span class="i-bar"><i class="fa fa-bars"></i></span></button>
            <div class="main-search">
                <input id="search-menu" name="search" value="" placeholder="영화 검색" class="form-control input-lg mb_10" autocomplete="off" type="text">
                <span class="input-group-btn">
              		<button type="button" class="btn btn-default btn-lg" onclick="searchMovie()"><i class="fa fa-search"></i></button>
            	</span>
            </div>
            <div class="collapse navbar-collapse js-navbar-collapse"  style="float:right;">
              <ul id="menu" class="nav navbar-nav">
                <li class="dropdown mega-dropdown"> <a href="main.do" class="">Home</a>
                </li>
                <li class="dropdown"> <a href="movie_info_page.do" class="dropdown-toggle">영화 정보</a>
                  <ul class="dropdown-menu">
                    <li> <a href="movie_info_page.do?sel=1">상영중</a></li>
                    <li> <a href="movie_info_page.do?sel=2">개봉 예정</a></li>
                    <li> <a href="movie_info_page.do?sel=3">지난 영화</a></li>
                  </ul>
                </li>
                <li class="dropdown"> <a href="movie_ranking_page.do" class="dropdown-toggle">랭킹</a>
                  <ul class="dropdown-menu">
                    <li> <a href="movie_ranking_page.do?sel=1">일간 박스오피스 순위</a></li>
                    <li> <a href="movie_ranking_page.do?sel=2">주간 박스오피스 순위</a></li>
                    <li> <a href="movie_ranking_page.do?sel=3">주말 박스오피스 순위</a></li>
                  </ul>
                </li>
                <li class="dropdown"> <a href="movie_recommend_page.do" class="dropdown-toggle">추천 영화</a>
                  <ul class="dropdown-menu">
                    <li> <a href="movie_recommend_page.do">장르별</a></li>
                    <li> <a href="movie_recommend_page.do">연도별</a></li>
                    <li> <a href="movie_recommend_page.do">연령별</a></li>
                  </ul>
                <li class="dropdown"> <a href="movie_analysis_page.do" class="dropdown-toggle">영화 분석</a>
                  <ul class="dropdown-menu">
                    <li> <a href="cart_page.html">상세 분석</a></li>
                    <li> <a href="checkout_page.html">비교 분석</a></li>
                  </ul>
                </li>
                <li> <a href="movie_review_page.do">40자평</a></li>
              </ul>
            </div>
            <!-- /.nav-collapse -->
          </nav>
        </div>
      </div>
    </header>
    <!-- =====  HEADER END  ===== -->
    
  </div>
  
    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  	<script src="js/jQuery_v3.1.1.min.js"></script>
  	<script src="js/jquery-ui.js"></script>
  	<script src="js/jquery.magnific-popup.js"></script>
  	<script src="js/jquery.firstVisitPopup.js"></script>
  	<script src="js/owl.carousel.min.js"></script>
  	<script src="js/bootstrap.min.js"></script>
  	<script src="js/jquery.magnific-popup.js"></script>
 	<script src="js/jquery.firstVisitPopup.js"></script>
 	<script src="js/custom.js"></script>
</body>

</html>