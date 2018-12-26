<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% 
	String movie_title="영화 제목";
	String movie_rate="10.3%";
	String movie_date="2018.12.31 개봉";
	String movie_img="images/poster.jpg";
	//String movie_img="http://placehold.it/236x340";
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
<html lang="en">

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
    	<div class="search_option_area">
				<ul class="search_option">
					<li id="data_genre">
						<span class="tit">장르</span>
						<a href="javascript:;" data-r="all" class="on">전체</a><span class="bar">|</span>
						<a href="javascript:;" data-r="action">액션/SF</a><span class="bar">|</span>
						<a href="javascript:;" data-r="drama">멜로/드라마</a><span class="bar">|</span>
						<a href="javascript:;" data-r="comedy">코미디</a><span class="bar">|</span>
						<a href="javascript:;" data-r="horror">공포/스릴러</a><span class="bar">|</span>
						<a href="javascript:;" data-r="ani">애니메이션</a><span class="bar">|</span>
						<a href="javascript:;" data-r="etc">기타</a>
					</li>
					<li id="data_period">
						<span class="tit">집계기간</span>
						<a href="javascript:;" data-r="2018-12-19">어제</a><span class="bar">|</span>
						<a href="javascript:;" data-r="2018-12-13" class="on">일주일</a><span class="bar">|</span>
						<a href="javascript:;" data-r="2018-11-20">1개월</a><span class="bar">|</span>
						<a href="javascript:;" data-r="2018-10-20">2개월</a><span class="bar">|</span>
						<a href="javascript:;" data-r="2018-06-20">6개월</a><span class="bar">|</span>
						<a href="javascript:;" data-r="2017-12-20">1년</a>						
					</li>
				</ul>
				<div class="btnArea">
					<a href="javascript:;" onclick="fetch_list(1)" class="btn_red_s">조회</a> 
				</div>
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
