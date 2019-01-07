<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
            <div class="collapse navbar-collapse js-navbar-collapse" style="float:right;">
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
                </li><li class="dropdown"> <a href="movie_analysis_page.do" class="dropdown-toggle">영화 분석</a>
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
    <jsp:include page="menu.jsp" flush="false"/>
    <!-- =====  HEADER END  ===== -->
    
    <div class="container"> <!-- container -->
    
    </div>
    
    <!-- =====  FOOTER START  ===== -->
    <jsp:include page="footer.jsp" flush="false"/>
    <!-- =====  FOOTER END  ===== -->
    
    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
