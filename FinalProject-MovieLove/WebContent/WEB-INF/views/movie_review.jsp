<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% 
	String movie_title="영화 제목";
	String movie_rate="10.3%";
	String movie_date="2018.12.31 개봉";
	//String movie_img="images/poster.jpg";
	String movie_img="http://placehold.it/190x240";
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
    	<div class="main-search">
    		<input id="search-input" name="search" value="" placeholder="영화 검색" class="form-control input-lg mb_10" autocomplete="off" type="text">
        </div>
        
        
        <div class="detail_summarize">
						<span class="thumb_summary  #info #poster">
															<a href="/moviedb/photoviewer?id=110556#1263994" class="area_poster" target="_blank">
									<img src="//img1.daumcdn.net/thumb/C155x225/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F8d6743476fdf438e846ccab9ac59b1491537322852509" class="img_summary" alt="안시성 포스터" onload="noImageOnLoad($(this));$(this).parent().find('.link_scale').show();">
									<span class="link_scale" style=""><span class="ico_popcorn ">확대하기</span></span>
								</a>
													</span>
						<div class="movie_summary">
							<div class="subject_movie">
								<strong class="tit_movie">안시성 (2017)</strong>
								<span class="txt_origin">The Great Battle, 安市城</span><!-- 2016-04-12 추가 -->
								<a href="/moviedb/grade?movieId=110556" class="raking_grade">
									<span class="bg_star star_grade"><span class="bg_star inner_star" style="width:76.69999837875366%">평점</span></span> <!-- 116px이 100%, % 계산에서 width값에 적용-->
									<em class="emph_grade">7.7</em><span class="txt_grade">/10</span>
								</a>
							</div>
							<!-- 2017-01-10 순서변경 및 수정 -->
							<dl class="list_movie list_main">
								<dt class="screen_out">장르|나라</dt>
								
																																
								<dd class="txt_main">시대극/액션</dd>
								
																<dd>
																			한국																	</dd>
																
																																																																		
																																																								
								<dt class="screen_out">개봉 | 영화시간/타입/나라</dt>
																	<dd class="txt_main">
																				
																					2018.09.19
																							개봉
																																								</dd>
																
																	<dd>135분, 12세이상관람가 </dd>
																
								<!--<dd>135분, 12세이상관람가 </dd>-->
								<!-- 2017-01-10 순서변경 및 수정 -->

																	<dt class="screen_out">감독</dt>
									<dd class="type_ellipsis">(감독)
																					<a href="/person/main?personId=22152" class="link_person #info #name">김광식</a>																			</dd>
																									<dt class="screen_out">주연</dt>
									<dd class="type_ellipsis">(주연)
																					<a href="/person/main?personId=2033" class="link_person #info #name">조인성</a>, 																					<a href="/person/main?personId=386045" class="link_person #info #name">남주혁</a>, 																					<a href="/person/main?personId=9908" class="link_person #info #name">박성웅</a>																			</dd>
															</dl>
							<dl class="list_placing">
																<dt>누적관객</dt><dd id="totalAudience">5,440,186명</dd>
							</dl>
							<div class="wrap_pbtn">
								
								                                    <a href="https://page.kakao.com/link/51931941" class="btn_item" target="_blank"><em class="ico_movie ico_page">카카오페이지</em>영화보기</a><!-- 2018-06-27 추가 -->
								
								
																																</div>
						</div>
					</div>
        
        
                       
        <div>
        	<img src="<%=movie_img%>">
        	<div>
        	정말 재미있었네요~~~~~~~~~~
        	<!-- 별점 -->
        	<span class="fa fa-star-o fa-star-fill" data-raing="1"></span>
	        <span class="fa fa-star-o fa-star-fill" data-raing="1"></span>
	        <span class="fa fa-star-o fa-star-fill" data-raing="1"></span>
	        <span class="fa fa-star-o fa-star-fill" data-raing="1"></span>
	        <span class="fa fa-star-o" data-raing="1"></span>
	        </div>
	        <div>
        	정말 재미있었네요~~~~~~~~~~
        	<!-- 별점 -->
        	<span class="fa fa-star-o fa-star-fill" data-raing="1"></span>
	        <span class="fa fa-star-o fa-star-fill" data-raing="1"></span>
	        <span class="fa fa-star-o fa-star-fill" data-raing="1"></span>
	        <span class="fa fa-star-o fa-star-fill" data-raing="1"></span>
	        <span class="fa fa-star-o" data-raing="1"></span>
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
