<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% 
	int random = (int)Math.random()*5;
%>

<!DOCTYPE html>
<html lang="en">
  <head>
	<style>
		body{
			background-color:white;
			font-size: 16px;
    		line-height: 1.5;
    		font-family: AppleSDGothicNeo-Regular, "Malgun Gothic", "맑은 고딕", dotum, 돋움, sans-serif;
    		color: rgb(42, 42, 42);
    		}
		.officetd{
			position:relative;
		}
		.rank{
			position:absolute;
			top:4px;
			left:10px;
			color:white;
		}
	</style>
    <!-- Custom styles for this template -->
    
    <link href="css/small-business.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawSexChart1);
    function drawSexChart1() {
        var data = google.visualization.arrayToDataTable([
          ['남녀','성비'],
          ['남자',${M1}],
          ['여자',${F1}]
        ]);

        var options = {
          //title: '관람객 성비',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('sexchart1'));
        chart.draw(data, options);
      }
    google.charts.setOnLoadCallback(drawAgeChart1);
    function drawAgeChart1() {
        var data = google.visualization.arrayToDataTable([
          ['연령대별 관람객','ageArr1[]'],
          ['10세 미만',${ageArr1[0]}],
          ['10대',${ageArr1[1]}],
          ['20대',${ageArr1[2]}],
          ['30대',${ageArr1[3]}],
          ['40대',${ageArr1[4]}],
          ['50대',${ageArr1[5]}],
          ['60대 이상',${ageArr1[5]}]
        ]);

        var options = {
          //title: '',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('agechart1'));
        chart.draw(data, options);
      }
    
    
    // 22222222222
    google.charts.setOnLoadCallback(drawSexChart2);
    function drawSexChart2() {
        var data = google.visualization.arrayToDataTable([
          ['남녀','성비'],
          ['남자',${M2}],
          ['여자',${F2}]
        ]);

        var options = {
          //title: '관람객 성비',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('sexchart2'));
        chart.draw(data, options);
      }
    google.charts.setOnLoadCallback(drawAgeChart2);
    function drawAgeChart2() {
        var data = google.visualization.arrayToDataTable([
          ['연령대별 관람객','ageArr2[]'],
          ['10세 미만',${ageArr2[0]}],
          ['10대',${ageArr2[1]}],
          ['20대',${ageArr2[2]}],
          ['30대',${ageArr2[3]}],
          ['40대',${ageArr2[4]}],
          ['50대',${ageArr2[5]}],
          ['60대 이상',${ageArr2[5]}]
        ]);

        var options = {
          //title: '',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('agechart2'));
        chart.draw(data, options);
      }
    </script>
	
  </head>
  
  <body class="main_content">
    <!-- Page Content -->
    <div class="container" style="padding: auto 10px auto 10px;">
      <!-- Heading Row -->
      <div class="row my-4" style="position:relative">
        <div class="col-lg-7" align="left" class="embed-responsive embed-responsive-16by9" >
		  <iframe width="100%" height="400" src="${randomMovie.getMOVIE_TRAILER()}"></iframe>
        </div>
        <!-- /.col-lg-8 -->
        <div class="col-lg-5 main-random" style="padding-right: 20px">
          <p class="mb_10 main-title">${randomMovie.getMOVIE_TITLE()}</p>
          <p class="mt_30 mb_10 main-ctitle" style="">${randomMovie.getMOVIE_CTITLE()}</p>
          <em class="main-desc">${randomMovie.getMOVIE_CONTENTS()}</em>
        </div>
        <!-- /.col-md-4 -->
        <a class="btn btn-primary btn-lg" href="movie_detail_page.do?id=${randomMovie.getMOVIE_ID()}" 
           style="position:absolute; right:24px; bottom:0; font-size:14px;">자세히 보러가기</a>
      </div>
      <!-- /.row -->

      <!-- Call to Action Well -->
      <div class="col-sm-12 col-lg-12 col-md-12 col-xs-12" style="margin-top:30px; padding-left:5px;">
      	<p style="font-size:18px; font-weight:bold; font-size:20px;">박스 오피스 순위</p>
      </div>
      <br />
      <br />
      <div id="myCarousel" class="carousel slide" data-ride="carousel" style="background-color:#333; padding:10px 0 10px 0; margin-top:20px; margin-bottom:20px;">
		  <!-- Indicators -->
		  <ol class="carousel-indicators" style="bottom:10px">
		    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		    <li data-target="#myCarousel" data-slide-to="1"></li>
		  </ol>

		  <!-- Wrapper for slides -->
		  <div class="carousel-inner" align="center">
		    <div class="item active">
		      <table>
		      	<tr>
		      		<c:forEach items="${movieShowingList}" var="movie" begin="0" end="4" varStatus="status">
		      		<td class="officetd"><h2 class="rank">${status.index+1}</h2><a href="#"><img class="boxoffice-img" src="${movie.MOVIE_IMG}"></a></td>
		      		</c:forEach>
		      	</tr>
		      </table>
		    </div>
		
		    <div class="item">
		      <table>
		      	<tr>
		      		<c:forEach items="${movieShowingList}" var="movie" begin="5" end="9" varStatus="status">
		      		<td class="officetd"><h2 class="rank">${status.index+1}</h2><a href="#"><img class="boxoffice-img" src="${movie.MOVIE_IMG}"></a></td>
		      		</c:forEach>
		      	</tr>
		      </table>
		    </div>
		    
		  </div>

		  <!-- Left and right controls -->
		  <div id="mainSlideArrowBtn" class="paging_feature">
          	<a id="mainSlidePrevBtn" href="#myCarousel" data-slide="prev" class="ico_movie ico_prev #top #arrow #left" style="display:block; left:20px;">이전</a>
          	<a id="mainSlideNextBtn" href="#myCarousel" data-slide="next" class="ico_movie ico_next #top #arrow #right" style="display:block;">다음</a>
          </div>
          
          <!-- 
		  <a class="left carousel-control" href="#myCarousel" data-slide="prev" id="btn-left">
		    <span class="glyphicon glyphicon-chevron-left"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#myCarousel" data-slide="next" id="btn-right">
		    <span class="glyphicon glyphicon-chevron-right"></span>
		    <span class="sr-only">Next</span>
		  </a>
		   -->
	</div>
	
	</div>
      <!-- Content Row -->
      <div class="row">
        <div class="col-md-7 mb-6" style="position:relative; padding-left:20px;">
          <div class="h-100">
            <div class="card-body">
              <h2 class="card-title" style="font-size:20px; padding:0;">영화 분석</h2>
              <a href="movie_analysis_page.do?movieTitle=${movieShowingList.get(0).getMOVIE_TITLE()}" class="btn_more" style="position:absolute; right:30px; left:auto; top:0;"></a>
               <div id="myCarousel1" class="carousel slide" data-ride="carousel">

		  <!-- Wrapper for slides -->
		  <div class="carousel-inner">
		    <div class="item active">
		   	  <p style="margin:10px 0 10px 0; display:block; font-weight:bold; color:#555;">[${mvo1.getMOVIE_TITLE()}]</p>
		      <div class="col-lg-6 col-sm-6 col-xs-6">
	    		<p style="color:#555">연령별 분석</p>
    			<div id="agechart1" align="center" style="width:100%; height:100%;"></div>
		      </div>
		      <div class="col-lg-6 col-sm-6 col-xs-6">
    			<p style="color:#555">성비 분석</p>
    			<div id="sexchart1" align="center" style="width:100%; height:100%;"></div>
		      </div>
    		  <p style="padding-left:10px; color:#555">워드 클라우드</p>
		      <div class="col-lg-12 col-sm-12 col-xs-12" align="center">
    			<img alt="워드 클라우드" width="50%" height="300" src="${mvo1.getMOVIE_WDCL()}" />
		      </div>
		    </div>
		
		    <div class="item">
		   	  <p style="margin:10px 0 10px 0; display:block; font-weight:bold; color:#555;">[${mvo2.getMOVIE_TITLE()}]</p>
		      <div class="col-lg-6 col-sm-6 col-xs-6">
	    		<p style="color:#555">연령별 분석</p>
    			<div id="agechart2" align="center" style="width:100%; height:100%;"></div>
		      </div>
		      <div class="col-lg-6 col-sm-6 col-xs-6">
    			<p style="color:#555">성비 분석</p>
    			<div id="sexchart2" align="center" style="width:100%; height:100%;"></div>
		      </div>
    		  <p style="padding-left:10px; color:#555">워드 클라우드</p>
		      <div class="col-lg-12 col-sm-12 col-xs-12" align="center">
    			<img alt="워드 클라우드" width="50%" height="300" src="${mvo2.getMOVIE_WDCL()}" />
		      </div>
		    </div>
		    
		  </div>
		  <!-- Left and right controls -->
	</div>
            </div>
            <div class="card-footer">
              
            </div>
          </div>
        </div>
        
        <!-- /.col-md-4 -->
        <div class="col-md-5 mb-4">
          <div class="h-100">
            <div class="card-body" style="position:relative;">
              <h2 class="card-title" style="font-size:18px; padding:0;">영화 40자평</h2>
              <!-- more info -->
              <a href="movie_review_detail_page.do?movieId=${movieShowingList.get(0).getMOVIE_ID()}" class="btn_more" style="position:absolute; right:0; left:auto; top:0;"></a>
              <!-- 내용 -->
              <div class="row">
              	<div id="myCarousel2" class="carousel slide" data-ride="carousel">
		  			<!-- Wrapper for slides -->
		  			<div class="carousel-inner" >
						<div class="item active" style="height:480px">
		    				<h7 style="margin: 10px 0 5px 0; display:block;">[${movieShowingList.get(0).getMOVIE_TITLE()}]</h7>
		    				<ul class="list_review" style="margin:0">
								<c:if test="${empty reviewList.get(0)}">
									<li>
										<div class="review_info">
											<span class="review_none" style="margin:10px 0 10px 0"> 등록된 40자평이 없습니다.</span>
										</div>
									</li>
								</c:if>
								
								<c:if test="${reviewList.size() > 0}">
		      						<c:forEach items="${reviewList.get(0)}" var="review" end="4" varStatus="statusReview">
									<c:if test="${review != null}">
									<li style="padding:0; font-size:14px;">
										<div class="review_info">
											<strong class="tit_profile">
											<em style="color:#333; font-style:normal; font-weight:bold;">${review.REVIEW_WRITER}</em>
											</strong>
											<div class="review_grade">
												<span class="bg_star star_grade"><span class="bg_star inner_star" style="width:70.75%">평점</span></span> <!-- 116px이 100%, % 계산에서 width값에 적용-->
												<em class="emph_grade" style="font-size:16px">${review.REVIEW_RATING}</em>
												<span class="txt_grade" style="font-size:16px; padding-top:2px;">/10</span>
											</div>
											<p class="desc_review" style="padding-top:30px">${review.REVIEW_CONTENTS}</p>
											<div class="append_review" style="padding-top:3px">
												<span class="info_append">${review.REVIEW_DATE}</span>
											</div>
										</div>
									</li>
									</c:if>
									</c:forEach>
								</c:if>
							</ul>
						</div>
						
						<div class="item" style="height:480px">
		    				<h7 style="margin: 10px 0 5px 0; display:block;">[${movieShowingList.get(1).getMOVIE_TITLE()}]</h7>							
		    				<ul class="list_review">
								<c:if test="${empty reviewList.get(1)}">
									<li>
										<div class="review_info">
											<span class="review_none" style="margin:10px 0 10px 0"> 등록된 40자평이 없습니다.</span>
										</div>
									</li>
								</c:if>
								
								<c:if test="${reviewList.size() > 0}">
		      						<c:forEach items="${reviewList.get(1)}" var="review" end="4" varStatus="statusReview">
									<c:if test="${review != null}">
									<li style="padding:0; font-size:14px;">
										<div class="review_info">
											<strong class="tit_profile">
											<em style="color:#333; font-style:normal; font-weight:bold;">${review.REVIEW_WRITER}</em>
											</strong>
											<div class="review_grade">
												<span class="bg_star star_grade"><span class="bg_star inner_star" style="width:70.75%">평점</span></span> <!-- 116px이 100%, % 계산에서 width값에 적용-->
												<em class="emph_grade" style="font-size:16px">${review.REVIEW_RATING}</em>
												<span class="txt_grade" style="font-size:16px; padding-top:2px;">/10</span>
											</div>
											<p class="desc_review" style="padding-top:30px">${review.REVIEW_CONTENTS}</p>
											<div class="append_review" style="padding-top:3px">
												<span class="info_append">${review.REVIEW_DATE}</span>
											</div>
										</div>
									</li>
									</c:if>
									</c:forEach>
								</c:if>
							</ul>
						</div>
						
						<div class="item" style="height:480px">
		    				<h7 style="margin: 10px 0 5px 0; display:block;">[${movieShowingList.get(2).getMOVIE_TITLE()}]</h7>
		    				<ul class="list_review">
								<c:if test="${empty reviewList.get(2)}">
									<li>
										<div class="review_info">
											<span class="review_none" style="margin:10px 0 10px 0"> 등록된 40자평이 없습니다.</span>
										</div>
									</li>
								</c:if>
		    				
								<c:if test="${reviewList.size() > 0}">
		      						<c:forEach items="${reviewList.get(2)}" var="review" end="4" varStatus="statusReview">
									<c:if test="${review != null}">
									<li style="padding:0; font-size:14px;">
										<div class="review_info">
											<strong class="tit_profile">
											<em style="color:#333; font-style:normal; font-weight:bold;">${review.REVIEW_WRITER}</em>
											</strong>
											<div class="review_grade">
												<span class="bg_star star_grade"><span class="bg_star inner_star" style="width:70.75%">평점</span></span> <!-- 116px이 100%, % 계산에서 width값에 적용-->
												<em class="emph_grade" style="font-size:16px">${review.REVIEW_RATING}</em>
												<span class="txt_grade" style="font-size:16px; padding-top:2px;">/10</span>
											</div>
											<p class="desc_review" style="padding-top:30px">${review.REVIEW_CONTENTS}</p>
											<div class="append_review" style="padding-top:3px">
												<span class="info_append">${review.REVIEW_DATE}</span>
											</div>
										</div>
									</li>
									</c:if>
									</c:forEach>
								</c:if>
							</ul>
						</div>
						
						<div class="item" style="height:480px">
		    				<h7 style="margin: 10px 0 5px 0; display:block;">[${movieShowingList.get(3).getMOVIE_TITLE()}]</h7>
		    				<ul class="list_review">
								<c:if test="${empty reviewList.get(3)}">
									<li>
										<div class="review_info">
											<span class="review_none" style="margin:10px 0 10px 0"> 등록된 40자평이 없습니다.</span>
										</div>
									</li>
								</c:if>
								
								<c:if test="${reviewList.size() > 0}">
		      						<c:forEach items="${reviewList.get(3)}" var="review" end="4" varStatus="statusReview">
									<c:if test="${review != null}">
									<li style="padding:0; font-size:14px;">
										<div class="review_info">
											<strong class="tit_profile">
											<em style="color:#333; font-style:normal; font-weight:bold;">${review.REVIEW_WRITER}</em>
											</strong>
											<div class="review_grade">
												<span class="bg_star star_grade"><span class="bg_star inner_star" style="width:70.75%">평점</span></span> <!-- 116px이 100%, % 계산에서 width값에 적용-->
												<em class="emph_grade" style="font-size:16px">${review.REVIEW_RATING}</em>
												<span class="txt_grade" style="font-size:16px; padding-top:2px;">/10</span>
											</div>
											<p class="desc_review" style="padding-top:30px">${review.REVIEW_CONTENTS}</p>
											<div class="append_review" style="padding-top:3px">
												<span class="info_append">${review.REVIEW_DATE}</span>
											</div>
										</div>
									</li>
									</c:if>
									</c:forEach>
								</c:if>
							</ul>
						</div>
						
						<div class="item" style="height:480px">
		    				<h7 style="margin: 10px 0 5px 0; display:block;">[${movieShowingList.get(4).getMOVIE_TITLE()}]</h7>
		    				<ul class="list_review">
								<c:if test="${empty reviewList.get(4)}">
									<li>
										<div class="review_info">
											<span class="review_none" style="margin:10px 0 10px 0"> 등록된 40자평이 없습니다.</span>
										</div>
									</li>
								</c:if>
								
								<c:if test="${reviewList.size() > 0}">
		      						<c:forEach items="${reviewList.get(4)}" var="review" end="4" varStatus="statusReview">
									<c:if test="${review != null}">
									<li style="padding:0; font-size:14px;">
										<div class="review_info">
											<strong class="tit_profile">
											<em style="color:#333; font-style:normal; font-weight:bold;">${review.REVIEW_WRITER}</em>
											</strong>
											<div class="review_grade">
												<span class="bg_star star_grade"><span class="bg_star inner_star" style="width:70.75%">평점</span></span> <!-- 116px이 100%, % 계산에서 width값에 적용-->
												<em class="emph_grade" style="font-size:16px">${review.REVIEW_RATING}</em>
												<span class="txt_grade" style="font-size:16px; padding-top:2px;">/10</span>
											</div>
											<p class="desc_review" style="padding-top:30px">${review.REVIEW_CONTENTS}</p>
											<div class="append_review" style="padding-top:3px">
												<span class="info_append">${review.REVIEW_DATE}</span>
											</div>
										</div>
									</li>
									</c:if>
									</c:forEach>
								</c:if>
							</ul>
						</div>
		    			
		  			</div>
				  </div>
				</div>
              </div>
           	  <div class="card-footer">
              
              </div>
          </div>
        </div>
        <!-- /.col-md-4 -->
       

      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->


    

  </body>

</html>
