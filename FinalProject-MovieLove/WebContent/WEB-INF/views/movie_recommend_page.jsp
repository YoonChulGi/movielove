<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String movie_title = "영화 제목";
	String movie_rate = "10.3%";
	String movie_date = "2018.12.31 개봉";
	String movie_img = "images/poster.jpg";
	//String movie_img="http://placehold.it/236x340";
	String sel1 = "", sel2 = "", sel3 = "";
	String sel = request.getParameter("sel");

	if (sel != null) {
		if (sel.equals("1")) {
			sel1 = "on";
		} else if (sel.equals("2")) {
			sel2 = "on";
		} else if (sel.equals("3")) {
			sel3 = "on";
		}
	} else {
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
	<jsp:include page="menu.jsp" flush="false" />
	<!-- =====  HEADER END  ===== -->

	<!-- Page Content -->

	<div id="myCarousel" class="carousel slide col-lg-12 col-md-6 col-sm-6" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1" class=""></li>
		</ol>

	
		<div class="row justify-content-end">

			<div class="carousel-inner" align="center">

				<div class="item active">
					<table>
						<tbody>
						
						
							<tr>
							
								<% if(session.getAttribute("memId")!=null){%>
			                	<h2 class="card-title" style="padding-bottom:50px;">"<%=session.getAttribute("memId")%> " 님의 취향저격 베스트 영화</h2>
			               		 <%} 
								else {%>
			                	<h2 class="card-title"  style="padding-bottom:50px;">"이번달 추천영화"</h2>
			                	<%} %>
			                	
			                	<% if(session.getAttribute("memId")!=null){%>
			                	<c:forEach var="gen" items="${genre}" varStatus="status" begin="1" end="5">
			                	<td class="officetd"><h2 class="rank"></h2> <a href="#"><img
										src="${gen}"
										alt=""></a></td>
			                	</c:forEach>
			                	<%} 
			                	else {%>
									
								<td class="officetd"><h2 class="rank"></h2> <a href="#"><img
										src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/358ea40235e240fea2f0b6ec7ef93c431543201035934"
										alt=""></a></td>
								<td class="officetd"><h2 class="rank"></h2> <a href="#"><img
										src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/4eeebce90dc441cdb208d11e27e356421544513634869"
										alt=""></a></td>
								<td class="officetd"><h2 class="rank"></h2> <a href="#"><img
										src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/f4d3fea1a1004a44873cca0dac2d8ccf1542956549688"
										alt=""></a></td>
								<td class="officetd"><h2 class="rank"></h2> <a href="#"><img
										src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/ce3cd6a875284e8b96414ef3696756a11544772388211"
										alt=""></a></td>
								<td class="officetd"><h2 class="rank"></h2> <a href="#"><img
										src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/10073f4c7fab4a07a23589f8fbd4254d1541739643225"
										alt=""></a></td>
								<%} %>
							</tr>
							
						</tbody>
					</table>
				</div>

				<div class="item">
					<table>
						<tbody>
						
						
						<tr>
								
						<% if(session.getAttribute("memId")!=null){%>
			                	<h2 class="card-title" style="padding-bottom:50px;">"<%=session.getAttribute("memId")%> " 님의 취향저격 베스트 영화</h2>
			               		 <%} 
								else {%>
			                	<h2 class="card-title"  style="padding-bottom:50px;">"이번달 추천영화"</h2>
			                	<%} %>
			                	<% if(session.getAttribute("memId")!=null){%>
			                	<c:forEach var="gen" items="${genre}" varStatus="status" begin="6" end="10">
			                	<td class="officetd"><h2 class="rank"></h2> <a href="#"><img
										src="${gen}"
										alt=""></a></td>
			                	</c:forEach>
			                	<%} 
			                	else {%>
									

										<td class="officetd"><h2 class="rank"></h2> <a href="#"><img
										src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/7f80906597164fe6b6504b3602946f631542963091970"
										alt=""></a></td>
								<td class="officetd"><h2 class="rank"></h2> <a href="#"><img
										src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/f4d3fea1a1004a44873cca0dac2d8ccf1542956549688"
										alt=""></a></td>
								<td class="officetd"><h2 class="rank"></h2> <a href="#"><img
										src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/25c7261d1e424fe59b68b7ef115b35d11542780702098"
										alt=""></a></td>
								<td class="officetd"><h2 class="rank"></h2> <a href="#"><img
										src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/fa5991f792db40bdb93de11542c0502c1543986203103"
										alt=""></a></td>
								<td class="officetd"><h2 class="rank"></h2> <a href="#"><img
										src="//img1.daumcdn.net/thumb/C180x260/?fname=http://t1.daumcdn.net/movie/eb9834885f7747d78e132b66c0cf46a21541478705054"
										alt=""></a></td>
											<%} %>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- Left and right controls -->










	<div class="container">
		<div class="row">


			<nav class="navbar-collapse collapse">
				<div class="dropdown">
					<button class="btn pull-left col-lg-1 col-sm-6 col-md-4">전체</button>
					<button class="btn pull-left col-lg-1 col-sm-6 col-md-4">국내</button>
					<button class="btn pull-left col-lg-1 col-sm-6 col-md-4">해외</button>

				</div>


				<div class="dropdown">

					<button class="btn dropdown-toggle col-lg-3 col-sm-6 col-md-4"
						data-toggle="dropdown">
						장르 <b class="caret"></b>
					</button>
					<ul class="dropdown-menu col-lg-3 col-sm-6 col-md-4">
						<li><a class="action" href="#">액션/SF</a></li>
						<li><a class="drama" href="#">멜로/드라마</a></li>
						<li><a class="comidy" href="#">코미디</a></li>
						<li><a class="scare" href="#">공포/스릴러</a></li>
					</ul>
				</div>
				<div class="dropdown">

					<button class="btn dropdown-toggle col-lg-3 col-sm-6 col-md-4"
						data-toggle="dropdown">
						연령별 <b class="caret"></b>
					</button>
					<ul class="dropdown-menu col-lg-3 col-sm-6 col-md-4">
						<li><a class="teen" href="#">10대</a></li>
						<li><a class="twentie" href="#">20대</a></li>
						<li><a class="thirtie" href="#">30대</a></li>
						<li><a class="fourtie" href="#">40대</a></li>
						<li><a class="fiftie" href="#">50대</a></li>
						<li><a class="sixty" href="#">60대이상</a></li>
					</ul>
				</div>
				<div class="dropdown ">

					<button class="btn dropdown-toggle col-lg-3 col-sm-6 col-md-4"
						data-toggle="dropdown">
						연도별 <b class="caret"></b>
					</button>
					<ul class="dropdown-menu col-lg-3 col-sm-6 col-md-4">
						<li><a class="1970" href="#">1970년대</a></li>
						<li><a class="1980" href="#">1980년대</a></li>
						<li><a class="1990" href="#">1990년대</a></li>
						<li><a class="2000" href="#">2000년대</a></li>
						<li><a class="2010" href="#">2010년대</a></li>

					</ul>
				</div>
			</nav>
		</div>

	</div>

	<div class="container">
		<div class="search_option_area col-lg-9 col-md-6 col-sm-3 col-xs-2">



			<div class="post col-lg-9 col-md-6 col-sm-3 col-xs-2"
				style="width: 880px; text-align: center; padding-top: 15px; padding-bottom: 15px;">

				<div class="movie_name col-lg-12 col-md-6 col-sm-2 col-xs-2">
					<strong style="padding-right: 15px;">NO.1</strong> <span
						style="padding-right: 30px; display: inline-block; width: 220px; height: 20px;">주먹왕
						랄프 2-인터넷 속으로</span> <img
						src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000081/81061/81061_185.jpg"
						alt="주먹왕 랄프 2-인터넷 속으로 포스터" onerror="errorImage(this)"
						style="hegith: 7%; width: 7%; objectfit: conta; align: center;"><span
						style="padding-left: 15px;"> 예매율</span><strong
						style="color: red; padding-left: 15px; display: inline-block; width: 59px; height: 20px;">48.3%</strong>
					<strong
						style="padding-left: 15px; padding-right: 15px; display: inline-block; width: 136px; height: 20px;">2019.01.03
						개봉</strong> <strong style="padding-left: 5px;">평점7.7</strong>
					<div class="review_grade"
						style="float: right; padding-top: 27px; padding-left: 10px;">
						<div class="bg_star star_grade">
							<div class="bg_star inner_star" style="width: 80.5%;"></div>
							<!-- 116px이 100%, % 계산에서 width값에 적용-->


						</div>

					</div>

				</div>
			</div>

			<div class="post col-lg-12 col-md-6 col-sm-2 col-xs-2"
				style="width: 880px; text-align: center; padding-top: 15px; padding-bottom: 15px;">

				<div class="movie_name col-lg-12 col-md-6 col-sm-2 col-xs-2">
					<strong style="padding-right: 15px;">NO.2</strong> <span
						style="padding-right: 30px; display: inline-block; width: 220px; height: 20px;">아쿠아맨</span>


					<img
						src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000081/81319/81319_185.jpg"
						alt="아쿠아맨 포스터" onerror="errorImage(this)"
						style="hegith: 7%; width: 7%; objectfit: conta; align: center;"><span
						style="padding-left: 15px;"> 예매율</span><strong
						style="color: red; padding-left: 15px; display: inline-block; width: 59px; height: 20px;">17.9%</strong>
					<strong
						style="padding-left: 15px; padding-right: 15px; display: inline-block; width: 136px; height: 20px;">2018.12.19
						개봉</strong> <strong style="padding-left: 5px;">평점7.5</strong>
					<div class="review_grade"
						style="float: right; padding-top: 27px; padding-left: 10px;">
						<div class="bg_star star_grade">
							<div class="bg_star inner_star" style="width: 77.5%;"></div>
							<!-- 116px이 100%, % 계산에서 width값에 적용-->


						</div>

					</div>
				</div>
			</div>
			<div class="post col-lg-12 col-md-6 col-sm-2 col-xs-2"
				style="width: 880px; text-align: center; padding-top: 15px; padding-bottom: 15px;">

				<div class="movie_name col-lg-12 col-md-6 col-sm-2 col-xs-2">

					<strong style="padding-right: 15px;">NO.3</strong><span
						style="padding-right: 30px; display: inline-block; width: 220px; height: 20px;">보헤미안
						랩소디</span> <img
						src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000081/81127/81127_185.jpg"
						alt="보헤미안 랩소디 포스터" onerror="errorImage(this)"
						style="hegith: 7%; width: 7%; objectfit: conta; align: center;">

					<span style="padding-left: 15px;"> 예매율</span><strong
						style="color: red; padding-left: 15px; display: inline-block; width: 59px; height: 20px;">7.1%</strong>
					<strong
						style="padding-left: 15px; padding-right: 15px; display: inline-block; width: 136px; height: 20px;">2018.10.31
						개봉</strong> <strong style="padding-left: 5px;">평점9.0</strong>
					<div class="review_grade"
						style="float: right; padding-top: 27px; padding-left: 10px;">
						<div class="bg_star star_grade">
							<div class="bg_star inner_star" style="width: 90.5%;"></div>
							<!-- 116px이 100%, % 계산에서 width값에 적용-->


						</div>

					</div>
				</div>
			</div>

			<div class="post col-lg-12 col-md-6 col-sm-2 col-xs-2"
				style="width: 880px; text-align: center; padding-top: 15px; padding-bottom: 15px;">
				<div class="movie_name col-lg-12 col-md-6 col-sm-2 col-xs-2">

					<strong style="padding-right: 15px;">NO.4 </strong><span
						style="padding-right: 30px; display: inline-block; width: 220px; height: 20px;">말모이</span>

					<img
						src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000081/81517/81517_185.jpg"
						alt="말모이 포스터" onerror="errorImage(this)"
						style="hegith: 7%; width: 7%; objectfit: conta; align: center;"><span
						style="padding-left: 15px;"> 예매율</span><strong
						style="color: red; padding-left: 15px; display: inline-block; width: 59px; height: 20px;">5.0%</strong>
					<strong
						style="padding-left: 15px; padding-right: 15px; display: inline-block; width: 136px; height: 20px;">2019.01.09
						개봉</strong> <strong style="padding-left: 5px;">평점8.8</strong>
					<div class="review_grade"
						style="float: right; padding-top: 27px; padding-left: 10px;">
						<div class="bg_star star_grade">
							<div class="bg_star inner_star" style="width: 88.7%;"></div>
							<!-- 116px이 100%, % 계산에서 width값에 적용-->


						</div>
					</div>
				</div>
			</div>
			<div class="post col-lg-12 col-md-6 col-sm-2 col-xs-2"
				style="width: 880px; text-align: center; padding-top: 15px; padding-bottom: 15px;">
				<div class="movie_name col-lg-12 col-md-6 col-sm-2 col-xs-2">
					<strong style="padding-right: 15px;">NO.5 </strong><span
						style="padding-right: 30px; display: inline-block; width: 220px; height: 20px;">PMC-더
						벙커</span> <img
						src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000081/81381/81381_185.jpg"
						alt="PMC-더 벙커 포스터" onerror="errorImage(this)"
						style="hegith: 7%; width: 7%; objectfit: conta; align: center;"><span
						style="padding-left: 15px;"> 예매율</span><strong
						style="color: red; padding-left: 15px; display: inline-block; width: 59px; height: 20px;">4.7%</strong>
					<strong
						style="padding-left: 15px; padding-right: 15px; display: inline-block; width: 136px; height: 20px;">2019.12.26
						개봉</strong> <strong style="padding-left: 5px;">평점5.5</strong>
					<div class="review_grade"
						style="float: right; padding-top: 27px; padding-left: 10px;">
						<div class="bg_star star_grade">
							<div class="bg_star inner_star" style="width: 57.5%;"></div>
							<!-- 116px이 100%, % 계산에서 width값에 적용-->


						</div>

					</div>
				</div>

			</div>

		</div>
	</div>









	<div class="bottom-number mt_20" align="center">
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Previous"> <span aria-hidden="true">«</span> <span
					class="sr-only">Previous</span>
			</a></li>

			<li class="page-item"><a class="page-link" href="#">1</a></li>

			<li class="page-item"><a class="page-link" href="#">2</a></li>

			<li class="page-item"><a class="page-link" href="#">3</a></li>

			<li class="page-item"><a class="page-link" href="#">4</a></li>

			<li class="page-item"><a class="page-link" href="#">5</a></li>

			<li class="page-item"><a class="page-link" href="#"
				aria-label="Next"> <span aria-hidden="true">»</span> <span
					class="sr-only">Next</span>
			</a></li>
		</ul>
	</div>


	<!-- /.container -->

	<!-- =====  FOOTER START  ===== -->
	<jsp:include page="footer.jsp" flush="false" />
	<!-- =====  FOOTER END  ===== -->


	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
