<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
  </head>
  
  <body class="main_content">
    <!-- Page Content -->
    <div class="container">
      <!-- Heading Row -->
      <div class="row my-4" style="position:relative">
        <div class="col-lg-8" align="center" class="embed-responsive embed-responsive-16by9" >
		  <iframe width="100%" height="340" src="http://mp4.cine21.com/cine21.com/movie/trailer/2018/11/fruit_mtr.mp4"></iframe>
        </div>
        <!-- /.col-lg-8 -->
        <div class="col-lg-4">
          <h1 class="mb_10">국가부도의 날</h1>
          <p>1997년, 대한민국 최고의 경제 호황을 믿어 의심치 않았던 그때, 곧 엄청난 경제 위기가 닥칠 것을 예견한 한국은행 통화정책팀장 ‘한시현’(김혜수)은 이 사실을 보고하고, 정부는 뒤늦게 국가부도 사태를 막기 위한 비공개 대책팀을 꾸린다. </p>
          
        </div>
        <!-- /.col-md-4 -->
        <a class="btn btn-primary btn-lg" href="#" style="position:absolute;right:0px;bottom:0px;">자세히 보러가기</a>
      </div>
      <!-- /.row -->

      <!-- Call to Action Well -->
      <div class="col-sm-12 col-lg-12 col-md-12 col-xs-12">
      	<h2>박스 오피스 순위</h2>
      </div>
      <br />
      <br />
      <div id="myCarousel" class="carousel slide" data-ride="carousel" style="background-color:#aaa;padding-top:10px;padding-bottom:10px;">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		    <li data-target="#myCarousel" data-slide-to="1"></li>
		  </ol>

		  <!-- Wrapper for slides -->
		  <div class="carousel-inner" align="center">
		    <div class="item active">
		      <table>
		      	<tr>
		      		<td class="officetd"><h2 class="rank">1</h2><a href="#"><img src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/358ea40235e240fea2f0b6ec7ef93c431543201035934" alt="마약왕"></a></td>
		      		<td class="officetd"><h2 class="rank">2</h2><a href="#"><img src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/4eeebce90dc441cdb208d11e27e356421544513634869" alt=""></a></td>
		      		<td class="officetd"><h2 class="rank">3</h2><a href="#"><img src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/f4d3fea1a1004a44873cca0dac2d8ccf1542956549688" alt=""></a></td>
		      		<td class="officetd"><h2 class="rank">4</h2><a href="#"><img src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/ce3cd6a875284e8b96414ef3696756a11544772388211" alt=""></a></td>
		      		<td class="officetd"><h2 class="rank">5</h2><a href="#"><img src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/10073f4c7fab4a07a23589f8fbd4254d1541739643225" alt=""></a></td>
		      	</tr>
		      </table>
		    </div>
		
		    <div class="item">
		      <table>
		      	<tr>
		      		<td class="officetd"><h2 class="rank">6</h2><a href="#"><img src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/7f80906597164fe6b6504b3602946f631542963091970" alt=""></a></td>
		      		<td class="officetd"><h2 class="rank">7</h2><a href="#"><img src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/f4d3fea1a1004a44873cca0dac2d8ccf1542956549688" alt=""></a></td>
		      		<td class="officetd"><h2 class="rank">8</h2><a href="#"><img src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/25c7261d1e424fe59b68b7ef115b35d11542780702098" alt=""></a></td>
		      		<td class="officetd"><h2 class="rank">9</h2><a href="#"><img src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/fa5991f792db40bdb93de11542c0502c1543986203103" alt=""></a></td>
		      		<td class="officetd"><h2 class="rank">10</h2><a href="#"><img src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/eb9834885f7747d78e132b66c0cf46a21541478705054" alt=""></a></td>
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
        <div class="col-md-7 mb-6" style="position:relative;">
          <div class="h-100">
            <div class="card-body">
              <h2 class="card-title" style="font-size:18px; padding:0;">영화 분석</h2>
              <a href="movie_analysis_page.do?movieTitle=${movieShowingList.get(0).getMOVIE_TITLE()}" class="btn_more" style="position:absolute; right:30px; left:auto; top:0;"></a>
               <div id="myCarousel1" class="carousel slide" data-ride="carousel">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		    <li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
		    <li data-target="#myCarousel1" data-slide-to="1"></li>
		    <li data-target="#myCarousel1" data-slide-to="2"></li>
		    <li data-target="#myCarousel1" data-slide-to="3"></li>
		    <li data-target="#myCarousel1" data-slide-to="4"></li>
		  </ol>

		  <!-- Wrapper for slides -->
		  <div class="carousel-inner">
		    <div class="item active">
		    <p style="margin: 10px 0 5px 0; display:block;">[${movieShowingList.get(0).getMOVIE_TITLE()}]</p>	
		      <div class="col-lg-6 col-sm-6 col-xs-6">
		      	<p>원형 그래프</p>
		      	<img class="col-lg-12 col-sm-12 col-xs-12" alt="" src="http://www.hippochart.com/hippo/gallery/120501031647_hippo_Pie.png">
		      </div>
		      <div class="col-lg-6 col-sm-6 col-xs-6">
		      	<p>막대그래프</p>
		      	<img class="col-lg-12 col-sm-12 col-xs-12" alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzV8uSTuwhiQQ7Hl20YJqrA1rKO3wYQvVipgBO5PhzRttFhc2Uxw">
		      </div>
		      
		    </div>
		
		    <div class="item">
		      <p style="margin: 10px 0 5px 0; display:block;">[${movieShowingList.get(1).getMOVIE_TITLE()}]</p>	
		      <div class="col-lg-6 col-sm-6 col-xs-6">
		      	<p>원형 그래프</p>
		      	<img class="col-lg-12 col-sm-12 col-xs-12" alt="" src="http://www.hippochart.com/hippo/gallery/120501031647_hippo_Pie.png">
		      </div>
		      <div class="col-lg-6 col-sm-6 col-xs-6">
		      	<p>막대그래프</p>
		      	<img class="col-lg-12 col-sm-12 col-xs-12" alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzV8uSTuwhiQQ7Hl20YJqrA1rKO3wYQvVipgBO5PhzRttFhc2Uxw">
		      </div>
		    </div>
		    
		    <div class="item">
		      <p style="margin: 10px 0 5px 0; display:block;">[${movieShowingList.get(2).getMOVIE_TITLE()}]</p>	
		      <div class="col-lg-6 col-sm-6 col-xs-6">
		      	<p>원형 그래프</p>
		      	<img class="col-lg-12 col-sm-12 col-xs-12" alt="" src="http://www.hippochart.com/hippo/gallery/120501031647_hippo_Pie.png">
		      </div>
		      <div class="col-lg-6 col-sm-6 col-xs-6">
		      	<p>막대그래프</p>
		      	<img class="col-lg-12 col-sm-12 col-xs-12" alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzV8uSTuwhiQQ7Hl20YJqrA1rKO3wYQvVipgBO5PhzRttFhc2Uxw">
		      </div>
		    </div>
		    
		    <div class="item">
		      <p style="margin: 10px 0 5px 0; display:block;">[${movieShowingList.get(3).getMOVIE_TITLE()}]</p>	
		      <div class="col-lg-6 col-sm-6 col-xs-6">
		      	<p>원형 그래프</p>
		      	<img class="col-lg-12 col-sm-12 col-xs-12" alt="" src="http://www.hippochart.com/hippo/gallery/120501031647_hippo_Pie.png">
		      </div>
		      <div class="col-lg-6 col-sm-6 col-xs-6">
		      	<p>막대그래프</p>
		      	<img class="col-lg-12 col-sm-12 col-xs-12" alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzV8uSTuwhiQQ7Hl20YJqrA1rKO3wYQvVipgBO5PhzRttFhc2Uxw">
		      </div>
		    </div>
		    
		    <div class="item">
		      <p style="margin: 10px 0 5px 0; display:block;">[${movieShowingList.get(4).getMOVIE_TITLE()}]</p>	
		      <div class="col-lg-6 col-sm-6 col-xs-6">
		      	<p>원형 그래프</p>
		      	<img class="col-lg-12 col-sm-12 col-xs-12" alt="" src="http://www.hippochart.com/hippo/gallery/120501031647_hippo_Pie.png">
		      </div>
		      <div class="col-lg-6 col-sm-6 col-xs-6">
		      	<p>막대그래프</p>
		      	<img class="col-lg-12 col-sm-12 col-xs-12" alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzV8uSTuwhiQQ7Hl20YJqrA1rKO3wYQvVipgBO5PhzRttFhc2Uxw">
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
              <!-- 영화 제목 -->
              <p class="card-text">${movie.getMOVIE_TITLE()}</p>
              <!-- more info -->
              <a href="movie_review_detail_page.do?movieId=${movieShowingList.get(0).getMOVIE_ID()}" class="btn_more" style="position:absolute; right:30px; left:auto; top:0;"></a>
              <!-- 내용 -->
              <div class="row">
              	<div id="myCarousel2" class="carousel slide" data-ride="carousel">
		  			<!-- Wrapper for slides -->
		  			<div class="carousel-inner" >
						<div class="item active" style="height:480px">
		    				<h7 style="margin: 10px 0 5px 0; display:block;">[${movieShowingList.get(0).getMOVIE_TITLE()}]</h7>
		    				<ul class="list_review">
								<c:if test="${empty reviewList.get(0)}">
									<li>
										<div class="review_info">
											<span class="review_none" style="margin:10px 0 10px 0"> 등록된 40자평이 없습니다.</span>
										</div>
									</li>
								</c:if>
								
								<c:if test="${reviewList.size() > 0}">
		      						<c:forEach items="${reviewList.get(0)}" var="review" end="3" varStatus="statusReview">
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
		      						<c:forEach items="${reviewList.get(1)}" var="review" end="3" varStatus="statusReview">
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
		      						<c:forEach items="${reviewList.get(2)}" var="review" end="3" varStatus="statusReview">
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
		      						<c:forEach items="${reviewList.get(3)}" var="review" end="3" varStatus="statusReview">
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
		      						<c:forEach items="${reviewList.get(4)}" var="review" end="3" varStatus="statusReview">
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
