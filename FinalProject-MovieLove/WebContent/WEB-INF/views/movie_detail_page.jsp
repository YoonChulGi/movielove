<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<!-- Custom styles for this template -->
<link href="css/small-business.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
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
	font-size: 14px;
	color: #f4f4f4;
	margin-bottom: 5px;
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
				style="background: url('http://image.cine21.com/cine21/still/2018/1217/51955_5c174480e492c.jpg');">
				<div class="top_area_cover">
					<div class="mov_top">
						<div class="mov_poster">
							<img
								src="http://image.cine21.com/resize/cine21/poster/2018/1206/51955_5c08765455234[X230,330].jpg" />
						</div>
						<div class="mov_info">
							<p class="tit">내안의 그놈</p>
							<p class="tit_eng">
								<span>Inside me</span>
							</p>
							<p class="sub_info">
								<span>2017</span> <span>한국</span> <span>15세 관람가</span>
							</p>
							<p class="sub_info">
								<span>코미디</span> <span>상영시간 : 122분</span>
							</p>
							<p class="sub_info">
								<span>개봉일 : 2019-01-09</span> <span>누적관객 : 111,975명</span>

							</p>
							<p class="sub_info">감독 :강효진</P>
							<p class="sub_info">출연 :진영(동현)박성웅(판수)라미란(미선)이수민(현정)이준혁(만철)
								...</p>




						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="give_star col-lg-2" style="float:right; align:center;">
			<strong class="star" style="font-size:18px; padding-left:55px; padding-top:10px; ">별점주기</strong>
			<p class="num text-center" style="font-size:35px; color:red; padding-top:10px; ">0</p>

			<div class="star_area" style="padding-left:20px; padding-top:6px;">
				<div id="star_container" data-score="0" style="cursor: pointer; ">
					<img alt="1"
						src="http://image.cine21.com/www1/common/star_a_off.png"
						title="bad">&nbsp;<img alt="2"
						src="http://image.cine21.com/www1/common/star_a_off.png"
						title="poor">&nbsp;<img alt="3"
						src="http://image.cine21.com/www1/common/star_a_off.png"
						title="regular">&nbsp;<img alt="4"
						src="http://image.cine21.com/www1/common/star_a_off.png"
						title="good">&nbsp;<img alt="5"
						src="http://image.cine21.com/www1/common/star_a_off.png"
						title="gorgeous"><input name="score" type="hidden">
				</div>
				
			</div>
<div class="button" style="padding-left:30px; padding-top:7px;">

			<a
				href="/movie/nzreview/comment_form/?movie_id=51955&amp;star_container=star_container"
				class="btn btn_review" id="btn_review_write">리뷰 남기기</a>
				</div>
		</div>
		<div class="story_area col-lg-6 col-md-4 col-sm-2"
			style="float: right;  padding-right:50px;">
			<div class="story">

				<strong class="text" style="font-size: 25px;">나 너니? 너 나니??
					제대로 바뀐 아재와 고딩, 웃음 대환장 파티!</strong>
				<p>엘리트 아재 판수(박성웅)를 우연히 옥상에서 떨어진 고등학생 동현(진영)이 덮치면서 제대로 바뀐다. 게다가
					판수는 동현의 몸으로 첫사랑 미선(라미란)과 존재도 몰랐던 딸 현정(이수민)을 만나게 되는데… 대유잼의 향연, 넌 이미
					웃고 있다!</p>
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
