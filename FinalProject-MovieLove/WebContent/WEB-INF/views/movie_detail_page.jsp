<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<!-- Custom styles for this template -->
<link href="css/small-business.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	
	<script type="text/javascript" src="//t1.daumcdn.net/movie/cssjs/1543973809/common/new_utils.js"></script>
	<script src="//t1.daumcdn.net/movie/cssjs/1543973809/iscroll5/iscroll.js"></script>
	<script src="//t1.daumcdn.net/movie/cssjs/1543973809/cookie/jquery.cookie.js"></script>
	<script>
	window.onload = function () {
		var maxHeight = $("em.desc_movie").css("max-height");
		$("em.desc_movie").addClass("desc_more");
		var curHeight = $("em.desc_movie").css("height");
		$("em.desc_movie").removeClass("desc_more");
		
		maxHeight = parseInt(maxHeight.replace("px", ""));
		curHeight = parseInt(curHeight.replace("px", ""));
		
		if(maxHeight >= curHeight) {
			$("a.link_more").hide();
		} else {
			$("a.link_more").show();
		}
	}
	//더보기 버튼 핸들링
	function setDescMoreButton() {
		if(isClickMoreButton) {
			return false;
		}
		var maxHeight = $("em.desc_movie").css("max-height");
		$("em.desc_movie").addClass("desc_more");
		var curHeight = $("em.desc_movie").css("height");
		$("em.desc_movie").removeClass("desc_more");
		
		maxHeight = parseInt(maxHeight.replace("px", ""));
		curHeight = parseInt(curHeight.replace("px", ""));
		
		if(maxHeight >= curHeight) {
			$("a.link_more").hide();
		} else {
			$("a.link_more").show();
		}
	}
	//접기 버튼 핸들링
	function setDescHideButton() {
		if(isClickHideButton) {
			return false;
		}
		var maxHeight = $("em.desc_movie").css("max-height");
		$("em.desc_movie").addClass("desc_more");
		var curHeight = $("em.desc_movie").css("height");
		$("em.desc_movie").removeClass("desc_more");
		console.log("maxHeight: "+maxHeight);
		console.log("curHeight: "+curHeight);
		
		maxHeight = parseInt(maxHeight.replace("px", ""));
		curHeight = parseInt(curHeight.replace("px", ""));
		
		if(maxHeight >= curHeight) {
			$("a.link_more").hide();
		} else {
			$("a.link_more").show();
		}
	}
	// 줄거리 더보기 버튼
	function plotMoreView() {		
		$("em.desc_movie").addClass("desc_more");
		$("a.link_more").hide();
		$("a.link_hide").show();
		isClickMoreButton = true;
		movietools.tiara.send("moviedb", "info summary");
	}
	// 줄거리 접기 버튼
	function plotHideView() {
		$("em.desc_movie").removeClass("desc_more");
		$("a.link_hide").hide();
		$("a.link_more").show();
		isClickMoreButton = true;
		movietools.tiara.send("moviedb", "info summary");
	}
	</script>
</head>

<style>
.movie_detail_top_area {
	background-repeat: no-repeat !important;
	background-size: cover !important;
	background-position: 50% 50% !important;
	height: 430px;
	/*opacity: 0.5;*/
}

.top_area_cover {
	height: 430px;
	background: url(http://image.cine21.com/www1/common/bg_gradient.png)
		repeat-x left bottom;
}

.mov_top {
	position: relative;
	width: 970px;
	margin: 0 auto;
	height: 430px;
}

.mov_poster {
	position: absolute;
	left: 0;
	top: 200px;
}

.mov_poster img {
	width: 230px;
	height: 330px;
	border: 4px solid #fff;
}

.mov_info {
	position: absolute;
	left: 280px;
	bottom: 20px;
}

.tit {
	font-weight: bold;
	color: #fff;
	font-size: 30px;
}

.sub_info {
	font-size: 13px;
	color: #f4f4f4;
	margin-bottom: 5px;
	line-height: 20px;
}
</style>

<body>

	<!-- =====  HEADER START  ===== -->
	<jsp:include page="menu.jsp" flush="false" />
	<!-- =====  HEADER END  ===== -->

	<div class="container">
		<!-- container -->

		<div class="row">
			<div
				class="col-lg-12 col-xs-12 col-md-12 col-sm-12 movie_detail_top_area"
				style="background: url('${steelcuts[0]}');">
				<div class="top_area_cover">
					<div class="mov_top">
						<div class="mov_poster">
							<img
								src="${vo.getMOVIE_IMG() }" />
						</div>
						<div class="mov_info">
							<p class="tit">${vo.getMOVIE_TITLE()}</p>
							<p class="tit_eng" style="margin-bottom:10px">
								<span>${vo.getMOVIE_TITLE_ENGLISH() }</span>
							</p>
							<p class="sub_info">
								<span>${vo.getMOVIE_YEAR().charAt(0) }${vo.getMOVIE_YEAR().charAt(1) }${vo.getMOVIE_YEAR().charAt(2) }${vo.getMOVIE_YEAR().charAt(3) }</span> <span>${vo.getMOVIE_COUNTRY() }</span> <span>${vo.getMOVIE_AGE() }</span>
							</p>
							<p class="sub_info">
								<span>${vo.getMOVIE_GENRE() }</span> <span>${vo.getMOVIE_RUNTIME()}</span>
							</p>
							<p class="sub_info">
								<span>개봉일 : ${vo.getMOVIE_YEAR() }</span> <span>누적관객 : ${vo.getMOVIE_AUDIENCE() }</span>

							</p>
							<p class="sub_info">감독 :${vo.getMOVIE_DIRECTOR() }</P>
							<p class="sub_info">출연 :${vo.getMOVIE_ACTORS() }</p>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="give_star col-lg-2" style="float: right; align: center;">
			<strong class="star" style="font-size:18px; margin-left:45px; display:inline-block;">평점</strong>
			<p class="num text-center" style="font-size:24px; color:#d43f3a; margin-left:10px; display:inline-block;">
				<c:if test="${avgRatingPer == 0}">0.00</c:if>
				<c:if test="${avgRatingPer != 0}">${avgRating}</c:if>
			</p>

			<span class="review_grade" style="margin:6px 0 5px 43px">
							<span class="bg_star star_grade"><span class="bg_star inner_star" style="width:${avgRatingPer}%">평점</span></span> <!-- 116px이 100%, % 계산에서 width값에 적용-->
							<em class="emph_grade" style="font-size:18px; font-style:normal">
							</em>
			</span>
			
			<div class="button" style="padding-left: 30px; padding-top: 7px;">

				<a href="/movie/nzreview/comment_form/?movie_id=51955&amp;star_container=star_container"
					class="btn btn_review" id="btn_review_write" style="background-color:#337ab7">40자평 남기기</a>
			</div>
		</div>
		<div class="story_area" style="float:right; width:51%;">
			<div class="story">
				<strong class="text" style="font-size:16px; padding-bottom:10px;">${vo.getMOVIE_CTITLE()}</strong>
				<em class="desc_movie" style="width:600px; font-size:13px;">${vo.getMOVIE_CONTENTS()}</em>
				<a href="javascript:;" class="link_more" onclick="plotMoreView(); return false;"
					id="descMoreButton" style="display:none">더 보기</a>
				<a href="javascript:;" class="link_hide" onclick="plotHideView(); return false;" 
					id="descHideButton" style="display:none">접기</a>
			</div>
		</div>

	</div>




	

	<div id="myCarousel" class="carousel slide" data-ride="carousel"
		style="padding-top: 10px; padding-bottom: 10px; width: 70%; margin: auto;">

	<h2 class="photo" style="padding-top:5px; padding-bottom:5px; font-size:20px;">스틸컷</h2>
	

		<!--페이지-->
		<ol class="carousel-indicators" style="bottom:35px">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>

		</ol>
		<!--페이지-->

		<div class="carousel-inner">
			<!--슬라이드1-->
			<div class="item active">
				<img
					src="${steelcuts[1] }"
					style="width: 1070px; height: 540px; margin: auto;"
					alt="First slide">
				<div class="container">
					<div class="carousel-caption"></div>
				</div>
			</div>
			<!--슬라이드1-->

			<!--슬라이드2-->
			<div class="item">
				<img
					src="${steelcuts[2] }"
					style="width: 1070px; height: 540px; margin: auto;" data-src=""
					alt="Second slide">
				<div class="container">
					<div class="carousel-caption"></div>
				</div>
			</div>
			<!--슬라이드2-->

			<!--슬라이드3-->
			<div class="item">
				<img
					src="${steelcuts[3] }"
					style="width: 1070px; height: 540px; margin: auto;" data-src=""
					alt="Third slide">
				<div class="container">
					<div class="carousel-caption"></div>
				</div>
			</div>
			<!--슬라이드3-->

			<!--슬라이드4-->
			<div class="item">
				<img
					src="${steelcuts[4] }"
					style="width: 1070px; height: 540px; margin: auto;" data-src=""
					alt="Third slide">
				<div class="container">
					<div class="carousel-caption"></div>
				</div>
			</div>
			<!--슬라이드4-->

			<!--슬라이드5-->
			<div class="item">
				<img
					src="${steelcuts[5] }"
					style="width: 1070px; height: 540px; margin: auto;" data-src=""
					alt="Third slide">
				<div class="container">
					<div class="carousel-caption"></div>
				</div>
			</div>
			<!--슬라이드5-->
		</div>

		<!--이전, 다음 버튼-->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev" style="background-image:none"><span
			class="glyphicon glyphicon-chevron-left"></span></a> <a
			class="right carousel-control" href="#myCarousel" data-slide="next" style="background-image:none"><span
			class="glyphicon glyphicon-chevron-right"></span></a>
	</div>
	
	<div class="video container"
		style="width: 1170px; height: 650px; margin: auto;">

	<h2 class="movie_" style="padding-top:5px; padding-bottom:5px;">예고편</h2>

		<video controls="" name="media"
			style="width: 1170px; height: 560px; margin: auto;">
			<source
				src="${vo.getMOVIE_TRAILER() }"
				type="video/mp4">
		</video>
	</div>


<div class="container">

		
			<div class="card-body col-lg-6 col-md-6 col-sm-6">
				<h2 class="card-title" style=" padding-bottom:5px;">평점</h2>



						<div class="star">
							<div class="item col-lg-12 col-md-6 col-sm-6">
								<div class="thumb" style="float:left;"><a href="#"><img
										src="http://image.cine21.com/resize/www1/writer/noimg[X60,60].jpg"
										alt="" style="display:block;">이용철</a></div>
									
										
								<p class="card-text col-lg-10 col-md-6 col-sm-6" style="float:left;">밑도
									끝도 없는 보디체인지 영화는 왜 자꾸 나오는 걸까?</p>
								<!-- 별점 -->
								<div class="star-rating col-sm-4 col-xs-4 col-lg-4 col-md-4"style="float:left;">
									<span class="fa fa-star" data-raing="1" style="color:red;"></span> <span
										class="fa fa-star-o" data-raing="1" style="color:red;"></span> <span
										class="fa fa-star-o" data-raing="0" style="color:red;"></span> <span
										class="fa fa-star-o" data-raing="0" style="color:red;"></span> <span
										class="fa fa-star-o" data-raing="0" style="color:red;"></span>
								</div>
								</div>
								</div>
								<div class="star">
							<div class="item col-lg-12 col-md-6 col-sm-6">
								<div class="thumb" style="float:left;"><a href="#"><img src="http://image.cine21.com/resize/www1/writer/E20041646[X60,60].jpg" alt="" style="display:block;">이주현</a></div>
									
										
								<p class="card-text col-lg-10 col-md-6 col-sm-6" style="float:left;">
									팔짱 끼고 보다 그놈에게 허를 찔렸다</p>
								<!-- 별점 -->
								<div class="star-rating col-sm-4 col-xs-4 col-lg-4 col-md-4" style="float:left;">
									<span class="fa fa-star" data-raing="1" style="color:red;"></span> <span class="fa fa-star" data-raing="1" style="color:red;"></span> <span class="fa fa-star-o" data-raing="0" style="color:red;"></span> <span class="fa fa-star-o" data-raing="0" style="color:red;"></span> <span class="fa fa-star-o" data-raing="0" style="color:red;"></span>
								</div>
								</div>
								</div>
								
									<div class="star">
							<div class="item col-lg-12 col-md-6 col-sm-6">
								<div class="thumb" style="float:left;"><a href="#"><img
										src="http://image.cine21.com/resize/www1/writer/noimg[X60,60].jpg"
										alt="" style="display:block;">안영진</a></div>
									
										
								<p class="card-text col-lg-10 col-md-6 col-sm-6" style="float:left;">노잼;; 이수민생각해서 별 한개 더드림</p>
								<!-- 별점 -->
								<div class="star-rating col-sm-4 col-xs-4 col-lg-4 col-md-4"style="float:left;">
									<span class="fa fa-star" data-raing="1" style="color:red;"></span> <span
										class="fa fa-star" data-raing="1" style="color:red;"></span> <span
										class="fa fa-star-o" data-raing="0" style="color:red;"></span> <span
										class="fa fa-star-o" data-raing="0" style="color:red;"></span> <span
										class="fa fa-star-o" data-raing="0" style="color:red;"></span>
								</div>
								</div>
								</div>
						</div>
						

			<a href="javascript:related_movie_list(2)" class="btn_next"><span class="hidden">다음</span><span class="ico"></span></a>

			<div class="related_mov col-lg-6 col-md-6 col-sm-6">
				<h2 class="card-title" style=" padding-bottom:5px;">관련영화</h2>
						<div class="movie" style="float:left; text-align:center;" >
						<a href="#"><img src="http://image.cine21.com/resize/cine21/still/2018/0828/11_49_07__5b84b8238ee05[X135,195].jpg" alt="" style="display:block; "><strong class="">양아치 느와르</strong></a>
					</div>
						<div class="movie" style="float:left; text-align:center;">
						<a href="#"><img src="http://image.cine21.com/resize/cine21/poster/2018/1116/16_59_39__5bee78ebdefd6[X135,195].jpg" alt="" style="display:block;"><strong class="">해피 투게더</strong></a>
					</div>
						<div class="movie" style="float:left; text-align:center;">
						<a href="#"><img src="http://image.cine21.com/resize/cine21/poster/2019/0116/12_14_04__5c3ea17c435b8[X135,195].jpg" alt="" style="display:block;"><strong class="">그대 이름은 장미</strong></a>
				</div>
				<div class="movie" style="float:left; text-align:center;">
						<a href="#"><img src="http://image.cine21.com/resize/cine21/poster/2019/0111/11_00_59__5c37f8dbbab0e[X135,195].jpg" alt="" style="display:block;"><strong class="">오케이! 마담</strong></a>
					</div>
					</div>
			</div>
	
					

	<!-- =====  FOOTER START  ===== -->
	<jsp:include page="footer.jsp" flush="false" />
	<!-- =====  FOOTER END  ===== -->

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>