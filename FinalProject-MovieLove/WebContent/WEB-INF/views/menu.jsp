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
</head>

<body>
	
      <div class="header-top">
        <div class="container">
          <div class="row">
            <div class="col-xs-12 col-sm-4">
              <div class="header-top-left">
                <span class="header-top-right text-left" style="height:auto; text-size:18px; margin-top:auto; margin-bottom:auto;">
                	Days a week from 9:00 am to 7:00 pm
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
                <input id="search-input" name="search" value="" placeholder="영화 검색" class="form-control input-lg mb_10" autocomplete="off" type="text">
                <span class="input-group-btn">
              		<button type="button" class="btn btn-default btn-lg"><i class="fa fa-search"></i></button>
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
                    <li> <a href="movie_ranking_page.do?sel=3">올해의 박스오피스 순위</a></li>
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
  <a id="scrollup"></a>
  <script src="js/jQuery_v3.1.1.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.magnific-popup.js"></script>
  <script src="js/jquery.firstVisitPopup.js"></script>
  <script src="js/custom.js"></script>
</body>

</html>